# LLM Wiki — Schema & Operating Rules

> This file is the AI operating manual for this wiki.
> Read it before performing any wiki operation.

## Three-Layer Architecture

```
raw/        → Raw sources  (immutable — read-only for the LLM)
wiki/       → LLM-maintained wiki
outputs/    → Query results, reports, analysis
config.yaml → Topics, feeds, schedule
```

## Folder Structure

```
llm-wiki-helloworld/
├── AGENTS.md              ← This file — schema & rules
├── config.yaml            ← System configuration
├── raw/                   ← Raw sources (DO NOT MODIFY)
│   ├── articles/          ← Web articles (markdown, text)
│   └── notes/             ← Personal notes
├── wiki/                  ← LLM owns this entirely
│   ├── INDEX.md           ← Catalog of every wiki page
│   ├── LOG.md             ← Timeline of all activity
│   ├── entities/          ← People, organisations, tools, projects
│   ├── concepts/          ← Ideas, patterns, methodologies
│   ├── sources/           ← Summary of each raw source
│   └── syntheses/         ← Analysis, comparisons, rankings
└── outputs/               ← Query results & reports
```

## Golden Rules

1. **Raw sources are immutable** — NEVER edit, delete, or move files in `raw/`
2. **LLM owns `wiki/`** — Humans do not edit wiki pages manually
3. **One topic per file** — kebab-case filenames, split files at ~500 lines
4. **Cross-reference with wiki links** — use `[[filename]]` format, minimum 2 links per page
5. **Keep INDEX.md up to date** — update on every create/delete
6. **LOG.md records every action** — format `## [YYYY-MM-DD HH:mm] action | Description`

---

## Workflows

### ingest
1. Read each new file in `raw/`
2. Create `wiki/sources/` summary
3. Extract entities → `wiki/entities/`
4. Extract concepts → `wiki/concepts/`
5. Add cross-references
6. Flag contradictions
7. Update `wiki/INDEX.md` and `wiki/LOG.md`

### query
1. Read `wiki/INDEX.md` to find relevant pages
2. Read those pages
3. Synthesise answer with citations
4. Save valuable answers to `outputs/` or `wiki/syntheses/`
5. Append to `wiki/LOG.md`

### lint
1. Check for contradictions
2. Find orphan pages
3. Find missing-but-referenced pages
4. Find stale claims
5. Find knowledge gaps
6. Write report to `outputs/`

---

## Wiki Page Formats

### Entity page  (wiki/entities/)

```markdown
---
type: entity
category: person | organization | tool | project
created: YYYY-MM-DD
updated: YYYY-MM-DD
sources: [list of raw sources]
---

# Entity Name

One or two sentence description.

## Overview
## Key Points
## Links
## Sources
```

### Concept page  (wiki/concepts/)

```markdown
---
type: concept
domain: ai | engineering | business | ...
created: YYYY-MM-DD
updated: YYYY-MM-DD
sources: [list of raw sources]
---

# Concept Name

One or two sentence description.

## Definition
## How It Works
## Examples
## Links
## Sources
```

### Source summary  (wiki/sources/)

```markdown
---
type: source
format: article | paper | note | video
raw_path: raw/articles/filename.md
ingested: YYYY-MM-DD
---

# Source Title

## Summary
## Key Takeaways
## Entities Mentioned
## Concepts Mentioned
## Notable Quotes
```

### Synthesis page  (wiki/syntheses/)

```markdown
---
type: synthesis
topic: topic being analysed
created: YYYY-MM-DD
sources_count: N
---

# Analysis Title

## Original Question
## Analysis
## Conclusion
## Sources Used
```
