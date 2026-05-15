# AWS Systems Manager Module

## Purpose

The `aws-systems-manager` module deploys SAMSON’s controlled remediation foundation.

## Role

This module creates an SSM Automation role and a runbook for disabling suspicious IAM access keys.

## Design Principle

SAMSON separates decision-making from execution:

- Risk Engine decides severity and recommended action
- Response Workflows handles notification and approval
- Systems Manager executes approved remediation

## Initial Runbook

- Disable IAM access key

## SAMSON Role

This module moves SAMSON from detection and alerting toward controlled, auditable remediation.