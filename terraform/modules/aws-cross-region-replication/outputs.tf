output "primary_evidence_bucket_name" {
  description = "Primary evidence bucket name."
  value       = aws_s3_bucket.primary_evidence.bucket
}

output "primary_evidence_bucket_arn" {
  description = "Primary evidence bucket ARN."
  value       = aws_s3_bucket.primary_evidence.arn
}

output "replica_evidence_bucket_name" {
  description = "Replica evidence bucket name."
  value       = aws_s3_bucket.replica_evidence.bucket
}

output "replica_evidence_bucket_arn" {
  description = "Replica evidence bucket ARN."
  value       = aws_s3_bucket.replica_evidence.arn
}

output "replication_role_arn" {
  description = "IAM role ARN used for S3 replication."
  value       = aws_iam_role.replication.arn
}