---
type: entity
category: person
created: 2026-05-04
updated: 2026-05-04
sources: [raw/messages/team-llm-wiki-adoption-discussion.md]
---

# David Park

DevOps Engineer who proposed automating the ingest workflow via GitHub Actions for the [[llm-wiki-pattern]] pilot.

## Overview

David Park is a DevOps Engineer on the same team as [[alice-chen]]. His initial concern was infrastructure overhead — "we're already drowning in tools" — but the zero-infrastructure nature of the LLM Wiki Pattern (plain markdown in a git repo, no servers) addressed that concern. He was assigned to build a GitHub Actions workflow to automatically trigger ingest whenever new files are pushed to the `raw/` folder.

## Key Points

- Raised access control as a concern; accepted the convention of keeping secrets out of `raw/` entirely.
- Convinced by the absence of external infrastructure dependencies.
- Proposed and was assigned to build GitHub Actions automation for the ingest workflow.

## Links

- [[llm-wiki-pattern]]
- [[alice-chen]]
- [[bob-martinez]]
- [[carol-liu]]

## Sources

- [Team Discussion: LLM Wiki Adoption](../sources/team-llm-wiki-adoption-discussion.md)
