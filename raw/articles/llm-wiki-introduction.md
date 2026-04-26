---
title: "The LLM Wiki Pattern — Build a Personal Knowledge Base That Maintains Itself"
url: "https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f"
author: "Andrej Karpathy"
discovered: 2026-04-25
topic: "LLM Wiki Pattern"
---

# The LLM Wiki Pattern

## Overview

The LLM Wiki pattern is a methodology for building and maintaining a personal knowledge base using large language models. Instead of manually writing notes, the user drops raw sources into a folder and the LLM reads them, extracts structured knowledge, and builds an interlinked wiki automatically.

The key insight is that LLMs are excellent at reading, summarising, and organising information — tasks that humans find tedious and time-consuming. By delegating these tasks to an LLM, the knowledge base compounds over time with minimal human effort.

## The Three Layers

The system has three distinct layers:

**1. Raw sources (`raw/`)**
This is where the user places their source material: articles, papers, notes, book highlights, Reddit threads, etc. These files are immutable — the LLM never modifies them. They serve as the ground truth from which everything else is derived.

**2. The wiki (`wiki/`)**
The LLM owns and maintains this layer entirely. It contains structured, interlinked markdown pages organised into:
- **Entities**: People, organisations, tools, projects
- **Concepts**: Ideas, patterns, methodologies
- **Sources**: A summary page for each raw source
- **Syntheses**: Analysis and comparisons across multiple sources

Every page cross-references related pages using wiki links (e.g. `[[concept-name]]`). This creates a graph of knowledge that grows richer as more sources are ingested.

**3. Outputs (`outputs/`)**
When the user asks a question, the LLM reads the relevant wiki pages and synthesises an answer with citations. Valuable answers are saved here.

## Core Workflows

### Ingest
When the user adds a new file to `raw/`, they ask the LLM to "ingest" it. The LLM:
1. Creates a source summary
2. Extracts entities and concepts, creating or updating wiki pages for each
3. Adds cross-references to existing pages
4. Detects and flags contradictions with existing content
5. Updates the master index (`wiki/INDEX.md`) and activity log (`wiki/LOG.md`)

A single source can affect 5–15 wiki pages.

### Query
The user asks a question. The LLM reads `wiki/INDEX.md` to locate relevant pages, reads those pages, and synthesises an answer with citations. Only information from the wiki is used — not the LLM's general training knowledge.

### Lint
The LLM scans the wiki for health issues: contradictions, orphan pages (nothing links to them), broken links, stale claims, and knowledge gaps. The lint report guides the next round of discovery.

### Discover
The LLM automatically searches the web for new sources based on configured topics and the knowledge gaps identified by lint. Found sources are saved to `raw/articles/` and then ingested.

## Why Not Just Use RAG?

Retrieval-Augmented Generation (RAG) retrieves raw chunks of text at query time. The LLM Wiki pattern is different in several important ways:

- **Compiled knowledge**: Information is pre-processed and structured once, not re-retrieved and re-interpreted every time.
- **Cross-references**: Connections between topics are built explicitly, not inferred each query.
- **Contradiction detection**: When new information conflicts with existing knowledge, it is flagged immediately.
- **Compounding**: The wiki grows richer over time. Each ingest cycle adds context that improves future queries.
- **No infrastructure**: The entire system is folders and markdown files. No vector databases, no embeddings, no servers.

## Infrastructure

The pattern intentionally uses the simplest possible infrastructure:
- All data is plain markdown files in standard folders
- Works with any AI coding assistant (Claude Code, Cursor, GitHub Copilot, Codex CLI, Gemini CLI, Aider)
- Compatible with Obsidian for graph visualisation
- Can be stored in a git repository for version history and collaboration

## Origins

The pattern was described by Andrej Karpathy, a co-founder of OpenAI and former Tesla AI Director, in a GitHub Gist. Karpathy observed that LLMs are essentially "very good at reading and writing" and proposed using them as librarians that build and maintain structured knowledge from unstructured sources.

The pattern has been widely adopted, with many open-source implementations adding features like automatic web discovery, Reddit scanning, GitHub trending tracking, and ready-made templates for specific use cases (book reading companions, competitive intelligence, job search research).

## Key Principles

1. **Humans provide raw sources; LLMs organise them.** The human's job is curation. The LLM's job is organisation.
2. **Sources are sacred.** Raw files are never modified. The wiki is derived, not primary.
3. **Everything is cited.** Every claim in the wiki links back to a raw source.
4. **The wiki is for humans.** Even though the LLM writes it, it must be readable and useful to the human owner.
5. **Contradictions are visible.** When sources disagree, the wiki shows both views and flags the conflict.

## Getting Started

The simplest way to start:
1. Create the folder structure: `raw/articles/`, `wiki/`, `outputs/`
2. Add a `CLAUDE.md` (or `AGENTS.md`) file that describes the schema and rules
3. Drop a source file into `raw/articles/`
4. Ask your AI: "Read CLAUDE.md, then ingest everything in raw/articles/"
5. Browse the generated wiki pages
