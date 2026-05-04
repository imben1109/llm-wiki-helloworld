---
type: entity
category: person
created: 2026-05-04
updated: 2026-05-04
sources: [raw/messages/team-llm-wiki-adoption-discussion.md]
---

# Alice Chen

Engineering Lead who championed adoption of the [[llm-wiki-pattern]] for her team's internal knowledge base.

## Overview

Alice Chen is an Engineering Lead who introduced the LLM Wiki Pattern to her engineering team, drawing on the work of [[andrej-karpathy]]. She led the decision to pilot the pattern for consolidating scattered engineering documentation — post-mortems, architecture decisions, and runbooks — into a single, LLM-maintained git repository.

## Key Points

- Proposed using the LLM Wiki Pattern as a replacement for Confluence/Notion for internal engineering docs.
- Emphasised the zero-infrastructure footprint: plain markdown files in a git repo, no external services.
- Defined the access-control boundary: sensitive data (credentials, PII) is kept out of `raw/` by convention.
- Organised the pilot action plan and assigned owners for each component.

## Links

- [[llm-wiki-pattern]]
- [[bob-martinez]]
- [[carol-liu]]
- [[david-park]]
- [[andrej-karpathy]]

## Sources

- [Team Discussion: LLM Wiki Adoption](../sources/team-llm-wiki-adoption-discussion.md)
