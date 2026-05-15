output "risk_engine_function_name" {
  description = "SAMSON risk engine Lambda function name."
  value       = aws_lambda_function.risk_engine.function_name
}

output "risk_engine_function_arn" {
  description = "SAMSON risk engine Lambda function ARN."
  value       = aws_lambda_function.risk_engine.arn
}

output "risk_engine_role_arn" {
  description = "Risk engine Lambda execution role ARN."
  value       = aws_iam_role.risk_engine.arn
}