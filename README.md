# llm-wiki-helloworld

A Hello World for the [LLM Wiki pattern](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f) — learn it using GitHub Copilot in VS Code.

> Drop raw sources into a folder. Copilot reads them, builds a structured wiki, and keeps it up-to-date. You just read and ask questions.

---

## Folder Structure

```
raw/        → Your raw sources  (never modified by Copilot)
wiki/       → Copilot-maintained wiki
outputs/    → Query results and reports
```

---

## Quick Start

### 1. Open in VS Code

Clone this repo and open it in VS Code. Copilot automatically reads `.github/copilot-instructions.md` — no setup needed.

### 2. Browse the example

- [`raw/articles/llm-wiki-introduction.md`](raw/articles/llm-wiki-introduction.md) — a raw source
- [`wiki/sources/llm-wiki-introduction.md`](wiki/sources/llm-wiki-introduction.md) — the summary Copilot produced
- [`wiki/INDEX.md`](wiki/INDEX.md) — the master catalog

### 3. Add a source and ingest it

Drop a markdown file into `raw/articles/`, then open **Copilot Chat** (`Ctrl+Shift+I` / `Cmd+Shift+I`) and type:

```
Ingest the new files in raw/articles/ and update the wiki.
```

### 4. Query your wiki

```
Query the wiki: what do we know about [topic]?
```

---

## Credits

- Pattern by [Andrej Karpathy](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f) — License: MIT