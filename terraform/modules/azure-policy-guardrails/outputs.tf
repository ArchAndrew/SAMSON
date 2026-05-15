output "required_tags_policy_id" {
  description = "Custom required tags policy definition ID."
  value       = azurerm_policy_definition.required_tags.id
}

output "policy_guardrails_initiative_id" {
  description = "SAMSON Azure Policy initiative ID."
  value       = azurerm_management_group_policy_set_definition.samson_guardrails.id
}

output "policy_guardrails_assignment_id" {
  description = "SAMSON Azure Policy assignment ID."
  value       = azurerm_management_group_policy_assignment.samson_guardrails.id
}