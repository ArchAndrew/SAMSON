output "subscription_association_id" {
  description = "Management group subscription association ID."
  value       = azurerm_management_group_subscription_association.security.id
}