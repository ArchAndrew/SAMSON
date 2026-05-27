from src.response_engine.orchestrator import orchestrate_security_event


def test_orchestrator_processes_high_risk_aws_event():
    event = {
        "source": "aws",
        "detail": {
            "eventName": "CreateAccessKey",
            "eventTime": "2026-05-14T00:00:00Z",
            "userIdentity": {
                "arn": "arn:aws:iam::123456789012:user/admin"
            },
            "requestParameters": {
                "userName": "test-user"
            }
        }
    }

    result = orchestrate_security_event(event)

    assert result["normalized_event"]["provider"] == "aws"
    assert result["normalized_event"]["event_name"] == "CreateAccessKey"
    assert result["risk_score"] >= 80
    assert result["blast_radius"] > 0
    assert len(result["controls"]) > 0
    assert len(result["recommendations"]) > 0
    assert result["approval"]["approval_required"] is True
    assert result["approval"]["status"] == "PENDING_APPROVAL"