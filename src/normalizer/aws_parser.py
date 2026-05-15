from src.normalizer.event_schema import GovernanceEvent


def parse_cloudtrail_event(event: dict) -> GovernanceEvent:
    detail = event.get("detail", {})

    return GovernanceEvent(
        provider="aws",
        event_name=detail.get("eventName", "Unknown"),
        actor=detail.get("userIdentity", {}).get("arn", "unknown"),
        resource=detail.get("requestParameters", {}).get("userName", "unknown"),
        timestamp=detail.get("eventTime", ""),
        raw_event=event,
    )