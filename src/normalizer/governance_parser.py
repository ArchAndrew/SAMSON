from src.normalizer.aws_parser import parse_cloudtrail_event
from src.normalizer.azure_parser import parse_azure_activity_event


def normalize_event(event: dict):
    source = event.get("source") or event.get("provider")

    if source == "aws":
        return parse_cloudtrail_event(event)

    if source == "azure":
        return parse_azure_activity_event(event)

    raise ValueError(f"Unsupported event source: {source}")