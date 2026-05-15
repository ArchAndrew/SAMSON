resource "aws_iam_role" "response_workflows" {
  name = "${var.project}-${var.environment}-response-workflows-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        Service = "lambda.amazonaws.com"
      }
      Action = "sts:AssumeRole"
    }]
  })

  tags = var.tags
}

resource "aws_iam_policy" "response_workflows" {
  name        = "${var.project}-${var.environment}-response-workflows-policy"
  description = "Permissions for SAMSON response workflow Lambda."

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ]
        Resource = "*"
      },
      {
        Effect = "Allow"
        Action = [
          "s3:PutObject",
          "s3:GetObject"
        ]
        Resource = "${var.evidence_bucket_arn}/*"
      },
      {
        Effect = "Allow"
        Action = [
          "events:PutEvents"
        ]
        Resource = var.event_bus_arn
      },
      {
        Effect = "Allow"
        Action = [
          "sns:Publish"
        ]
        Resource = aws_sns_topic.response_notifications.arn
      }
    ]
  })

  tags = var.tags
}

resource "aws_iam_role_policy_attachment" "response_workflows" {
  role       = aws_iam_role.response_workflows.name
  policy_arn = aws_iam_policy.response_workflows.arn
}

resource "aws_sns_topic" "response_notifications" {
  name = "${var.project}-${var.environment}-response-notifications"

  tags = var.tags
}

resource "aws_sns_topic_subscription" "email" {
  count     = length(var.notification_emails)
  topic_arn = aws_sns_topic.response_notifications.arn
  protocol  = "email"
  endpoint  = var.notification_emails[count.index]
}

data "archive_file" "response_workflows_package" {
  type        = "zip"
  source_dir  = var.lambda_source_dir
  output_path = "${path.module}/response_workflows.zip"
}

resource "aws_lambda_function" "response_workflows" {
  function_name = "${var.project}-${var.environment}-response-workflows"
  role          = aws_iam_role.response_workflows.arn
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.12"
  timeout       = var.lambda_timeout
  memory_size   = var.lambda_memory

  filename         = data.archive_file.response_workflows_package.output_path
  source_code_hash = data.archive_file.response_workflows_package.output_base64sha256

  environment {
    variables = {
      PROJECT              = var.project
      ENVIRONMENT          = var.environment
      EVIDENCE_BUCKET_NAME = var.evidence_bucket_name
      EVENT_BUS_NAME       = var.event_bus_name
      SNS_TOPIC_ARN        = aws_sns_topic.response_notifications.arn
      AUTONOMY_MODE        = var.autonomy_mode
    }
  }

  depends_on = [
    aws_iam_role_policy_attachment.response_workflows
  ]

  tags = var.tags
}

resource "aws_lambda_permission" "allow_eventbridge" {
  statement_id  = "AllowExecutionFromEventBridgeResponseWorkflows"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.response_workflows.function_name
  principal     = "events.amazonaws.com"
}