from src.normalizer.governance_parser import normalize_event
from src.risk_engine.governance_risk import calculate_governance_risk
from src.risk_engine.blast_radius import calculate_blast_radius
from src.risk_engine.control_mapper import map_controls
from src.response_engine.response_recommendations import generate_recommendations
from src.response_engine.approval_workflow import create_approval_payload
from src.ai_engine.azure_openai_summary import generate_executive_summary
from src.notification_engine.sns_notifier import publish_notification
from dotenv import load_dotenv
load_dotenv()


def orchestrate_security_event(event: dict) -> dict:
    normalized = normalize_event(event)

    risk_score = calculate_governance_risk({
        "event_name": normalized.event_name,
        "provider": normalized.provider,
    })

    blast_radius = calculate_blast_radius(
        resource_type="iam_user" if normalized.provider == "aws" else "service_principal",
        privilege_level="admin" if risk_score >= 80 else "standard",
    )

    controls = map_controls(normalized.event_name)

    recommendations = generate_recommendations(
        event_name=normalized.event_name,
        risk_score=risk_score,
    )

    approval = create_approval_payload(
        event_name=normalized.event_name,
        provider=normalized.provider,
        risk_score=risk_score,
        recommendations=recommendations,
        actor=normalized.actor,
        resource=normalized.resource,
    )

    severity = (
        "CRITICAL" if risk_score >= 90
        else "HIGH" if risk_score >= 80
        else "MEDIUM" if risk_score >= 50
        else "LOW"
    )

    summary_input = {
        "provider": normalized.provider,
        "event_name": normalized.event_name,
        "risk_score": risk_score,
        "severity": severity,
        "blast_radius": blast_radius,
        "recommended_response": approval["status"],
    }

    executive_summary = generate_executive_summary(summary_input)

    notification_event = {
        "project": "SAMSON",
        "environment": "dev",
        "severity": severity,
        "risk_score": risk_score,
        "recommended_action": approval["status"],
        "executive_summary": executive_summary,
        "approval_status": approval["status"],
    }

    notification_result = publish_notification(notification_event)

    return {
        "normalized_event": normalized.__dict__,
        "risk_score": risk_score,
        "blast_radius": blast_radius,
        "controls": controls,
        "recommendations": recommendations,
        "approval": approval,
        "executive_summary": executive_summary,
        "notification_result": notification_result,
    }