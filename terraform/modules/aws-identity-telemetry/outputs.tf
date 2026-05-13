output "cloudtrail_name" {
  description = "Name of the SAMSON identity CloudTrail."
  value       = aws_cloudtrail.identity_trail.name
}

output "cloudwatch_log_group_name" {
  description = "CloudWatch Log Group for identity events."
  value       = aws_cloudwatch_log_group.identity_events.name
}

output "cloudwatch_log_group_arn" {
  description = "CloudWatch Log Group ARN for identity events."
  value       = aws_cloudwatch_log_group.identity_events.arn
}

output "access_analyzer_name" {
  description = "IAM Access Analyzer name."
  value       = aws_accessanalyzer_analyzer.identity_access_analyzer.analyzer_name
}

output "access_analyzer_arn" {
  description = "IAM Access Analyzer ARN."
  value       = aws_accessanalyzer_analyzer.identity_access_analyzer.arn
}