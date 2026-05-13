# aws-scp-guardrails

Creates Service Control Policies for the SAMSON AWS Organizations governance model.

## Guardrails

- Deny use of unapproved AWS regions
- Deny root user actions

## Purpose

This module demonstrates preventive governance controls at the AWS Organizations layer.

## Enterprise Relevance

SCPs define the maximum available permissions within an AWS Organization. They help prevent risky actions even when IAM permissions are overly permissive.

## Design Note

These guardrails should be tested in a sandbox OU before applying broadly across production accounts.