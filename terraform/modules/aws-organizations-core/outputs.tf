output "organization_id" {
  description = "AWS Organizations organization ID."
  value       = aws_organizations_organization.this.id
}

output "organization_arn" {
  description = "AWS Organizations organization ARN."
  value       = aws_organizations_organization.this.arn
}

output "root_id" {
  description = "Root ID of the AWS Organization."
  value       = aws_organizations_organization.this.roots[0].id
}

output "security_ou_id" {
  description = "Security OU ID."
  value       = aws_organizations_organizational_unit.security.id
}

output "shared_services_ou_id" {
  description = "Shared Services OU ID."
  value       = aws_organizations_organizational_unit.shared_services.id
}

output "workloads_ou_id" {
  description = "Workloads OU ID."
  value       = aws_organizations_organizational_unit.workloads.id
}

output "sandbox_ou_id" {
  description = "Sandbox OU ID."
  value       = aws_organizations_organizational_unit.sandbox.id
}