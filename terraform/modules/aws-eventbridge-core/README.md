# AWS EventBridge Core Module

## Purpose

The `aws-eventbridge-core` module creates SAMSON’s AWS event routing backbone.

It defines a custom EventBridge bus, identity/governance event rules, and a dead-letter queue for failed event processing.

## Captured Event Categories

- IAM activity
- STS role assumption activity
- AWS Organizations activity
- IAM Access Analyzer findings

## Business Value

EventBridge converts SAMSON from a passive telemetry platform into an event-driven security architecture. It enables identity and governance events to flow into normalization, risk scoring, response workflows, evidence storage, and Splunk reporting.

## SAMSON Role

This module acts as the central nervous system for AWS-side event routing.