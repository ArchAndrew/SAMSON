def generate_executive_summary(event: dict) -> str:
    """
    Placeholder for Azure OpenAI integration.

    For now, returns a deterministic summary so the orchestrator and
    unit tests can proceed even before the Azure OpenAI API is wired.
    """

    provider = event.get("provider", "unknown")
    event_name = event.get("event_name", "UnknownEvent")
    risk_score = event.get("risk_score", 0)
    severity = event.get("severity", "LOW")
    blast_radius = event.get("blast_radius", 0)
    response = event.get("recommended_response", "monitor_only")

    return (
        f"A {severity} severity governance event was detected in {provider}. "
        f"The event '{event_name}' received a risk score of {risk_score} "
        f"and an estimated blast radius of {blast_radius}. "
        f"The recommended response is '{response}'."
    )