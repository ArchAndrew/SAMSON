output "ssm_automation_role_arn" {
  description = "IAM role ARN used by SAMSON SSM automation runbooks."
  value       = aws_iam_role.ssm_automation.arn
}

output "disable_access_key_document_name" {
  description = "SSM Automation document for disabling an IAM access key."
  value       = aws_ssm_document.disable_access_key.name
}