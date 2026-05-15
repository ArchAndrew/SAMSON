resource "azurerm_management_group_subscription_association" "security" {
  management_group_id = var.security_management_group_id
  subscription_id     = var.subscription_id
}