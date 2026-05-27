resource "azurerm_monitor_diagnostic_setting" "subscription_activity_logs" {
  name                       = lower("${var.project}-${var.environment}-subscription-activity")
  target_resource_id         = var.subscription_id
  log_analytics_workspace_id = var.log_analytics_workspace_id

  enabled_log {
    category = "Administrative"
  }

  enabled_log {
    category = "Security"
  }

  enabled_log {
    category = "Policy"
  }

  enabled_log {
    category = "Alert"
  }

  enabled_log {
    category = "Recommendation"
  }

  enabled_log {
    category = "ServiceHealth"
  }

  enabled_log {
    category = "ResourceHealth"
  }

 enabled_metric {
  category = "AllMetrics"
}
  }
