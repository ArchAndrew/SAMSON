# AWS Risk Engine Module

## Purpose

The `aws-risk-engine` module deploys SAMSON’s deterministic risk scoring Lambda.

## Role

The risk engine receives normalized security events and calculates:

- Severity
- Risk score
- Blast radius
- Compliance impact
- Recommended response action

## Design Principle

The risk engine does not directly remediate. It produces authoritative decisions and recommendations. The response workflow layer executes approved actions.

## SAMSON Role

This module turns normalized telemetry into structured risk intelligence for evidence storage, Splunk reporting, and future Azure OpenAI executive summaries.