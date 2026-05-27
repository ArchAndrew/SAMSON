output "event_bus_name" {
  description = "SAMSON EventBridge bus name."
  value       = aws_cloudwatch_event_bus.samson.name
}

output "event_bus_arn" {
  description = "SAMSON EventBridge bus ARN."
  value       = aws_cloudwatch_event_bus.samson.arn
}

output "iam_activity_rule_name" {
  description = "IAM activity EventBridge rule name."
  value       = aws_cloudwatch_event_rule.iam_activity.name
}

output "sts_activity_rule_name" {
  description = "STS activity EventBridge rule name."
  value       = aws_cloudwatch_event_rule.sts_activity.name
}

output "organizations_activity_rule_name" {
  description = "AWS Organizations activity EventBridge rule name."
  value       = aws_cloudwatch_event_rule.organizations_activity.name
}

output "access_analyzer_findings_rule_name" {
  description = "IAM Access Analyzer findings EventBridge rule name."
  value       = aws_cloudwatch_event_rule.access_analyzer_findings.name
}

output "dead_letter_queue_arn" {
  description = "EventBridge DLQ ARN."
  value       = aws_sqs_queue.dead_letter_queue.arn
}