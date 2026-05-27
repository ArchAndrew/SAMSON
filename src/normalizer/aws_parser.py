from src.normalizer.event_schema import GovernanceEvent


def parse_cloudtrail_event(event: dict) -> GovernanceEvent:
    """
    Public showcase implementation for AWS governance event normalization.

    NOTE:
    The full private SAMSON implementation performs:
    - deep CloudTrail field extraction
    - identity correlation
    - privilege-context enrichment
    - governance tagging
    - compliance-aware normalization
    - cross-account telemetry interpretation
    - deterministic preprocessing for risk analysis

    This sanitized version preserves architectural intent
    while protecting proprietary parsing and enrichment logic.
    """

    detail = event.get("detail", {})

    return GovernanceEvent(
        provider="aws",
        event_name=detail.get("eventName", "UnknownEvent"),
        actor="sanitized-actor",
        resource="sanitized-resource",
        timestamp=detail.get("eventTime", ""),
        raw_event={
            "message": "Sanitized public event payload"
        },
    )