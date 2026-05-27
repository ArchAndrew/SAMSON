resource "azurerm_sentinel_log_analytics_workspace_onboarding" "samson" {
  workspace_id = var.log_analytics_workspace_id
}

resource "azurerm_sentinel_alert_rule_scheduled" "high_risk_admin_activity" {
  name                       = lower("${var.project}-${var.environment}-high-risk-admin-activity")
  log_analytics_workspace_id = var.log_analytics_workspace_id
  display_name               = "${var.project}-${var.environment} High Risk Admin Activity"
  severity                   = "High"
  enabled                    = true

  query_frequency = "PT5M"
  query_period    = "PT5M"

  query = <<-KQL
    AzureActivity
    | where CategoryValue == "Administrative"
    | where OperationNameValue has_any ("roleAssignments/write", "policyAssignments/write", "Create or Update Role Assignment")
    | project TimeGenerated, Caller, OperationNameValue, ActivityStatusValue, ResourceGroup, ResourceProviderValue, _ResourceId
  KQL

  event_grouping {
    aggregation_method = "SingleAlert"
  }

  depends_on = [
    azurerm_sentinel_log_analytics_workspace_onboarding.samson
  ]
}