from src.risk_engine.governance_risk import calculate_governance_risk


def test_high_risk_admin_action():
    event = {
        "event_name": "CreateAccessKey",
        "provider": "aws"
    }

    score = calculate_governance_risk(event)

    assert score >= 80