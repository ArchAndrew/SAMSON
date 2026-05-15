output "platform_management_group_id" {
  description = "Root platform management group ID."
  value       = azurerm_management_group.platform.id
}

output "security_management_group_id" {
  description = "Security management group ID."
  value       = azurerm_management_group.security.id
}

output "workloads_management_group_id" {
  description = "Workloads management group ID."
  value       = azurerm_management_group.workloads.id
}

output "sandbox_management_group_id" {
  description = "Sandbox management group ID."
  value       = azurerm_management_group.sandbox.id
}