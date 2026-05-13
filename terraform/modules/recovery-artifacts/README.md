# Recovery Artifacts Module

## Purpose

The `recovery-artifacts` module defines the critical artifacts and recovery objectives required to restore SAMSON after a failure or compromise.

This module provisions no infrastructure. It exports structured metadata describing Terraform state, governance policies, compliance mappings, and security evidence needed for disaster recovery.

## Recovery Objectives

- DR Strategy: Pilot Light
- RTO: 4 hours
- RPO: 15 minutes

## Critical Artifacts

- Terraform remote state
- AWS Organizations hierarchy
- Service Control Policies
- Compliance mappings
- Policy simulation tests
- Security evidence

## Business Value

This module demonstrates that governance and security controls are recoverable, not just operational. It provides the foundation for resilience planning, audit evidence, and disaster recovery automation.