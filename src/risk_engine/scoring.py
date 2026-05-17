def classify_severity(score: int) -> str:
    if score >= 90:
        return "CRITICAL"
    if score >= 80:
        return "HIGH"
    if score >= 50:
        return "MEDIUM"
    return "LOW"


def build_risk_score(event_name: str, provider: str, blast_radius: int = 0) -> dict:
    base_scores = {
        "CreateAccessKey": 85,
        "AttachUserPolicy": 90,
        "Microsoft.Authorization/roleAssignments/write": 85,
    }

    score = base_scores.get(event_name, 40)

    if blast_radius >= 80:
        score = min(score + 5, 100)

    return {
        "provider": provider,
        "event_name": event_name,
        "risk_score": score,
        "severity": classify_severity(score),
        "blast_radius": blast_radius,
    }