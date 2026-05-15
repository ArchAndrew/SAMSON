from src.normalizer.governance_parser import normalize_event


def test_normalize_aws_event():
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

    normalized = normalize_event(event)

    assert normalized.provider == "aws"
    assert normalized.event_name == "CreateAccessKey"
    assert normalized.actor.endswith("user/admin")
    assert normalized.resource == "test-user"