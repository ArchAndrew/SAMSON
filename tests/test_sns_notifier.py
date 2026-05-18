from src.notification_engine.sns_notifier import build_notification_payload, should_notify


def test_high_risk_event_should_notify():
    event = {
        "project": "SAMSON",
        "severity": "HIGH",
        "risk_score": 85,
        "recommended_action": "Review IAM activity",
        "executive_summary": "SAMSON detected a high-risk IAM event.",
        "approval_status": "PENDING_APPROVAL",
    }

    assert should_notify(event) is True


def test_notification_payload_contains_summary():
    event = {
        "project": "SAMSON",
        "severity": "HIGH",
        "risk_score": 85,
        "executive_summary": "SAMSON detected a high-risk IAM event.",
    }

    payload = build_notification_payload(event)

    assert "SAMSON Alert" in payload["subject"]
    assert "executive_summary" in payload["message"]
    assert "high-risk IAM event" in payload["message"]