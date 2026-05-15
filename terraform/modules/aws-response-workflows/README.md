# AWS Response Workflows Module

## Purpose

The `aws-response-workflows` module deploys SAMSON’s controlled response layer.

## Role

This module receives risk-engine decisions and prepares response actions such as alerting, escalation, approval workflows, or future automated containment.

## Design Principle

The response workflow layer executes actions. The risk engine only decides what should happen.

## Autonomy Modes

- `monitor` — log and notify only
- `approval_required` — require human review before remediation
- `autonomous` — allow automated containment for approved critical scenarios

## SAMSON Role

This module turns risk intelligence into operational response while preserving human-in-the-loop control for high-impact actions.