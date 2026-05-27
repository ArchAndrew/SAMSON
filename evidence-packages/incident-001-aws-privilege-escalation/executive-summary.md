# Incident 001 — AWS Privilege Escalation

## Summary

SAMSON detected the creation of a new AWS IAM access key by an administrative identity.

## Risk

Access key creation introduces long-lived credentials that can be used outside the normal browser-based login flow. If unmanaged, this can create persistence, bypass MFA expectations, and increase the risk of credential misuse.

## Risk Score

- Score: 90
- Severity: Critical
- Blast Radius: High
- Approval Required: Yes

## Affected Resource

- IAM User: test-user
- Actor: arn:aws:iam::123456789012:user/admin
- Region: us-east-1

## Control Mapping

- NIST 800-53 AC-2 — Account Management
- NIST 800-53 IA-2 — Identification and Authentication
- CIS 5.4 — Access key lifecycle governance

## Recommended Response

1. Verify that the access key was authorized.
2. Confirm MFA enforcement for the initiating identity.
3. Rotate or remove unnecessary access keys.
4. Review recent API activity from the affected user.
5. Escalate to security leadership if unauthorized.

## Executive Interpretation

This event represents a high-risk identity governance condition because it may create persistent programmatic access. SAMSON classified the event as critical and routed it for approval-based review.