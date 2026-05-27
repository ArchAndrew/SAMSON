resource "aws_cloudwatch_event_bus" "samson" {
  name = "${var.project}-${var.environment}-event-bus"

  tags = var.tags
}

resource "aws_cloudwatch_event_rule" "iam_activity" {
  name           = "${var.project}-${var.environment}-iam-activity"
  description    = "Captures IAM-related CloudTrail activity for SAMSON."
  event_bus_name = aws_cloudwatch_event_bus.samson.name

  event_pattern = jsonencode({
    source = ["aws.iam"]
  })

  tags = var.tags
}

resource "aws_cloudwatch_event_rule" "sts_activity" {
  name           = "${var.project}-${var.environment}-sts-activity"
  description    = "Captures STS AssumeRole activity for SAMSON."
  event_bus_name = aws_cloudwatch_event_bus.samson.name

  event_pattern = jsonencode({
    source = ["aws.sts"]
  })

  tags = var.tags
}

resource "aws_cloudwatch_event_rule" "organizations_activity" {
  name           = "${var.project}-${var.environment}-organizations-activity"
  description    = "Captures AWS Organizations governance activity for SAMSON."
  event_bus_name = aws_cloudwatch_event_bus.samson.name

  event_pattern = jsonencode({
    source = ["aws.organizations"]
  })

  tags = var.tags
}

resource "aws_cloudwatch_event_rule" "access_analyzer_findings" {
  name           = "${var.project}-${var.environment}-access-analyzer-findings"
  description    = "Captures IAM Access Analyzer findings for SAMSON."
  event_bus_name = aws_cloudwatch_event_bus.samson.name

  event_pattern = jsonencode({
    source = ["aws.access-analyzer"]
  })

  tags = var.tags
}

resource "aws_sqs_queue" "dead_letter_queue" {
  name                      = "${var.project}-${var.environment}-eventbridge-dlq"
  message_retention_seconds = var.dlq_retention_seconds

  tags = var.tags
}