---
title: "Application Support Incident: CRM Login Failures for Sales Team"
platform: "Microsoft Teams"
channel: "Application Support > #crm-support"
date: 2026-05-01
participants:
  - Sarah Wong (Application Support Lead)
  - James Patel (Application Support Engineer)
  - Kevin O'Brien (CRM Application Owner)
  - Lisa Tan (Infrastructure Engineer)
topic: "Application Support"
severity: "P2 - High"
application: "CRM Application"
incident_id: "INC-2026-0501-001"
---

# Microsoft Teams Thread: CRM Login Failures — P2 Incident

**Team**: Application Support  
**Channel**: #crm-support  
**Date**: 2026-05-01  
**Incident ID**: INC-2026-0501-001  

---

**Sarah Wong** [08:47] 🔴 **P2 INCIDENT OPENED**  
Heads up team — we have multiple users in the Sales department reporting they can't log in to the CRM. Ticket count is at 14 and climbing. @James Patel can you start investigation? @Kevin O'Brien FYI as app owner.

**James Patel** [08:51]  
On it. First check — the CRM login page is loading fine, so it's not a full outage. Users are getting an "Authentication failed — please contact your system administrator" error after entering credentials.

**Kevin O'Brien** [08:53]  
Thanks for the heads up. Was there any deployment or configuration change last night? I didn't approve anything but want to double-check.

**Sarah Wong** [08:55]  
Checking change log now... there was a scheduled AD (Active Directory) group policy update at 02:00 last night. Might be related.

**Lisa Tan** [08:58]  
I can check the AD side. Also pulling the CRM application logs now. Give me 5 minutes.

**James Patel** [09:02]  
Got something in the logs:

```
[ERROR] 2026-05-01 08:30:12 AuthService - LDAP bind failed: invalid credentials for service account crm-svc@company.com
[ERROR] 2026-05-01 08:30:12 AuthService - User authentication aborted: downstream LDAP unavailable
```

Service account password may have expired or been reset by the AD policy change.

**Lisa Tan** [09:06]  
Confirmed. The AD group policy update last night enforced a 90-day password rotation for all service accounts. The `crm-svc` service account password was rotated automatically at 02:15. The CRM application still has the old password stored in its config.

**Kevin O'Brien** [09:08]  
Ah — the CRM's service account credentials are stored in the app server config file at `/opt/crm/config/ldap.properties`. We need to update the password there and restart the auth service.

**Sarah Wong** [09:09]  
@Lisa Tan can you update the service account password in the config? @Kevin O'Brien please confirm the new credential through the secure channel, not here.

**Kevin O'Brien** [09:10]  
Sent the new password via secure message to @Lisa Tan.

**Lisa Tan** [09:14]  
Password updated in `/opt/crm/config/ldap.properties` on both app servers (crm-app-01 and crm-app-02). Restarting auth service now.

**Lisa Tan** [09:17]  
Auth service restarted. LDAP bind is successful in logs:

```
[INFO] 2026-05-01 09:17:03 AuthService - LDAP bind successful for crm-svc@company.com
[INFO] 2026-05-01 09:17:03 AuthService - Authentication service ready
```

**James Patel** [09:18]  
Tested with an affected user — login is working now. ✅

**Sarah Wong** [09:20]  
Confirming with 3 more users from the original tickets — all resolved. 🟢  
Closing the incident. Root cause: AD group policy enforced automatic service account password rotation; CRM application config was not updated to match.

**James Patel** [09:21]  
I'll write up the post-incident notes and add this to the known issues log in Confluence. We should also add the CRM service account to our quarterly credential rotation checklist so this doesn't catch us again.

**Kevin O'Brien** [09:22]  
Good call. I'll raise a change request to automate the service account password sync going forward.

**Sarah Wong** [09:23]  
Agreed. @James Patel please also update the CRM Troubleshooting Runbook on Confluence with the root cause and resolution steps — this will definitely happen again.

---

**Incident Summary:**
- **Affected application**: CRM
- **Impact**: Sales team unable to log in (~47 affected users, ~50 min total duration)
- **Root cause**: AD group policy auto-rotated the `crm-svc` service account password; CRM application config not updated to match.
- **Resolution**: Updated LDAP service account password in CRM app config on both servers (crm-app-01, crm-app-02); restarted auth service.
- **Follow-up actions**:
  1. James: Update CRM Troubleshooting Runbook on Confluence with root cause and resolution steps.
  2. James: Log in the known issues register.
  3. Kevin: Raise change request to automate service account password sync with AD.
  4. Sarah: Add CRM service account to the quarterly credential rotation checklist.
