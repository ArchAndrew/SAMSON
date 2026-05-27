import json
import os
from datetime import datetime, timezone

from src.risk_engine.executive_summary import generate_executive_summary


def score_event(event: dict) -> dict:
    """
    Public showcase implementation of the SAMSON risk-engine Lambda.

    NOTE:
    The private SAMSON implementation includes:
    - deterministic governance scoring
    - identity and privilege analysis
    - attack-path correlation
    - blast-radius estimation
    - compliance control mapping
    - approval workflow alignment
    - executive summary enrichment

    This sanitized version preserves the Lambda contract
    while protecting proprietary scoring logic.
    """

    detail_type = event.get("detail_type") or event.get(
        "detail-type",
        "sanitized-event",
    )

    score = 45
    severity = "LOW"
    recommended_action = "Monitor and review governance activity."

    result = {
        "schema_version": "1.0",
        "project": os.getenv("PROJECT", "SAMSON"),
        "environment": os.getenv("ENVIRONMENT", "public-demo"),
        "scored_at": datetime.now(timezone.utc).isoformat(),
        "detail_type": detail_type,
        "risk_score": score,
        "severity": severity,
        "recommended_action": recommended_action,
        "decision_authority": "deterministic-risk-engine",
        "public_showcase": True,
        "source_event": {
            "message": "Sanitized event payload removed from public release."
        },
    }

    result["executive_summary"] = generate_executive_summary(
        {
            "provider": event.get("source", "unknown"),
            "event_name": detail_type,
            "actor": "sanitized-actor",
            "risk_score": score,
            "blast_radius": "sanitized",
            "severity": severity,
            "approval_status": "AUTO_REVIEW",
            "framework": "General",
            "control": "Governance Review",
        }
    )

    return result


def lambda_handler(event, context):
    """
    Public SAMSON risk-engine Lambda entry point.
    """

    result = score_event(event)

    print(json.dumps(result))

    return {
        "statusCode": 200,
        "body": json.dumps(result),
    }