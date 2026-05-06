---
type: concept
domain: ai
created: 2026-04-25
updated: 2026-04-25
sources: [llm-wiki-introduction]
---

# Retrieval-Augmented Generation

A technique that grounds LLM responses in external documents by retrieving relevant content at query time, reducing hallucination and enabling answers about private or recent data.

## Definition

Retrieval-Augmented Generation (RAG) is a pattern where:
1. A corpus of documents is indexed (typically via vector embeddings)
2. When a user asks a question, the most relevant document chunks are retrieved
3. Those chunks are included in the LLM prompt as context
4. The LLM answers based on the retrieved context

## Strengths

- Works with any existing document corpus without restructuring
- Easy to set up with modern vector databases (Pinecone, Chroma, Weaviate)
- Handles large corpora that would not fit in a single context window
- Knowledge can be updated by re-indexing documents

## Limitations

- Knowledge is re-retrieved and re-interpreted every query (no compilation)
- No explicit cross-references between topics — connections are inferred at query time
- Contradictions between sources are not detected
- Knowledge does not compound — the corpus is flat
- Requires vector database and embedding infrastructure

## Comparison with LLM Wiki

The [[llm-wiki-pattern]] takes a different approach: knowledge is compiled and structured **once** at ingest time, rather than retrieved raw at query time. See [[llm-wiki-pattern]] for the full comparison.

## Links

- [[llm-wiki-pattern]] — An alternative approach that compiles knowledge at ingest time
- [[personal-knowledge-base]] — The broader use case both approaches address
- [[transformer-architecture]] — The underlying architecture of the LLMs used in both RAG and LLM Wiki systems

## Sources

- [LLM Wiki Introduction](../sources/llm-wiki-introduction.md)
