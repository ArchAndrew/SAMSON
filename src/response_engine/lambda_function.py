import json
import os
from datetime import datetime, timezone


def determine_response(event: dict) -> dict:
    """
    Public showcase implementation of SAMSON response orchestration.

    NOTE:
    The private SAMSON implementation includes:
    - deterministic risk scoring
    - approval-aware response routing
    - governance escalation logic
    - autonomous remediation workflows
    - blast radius analysis
    - executive response coordination

    This sanitized version preserves the response-engine structure
    while protecting proprietary orchestration logic.
    """

    severity = event.get("severity", "LOW").upper()

    if severity in ["CRITICAL", "HIGH"]:
        recommended_action = "ESCALATE_AND_REVIEW"
        approval_required = True
        autonomy_mode = "SUPERVISED"
    else:
        recommended_action = "MONITOR"
        approval_required = False
        autonomy_mode = "ASSISTED"

    return {
        "schema_version": "1.0",
        "project": os.getenv("PROJECT", "SAMSON"),
        "environment": os.getenv("ENVIRONMENT", "public-demo"),
        "evaluated_at": datetime.now(timezone.utc).isoformat(),
        "autonomy_mode": autonomy_mode,
        "recommended_response": recommended_action,
        "approval_required": approval_required,
        "event_summary": {
            "provider": event.get("provider", "unknown"),
            "event_name": event.get("event_name", "sanitized-event"),
            "severity": severity,
        },
    }


def lambda_handler(event, context):
    """
    Public SAMSON response-engine Lambda entry point.
    """

    response = determine_response(event)

    print(json.dumps(response))

    return {
        "statusCode": 200,
        "body": json.dumps(response),
    }