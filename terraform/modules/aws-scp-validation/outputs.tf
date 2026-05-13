output "organization_id" {
  description = "AWS Organizations ID."
  value       = data.aws_organizations_organization.current.id
}

output "root_ids" {
  description = "Root IDs in the organization."
  value       = data.aws_organizations_organization.current.roots[*].id
}

output "service_control_policy_ids" {
  description = "All SCP IDs discovered in the organization."
  value       = data.aws_organizations_policies.service_control_policies.ids
}

output "fullawsaccess_present" {
  description = "Whether the AWS-managed FullAWSAccess SCP is present in the organization."
  value       = local.fullawsaccess_present
}