---
type: concept
domain: engineering | operations
created: 2026-05-05
updated: 2026-05-05
sources: [raw/articles/confluence-crm-troubleshooting-runbook.md, raw/messages/teams-crm-support-incident.md]
---

# Application Support Runbook

A structured reference document that application support engineers use to diagnose and resolve known issues for a specific application.

## Definition

An application support runbook is a living document — typically maintained in a wiki or knowledge base such as Confluence — that captures common issues, step-by-step diagnostic procedures, resolution scripts, escalation paths, and a known issues log for a given application. Runbooks reduce mean time to resolution (MTTR) by codifying institutional knowledge: engineers follow a documented path rather than rediscovering solutions from scratch on each incident.

## How It Works

A good runbook covers:

- **Application overview** — app servers, authentication method, config and log file paths.
- **Escalation path** — severity levels (P1–P4) with response time targets and owner contacts.
- **Common issues** — each with symptoms, likely root causes (in order of likelihood), diagnostic steps, and resolution commands.
- **Known issues log** — a table of recurring issues with current status, workarounds, and target fix versions.
- **Related articles** — links to adjacent procedures (credential rotation, architecture overview, incident management process).

Runbooks should be updated immediately after every incident resolution (see [[post-mortem-knowledge-management]]) so the fix is available the next time the issue occurs.

## Examples

- The CRM Troubleshooting Runbook (Confluence, `APP-SUPPORT-CRM-001`) documents three common issue types, a P1–P4 escalation table, and a known issues log — updated by [[james-patel]] after the 2026-05-01 P2 incident.
- After the service account password rotation incident, the runbook was updated with a `⚠️ Known trigger` callout warning engineers to check service account rotation status after every AD group policy cycle.

## Links

- [[incident-management]]
- [[post-mortem-knowledge-management]]
- [[service-account-management]]
- [[james-patel]]
- [[kevin-obrien]]

## Sources

- [Confluence: CRM Troubleshooting Runbook](../sources/confluence-crm-troubleshooting-runbook.md)
- [Microsoft Teams: CRM Support Incident](../sources/teams-crm-support-incident.md)
