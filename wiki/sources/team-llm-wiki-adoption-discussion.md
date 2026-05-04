---
type: source
format: team-message
raw_path: raw/messages/team-llm-wiki-adoption-discussion.md
ingested: 2026-05-04
---

# Team Discussion: Adopting the LLM Wiki Pattern

## Summary

An engineering team at a software company discussed adopting the [[llm-wiki-pattern]] for their internal knowledge base on Slack. The thread was initiated by Alice Chen (Engineering Lead), who introduced the pattern invented by [[andrej-karpathy]] as a way to automatically organise engineering documentation — architectural decisions, runbooks, and post-mortems — using an LLM.

The team compared the approach to existing tools (Confluence, Notion) and concluded the key differentiators are: automatic cross-referencing, contradiction detection across documents, and zero external infrastructure. The entire system runs as markdown files in a git repository.

The thread ended with a concrete action plan: a one-week pilot using the last five post-mortems as seed content, a GitHub Actions workflow for automated ingest, and a designated owner for each component.

## Key Takeaways

- The team chose the LLM Wiki Pattern over Confluence/Notion because of automatic cross-referencing and contradiction detection.
- Zero-infrastructure appeal was decisive for the DevOps engineer: no vector databases, no embeddings, no servers.
- Post-mortems were identified as the highest-value initial content — currently scattered across multiple tools.
- A [[github-actions-ingest-workflow]] was proposed to trigger ingest automatically on every push to `raw/`.
- The "raw sources never contain secrets" rule was cited as the access-control boundary.
- Contradiction detection across Architecture Decision Records (ADRs) was highlighted as a key pain point the pattern solves.

## Entities Mentioned

- [[alice-chen]]
- [[bob-martinez]]
- [[carol-liu]]
- [[david-park]]
- [[andrej-karpathy]]

## Concepts Mentioned

- [[llm-wiki-pattern]]
- [[personal-knowledge-base]]
- [[contradiction-detection]]
- [[architecture-decision-records]]
- [[post-mortem-knowledge-management]]

## Notable Quotes

> "The killer feature for me is contradiction detection. When two ADRs disagree, the wiki flags it immediately." — Carol Liu

> "It's just markdown files in a git repo. No vector databases, no embeddings, no servers." — Alice Chen

> "Once they're ingested, you can ask 'what are the common failure patterns across all our incidents?' and the LLM synthesises an answer from the wiki only — no hallucination." — Carol Liu
