#!/usr/bin/env bash
# start-issue.sh <issue-number>
#
# 1. Verifies the current branch is main and up to date with origin.
# 2. Fetches the GitHub issue and exports it to outputs/issue-<number>.md.
# 3. Creates a new branch named issue-<number>.
# 4. Commits the exported file with a message referencing the issue.
# 5. Opens a pull request whose description links back to the issue.
#
# Requirements: gh CLI (https://cli.github.com/) and git.

set -euo pipefail

# ── helpers ──────────────────────────────────────────────────────────────────

die()  { echo "error: $*" >&2; exit 1; }
info() { echo "→ $*"; }

# ── validate argument ─────────────────────────────────────────────────────────

[[ $# -eq 1 && $1 =~ ^[0-9]+$ ]] || die "Usage: $0 <issue-number>"
ISSUE_NUMBER="$1"

# ── check gh CLI ──────────────────────────────────────────────────────────────

command -v gh >/dev/null 2>&1 || die "gh CLI is not installed. See https://cli.github.com/"
gh auth status >/dev/null 2>&1  || die "Not authenticated. Run: gh auth login"

# ── detect repo ───────────────────────────────────────────────────────────────

REPO=$(gh repo view --json nameWithOwner -q .nameWithOwner 2>/dev/null) \
  || die "Not inside a GitHub repository."

# ── check current branch is main ─────────────────────────────────────────────

CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
[[ "$CURRENT_BRANCH" == "main" ]] \
  || die "Current branch is '$CURRENT_BRANCH'. Please switch to main first."

# ── check main is up to date with origin ─────────────────────────────────────

info "Fetching origin/main …"
git fetch origin main --quiet

LOCAL=$(git rev-parse HEAD)
REMOTE=$(git rev-parse origin/main)
BASE=$(git merge-base HEAD origin/main)

if [[ "$LOCAL" != "$REMOTE" ]]; then
  if [[ "$LOCAL" == "$BASE" ]]; then
    die "Local main is behind origin/main. Run: git pull"
  elif [[ "$REMOTE" == "$BASE" ]]; then
    die "Local main has unpushed commits. Push or reset before starting a new issue."
  else
    die "Local main and origin/main have diverged. Please reconcile manually."
  fi
fi

info "Branch main is up to date with origin."

# ── fetch issue metadata ──────────────────────────────────────────────────────

info "Fetching issue #${ISSUE_NUMBER} from ${REPO} …"

ISSUE_JSON=$(gh issue view "$ISSUE_NUMBER" --repo "$REPO" \
  --json number,title,url,state,body,labels,assignees,createdAt)

# Helper: extract a value from $ISSUE_JSON using a Python expression.
# Usage: jget <python-expression>   (the parsed dict is available as `d`)
jget() { echo "$ISSUE_JSON" | python3 -c "import sys,json; d=json.load(sys.stdin); print($1)"; }

ISSUE_TITLE=$(jget "d['title']")
ISSUE_URL=$(jget "d['url']")
ISSUE_STATE=$(jget "d['state']")
ISSUE_BODY=$(jget "d['body'] or ''")
ISSUE_DATE=$(jget "d['createdAt'][:10]")
ISSUE_LABELS=$(jget "', '.join(l['name'] for l in d['labels']) or '—'")
ISSUE_ASSIGNEES=$(jget "', '.join(a['login'] for a in d['assignees']) or '—'")

# ── export issue to outputs/issue-<number>.md ────────────────────────────────

OUTPUTS_DIR="outputs"
mkdir -p "$OUTPUTS_DIR"
ISSUE_FILE="${OUTPUTS_DIR}/issue-${ISSUE_NUMBER}.md"

cat > "$ISSUE_FILE" <<EOF
# Issue #${ISSUE_NUMBER}: ${ISSUE_TITLE}

| Field     | Value |
|-----------|-------|
| URL       | ${ISSUE_URL} |
| State     | ${ISSUE_STATE} |
| Created   | ${ISSUE_DATE} |
| Labels    | ${ISSUE_LABELS} |
| Assignees | ${ISSUE_ASSIGNEES} |

## Description

${ISSUE_BODY}

---

## Planning

> Add your implementation plan here before starting work.

- [ ] Step 1
- [ ] Step 2

## Progress

> Track execution here as you work through the issue.

## Notes

> Record decisions, blockers, or observations here.
EOF

info "Issue exported to ${ISSUE_FILE}"

# ── create branch issue-<number> ─────────────────────────────────────────────

BRANCH="issue-${ISSUE_NUMBER}"

if git show-ref --verify --quiet "refs/heads/${BRANCH}"; then
  info "Branch '${BRANCH}' already exists — switching to it."
  git checkout "$BRANCH"
else
  info "Creating branch '${BRANCH}' …"
  git checkout -b "$BRANCH"
fi

# ── commit the exported issue file ───────────────────────────────────────────

git add "$ISSUE_FILE"

if git diff --cached --quiet; then
  info "Nothing new to commit (issue file already up to date)."
else
  COMMIT_MSG="Issue #${ISSUE_NUMBER}: ${ISSUE_TITLE}"
  git commit -m "$COMMIT_MSG"
  info "Committed: ${COMMIT_MSG}"
fi

# ── push branch and open pull request ────────────────────────────────────────

info "Pushing branch '${BRANCH}' to origin …"
git push --set-upstream origin "$BRANCH"

info "Opening pull request …"
gh pr create \
  --repo "$REPO" \
  --base main \
  --head "$BRANCH" \
  --title "Issue #${ISSUE_NUMBER}: ${ISSUE_TITLE}" \
  --body "Closes ${ISSUE_URL}"

info "Done! Pull request created for issue #${ISSUE_NUMBER}."
