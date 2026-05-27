output "sentinel_onboarding_id" {
  value = azurerm_sentinel_log_analytics_workspace_onboarding.samson.id
}

output "high_risk_admin_activity_rule_id" {
  value = azurerm_sentinel_alert_rule_scheduled.high_risk_admin_activity.id
}