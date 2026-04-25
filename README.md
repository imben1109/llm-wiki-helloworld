# llm-wiki-helloworld

A **Hello World** for the [LLM Wiki pattern](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f) popularised by Andrej Karpathy.

> Drop raw sources into a folder. Your AI reads them, builds a structured, interlinked wiki, and keeps it up-to-date — automatically. You just read and ask questions.

---

## What Is the LLM Wiki Pattern?

Traditional note-taking and RAG systems re-retrieve information from scratch every time you ask a question. The LLM Wiki pattern is different:

| | Traditional RAG | LLM Wiki |
|---|---|---|
| Knowledge | Re-retrieved each query | Compiled once, maintained continuously |
| Cross-references | None | Built and maintained automatically |
| Contradictions | Not detected | Flagged on ingest |
| Compounding | Flat | Grows richer over time |
| Infrastructure | Vector DB + embeddings | Just folders + markdown |

The **three-layer architecture** is:

```
raw/        → Your raw sources  (LLM reads only, never modifies)
wiki/       → LLM-maintained wiki  (LLM creates, updates, organises)
outputs/    → Query results, reports, briefs
```

---

## This Hello World

This repository is a pre-populated example that lets you explore the pattern before setting up your own wiki. It includes:

- **One raw source** in `raw/articles/` about the LLM Wiki pattern itself
- **Pre-generated wiki pages** in `wiki/` showing exactly what an LLM produces:
  - An entity page for Andrej Karpathy (`wiki/entities/`)
  - Two concept pages (`wiki/concepts/`)
  - A source summary (`wiki/sources/`)
  - A master index (`wiki/INDEX.md`)
  - An activity log (`wiki/LOG.md`)
- **`.github/copilot-instructions.md`** — the schema and rules that GitHub Copilot reads automatically in VS Code
- **`config.yaml`** — configuration for topics, feeds, and schedules

---

## Quick Start with GitHub Copilot

### Step 1 — Open the project in VS Code

Clone this repository and open the folder in VS Code.  
GitHub Copilot will automatically read `.github/copilot-instructions.md` so it already understands the wiki schema — no extra setup needed.

### Step 2 — Browse the example

Read through these files to understand what the wiki looks like:

1. [`raw/articles/llm-wiki-introduction.md`](raw/articles/llm-wiki-introduction.md) — a raw source article
2. [`wiki/sources/llm-wiki-introduction.md`](wiki/sources/llm-wiki-introduction.md) — the source summary Copilot extracted
3. [`wiki/concepts/llm-wiki-pattern.md`](wiki/concepts/llm-wiki-pattern.md) — a concept page
4. [`wiki/entities/andrej-karpathy.md`](wiki/entities/andrej-karpathy.md) — an entity page
5. [`wiki/INDEX.md`](wiki/INDEX.md) — the master catalog of all pages

### Step 3 — Add your own source

Create a new markdown file in `raw/articles/` with this frontmatter:

```markdown
---
title: "Your Article Title"
url: "https://example.com/article"
author: "Author Name"
discovered: 2026-04-25
topic: "your topic"
---

Article content here...
```

### Step 4 — Ask Copilot to ingest it

Open **Copilot Chat** in VS Code (`Ctrl+Shift+I` / `Cmd+Shift+I`) and type:

```
Ingest the new files in raw/articles/ and update the wiki.
```

Copilot will:
- Create a source summary in `wiki/sources/`
- Create or update entity and concept pages in `wiki/entities/` and `wiki/concepts/`
- Update `wiki/INDEX.md` and `wiki/LOG.md`

### Step 5 — Query your wiki

In Copilot Chat:

```
Query the wiki: what do we know about [topic]?
```

Or for a health check:

```
Run a lint check on the wiki and save the report to outputs/.
```

---

## Copilot Chat Reference

| What you want | What to type in Copilot Chat |
|---|---|
| Ingest new sources | `Ingest the new files in raw/articles/ and update the wiki.` |
| Ask a question | `Query the wiki: what do we know about [topic]?` |
| Health check | `Run a lint check on the wiki and save the report to outputs/.` |
| Deep-dive analysis | `Synthesise everything the wiki knows about [topic] and save to wiki/syntheses/.` |

> **Tip:** Copilot reads `.github/copilot-instructions.md` automatically, so you never need to say "read the instructions first" — it already knows the schema.

---

## Core Workflows

### `ingest` — Process new sources
1. Read a new file from `raw/`
2. Create a source summary in `wiki/sources/`
3. Extract entities → create/update `wiki/entities/`
4. Extract concepts → create/update `wiki/concepts/`
5. Add cross-references between pages
6. Flag any contradictions with existing content
7. Update `wiki/INDEX.md` and `wiki/LOG.md`

### `query` — Answer a question
1. Read `wiki/INDEX.md` to find relevant pages
2. Read those pages
3. Synthesise an answer with citations
4. Save valuable answers to `wiki/syntheses/` or `outputs/`

### `lint` — Health check
1. Find contradictions between wiki pages
2. Find orphan pages (nothing links to them)
3. Find broken links
4. Report knowledge gaps

---

## Folder Structure

```
llm-wiki-helloworld/
├── README.md                              ← You are here
├── .github/copilot-instructions.md        ← Schema + rules (Copilot reads this automatically)
├── config.yaml                            ← Topics, feeds, schedule
│
├── raw/                        ← YOUR SOURCES (never modified by the LLM)
│   ├── articles/               ← Web articles, blog posts, papers
│   └── notes/                  ← Personal notes
│
├── wiki/                       ← LLM-maintained wiki (don't edit manually)
│   ├── INDEX.md                ← Master catalog of every wiki page
│   ├── LOG.md                  ← Activity log of every change
│   ├── entities/               ← People, organisations, tools, projects
│   ├── concepts/               ← Ideas, patterns, methodologies
│   ├── sources/                ← Summary of each raw source
│   └── syntheses/              ← Analysis, comparisons, deep dives
│
└── outputs/                    ← Query results, reports, briefs
```

---

## Next Steps

- Add your own sources to `raw/articles/` and run `ingest`
- Extend `config.yaml` with your own topics
- Open the `wiki/` folder in [Obsidian](https://obsidian.md/) for a graph view of connections
- See [mduongvandinh/llm-wiki](https://github.com/mduongvandinh/llm-wiki) for a full-featured implementation with auto-discovery, variants, and a browser viewer

---

## Credits

- Pattern concept: [Andrej Karpathy — LLM Wiki](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f)
- License: MIT