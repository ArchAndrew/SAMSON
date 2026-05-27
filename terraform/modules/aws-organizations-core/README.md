# aws-organizations-core

This module creates the core AWS Organizations governance structure for SAMSON.

## Purpose

SAMSON uses AWS Organizations to model enterprise-scale account governance, centralized security administration, and policy enforcement.

## Created Resources

- AWS Organization
- Security OU
- Shared Services OU
- Workloads OU
- Sandbox OU
- Service Control Policy support enabled

## Design Intent

The organization model separates governance, security tooling, shared services, workloads, and sandbox activity. This supports least privilege, centralized visibility, delegated security administration, and scalable guardrail enforcement.

## SAMSON Relevance

This module provides the AWS governance foundation for:

- Centralized security telemetry
- SCP guardrails
- Multi-account evidence collection
- Workload isolation
- Security service delegation
- Enterprise cloud operating model