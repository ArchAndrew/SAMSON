from src.response_engine.approval_workflow import create_approval_payload


def test_high_risk_event_requires_approval():
    payload = create_approval_payload(
        event_name="CreateAccessKey",
        provider="aws",
        risk_score=85,
        recommendations=["Require immediate security review."],
        actor="arn:aws:iam::123456789012:user/admin",
        resource="test-user",
    )

    assert payload["approval_required"] is True
    assert payload["status"] == "PENDING_APPROVAL"
    assert payload["risk_score"] == 85


def test_low_risk_event_auto_review():
    payload = create_approval_payload(
        event_name="UnknownEvent",
        provider="aws",
        risk_score=40,
        recommendations=["Perform standard governance review."],
    )

    assert payload["approval_required"] is False
    assert payload["status"] == "AUTO_REVIEW"