---
type: concept
domain: engineering
created: 2026-05-04
updated: 2026-05-04
sources: [raw/messages/team-llm-wiki-adoption-discussion.md]
---

# Architecture Decision Records

Lightweight documents that capture the context, options considered, and rationale behind a significant architectural decision.

## Definition

An Architecture Decision Record (ADR) is a short markdown document — typically one to two pages — that records a single architectural decision: what was decided, why, what alternatives were considered, and what the consequences are. ADRs are stored alongside the codebase (commonly in `docs/decisions/`) and treated as immutable historical records.

## How It Works

ADRs are written at the time a decision is made and typically never updated (a superseding decision gets a new ADR). Over time, a codebase accumulates dozens or hundreds of ADRs. This creates a documentation problem: contradictions between old and new ADRs go unnoticed, and new engineers cannot easily navigate the decision history.

The [[llm-wiki-pattern]] addresses this by ingesting ADRs as raw sources. The LLM extracts entities (services, technologies, teams), concepts (patterns, tradeoffs), and — critically — detects when two ADRs contradict each other on the same topic. Contradictions are flagged explicitly in the wiki rather than silently coexisting.

## Examples

- Two ADRs recommend different logging libraries for the same service class; the wiki flags the contradiction.
- A new engineer asks "why did we choose gRPC over REST for internal services?" — the wiki cites the relevant ADR.
- The wiki synthesises a page listing all decisions related to the database layer, with cross-references.

## Links

- [[llm-wiki-pattern]]
- [[contradiction-detection]]
- [[personal-knowledge-base]]
- [[carol-liu]]

## Sources

- [Team Discussion: LLM Wiki Adoption](../sources/team-llm-wiki-adoption-discussion.md)
