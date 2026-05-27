from src.normalizer.event_schema import GovernanceEvent


def parse_azure_activity_event(event: dict) -> GovernanceEvent:
    """
    Public showcase implementation for Azure governance event normalization.

    NOTE:
    The full private SAMSON implementation performs:
    - Azure Activity Log enrichment
    - identity and RBAC correlation
    - subscription and management group context mapping
    - governance policy evaluation
    - compliance-aware normalization
    - privilege and scope interpretation
    - deterministic preprocessing for downstream risk analysis

    This sanitized version preserves architectural flow
    while protecting proprietary normalization logic.
    """

    return GovernanceEvent(
        provider="azure",
        event_name=event.get("operationName", {}).get("value", "Unknown"),
        actor="sanitized-actor",
        resource="sanitized-resource",
        timestamp=event.get("eventTimestamp", ""),
        raw_event={
            "message": "Sanitized public Azure governance event payload"
        },
    )