# Azure Subscription Governance Module

## Purpose

Associates an Azure subscription with the SAMSON Security management group.

## Why This Matters

In enterprise Azure environments, subscriptions inherit governance controls from their parent management groups. By attaching the subscription to the Security management group, future Azure Policy assignments, Log Analytics settings, and Sentinel integrations can be inherited automatically.

## SAMSON Role

This module establishes the subscription-level governance boundary for the Azure side of the SAMSON architecture.