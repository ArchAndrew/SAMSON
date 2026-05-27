# Splunk Integration Module

## Purpose

Deploys SAMSON’s Splunk HEC forwarder.

## Role

This module forwards risk-engine and response-workflow events into Splunk for SOC dashboards, executive reporting, incident timelines, and compliance visibility.

## Security Design

The Splunk HEC token is not hardcoded. The Lambda retrieves it from AWS Systems Manager Parameter Store.

## SAMSON Role

Splunk serves as the operational monitoring and analytics layer for SAMSON.