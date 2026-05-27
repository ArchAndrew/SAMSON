# AWS Identity Telemetry Module

## Purpose

The `aws-identity-telemetry` module collects AWS identity and governance activity for SAMSON.

## Resources

- CloudTrail management event trail
- CloudWatch Log Group for identity events
- IAM role and policy for CloudTrail log delivery
- IAM Access Analyzer

## Captured Signals

- IAM activity
- STS role assumption
- Console authentication activity
- AWS Organizations activity
- Management-plane API events

## SAMSON Role

This module provides the AWS-side identity telemetry foundation used for detection, normalization, risk scoring, and forensic evidence retention.