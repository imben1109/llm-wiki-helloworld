---
type: concept
domain: engineering | security | operations
created: 2026-05-05
updated: 2026-05-05
sources: [raw/messages/teams-crm-support-incident.md, raw/articles/confluence-crm-troubleshooting-runbook.md]
---

# Service Account Management

The practice of creating, securing, rotating, and auditing non-human (application) accounts used by services to authenticate with other systems.

## Definition

A service account is a non-human identity used by an application or automated process to authenticate with a downstream system (e.g., an LDAP directory, a database, or an API). Service account management covers the lifecycle of these accounts: provisioning, credential rotation, auditing, and decommissioning. Poor service account management — particularly uncoordinated credential rotation — is a common root cause of application authentication failures.

## How It Works

Service accounts are typically created in an identity provider such as Active Directory (AD). Their credentials (passwords or certificates) must be stored in application configuration files or secrets managers and kept in sync with the identity provider.

Common failure mode: an identity provider enforces automatic credential rotation (e.g., 90-day AD group policy) and rotates the service account password, but the application config is not updated to match. This causes the application's LDAP/database bind to fail at runtime — often surfacing as a generic "authentication failed" error to end users.

**Best practices:**
- Store service account credentials in a secrets manager rather than plain config files.
- Automate credential rotation synchronisation between the identity provider and the application.
- Maintain a credential rotation checklist for any accounts not yet automated.
- Never transmit service account passwords over unencrypted channels (e.g., chat messages).

## Examples

- The CRM `crm-svc` service account was auto-rotated by AD group policy at 02:15; the CRM config was not updated, causing a P2 login failure incident for 47 users (see [[incident-management]]).
- The CRM Troubleshooting Runbook documents a known trigger: AD enforces 90-day rotation; a change request was raised to automate sync.
- [[kevin-obrien]] committed to raising a change request to automate service account password synchronisation after the incident.

## Links

- [[incident-management]]
- [[application-support-runbook]]
- [[kevin-obrien]]
- [[lisa-tan]]

## Sources

- [Microsoft Teams: CRM Support Incident](../sources/teams-crm-support-incident.md)
- [Confluence: CRM Troubleshooting Runbook](../sources/confluence-crm-troubleshooting-runbook.md)
