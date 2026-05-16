from datetime import datetime, timezone


def create_approval_payload(
    event_name: str,
    provider: str,
    risk_score: int,
    recommendations: list[str],
    actor: str = "unknown",
    resource: str = "unknown",
) -> dict:
    approval_required = risk_score >= 80

    return {
        "approval_required": approval_required,
        "status": "PENDING_APPROVAL" if approval_required else "AUTO_REVIEW",
        "provider": provider,
        "event_name": event_name,
        "actor": actor,
        "resource": resource,
        "risk_score": risk_score,
        "recommendations": recommendations,
        "created_at": datetime.now(timezone.utc).isoformat(),
    }