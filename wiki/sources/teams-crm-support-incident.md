---
type: source
format: team-message
platform: Microsoft Teams
raw_path: raw/messages/teams-crm-support-incident.md
ingested: 2026-05-05
---

# Microsoft Teams: CRM Support Incident — P2 Login Failures

## Summary

An application support team coordinated the resolution of a P2 incident on Microsoft Teams. The CRM application was returning "Authentication failed" errors for approximately 47 users in the Sales team. [[sarah-wong]] (Application Support Lead) opened the incident and coordinated the response with [[james-patel]] (Support Engineer), [[kevin-obrien]] (CRM Application Owner), and [[lisa-tan]] (Infrastructure Engineer).

Root cause was identified within 19 minutes: an overnight Active Directory group policy update had automatically rotated the `crm-svc` service account password, but the CRM application's LDAP configuration was not updated to match. [[lisa-tan]] updated the config file on both app servers and restarted the auth service, fully restoring login access within 50 minutes of the incident opening.

The thread concluded with four follow-up actions, including updating the CRM Troubleshooting Runbook on Confluence and raising a change request to automate service account credential synchronisation.

## Key Takeaways

- Log analysis (`AuthService - LDAP bind failed`) was the decisive diagnostic step that pinpointed the root cause.
- Credential rotation was discussed in-thread but the actual new password was shared via a secure channel — a good security practice modelled in the message.
- The team referenced the Confluence Troubleshooting Runbook as the canonical place to record resolution steps for reuse.
- [[incident-management]] cycle (open → diagnose → fix → confirm → close) was completed within a single Teams thread.
- Follow-up: automating [[service-account-management]] credential sync to prevent recurrence.

## Entities Mentioned

- [[sarah-wong]]
- [[james-patel]]
- [[kevin-obrien]]
- [[lisa-tan]]

## Concepts Mentioned

- [[incident-management]]
- [[application-support-runbook]]
- [[service-account-management]]
- [[post-mortem-knowledge-management]]

## Notable Quotes

> "Please confirm the new credential through the secure channel, not here." — Sarah Wong

> "Please update the CRM Troubleshooting Runbook on Confluence with the root cause and resolution steps — this will definitely happen again." — Sarah Wong

> "I'll write up the post-incident notes and add this to the known issues log in Confluence." — James Patel
