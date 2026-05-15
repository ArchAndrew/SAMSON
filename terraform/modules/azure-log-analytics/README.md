# Azure Log Analytics Module

## Purpose

Creates SAMSON’s centralized Azure telemetry workspace.

## Role

The Log Analytics Workspace stores Azure governance, identity, and security telemetry for KQL analysis and Sentinel integration.

## Design

- SKU: PerGB2018
- Retention: 30 days
- Daily quota: 1 GB
- Region: eastus

## SAMSON Role

This module provides the Azure-side observability foundation for detections, dashboards, and Sentinel-lite analytics.