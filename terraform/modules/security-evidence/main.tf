locals {
  evidence_metadata = {
    primary_bucket = var.primary_bucket_name
    replica_bucket = var.replica_bucket_name
    retention_days = var.retention_days
    dr_strategy    = var.dr_strategy
    rpo_minutes    = var.rpo_minutes
    rto_hours      = var.rto_hours
    classification = "Confidential"
    purpose        = "Security and Forensic Evidence Repository"
  }
}