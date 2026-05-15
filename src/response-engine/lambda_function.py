import json
import os
from datetime import datetime, timezone


def determine_response(event: dict) -> dict:
    body = event.get("body", event)

    if isinstance(body, str):
        try:
            body = json.loads(body)
        except json.JSONDecodeError:
            body = {"raw_body": body}

    severity = body.get("severity", "LOW")
    risk_score = body.get("risk_score", 0)
    autonomy_mode = os.getenv("AUTONOMY_MODE", "approval_required")

    action = "monitor_only"
    approval_required = False

    if severity in ["HIGH", "CRITICAL"] or risk_score >= 85:
        action = "escalate_for_review"
        approval_required = True

    if autonomy_mode == "autonomous" and severity == "CRITICAL":
        action = "automated_containment_candidate"
        approval_required = False

    return {
        "schema_version": "1.0",
        "project": os.getenv("PROJECT", "SAMSON"),
        "environment": os.getenv("ENVIRONMENT", "dev"),
        "evaluated_at": datetime.now(timezone.utc).isoformat(),
        "autonomy_mode": autonomy_mode,
        "recommended_response": action,
        "approval_required": approval_required,
        "source_risk_event": body,
    }


def lambda_handler(event, context):
    response = determine_response(event)
    print(json.dumps(response))

    return {
        "statusCode": 200,
        "body": json.dumps(response)
    }