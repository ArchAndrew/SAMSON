output "response_workflows_function_name" {
  description = "SAMSON response workflow Lambda function name."
  value       = aws_lambda_function.response_workflows.function_name
}

output "response_workflows_function_arn" {
  description = "SAMSON response workflow Lambda function ARN."
  value       = aws_lambda_function.response_workflows.arn
}

output "response_notifications_topic_arn" {
  description = "SNS topic ARN for response notifications."
  value       = aws_sns_topic.response_notifications.arn
}

output "response_workflows_role_arn" {
  description = "Response workflow Lambda execution role ARN."
  value       = aws_iam_role.response_workflows.arn
}