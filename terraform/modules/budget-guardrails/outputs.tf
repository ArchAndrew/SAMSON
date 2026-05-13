output "budget_name" {
  description = "Name of the AWS Budget."
  value       = aws_budgets_budget.monthly_cost.name
}

output "budget_limit_usd" {
  description = "Configured monthly budget limit."
  value       = var.monthly_budget_limit
}

output "notification_emails" {
  description = "Recipients of budget alerts."
  value       = var.notification_emails
}