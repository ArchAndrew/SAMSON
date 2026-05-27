# Incident 002 — Azure Role Abuse

## Summary

SAMSON detected the creation or modification of an Azure RBAC role assignment.

## Risk

Role assignments can grant elevated privileges at the resource group, subscription, or management group scope. Unauthorized changes may enable privilege escalation, lateral movement, and loss of governance control.

## Risk Score

- Score: 85
- Severity: High
- Blast Radius: High
- Approval Required: Yes

## Affected Resource

- Resource: Azure Role Assignment
- Actor: admin@company.com
- Scope: Resource Group / Subscription

## Control Mapping

- NIST 800-53 AC-2 — Account Management
- NIST 800-53 AC-6 — Least Privilege
- CIS 6.1 — Role-based access governance

## Recommended Response

1. Validate the business justification.
2. Confirm the granted role and scope.
3. Review recent administrative activity.
4. Revoke unauthorized assignments.
5. Escalate to security leadership if necessary.

## Executive Interpretation

This event represents a high-risk identity governance condition because it can materially alter access permissions in Azure. SAMSON classified the event as high severity and routed it for approval-based review.