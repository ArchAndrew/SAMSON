output "evidence_metadata" {
  description = "Security evidence repository metadata."
  value       = local.evidence_metadata
}

output "primary_bucket_name" {
  description = "Primary evidence bucket."
  value       = var.primary_bucket_name
}

output "replica_bucket_name" {
  description = "Replica evidence bucket."
  value       = var.replica_bucket_name
}