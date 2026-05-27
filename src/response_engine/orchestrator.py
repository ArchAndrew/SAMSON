from src.normalizer.governance_parser import normalize_event
from src.risk_engine.governance_risk import calculate_governance_risk
from src.risk_engine.blast_radius import calculate_blast_radius
from src.risk_engine.control_mapper import map_controls
from src.response_engine.response_recommendations import generate_recommendations
from src.response_engine.approval_workflow import create_approval_payload
from src.risk_engine.executive_summary import generate_executive_summary
from src.notification_engine.sns_notifier import publish_notification
from src.notification_engine.splunk_notifier import publish_to_splunk


def _classify_severity(risk_score: int) -> str:
    """
    Public severity classifier.

    Private implementation may include additional business context,
    control weighting, identity impact, and environment-aware scoring.
    """

    if risk_score >= 90:
        return "CRITICAL"
    if risk_score >= 80:
        return "HIGH"
    if risk_score >= 50:
        return "MEDIUM"
    return "LOW"


def orchestrate_security_event(event: dict) -> dict:
    """
    Public showcase implementation of the SAMSON orchestration pipeline.

    NOTE:
    The private SAMSON implementation includes:
    - multi-cloud telemetry normalization
    - deterministic governance risk scoring
    - blast-radius and privilege-context evaluation
    - compliance control mapping
    - approval-aware response workflows
    - Azure OpenAI executive summarization
    - SNS notification routing
    - Splunk forwarding
    - audit/evidence preservation logic

    This sanitized version preserves the end-to-end architecture flow
    while protecting proprietary security logic.
    """

    normalized = normalize_event(event)

    risk_score = calculate_governance_risk(
        {
            "event_name": normalized.event_name,
            "provider": normalized.provider,
        }
    )

    severity = _classify_severity(risk_score)

    blast_radius = calculate_blast_radius(
        resource_type="sanitized-resource",
        privilege_level="sanitized-privilege",
    )

    controls = map_controls(normalized.event_name)

    recommendations = generate_recommendations(
        event_name=normalized.event_name,
        risk_score=risk_score,
    )

    approval = create_approval_payload(
        event_name=normalized.event_name,
        provider=normalized.provider,
        severity=severity,
        recommendations=recommendations,
    )

    summary_input = {
        "provider": normalized.provider,
        "event_name": normalized.event_name,
        "risk_score": risk_score,
        "severity": severity,
        "blast_radius": blast_radius,
        "recommended_response": approval["status"],
        "approval_status": approval["status"],
        "recommendations": recommendations,
    }

    executive_summary = generate_executive_summary(summary_input)

    enriched_event = {
        "normalized_event": normalized.__dict__,
        "risk_score": risk_score,
        "blast_radius": blast_radius,
        "severity": severity,
        "controls": controls,
        "recommendations": recommendations,
        "approval": approval,
        "approval_status": approval["status"],
        "executive_summary": executive_summary,
        "public_showcase": True,
    }

    enriched_event["notification_result"] = publish_notification(enriched_event)
    enriched_event["splunk_result"] = publish_to_splunk(enriched_event)

    return enriched_event