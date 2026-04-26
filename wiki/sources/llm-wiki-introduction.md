---
type: source
format: article
raw_path: raw/articles/llm-wiki-introduction.md
ingested: 2026-04-25
---

# The LLM Wiki Pattern — Build a Personal Knowledge Base That Maintains Itself

## Summary

This article by [[andrej-karpathy]] introduces the LLM Wiki pattern: a methodology for building and maintaining a personal knowledge base using large language models. The core idea is that LLMs are excellent at reading, summarising, and organising information, so the user drops raw sources into a folder and the LLM builds a structured, interlinked wiki automatically.

The system uses three layers: `raw/` (immutable source files), `wiki/` (LLM-maintained structured pages), and `outputs/` (query results). The LLM processes new sources through an "ingest" workflow, answers questions through a "query" workflow, and checks the wiki's health through a "lint" workflow.

The pattern is positioned as superior to traditional RAG because knowledge is compiled once rather than re-retrieved every query, cross-references are explicit, contradictions are flagged automatically, and the knowledge base compounds over time with no infrastructure beyond folders and markdown files.

## Key Takeaways

- The LLM's role is organiser; the human's role is curator (adding raw sources)
- Raw files are immutable — they are the source of truth, never modified
- One source can affect 5–15 wiki pages on ingest
- The wiki is entirely made of plain markdown files — no vector databases or servers required
- Works with any AI coding assistant that can read and write files
- Compatible with Obsidian for graph visualisation of connections
- Can be stored in git for version history and team collaboration
- Contradictions between sources are flagged explicitly rather than silently ignored
- The "lint" workflow identifies knowledge gaps for the next discovery cycle

## Entities Mentioned

- [[andrej-karpathy]] — Author of the pattern; OpenAI co-founder, former Tesla AI Director

## Concepts Mentioned

- [[llm-wiki-pattern]] — The main subject of this article
- [[personal-knowledge-base]] — The broader category this pattern belongs to
- [[retrieval-augmented-generation]] — Contrasted with the LLM Wiki approach

## Notable Quotes

> "LLMs are essentially very good at reading and writing."

> "Humans provide raw sources; LLMs organise them."

> "Sources are sacred. Raw files are never modified. The wiki is derived, not primary."
