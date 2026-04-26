# LLM Wiki — Schema & Operating Rules

> This file is read automatically by GitHub Copilot in VS Code.
> It tells Copilot how to build and maintain this wiki.
> A personal knowledge base that builds and maintains itself.
> Copilot reads raw sources and writes the wiki. You read the wiki and ask questions.

## Three-Layer Architecture

```
raw/        → Raw sources  (immutable — Copilot reads only, NEVER modifies)
wiki/       → Copilot-maintained wiki  (Copilot creates, updates, organises entirely)
outputs/    → Query results, reports, analysis
config.yaml → Topics, feeds, schedule
```

## Folder Structure

```
llm-wiki-helloworld/
├── .github/copilot-instructions.md  ← This file — schema & rules
├── config.yaml                      ← System configuration
├── raw/                             ← Raw sources (DO NOT MODIFY)
│   ├── articles/                    ← Web articles (markdown, text)
│   └── notes/                       ← Personal notes
├── wiki/                            ← Copilot owns this entirely
│   ├── INDEX.md                     ← Catalog of every wiki page
│   ├── LOG.md                       ← Timeline of all activity
│   ├── entities/                    ← People, organisations, tools, projects
│   ├── concepts/                    ← Ideas, patterns, methodologies
│   ├── sources/                     ← Summary of each raw source
│   └── syntheses/                   ← Analysis, comparisons, rankings
└── outputs/                         ← Query results & reports
```

## Golden Rules

1. **Raw sources are immutable** — NEVER edit, delete, or move files in `raw/`
2. **Copilot owns `wiki/`** — Do not edit wiki pages manually
3. **One topic per file** — kebab-case filenames, split files at ~500 lines
4. **Cross-reference with wiki links** — use `[[filename]]` format, minimum 2 links per page
5. **Keep INDEX.md up to date** — update on every create/delete
6. **LOG.md records every action** — format `## [YYYY-MM-DD HH:mm] action | Description`

---

## Workflows

### ingest
When asked to ingest new sources:
1. Read each new file in `raw/`
2. Create a source summary in `wiki/sources/`
3. Extract entities (people, orgs, tools, projects) → create/update `wiki/entities/`
4. Extract concepts (ideas, patterns, methodologies) → create/update `wiki/concepts/`
5. Add cross-references between related pages using `[[filename]]` links
6. Flag contradictions with existing wiki content
7. Update `wiki/INDEX.md`
8. Append an entry to `wiki/LOG.md`

### query
When asked to answer a question about the wiki:
1. Read `wiki/INDEX.md` to find relevant pages
2. Read those pages
3. Synthesise an answer with citations
4. If the answer is valuable, save it to `outputs/` or `wiki/syntheses/`
5. Append to `wiki/LOG.md`

**Rule:** Answer based on the wiki only, not on outside knowledge.

### lint
When asked to run a health check:
1. Check for contradictions between pages
2. Find orphan pages (nothing links to them)
3. Find mentioned-but-missing pages (referenced but don't exist)
4. Find knowledge gaps (areas with thin coverage)
5. Check for broken wiki links
6. Write the report to `outputs/lint-report-YYYY-MM-DD.md`
7. Append to `wiki/LOG.md`

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
[Detailed description]

## Key Points
- [Bullet points]

## Links
- [[related-concept]]
- [[related-entity]]

## Sources
- [Source 1](../raw/path)
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
[Clear explanation]

## How It Works
[Technical detail if needed]

## Examples
[Concrete examples]

## Links
- [[related-concept]]
- [[related-entity]]

## Sources
- [Source 1](../raw/path)
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
[2–3 paragraph summary]

## Key Takeaways
- [Bullet points — most important insights]

## Entities Mentioned
- [[entity-1]]
- [[entity-2]]

## Concepts Mentioned
- [[concept-1]]
- [[concept-2]]

## Notable Quotes
> "Important quote from the source"
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
[The question or purpose of this analysis]

## Analysis
[Synthesised analysis content]

## Conclusion
[Summary of findings]

## Sources Used
- [[source-1]]
- [[source-2]]
```
