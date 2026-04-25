---
type: concept
domain: knowledge-management
created: 2026-04-25
updated: 2026-04-25
sources: [llm-wiki-introduction]
---

# Personal Knowledge Base

A system for capturing, organising, and retrieving information for personal or professional use. Also called a "second brain."

## Definition

A personal knowledge base (PKB) is a collection of notes, documents, and references that a person maintains over time to externalise memory and support thinking. The goal is to be able to find and build on past knowledge without relying on memory alone.

## Traditional Approaches

Before AI-powered tools, personal knowledge bases relied on manual note-taking:

- **Plain notes**: Files in folders (text, markdown)
- **Zettelkasten**: Atomic, interlinked notes with unique IDs (popularised by Niklas Luhmann)
- **Roam / Obsidian / Notion**: Graph-based tools where notes link to each other
- **Wiki software**: MediaWiki-style pages with cross-referencing

All of these approaches require significant manual effort to create, tag, and maintain notes.

## AI-Augmented Approaches

Large language models have opened new possibilities for personal knowledge bases:

- **RAG (Retrieval-Augmented Generation)**: A vector database indexes your notes; at query time, relevant chunks are retrieved and the LLM answers based on them
- **[[llm-wiki-pattern]]**: Raw sources are ingested once; the LLM builds a structured wiki with cross-references, and queries are answered from the wiki

## Key Challenges in PKB Design

1. **Capture friction**: Making it easy to add new sources
2. **Organisation**: Structuring information so it can be found later
3. **Connection**: Linking related ideas across different sources
4. **Currency**: Keeping information up to date as things change
5. **Retrieval**: Finding the right information at the right time

The [[llm-wiki-pattern]] addresses all five by delegating organisation, connection, and maintenance to an LLM.

## Links

- [[llm-wiki-pattern]] — An LLM-powered approach to building a PKB
- [[andrej-karpathy]] — Proposed using LLMs to maintain a wiki-style PKB
- [[retrieval-augmented-generation]] — An alternative AI approach to PKBs

## Sources

- [LLM Wiki Introduction](../sources/llm-wiki-introduction.md)
