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


def test_normalize_azure_event():
    sample = {
        "operationName": {"value": "Microsoft.Authorization/roleAssignments/write"},
        "caller": "admin@company.com",
        "resourceId": "/subscriptions/123/resourceGroups/rg1",
        "eventTimestamp": "2026-05-14T22:00:00Z"
    }

    result = normalize_event(sample, provider="azure")

    assert result.provider == "azure"
    assert "roleAssignments" in result.event_name
    assert result.actor == "admin@company.com"


def test_governance_dispatch():
    sample = {
        "detail": {
            "eventName": "CreateAccessKey",
            "userIdentity": {
                "arn": "arn:aws:iam::123456789012:user/admin"
            },
            "requestParameters": {
                "userName": "admin"
            },
            "eventTime": "2026-05-14T22:00:00Z"
        }
    }

    result = normalize_event(sample, provider="aws")

    assert result.provider == "aws"
    assert result.event_name == "CreateAccessKey"