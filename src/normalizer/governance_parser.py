from src.normalizer.aws_parser import parse_cloud_event
from src.normalizer.azure_parser import parse_activity_event


def normalize_event(event: dict, provider: str | None = None):
    """
    Normalize multi-cloud governance telemetry into a shared schema.

    This sanitized implementation demonstrates the orchestration flow
    used within the SAMSON governance pipeline while omitting
    proprietary normalization logic, enrichment rules,
    and provider-specific intelligence mappings.
    """

    # Basic provider detection
    if provider is None:
        if event.get("source") == "aws":
            provider = "aws"
        elif event.get("source") == "azure":
            provider = "azure"
        else:
            provider = "unknown"

    # Route event to appropriate parser
    if provider == "aws":
        return parse_cloud_event(event)

    if provider == "azure":
        return parse_activity_event(event)

    raise ValueError(f"Unsupported provider type: {provider}")