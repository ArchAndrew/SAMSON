# Security Evidence Module

Defines the metadata for SAMSON's forensic evidence repository.

## Purpose

The Security Evidence module represents the immutable storage layer used to retain:

- CloudTrail logs
- GuardDuty findings
- Security Hub findings
- AWS Config snapshots
- Incident response artifacts
- Compliance reports
- AI-generated risk assessments

## Disaster Recovery

- Strategy: Pilot Light
- RPO: 15 minutes
- RTO: 4 hours

## Classification

Confidential

## Architecture Role

This module serves as the forensic memory of SAMSON by documenting the primary and replica evidence stores and their retention requirements.