from dataclasses import dataclass
from typing import Optional


@dataclass
class GovernanceEvent:
    provider: str
    event_name: str
    actor: str
    resource: str
    timestamp: str
    severity: Optional[str] = None
    raw_event: Optional[dict] = None