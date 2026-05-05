# llm-wiki-helloworld

A Hello World for the [LLM Wiki pattern](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f) — learn it using **GitHub Copilot in VS Code**.

> Drop raw sources into a folder. Copilot reads them, builds a structured wiki, and keeps it up-to-date. You just read and ask questions.

> **No CLI required.** This project works entirely through the GitHub Copilot Chat panel inside VS Code.

---

## Requirements

- [VS Code](https://code.visualstudio.com/)
- [GitHub Copilot extension](https://marketplace.visualstudio.com/items?itemName=GitHub.copilot) (includes Copilot Chat)
- A GitHub account with an active Copilot subscription

No terminal commands, no GitHub CLI, no extra tools.

---

## Folder Structure

```
raw/        → Your raw sources  (never modified by Copilot)
wiki/       → Copilot-maintained wiki
outputs/    → Query results and reports
```

---

## How to Use It

### 1. Clone and open in VS Code

Clone this repo and open it in VS Code.

```
git clone https://github.com/imben1109/llm-wiki-helloworld.git
code llm-wiki-helloworld
```

VS Code will automatically pick up `.github/copilot-instructions.md`, which tells Copilot how to manage this wiki. No extra configuration needed.

### 2. Browse the included example

- [`raw/articles/llm-wiki-introduction.md`](raw/articles/llm-wiki-introduction.md) — a raw source article
- [`wiki/sources/llm-wiki-introduction.md`](wiki/sources/llm-wiki-introduction.md) — the summary Copilot produced from it
- [`wiki/INDEX.md`](wiki/INDEX.md) — the master catalog of all wiki pages

### 3. Add your own source and ingest it

1. Drop any markdown (`.md`) or text file into `raw/articles/`.
2. Open **Copilot Chat** in VS Code:
   - Keyboard shortcut: `Ctrl+Shift+I` (Windows/Linux) or `Cmd+Shift+I` (macOS)
   - Or click the Copilot icon in the sidebar.
3. Type the following prompt and press **Enter**:

```
Ingest the new files in raw/articles/ and update the wiki.
```

Copilot will read the new file, create a source summary in `wiki/sources/`, extract entities and concepts, and update `wiki/INDEX.md` — all automatically.

### 4. Query your wiki

Open Copilot Chat and ask questions like:

```
Query the wiki: what do we know about [topic]?
```

```
Summarise everything in the wiki about [topic].
```

```
What are the key concepts in the wiki?
```

### 5. Run a health check (lint)

```
Run a wiki lint check and save the report to outputs/.
```

Copilot will check for broken links, orphan pages, and knowledge gaps, then write a report to `outputs/`.

---

## Tips

- All interactions happen in **Copilot Chat** — no terminal commands needed.
- The `raw/` folder is read-only for Copilot. Put your sources there; Copilot will never modify them.
- Keep source files in markdown format for best results.
- The wiki is entirely managed inside the `wiki/` folder — feel free to read any page there.

---

## Alternatives

The LLM Wiki pattern is one of several approaches to building a personal knowledge base. Key alternatives include:

### Traditional (manual) tools
| Tool | Description |
|------|-------------|
| **Plain notes / Markdown folders** | Simple files in folders; low friction but no automatic organisation |
| **Zettelkasten** | Atomic, interlinked notes with unique IDs; powerful but requires strict discipline |
| **Obsidian / Roam / Notion** | Graph-based PKB tools with rich linking; still requires manual writing and tagging |
| **Wiki software (MediaWiki etc.)** | Cross-referenced pages; collaborative but entirely manual |

### AI-assisted alternatives
| Approach | Description |
|----------|-------------|
| **RAG (Retrieval-Augmented Generation)** | Indexes documents into a vector database; retrieves relevant chunks at query time. See [Why Not Just Use RAG?](#why-not-just-use-rag) below. |
| **Full chat with documents** | Upload files directly to an LLM chat session; simple but no persistent, structured knowledge base |
| **AI note assistants** (Notion AI, Mem, etc.) | Integrated AI inside existing PKB tools; still relies on manual note creation |

### Why Not Just Use RAG?

| Aspect | Traditional RAG | LLM Wiki |
|--------|----------------|----------|
| When knowledge is processed | At query time | At ingest time (once) |
| Cross-references | None — inferred per query | Explicit and maintained |
| Contradiction detection | Not detected | Flagged on ingest |
| Growth over time | Flat corpus | Compounding wiki |
| Infrastructure required | Vector DB + embeddings | Folders + markdown only |

---

## Advantages

- **No infrastructure** — the entire system is plain markdown files and folders; no vector database, no embeddings, no servers required.
- **Compiled knowledge** — information is processed and structured once at ingest time, making queries fast and consistent.
- **Explicit cross-references** — connections between topics are built and maintained automatically, creating a graph of knowledge.
- **Contradiction detection** — when a new source conflicts with existing wiki content, the conflict is flagged immediately.
- **Compounding value** — each new source adds context that enriches existing pages, so the wiki becomes more useful over time.
- **Works with any AI assistant** — compatible with GitHub Copilot, Claude, Cursor, Codex CLI, Gemini CLI, Aider, and others.
- **Git-friendly** — all content is plain text, so version history, branching, and collaboration work out of the box.
- **Human-readable** — the wiki is written for humans; you can read and browse it directly without querying an AI.
- **Obsidian-compatible** — the `[[wiki-link]]` format works with Obsidian for graph visualisation.

---

## Disadvantages / Limitations

- **Manual ingest trigger** — you must ask the LLM to ingest new sources; there is no fully automatic pipeline unless you add one.
- **Re-ingest required for updates** — if a raw source changes, the wiki pages derived from it are not updated automatically.
- **LLM quality dependency** — the structure and accuracy of the wiki depends on how well the LLM follows the schema instructions; a weaker model may produce inconsistent results.
- **Context window limits** — very large source files or a very large wiki may exceed the LLM's context window, requiring chunking strategies.
- **Schema maintenance** — the `copilot-instructions.md` schema must be kept clear and up to date; a poorly written schema leads to a poorly organised wiki.
- **Not real-time** — unlike RAG, which can answer from any document immediately, the LLM Wiki requires an explicit ingest step before new sources are queryable.
- **Single-user by default** — while git enables collaboration, the pattern is primarily designed for personal use; multi-user workflows require additional conventions.

---

## Credits

- Pattern by [Andrej Karpathy](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f) — License: MIT