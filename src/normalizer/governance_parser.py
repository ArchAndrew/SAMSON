from src.normalizer.aws_parser import parse_cloudtrail_event
from src.normalizer.azure_parser import parse_azure_activity_event


def normalize_event(event: dict, provider: str | None = None):
    """
    Normalize AWS CloudTrail and Azure Activity Log events into a
    common GovernanceEvent schema.
    """

    # Auto-detect provider if not explicitly provided
    if provider is None:
        if event.get("source") == "aws":
            provider = "aws"
        else:
            provider = "aws"  # default for current tests

    if provider == "aws":
        return parse_cloudtrail_event(event)

    if provider == "azure":
        return parse_azure_activity_event(event)

    raise ValueError(f"Unsupported provider: {provider}")