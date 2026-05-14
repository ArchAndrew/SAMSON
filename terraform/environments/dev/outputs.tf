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

output "event_bus_name" {
  description = "SAMSON EventBridge bus name."
  value       = module.aws_eventbridge_core.event_bus_name
}

output "event_bus_arn" {
  description = "SAMSON EventBridge bus ARN."
  value       = module.aws_eventbridge_core.event_bus_arn
}

output "eventbridge_dlq_arn" {
  description = "SAMSON EventBridge dead-letter queue ARN."
  value       = module.aws_eventbridge_core.dead_letter_queue_arn
}

output "lambda_normalizer_name" {
  description = "SAMSON Lambda normalizer function name."
  value       = module.aws_lambda_normalizer.lambda_function_name
}

output "lambda_normalizer_arn" {
  description = "SAMSON Lambda normalizer function ARN."
  value       = module.aws_lambda_normalizer.lambda_function_arn
}

output "risk_engine_function_name" {
  description = "SAMSON risk engine Lambda function name."
  value       = module.aws_risk_engine.risk_engine_function_name
}

output "risk_engine_function_arn" {
  description = "SAMSON risk engine Lambda function ARN."
  value       = module.aws_risk_engine.risk_engine_function_arn
}

output "response_workflows_function_name" {
  description = "SAMSON response workflow Lambda function name."
  value       = module.aws_response_workflows.response_workflows_function_name
}

output "response_notifications_topic_arn" {
  description = "SAMSON response notification SNS topic ARN."
  value       = module.aws_response_workflows.response_notifications_topic_arn
}

output "splunk_forwarder_function_name" {
  description = "SAMSON Splunk forwarder Lambda function name."
  value       = module.splunk_integration.splunk_forwarder_function_name
}

output "splunk_forwarder_function_arn" {
  description = "SAMSON Splunk forwarder Lambda function ARN."
  value       = module.splunk_integration.splunk_forwarder_function_arn
}

output "ssm_automation_role_arn" {
  description = "SAMSON SSM automation role ARN."
  value       = module.aws_systems_manager.ssm_automation_role_arn
}

output "disable_access_key_document_name" {
  description = "SAMSON SSM document for disabling IAM access keys."
  value       = module.aws_systems_manager.disable_access_key_document_name
}

output "azure_platform_management_group_id" {
  value = module.azure_management_groups.platform_management_group_id
}

output "azure_security_management_group_id" {
  value = module.azure_management_groups.security_management_group_id
}

output "azure_workloads_management_group_id" {
  value = module.azure_management_groups.workloads_management_group_id
}

output "azure_sandbox_management_group_id" {
  value = module.azure_management_groups.sandbox_management_group_id
}