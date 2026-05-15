resource "azurerm_resource_group" "log_analytics" {
  name     = var.resource_group_name
  location = var.location

  tags = var.tags
}

resource "azurerm_log_analytics_workspace" "samson" {
  name                = lower("${var.project}-${var.environment}-law")
  location            = azurerm_resource_group.log_analytics.location
  resource_group_name = azurerm_resource_group.log_analytics.name

  sku               = var.workspace_sku
  retention_in_days = var.retention_in_days
  daily_quota_gb    = var.daily_quota_gb

  tags = var.tags
}