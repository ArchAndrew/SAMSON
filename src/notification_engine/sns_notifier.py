import os
import json
import boto3


def build_notification_payload(event: dict) -> dict:
    """
    Build a structured SNS notification payload containing the
    deterministic risk assessment and executive summary.
    """
    subject = f"SAMSON Alert: {event.get('severity', 'UNKNOWN')} Risk Event"

    message = {
        "project": event.get("project", "SAMSON"),
        "environment": event.get("environment", "dev"),
        "severity": event.get("severity", "UNKNOWN"),
        "risk_score": event.get("risk_score", 0),
        "recommended_action": event.get(
            "recommended_action",
            "Review event"
        ),
        "executive_summary": event.get(
            "executive_summary",
            "No executive summary available."
        ),
        "approval_status": event.get(
            "approval_status",
            "AUTO_REVIEW"
        ),
    }

    return {
        "subject": subject,
        "message": json.dumps(message, indent=2),
    }


def should_notify(event: dict) -> bool:
    """
    Determine whether a notification should be sent based on the
    configured risk threshold.
    Default threshold: 80
    """
    threshold = int(os.getenv("NOTIFICATION_THRESHOLD", "80"))
    return event.get("risk_score", 0) >= threshold


# Create the SNS client once per Lambda container reuse.
sns = boto3.client("sns")


def publish_notification(event: dict):
    """
    Publish a notification to Amazon SNS when the event risk score
    meets or exceeds the configured threshold.

    Gracefully handles cases where:
    - Risk score is below threshold
    - SNS_TOPIC_ARN is not configured
    """
    if not should_notify(event):
        return {
            "notification_sent": False,
            "reason": "risk_score_below_threshold",
        }

    payload = build_notification_payload(event)
    topic_arn = os.getenv("SNS_TOPIC_ARN")

    if not topic_arn:
        return {
            "notification_sent": False,
            "reason": "SNS_TOPIC_ARN_not_configured",
            "payload": payload,
        }

    response = sns.publish(
        TopicArn=topic_arn,
        Subject=payload["subject"],
        Message=payload["message"],
    )

    return {
        "notification_sent": True,
        "sns_message_id": response.get("MessageId"),
        "subject": payload["subject"],
    }