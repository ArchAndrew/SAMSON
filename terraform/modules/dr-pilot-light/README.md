# DR Pilot Light Module

## Purpose

The `dr-pilot-light` module defines SAMSON’s cost-controlled disaster recovery strategy.

This module provisions no infrastructure. It documents the recovery model, recovery sequence, degraded operations mode, and region strategy as Terraform outputs.

## Strategy

- Primary Region: `us-east-1`
- Recovery Region: `us-east-2`
- DR Model: Pilot Light
- Recovery Method: Terraform rehydration
- Warm Resources: Intentionally minimized for cost control

## Business Value

Pilot Light provides a practical balance between resilience and cost. SAMSON avoids expensive active-active architecture while preserving the ability to recover governance, evidence, and security operations through Terraform-defined infrastructure.

## SAMSON Role

This module demonstrates that SAMSON is designed for recoverability, not just deployment.