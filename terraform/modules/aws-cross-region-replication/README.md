# AWS Cross-Region Replication Module

## Purpose

The `aws-cross-region-replication` module creates primary and replica S3 evidence buckets for SAMSON.

It supports forensic preservation and disaster recovery by replicating evidence artifacts from the primary region to a secondary recovery region.

## Features

- Primary evidence bucket
- Replica evidence bucket
- Versioning enabled
- Server-side encryption
- Public access blocked
- S3 Cross-Region Replication
- Dedicated IAM replication role

## Business Value

Security evidence must survive outages, accidental deletion, and regional disruption. This module supports continuity by preserving evidence across regions.

## SAMSON Role

This module strengthens SAMSON’s pilot-light disaster recovery strategy and supports evidence durability for audit, incident response, and recovery operations.