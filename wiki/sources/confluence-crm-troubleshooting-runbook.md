---
type: source
format: article
platform: Confluence
raw_path: raw/articles/confluence-crm-troubleshooting-runbook.md
ingested: 2026-05-05
---

# Confluence: CRM Application Troubleshooting Runbook

## Summary

A Confluence runbook maintained by the Application Support team for the CRM application. It is the canonical first reference for support engineers handling CRM-related incidents. The page covers common issues (login failures, slow performance, data sync errors), step-by-step diagnostic and resolution procedures, an escalation path table by severity (P1–P4), and a known issues log.

The runbook was last updated by [[james-patel]] on 2026-05-01, following the resolution of INC-2026-0501-001 (see [[teams-crm-support-incident]]), which added the service account password rotation issue and its resolution steps.

## Key Takeaways

- Three common issue categories are documented: login failures (LDAP), slow performance (DB connection pool), and ERP data sync errors.
- The escalation path specifies response times and owners for each severity level (P1 to P4).
- Known issues log (KI-001 to KI-003) tracks open and resolved issues with workarounds and target fix versions.
- A recurring trigger is explicitly documented: AD group policy auto-rotates service account passwords every 90 days; the CRM config must be manually updated until an automation fix is delivered.
- The runbook links to related procedures: credential rotation checklist, AD service account management, incident management process.

## Entities Mentioned

- [[kevin-obrien]]
- [[james-patel]]

## Concepts Mentioned

- [[incident-management]]
- [[application-support-runbook]]
- [[service-account-management]]

## Notable Quotes

> "⚠️ Known trigger: Active Directory group policy enforces automatic 90-day service account password rotation. After each AD group policy update cycle, check whether crm-svc is due for rotation."
