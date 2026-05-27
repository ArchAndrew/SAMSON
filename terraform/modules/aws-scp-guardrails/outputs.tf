output "deny_unapproved_regions_policy_id" {
  description = "Policy ID for the deny unapproved regions SCP."
  value       = aws_organizations_policy.deny_unapproved_regions.id
}

output "deny_root_user_actions_policy_id" {
  description = "Policy ID for the deny root user actions SCP."
  value       = aws_organizations_policy.deny_root_user_actions.id
}

output "scp_target_id" {
  description = "Target ID where SCPs are attached."
  value       = var.target_id
}