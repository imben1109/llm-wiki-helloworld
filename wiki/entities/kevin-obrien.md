---
type: entity
category: person
created: 2026-05-05
updated: 2026-05-05
sources: [raw/messages/teams-crm-support-incident.md, raw/articles/confluence-crm-troubleshooting-runbook.md]
---

# Kevin O'Brien

CRM Application Owner who provided application-layer context during the P2 incident and owns the CRM Troubleshooting Runbook on Confluence.

## Overview

Kevin O'Brien is the CRM Application Owner, responsible for the CRM application's configuration, change approval, and Confluence documentation. During the P2 incident, he identified the exact location of the service account credentials in the CRM config file and confirmed the credential update channel. He was also assigned to raise a change request to automate [[service-account-management]] credential synchronisation with Active Directory to prevent recurrence.

## Key Points

- Provided the critical config file path (`/opt/crm/config/ldap.properties`) during the incident, accelerating resolution.
- Transmitted the new service account password via a secure channel (not in the Teams thread).
- Named as application owner in the CRM Troubleshooting Runbook on Confluence.
- Committed to raising a change request for automated service account password sync.

## Links

- [[incident-management]]
- [[application-support-runbook]]
- [[service-account-management]]
- [[sarah-wong]]
- [[james-patel]]
- [[lisa-tan]]

## Sources

- [Microsoft Teams: CRM Support Incident](../sources/teams-crm-support-incident.md)
- [Confluence: CRM Troubleshooting Runbook](../sources/confluence-crm-troubleshooting-runbook.md)
