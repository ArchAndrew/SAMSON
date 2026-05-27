from dataclasses import dataclass
from typing import Optional


@dataclass
class GovernanceEvent:
    """
    Public governance event schema used throughout the SAMSON pipeline.

    NOTE:
    The private SAMSON implementation includes additional
    enrichment metadata, governance context, compliance mappings,
    identity correlation attributes, and deterministic analysis fields.

    This sanitized schema preserves architectural structure
    while protecting proprietary implementation details.
    """

    provider: str
    event_name: str
    actor: str
    resource: str
    timestamp: str

    # Optional governance metadata
    severity: Optional[str] = None

    # Sanitized placeholder for normalized telemetry
    raw_event: Optional[dict] = None