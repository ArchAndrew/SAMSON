output "organization_id" {
  description = "AWS Organizations ID."
  value       = module.aws_scp_validation.organization_id
}

output "root_ids" {
  description = "Root IDs in the organization."
  value       = module.aws_scp_validation.root_ids
}

output "service_control_policy_ids" {
  description = "All discovered Service Control Policy IDs."
  value       = module.aws_scp_validation.service_control_policy_ids
}

output "fullawsaccess_present" {
  description = "Whether the AWS-managed FullAWSAccess policy exists in the organization."
  value       = module.aws_scp_validation.fullawsaccess_present
}

output "sandbox_ou_id" {
  description = "Sandbox Organizational Unit ID."
  value       = module.aws_organizations_core.sandbox_ou_id
}

output "policy_simulation_tests" {
  description = "Policy simulation test cases for validating SCP guardrails."
  value       = module.aws_policy_simulator.policy_simulation_tests
}

output "compliance_summary" {
  description = "Summary of SAMSON compliance mappings."
  value       = module.compliance_mapping.compliance_summary
}

output "control_mappings" {
  description = "SAMSON control-to-framework mappings."
  value       = module.compliance_mapping.control_mappings
}

output "recovery_objectives" {
  description = "Disaster recovery objectives for SAMSON."
  value       = module.recovery_artifacts.recovery_objectives
}

output "recovery_artifacts" {
  description = "Recovery-critical artifacts for SAMSON."
  value       = module.recovery_artifacts.recovery_artifacts
}

output "pilot_light_strategy" {
  description = "SAMSON pilot light disaster recovery strategy."
  value       = module.dr_pilot_light.pilot_light_strategy
}

output "primary_evidence_bucket_name" {
  description = "Primary SAMSON evidence bucket."
  value       = module.aws_cross_region_replication.primary_evidence_bucket_name
}

output "replica_evidence_bucket_name" {
  description = "Replica SAMSON evidence bucket."
  value       = module.aws_cross_region_replication.replica_evidence_bucket_name
}

output "replication_role_arn" {
  description = "IAM role used for evidence replication."
  value       = module.aws_cross_region_replication.replication_role_arn
}

output "security_evidence_metadata" {
  description = "SAMSON security evidence repository metadata."
  value       = module.security_evidence.evidence_metadata
}

output "identity_cloudtrail_name" {
  description = "SAMSON identity CloudTrail name."
  value       = module.aws_identity_telemetry.cloudtrail_name
}

output "identity_log_group_name" {
  description = "SAMSON identity CloudWatch Log Group name."
  value       = module.aws_identity_telemetry.cloudwatch_log_group_name
}

output "access_analyzer_name" {
  description = "SAMSON IAM Access Analyzer name."
  value       = module.aws_identity_telemetry.access_analyzer_name
}