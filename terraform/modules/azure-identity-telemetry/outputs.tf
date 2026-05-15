output "azure_identity_telemetry_diagnostic_setting_id" {
  value = azurerm_monitor_diagnostic_setting.subscription_activity_logs.id
}