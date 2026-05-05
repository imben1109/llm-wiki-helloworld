---
type: concept
domain: engineering | operations
created: 2026-05-05
updated: 2026-05-05
sources: [raw/messages/teams-crm-support-incident.md, raw/articles/confluence-crm-troubleshooting-runbook.md]
---

# Incident Management

The structured process of detecting, diagnosing, resolving, and documenting an unexpected disruption to an application or service.

## Definition

Incident management is the end-to-end workflow for handling unplanned service disruptions — from the moment an issue is reported until service is restored and follow-up actions are completed. A mature incident management process assigns clear roles (incident lead, technical responder, application owner), defines severity levels with associated response time targets, and mandates post-incident documentation to prevent recurrence.

## How It Works

A typical incident lifecycle:

1. **Detection** — A user report, monitoring alert, or support ticket identifies a disruption.
2. **Triage** — The incident lead assigns a severity (P1–P4) based on impact and scope.
3. **Investigation** — The technical responder gathers logs, checks recent changes, and identifies the root cause.
4. **Resolution** — A fix is applied and confirmed with affected users.
5. **Closure** — The incident is formally closed with a summary of root cause and impact.
6. **Post-incident** — Root cause and resolution steps are recorded in the [[application-support-runbook]] or known issues log; follow-up change requests are raised.

## Examples

- A CRM P2 incident (login failures for ~47 users) was opened, diagnosed, resolved, and closed within 50 minutes via a Microsoft Teams thread; root cause was documented in Confluence immediately after.
- The CRM Troubleshooting Runbook defines P1–P4 severity levels with response times (15 min for P1, 30 min for P2, 4 hours for P3).

## Links

- [[application-support-runbook]]
- [[post-mortem-knowledge-management]]
- [[service-account-management]]
- [[sarah-wong]]
- [[james-patel]]

## Sources

- [Microsoft Teams: CRM Support Incident](../sources/teams-crm-support-incident.md)
- [Confluence: CRM Troubleshooting Runbook](../sources/confluence-crm-troubleshooting-runbook.md)
