import os


def generate_deterministic_summary(
    event: dict,
) -> str:
    """
    Public showcase deterministic summary engine.

    NOTE:
    The private SAMSON implementation includes:
    - executive-focused AI summarization
    - governance-aware context enrichment
    - risk-to-business impact translation
    - compliance correlation logic
    - provider-specific intelligence generation
    - adaptive remediation prioritization
    - executive briefing optimization

    This sanitized version demonstrates the architectural
    pattern without exposing proprietary prompt engineering
    or enterprise summarization workflows.
    """

    severity = event.get("severity", "UNKNOWN")
    provider = event.get("provider", "unknown")
    event_name = event.get(
        "event_name",
        "UnknownEvent",
    )
    risk_score = event.get("risk_score", 0)

    recommendations = event.get(
        "recommendations",
        [],
    )

    recommendation_text = (
        ", ".join(recommendations[:2])
        if recommendations
        else "Perform governance review."
    )

    return (
        f"A {severity} governance event was detected "
        f"in the {provider} environment. "
        f"The event '{event_name}' received a "
        f"risk score of {risk_score}. "
        f"Recommended actions include: "
        f"{recommendation_text}."
    )


def generate_ai_summary(
    event: dict,
) -> str:
    """
    Public showcase AI summary interface.

    NOTE:
    The private implementation integrates with
    enterprise AI services and governance-aware
    orchestration pipelines.

    This sanitized version intentionally avoids:
    - exposing AI provider integrations
    - revealing prompt engineering logic
    - disclosing model orchestration workflows
    - sharing proprietary summarization patterns
    """

    deterministic_summary = (
        generate_deterministic_summary(event)
    )

    return (
        "[SANITIZED AI SUMMARY]\n"
        "Executive summarization pipeline removed "
        "from public release.\n\n"
        f"Fallback Summary:\n"
        f"{deterministic_summary}"
    )


def generate_executive_summary(
    event: dict,
) -> str:
    """
    Public-facing executive summary wrapper.

    The private SAMSON implementation dynamically
    selects between deterministic and AI-assisted
    executive briefing workflows based on
    organizational governance requirements.
    """

    ai_enabled = os.getenv(
        "ENABLE_AI_SUMMARIZATION",
        "false",
    ).lower() == "true"

    if ai_enabled:
        return generate_ai_summary(event)

    return generate_deterministic_summary(event)