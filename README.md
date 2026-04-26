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

## Credits

- Pattern by [Andrej Karpathy](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f) — License: MIT