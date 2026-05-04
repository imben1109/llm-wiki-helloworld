---
title: "Team Discussion: Adopting the LLM Wiki Pattern for Our Engineering Knowledge Base"
platform: "Slack"
channel: "#engineering-knowledge"
date: 2026-05-01
participants:
  - Alice Chen (Engineering Lead)
  - Bob Martinez (Senior Backend Engineer)
  - Carol Liu (ML Engineer)
  - David Park (DevOps Engineer)
topic: "LLM Wiki Pattern"
---

# Team Message Thread: LLM Wiki Pattern Adoption

**Channel**: #engineering-knowledge  
**Date**: 2026-05-01  

---

**Alice Chen** [09:02]  
Hey team 👋 I came across this interesting pattern by Andrej Karpathy for building a self-maintaining knowledge base using LLMs. The idea is: you drop raw notes/articles into a `raw/` folder, and the LLM automatically reads them, extracts entities and concepts, and builds a structured, interlinked wiki. Thinking we could use this to document our architectural decisions and runbooks. Thoughts?

**Bob Martinez** [09:15]  
Sounds interesting. How is it different from just keeping a Confluence space or Notion wiki?

**Alice Chen** [09:18]  
Main difference: the LLM does the organising and cross-referencing automatically. You drop a raw meeting note or article in, say "ingest this", and it creates structured pages, finds related topics, and flags contradictions with existing docs. No manual tagging or linking required.

**Carol Liu** [09:24]  
I've actually been experimenting with this locally! The killer feature for me is contradiction detection. When two ADRs (Architecture Decision Records) disagree, the wiki flags it immediately. We have a few of those lurking in our current Confluence that nobody notices.

**David Park** [09:31]  
What's the infra story? We're already drowning in tools.

**Alice Chen** [09:33]  
That's the best part — it's just markdown files in a git repo. No vector databases, no embeddings, no servers. The entire thing is folders + a prompt file. Compatible with Obsidian if you want graph visualisation.

**Bob Martinez** [09:41]  
OK, that's compelling. But who maintains the prompt/schema file? If it drifts, the whole wiki degrades.

**Carol Liu** [09:45]  
We version the schema file with the repo. It's a `CLAUDE.md` or `copilot-instructions.md` — just a markdown file describing the rules. Changing it is a normal PR.

**David Park** [09:52]  
What about access control? Not everything should be in one flat wiki.

**Alice Chen** [09:55]  
Good point. My proposal: start with a public-to-the-team monorepo for general engineering knowledge. Sensitive stuff (credentials, PII) stays out of `raw/` entirely — that's enforced by the "raw sources are immutable/never contain secrets" rule baked into the schema.

**Bob Martinez** [10:03]  
I like the idea of putting our post-mortems in there. Right now they're scattered across Notion, GitHub Issues, and someone's Google Doc from 2024.

**Carol Liu** [10:07]  
Yes! And once they're ingested, you can ask "what are the common failure patterns across all our incidents?" and the LLM synthesises an answer from the wiki only — no hallucination, because it's constrained to the actual ingested content.

**David Park** [10:12]  
Alright, I'm sold on a pilot. Who wants to set it up?

**Alice Chen** [10:14]  
I'll create the repo and schema this week. @Carol Liu — can you help write the ingest prompt? You've already tested this.

**Carol Liu** [10:15]  
On it 👍

**Bob Martinez** [10:16]  
I'll start migrating our last 5 post-mortems into `raw/notes/` as the first batch.

**David Park** [10:18]  
I can set up a GitHub Actions workflow to run ingest automatically whenever someone pushes to `raw/`. That way the wiki stays fresh without anyone having to remember to run it manually.

**Alice Chen** [10:20]  
Perfect. Let's reconvene next Thursday to review the pilot. I'll create the tracking issue.

---

**Summary of decisions made in this thread:**
1. Adopt the LLM Wiki Pattern for team engineering knowledge base.
2. Start with a team-shared git repository (markdown files, no external infra).
3. Pilot content: last 5 post-mortems.
4. Alice: set up repo + schema. Carol: write ingest prompt. Bob: migrate post-mortems. David: GitHub Actions automation.
5. Review in one week.
