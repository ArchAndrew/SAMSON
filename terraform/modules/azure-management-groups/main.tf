resource "azurerm_management_group" "platform" {
  display_name = "${var.project}-${var.environment}-platform"
  name         = lower("${var.project}-${var.environment}-platform")
}

resource "azurerm_management_group" "security" {
  display_name               = "${var.project}-${var.environment}-security"
  name                       = lower("${var.project}-${var.environment}-security")
  parent_management_group_id = azurerm_management_group.platform.id
}

resource "azurerm_management_group" "workloads" {
  display_name               = "${var.project}-${var.environment}-workloads"
  name                       = lower("${var.project}-${var.environment}-workloads")
  parent_management_group_id = azurerm_management_group.platform.id
}

resource "azurerm_management_group" "sandbox" {
  display_name               = "${var.project}-${var.environment}-sandbox"
  name                       = lower("${var.project}-${var.environment}-sandbox")
  parent_management_group_id = azurerm_management_group.platform.id
}