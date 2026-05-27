def classify_severity(
    score: int,
) -> str:
    """
    Public showcase severity classification model.

    NOTE:
    The private SAMSON implementation includes:
    - adaptive severity weighting
    - organizational risk tolerance mapping
    - compliance-aware escalation logic
    - identity and privilege correlation
    - blast-radius influence modeling
    - contextual governance scoring

    This sanitized version demonstrates the
    architectural pattern without exposing
    proprietary classification thresholds.
    """

    if score >= 85:
        return "CRITICAL"

    if score >= 65:
        return "HIGH"

    if score >= 40:
        return "MEDIUM"

    return "LOW"


def build_risk_score(
    event_name: str,
    provider: str,
    blast_radius: int = 0,
) -> dict:
    """
    Public showcase risk-scoring engine.

    NOTE:
    The private SAMSON implementation contains:
    - deterministic governance scoring
    - attack-path correlation
    - privilege escalation weighting
    - compliance-driven prioritization
    - provider-aware scoring adjustments
    - organizational context enrichment
    - dynamic confidence calculations

    This sanitized version preserves the
    overall architectural flow while removing
    proprietary scoring logic.
    """

    # Generic showcase event weighting
    base_scores = {
        "IdentityEvent": 75,
        "PrivilegeEvent": 85,
        "ConfigurationEvent": 55,
        "PolicyEvent": 60,
    }

    score = base_scores.get(
        event_name,
        40,
    )

    # Simplified blast-radius influence
    if blast_radius >= 80:
        score = min(score + 10, 100)

    elif blast_radius >= 60:
        score = min(score + 5, 100)

    return {
        "provider": provider,
        "event_name": event_name,
        "risk_score": score,
        "severity": classify_severity(score),
        "blast_radius": blast_radius,
        "public_showcase": True,
    }
