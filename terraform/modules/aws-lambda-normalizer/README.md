# AWS Lambda Normalizer Module

## Purpose

The `aws-lambda-normalizer` module deploys the SAMSON event normalization Lambda.

## Role

The normalizer receives cloud security and governance events, converts them into a common schema, and prepares them for risk scoring, evidence storage, and downstream analytics.

## Inputs

- EventBridge event bus
- Evidence bucket
- Lambda source directory
- Standardized tags

## Outputs

- Lambda function name
- Lambda function ARN
- Lambda execution role ARN

## SAMSON Role

This module turns raw cloud events into structured intelligence that can be scored, mapped to compliance controls, stored as evidence, and forwarded to Splunk.