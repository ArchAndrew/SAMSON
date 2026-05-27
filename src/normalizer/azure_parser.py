from src.normalizer.event_schema import GovernanceEvent


def parse_azure_activity_event(event: dict) -> GovernanceEvent:
    return GovernanceEvent(
        provider="azure",
        event_name=event.get("operationName", {}).get("value", "Unknown"),
        actor=event.get("caller", "unknown"),
        resource=event.get("resourceId", "unknown"),
        timestamp=event.get("eventTimestamp", ""),
        raw_event=event,
    )