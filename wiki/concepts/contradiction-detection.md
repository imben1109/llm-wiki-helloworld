---
type: concept
domain: ai | knowledge-management
created: 2026-05-04
updated: 2026-05-04
sources: [raw/messages/team-llm-wiki-adoption-discussion.md]
---

# Contradiction Detection

The automatic identification of conflicting claims or recommendations across ingested sources within a wiki.

## Definition

Contradiction detection is a core feature of the [[llm-wiki-pattern]] in which the LLM, during an ingest cycle, compares new information against existing wiki content and flags cases where the two conflict. A flagged contradiction is surfaced explicitly in the relevant wiki pages — both views are shown, and the conflict is noted — rather than allowing silently inconsistent documentation to accumulate.

## How It Works

When a new source is ingested, the LLM reads all existing wiki pages related to the topics in the new source. If the new source makes a claim that contradicts an existing wiki page (e.g., two post-mortems recommend opposite mitigations, or two ADRs prescribe different technology choices for the same problem), the LLM:

1. Notes the contradiction inline on the relevant concept or entity page.
2. Cites both sources.
3. Leaves resolution to the human owner — the wiki records the conflict, not an arbitrary resolution.

The `flag_contradictions: true` setting in `config.yaml` controls whether this behaviour is active.

## Examples

- Two [[architecture-decision-records]] recommend different logging libraries; the contradiction is flagged on the "Logging" concept page.
- Two post-mortems recommend opposite mitigation strategies for the same failure class; both recommendations are shown on the relevant concept page with a ⚠️ flag.
- A new article contradicts a claim made in an older article; the wiki shows both claims with their respective source citations.

## Links

- [[llm-wiki-pattern]]
- [[architecture-decision-records]]
- [[post-mortem-knowledge-management]]
- [[carol-liu]]

## Sources

- [Team Discussion: LLM Wiki Adoption](../sources/team-llm-wiki-adoption-discussion.md)
