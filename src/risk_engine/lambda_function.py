import json
import os
from datetime import datetime, timezone


def score_event(event: dict) -> dict:
    detail_type = event.get("detail_type") or event.get("detail-type", "unknown")
    source_event = event.get("source_event", event)

    raw_text = json.dumps(source_event).lower()

    score = 25
    severity = "LOW"
    recommended_action = "Log and monitor"

    if "createaccesskey" in raw_text or "attachuserpolicy" in raw_text:
        score = 85
        severity = "HIGH"
        recommended_action = "Review IAM activity and consider disabling unauthorized credentials"

    if "administratoraccess" in raw_text or "fullawsaccess" in raw_text:
        score = 95
        severity = "CRITICAL"
        recommended_action = "Escalate immediately and validate privilege escalation path"

    if "assumerole" in raw_text:
        score = max(score, 70)
        severity = "MEDIUM" if score < 85 else severity
        recommended_action = "Validate role assumption context and source identity"

    return {
        "schema_version": "1.0",
        "project": os.getenv("PROJECT", "SAMSON"),
        "environment": os.getenv("ENVIRONMENT", "dev"),
        "scored_at": datetime.now(timezone.utc).isoformat(),
        "detail_type": detail_type,
        "risk_score": score,
        "severity": severity,
        "recommended_action": recommended_action,
        "decision_authority": "deterministic-risk-engine",
        "source_event": source_event,
    }


def lambda_handler(event, context):
    result = score_event(event)
    print(json.dumps(result))

    return {
        "statusCode": 200,
        "body": json.dumps(result)
    }