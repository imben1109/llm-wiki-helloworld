---
type: entity
category: person
created: 2026-05-05
updated: 2026-05-05
sources: [raw/messages/teams-crm-support-incident.md]
---

# Lisa Tan

Infrastructure Engineer who identified the Active Directory root cause and applied the config fix during the CRM P2 incident.

## Overview

Lisa Tan is an Infrastructure Engineer who handles the server and Active Directory layer for the application support team. In the CRM P2 incident, she confirmed that the overnight AD group policy update had automatically rotated the `crm-svc` service account password — the root cause of the login failures. She then updated the LDAP config on both CRM app servers (crm-app-01, crm-app-02) and restarted the auth service, resolving the incident within 50 minutes of it opening.

## Key Points

- Confirmed the AD group policy change as the root cause by cross-referencing the CRM logs with AD change history.
- Applied the fix on both app servers — critical, as the CRM runs active-active across two nodes.
- Verified successful resolution by checking the application log for a successful LDAP bind before confirming to the team.

## Links

- [[incident-management]]
- [[service-account-management]]
- [[sarah-wong]]
- [[james-patel]]
- [[kevin-obrien]]

## Sources

- [Microsoft Teams: CRM Support Incident](../sources/teams-crm-support-incident.md)
