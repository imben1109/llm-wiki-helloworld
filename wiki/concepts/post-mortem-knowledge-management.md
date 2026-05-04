---
type: concept
domain: engineering
created: 2026-05-04
updated: 2026-05-04
sources: [raw/messages/team-llm-wiki-adoption-discussion.md]
---

# Post-Mortem Knowledge Management

The practice of capturing, structuring, and making searchable the lessons learned from engineering incidents and outages.

## Definition

Post-mortem knowledge management refers to systematically recording incident post-mortems and making the knowledge within them discoverable and synthesisable over time. The goal is to turn individual incident reports into a compounding knowledge base that reveals cross-incident patterns, recurring root causes, and shared mitigations.

## How It Works

In many organisations, post-mortems are written once and then forgotten — scattered across Notion, Confluence, GitHub Issues, Google Docs, or email threads. This fragmentation prevents teams from asking higher-order questions like "what are our most common failure modes?" or "which services have the most recurring incidents?"

The [[llm-wiki-pattern]] directly addresses this by treating post-mortems as raw source material. Each post-mortem is dropped into `raw/notes/`, ingested by the LLM, and turned into structured wiki pages. Entities (services, teams, on-call engineers), concepts (failure patterns, mitigations), and cross-references are extracted automatically.

## Examples

- A team migrates their last five post-mortems into `raw/notes/` as a pilot; the LLM extracts recurring root causes and cross-references them across incidents.
- An engineer asks "what are the common failure patterns across all our incidents?" — the LLM synthesises an answer from the wiki only, citing specific post-mortems.
- The wiki flags a contradiction: two post-mortems recommend opposite mitigation strategies for the same class of failure.

## Links

- [[llm-wiki-pattern]]
- [[personal-knowledge-base]]
- [[contradiction-detection]]
- [[bob-martinez]]

## Sources

- [Team Discussion: LLM Wiki Adoption](../sources/team-llm-wiki-adoption-discussion.md)
