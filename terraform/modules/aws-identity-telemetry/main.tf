resource "aws_cloudwatch_log_group" "identity_events" {
  name              = "/samson/${var.environment}/identity-events"
  retention_in_days = var.log_retention_days

  tags = var.tags
}

resource "aws_iam_role" "cloudtrail_logs" {
  name = "${var.project}-${var.environment}-cloudtrail-logs-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "cloudtrail.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })

  tags = var.tags
}

resource "aws_iam_policy" "cloudtrail_logs" {
  name        = "${var.project}-${var.environment}-cloudtrail-logs-policy"
  description = "Allows CloudTrail to publish identity events to CloudWatch Logs."

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = "logs:CreateLogStream"
        Resource = "${aws_cloudwatch_log_group.identity_events.arn}:*"
      },
      {
        Effect   = "Allow"
        Action   = "logs:PutLogEvents"
        Resource = "${aws_cloudwatch_log_group.identity_events.arn}:*"
      }
    ]
  })

  tags = var.tags
}

resource "aws_iam_role_policy_attachment" "cloudtrail_logs" {
  role       = aws_iam_role.cloudtrail_logs.name
  policy_arn = aws_iam_policy.cloudtrail_logs.arn
}

data "aws_caller_identity" "current" {}

resource "aws_s3_bucket_policy" "cloudtrail_delivery" {
  bucket = var.evidence_bucket_name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "AWSCloudTrailAclCheck"
        Effect = "Allow"
        Principal = {
          Service = "cloudtrail.amazonaws.com"
        }
        Action   = "s3:GetBucketAcl"
        Resource = "arn:aws:s3:::${var.evidence_bucket_name}"
      },
      {
        Sid    = "AWSCloudTrailWrite"
        Effect = "Allow"
        Principal = {
          Service = "cloudtrail.amazonaws.com"
        }
        Action   = "s3:PutObject"
        Resource = "arn:aws:s3:::${var.evidence_bucket_name}/AWSLogs/${data.aws_caller_identity.current.account_id}/*"
        Condition = {
          StringEquals = {
            "s3:x-amz-acl" = "bucket-owner-full-control"
          }
        }
      }
    ]
  })
}

resource "aws_cloudtrail" "identity_trail" {
  name                          = "${var.project}-${var.environment}-identity-trail"
  s3_bucket_name                = var.evidence_bucket_name
  include_global_service_events = true
  is_multi_region_trail         = true
  enable_logging                = true

  cloud_watch_logs_group_arn = "${aws_cloudwatch_log_group.identity_events.arn}:*"
  cloud_watch_logs_role_arn  = aws_iam_role.cloudtrail_logs.arn

  event_selector {
    read_write_type           = "All"
    include_management_events = true
  }

  depends_on = [
  aws_iam_role_policy_attachment.cloudtrail_logs,
  aws_s3_bucket_policy.cloudtrail_delivery
]

  tags = var.tags
}

resource "aws_accessanalyzer_analyzer" "identity_access_analyzer" {
  analyzer_name = "${var.project}-${var.environment}-identity-access-analyzer"
  type          = "ACCOUNT"

  tags = var.tags
}