output "lambda_function_name" {
  description = "Lambda normalizer function name."
  value       = aws_lambda_function.normalizer.function_name
}

output "lambda_function_arn" {
  description = "Lambda normalizer function ARN."
  value       = aws_lambda_function.normalizer.arn
}

output "lambda_role_arn" {
  description = "Lambda normalizer execution role ARN."
  value       = aws_iam_role.lambda_normalizer.arn
}