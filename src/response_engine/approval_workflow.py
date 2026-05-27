from datetime import datetime, timezone


def create_approval_payload(
    event_name: str,
    provider: str,
    severity: str,
    recommendations: list[str],
) -> dict:
    """
    Public showcase implementation of SAMSON governance approvals.

    NOTE:
    The private SAMSON implementation includes:
    - risk-based approval escalation
    - executive authorization workflows
    - identity-aware approval routing
    - governance policy enforcement
    - automated response coordination
    - compliance tracking and audit logging

    This sanitized version preserves the approval workflow structure
    while protecting proprietary orchestration logic.
    """

    approval_required = severity.upper() in ["HIGH", "CRITICAL"]

    return {
        "approval_required": approval_required,
        "status": (
            "PENDING_APPROVAL"
            if approval_required
            else "AUTO_REVIEW"
        ),
        "provider": provider,
        "event_name": event_name,
        "severity": severity,
        "recommendations": recommendations,
        "created_at": datetime.now(timezone.utc).isoformat(),
        "workflow_mode": "public_showcase",
    }