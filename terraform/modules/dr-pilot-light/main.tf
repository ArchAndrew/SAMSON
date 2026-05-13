locals {
  pilot_light_strategy = {
    project         = var.project
    environment     = var.environment
    strategy        = "Pilot Light"
    primary_region  = var.primary_region
    recovery_region = var.recovery_region

    recovery_method = "Terraform rehydration"

    warm_resources = {
      status      = "Minimized"
      rationale   = "Warm resources are intentionally minimized for cost control while preserving recovery capability."
      standby_use = "Recovery metadata, replicated artifacts, and deployment definitions."
    }

    recovery_sequence = [
      "Validate Terraform remote state availability",
      "Confirm recovery artifacts are accessible",
      "Rehydrate core governance modules in recovery region",
      "Restore evidence access paths",
      "Validate SCP and policy simulation outputs",
      "Resume security telemetry and reporting"
    ]

    degraded_mode = {
      evidence_collection = "Continue where available"
      risk_scoring        = "Temporarily delayed"
      response_workflows  = "Partially suspended"
      reporting           = "Limited until recovery completes"
    }
  }
}