# tests/test_response_recommendations.py

from src.response_engine.response_recommendations import generate_recommendations


def test_high_risk_access_key_recommendations():
    recommendations = generate_recommendations(
        event_name="CreateAccessKey",
        risk_score=85
    )

    assert isinstance(recommendations, list)
    assert len(recommendations) > 0
    assert "Require immediate security review." in recommendations
    assert "Verify that the access key is required." in recommendations


def test_standard_governance_recommendation():
    recommendations = generate_recommendations(
        event_name="UnknownEvent",
        risk_score=40
    )

    assert recommendations == ["Perform standard governance review."]