output "splunk_forwarder_function_name" {
  value = aws_lambda_function.splunk_forwarder.function_name
}

output "splunk_forwarder_function_arn" {
  value = aws_lambda_function.splunk_forwarder.arn
}

output "splunk_forwarder_role_arn" {
  value = aws_iam_role.splunk_forwarder.arn
}