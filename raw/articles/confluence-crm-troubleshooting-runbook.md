---
title: "CRM Application — Troubleshooting Runbook"
platform: "Confluence"
space: "Application Support"
page_id: "APP-SUPPORT-CRM-001"
last_updated: 2026-05-01
updated_by: "James Patel"
application: "CRM Application"
topic: "Application Support"
---

# CRM Application — Troubleshooting Runbook

**Space**: Application Support  
**Owner**: Kevin O'Brien (Application Owner)  
**Maintained by**: Application Support Team  
**Last updated**: 2026-05-01 by James Patel  

---

## Overview

This runbook covers common issues, diagnostic steps, escalation paths, and known fixes for the CRM application. It is the first reference point for all application support engineers when a CRM-related ticket is raised.

**Application details:**
- **Application**: CRM (Customer Relationship Management)
- **Primary users**: Sales team, Account Management team
- **App servers**: crm-app-01, crm-app-02 (active-active)
- **Auth method**: LDAP via Active Directory (service account: `crm-svc@company.com`)
- **Config path**: `/opt/crm/config/`
- **Log path**: `/var/log/crm/application.log`

---

## Escalation Path

| Severity | Response Time | Who to contact |
|----------|--------------|----------------|
| P1 – Critical (full outage) | 15 min | Application Support Lead → Application Owner → Infrastructure Lead |
| P2 – High (major feature unavailable) | 30 min | Application Support Engineer → Application Support Lead |
| P3 – Medium (degraded performance) | 4 hours | Application Support Engineer |
| P4 – Low (cosmetic / enhancement) | Next business day | Application Support Engineer |

---

## Common Issues

### 1. Login Failures — "Authentication failed" Error

**Symptoms:**
- Users receive "Authentication failed — please contact your system administrator" on login.
- Login page loads normally; error appears after credential entry.

**Root causes (in order of likelihood):**
1. CRM service account password (`crm-svc`) has expired or been rotated and the app config is stale.
2. Active Directory is unreachable from the app server (network/firewall issue).
3. User account is locked in Active Directory.

**Diagnostic steps:**
1. Check CRM application log for LDAP errors:
   ```bash
   tail -200 /var/log/crm/application.log | grep -i "ldap\|auth\|bind"
   ```
2. If you see `LDAP bind failed: invalid credentials`, the service account password is the issue → see Resolution A.
3. If you see `LDAP connection refused` or `timeout`, it is a network issue → escalate to Infrastructure team.
4. If only a specific user is affected, check their AD account lock status with the IT Admin team.

**Resolution A — Service account password out of sync:**
1. Obtain the current `crm-svc` service account password from the IT Admin team via a secure channel (do NOT send passwords in Teams).
2. Update the password in the config on both app servers:
   ```bash
   sudo vi /opt/crm/config/ldap.properties
   # Update: ldap.serviceaccount.password=<new_password>
   ```
3. Restart the CRM auth service:
   ```bash
   sudo systemctl restart crm-auth
   ```
4. Verify LDAP bind succeeds in the log:
   ```bash
   tail -20 /var/log/crm/application.log | grep "LDAP bind"
   ```
5. Test login with an affected user account.

> ⚠️ **Known trigger**: Active Directory group policy enforces automatic 90-day service account password rotation. After each AD group policy update cycle, check whether `crm-svc` is due for rotation. See the [Quarterly Credential Rotation Checklist](#related-articles).

---

### 2. Slow Performance — Pages Taking > 10 Seconds to Load

**Symptoms:**
- CRM pages are loading very slowly for all or a subset of users.
- No error messages displayed; application is functional but sluggish.

**Diagnostic steps:**
1. Check current server load:
   ```bash
   top -n 1 | head -20
   ```
2. Check database connection pool status in the CRM admin console: `https://crm-app-01/admin/db-pool`
3. Check for long-running DB queries in the application log:
   ```bash
   grep "slow query" /var/log/crm/application.log | tail -50
   ```

**Resolution:**
- If DB connection pool is exhausted: restart the CRM application service (`sudo systemctl restart crm-app`).
- If slow queries are identified: escalate to the database team with query details.
- If server load is high and no obvious cause: escalate to Infrastructure team.

---

### 3. Data Sync Errors — CRM Records Not Updating from ERP

**Symptoms:**
- Sales team reports that new customer records or orders created in the ERP are not appearing in the CRM.
- CRM shows "Last sync: X hours ago" in the integration status panel.

**Diagnostic steps:**
1. Check the integration service log:
   ```bash
   tail -100 /var/log/crm/integration.log | grep -i "error\|failed\|sync"
   ```
2. Verify the ERP integration endpoint is reachable:
   ```bash
   curl -I https://erp.company.internal/api/crm-sync/health
   ```

**Resolution:**
- If integration service is down: `sudo systemctl restart crm-integration`
- If ERP endpoint is unreachable: escalate to the ERP support team.
- If sync jobs are backed up (queue > 500 items): notify Application Owner and monitor; do not restart.

---

## Known Issues Log

| Issue ID | Description | Status | Workaround | Resolved in |
|----------|-------------|--------|------------|-------------|
| KI-001 | Service account password out of sync after AD group policy rotation | Resolved | Update `ldap.properties` and restart auth service (see Common Issue #1) | Patch pending (auto-sync) |
| KI-002 | DB connection pool exhausted after > 200 concurrent users | Open | Restart `crm-app` service | Scheduled for v4.2 |
| KI-003 | ERP sync fails silently when ERP is in maintenance mode | Open | Check ERP maintenance calendar before escalating | Under investigation |

---

## Related Articles

- [Quarterly Credential Rotation Checklist](../procedures/quarterly-credential-rotation.md)
- [Active Directory Service Account Management](../infrastructure/ad-service-accounts.md)
- [CRM Application Architecture Overview](../architecture/crm-overview.md)
- [Incident Management Process](../procedures/incident-management.md)
