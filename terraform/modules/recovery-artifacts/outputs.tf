output "recovery_artifacts" {
  description = "Recovery-critical artifacts required to restore governance and security operations."
  value       = local.recovery_artifacts
}

output "recovery_objectives" {
  description = "Disaster recovery objectives and strategy."
  value       = local.recovery_objectives
}