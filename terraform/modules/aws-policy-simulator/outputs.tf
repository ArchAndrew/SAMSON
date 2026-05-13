output "policy_simulation_tests" {
  description = "Defined policy simulation test cases for SCP validation."
  value       = local.policy_simulation_tests
}

output "approved_region" {
  description = "Approved region used for policy simulation."
  value       = var.approved_region
}

output "unapproved_region" {
  description = "Unapproved region used for policy simulation."
  value       = var.unapproved_region
}