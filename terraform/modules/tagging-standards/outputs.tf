output "required_tags" {
  description = "Standardized organizational tags."
  value       = local.required_tags
}

output "merged_tags" {
  description = "Standardized tags plus any additional tags."
  value       = local.merged_tags
}