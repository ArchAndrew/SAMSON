output "log_analytics_workspace_id" {
  value = azurerm_log_analytics_workspace.samson.id
}

output "log_analytics_workspace_name" {
  value = azurerm_log_analytics_workspace.samson.name
}

output "log_analytics_workspace_resource_group_name" {
  value = azurerm_resource_group.log_analytics.name
}

output "log_analytics_workspace_customer_id" {
  value     = azurerm_log_analytics_workspace.samson.workspace_id
  sensitive = true
}