---
type: concept
domain: ai
created: 2026-04-25
updated: 2026-04-25
sources: [llm-wiki-introduction]
---

# LLM Wiki Pattern

A methodology for building and maintaining a [[personal-knowledge-base]] using large language models, where the user provides raw sources and the LLM automatically builds a structured, interlinked wiki.

## Definition

The LLM Wiki pattern is a system for knowledge management in which:

1. The **human** curates sources (articles, papers, notes) by placing them in a `raw/` folder
2. The **LLM** organises those sources into a structured wiki by extracting entities, concepts, and relationships
3. The **wiki** grows richer over time as more sources are ingested, with explicit cross-references between pages

The pattern was introduced by [[andrej-karpathy]] and is intentionally simple: the entire system consists of folders and plain markdown files.

## How It Works

### Three-Layer Architecture

```
raw/      → Immutable raw sources (LLM reads only)
wiki/     → LLM-maintained structured wiki
outputs/  → Query results and reports
```

### Core Workflows

**Ingest** — When a new file is added to `raw/`:
- The LLM creates a source summary
- Extracts entities (people, tools, organisations) → new or updated pages in `wiki/entities/`
- Extracts concepts (ideas, patterns) → new or updated pages in `wiki/concepts/`
- Adds cross-references between related pages
- Flags contradictions with existing content
- Updates `wiki/INDEX.md` (the master catalog) and `wiki/LOG.md` (the activity log)

**Query** — When the user asks a question:
- The LLM reads `wiki/INDEX.md` to find relevant pages
- Reads those pages and synthesises an answer with citations
- Only uses information from the wiki, not outside training knowledge
- Saves valuable answers to `wiki/syntheses/` or `outputs/`

**Lint** — Periodic health check:
- Finds contradictions between pages
- Finds orphan pages (no other page links to them)
- Finds broken links
- Identifies knowledge gaps

**Discover** — Automated source finding:
- Searches the web for new sources based on configured topics
- Uses knowledge gaps from lint to prioritise what to find
- Places found sources in `raw/articles/` and triggers ingest

## Examples

A user interested in machine learning adds a blog post to `raw/articles/`. On ingest, the LLM:
- Creates a source summary page
- Creates or updates entity pages for each person mentioned
- Creates or updates concept pages for each ML technique described
- Links those pages to each other and to existing wiki pages
- Flags any claims that contradict what earlier sources said

Later, the user asks: "What are the trade-offs between transformers and RNNs?" The LLM reads the relevant concept pages and synthesises a cited answer.

## Comparison with RAG

| Aspect | Traditional RAG | LLM Wiki |
|--------|----------------|----------|
| When knowledge is processed | At query time | At ingest time |
| Cross-references | None | Explicit and maintained |
| Contradictions | Not detected | Flagged on ingest |
| Growth over time | Flat | Compounding |
| Infrastructure | Vector DB + embeddings | Folders + markdown |

## Links

- [[personal-knowledge-base]] — The broader category
- [[andrej-karpathy]] — Creator of the pattern
- [[retrieval-augmented-generation]] — The approach contrasted with LLM Wiki

## Sources

- [LLM Wiki Introduction](../sources/llm-wiki-introduction.md)
