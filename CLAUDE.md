# LLM Wiki — Schema & Operating Rules

> A personal knowledge base that builds and maintains itself.
> The LLM reads raw sources and writes the wiki. Humans read the wiki and ask questions.

## Three-Layer Architecture

```
raw/        → Raw sources  (immutable — LLM reads only, NEVER modifies)
wiki/       → LLM-maintained wiki  (LLM creates, updates, organises entirely)
outputs/    → Query results, reports, analysis
config.yaml → Topics, feeds, schedule
```

## Folder Structure

```
llm-wiki-helloworld/
├── CLAUDE.md              ← This file — schema & rules
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

### 1. Raw sources are immutable
- NEVER edit, delete, or move files in `raw/`
- They are the source of truth — every wiki claim must trace back to raw

### 2. The LLM owns `wiki/` entirely
- Humans do not edit wiki pages manually
- The LLM creates, updates, and removes wiki pages
- Every change must be recorded in `LOG.md`

### 3. One topic per file
- Each entity, concept, and source summary is a separate `.md` file
- File names: `kebab-case.md`  (e.g. `andrej-karpathy.md`, `llm-agents.md`)
- Split files if they exceed ~500 lines

### 4. Cross-reference with wiki links
- Use `[[filename-without-extension]]` format for links between pages
- Each page should have at least two links to other pages
- Orphan pages (nothing links to them) must be reported during lint

### 5. Keep INDEX.md up to date
- Create or delete a wiki page → update `INDEX.md` immediately
- Format: `- [Page Title](path/file.md) — one-line description`
- Group by category: entities, concepts, sources, syntheses

### 6. LOG.md records every action
- Format: `## [YYYY-MM-DD HH:mm] action | Description`
- Actions: `ingest`, `query`, `lint`, `discover`, `update`
- Each entry states: files created/changed, pages affected

---

## Workflows

### ingest — Process new sources

```
1. Read each new file in raw/
2. Create a source summary in wiki/sources/
3. Extract entities  → create/update pages in wiki/entities/
4. Extract concepts  → create/update pages in wiki/concepts/
5. Find connections with existing pages → add cross-references
6. Detect contradictions with existing content → note them clearly
7. Update wiki/INDEX.md
8. Append to wiki/LOG.md
```

**Rules:**
- One source typically affects 3–10 wiki pages
- Always cite the source: `[Source: filename](../raw/path)`
- If new information contradicts existing content → keep both, flag the conflict
- Never fabricate information — only write what is in raw sources

### query — Answer a question

```
1. Read wiki/INDEX.md to find relevant pages
2. Read those pages
3. Synthesise an answer with citations
4. If the answer is valuable → save to outputs/ or wiki/syntheses/
5. Append to wiki/LOG.md
```

**Rules:**
- Answer based on the wiki only, not on outside knowledge
- If the wiki lacks enough information → say so clearly and suggest what to find
- Good answers (comparisons, analyses) → save as a new wiki/syntheses/ page

### lint — Health check

```
1. Check for contradictions between pages
2. Find orphan pages (nothing links to them)
3. Find mentioned-but-missing pages (referenced but don't exist)
4. Find stale claims (new sources disprove old ones)
5. Find knowledge gaps (areas lacking coverage)
6. Check for broken wiki links
7. Suggest new pages to create
8. Write results to outputs/ and append to LOG.md
```

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
