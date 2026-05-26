import os
from openai import OpenAI


def generate_deterministic_summary(event: dict) -> str:
    severity = event.get("severity", "UNKNOWN")
    provider = event.get("provider", "unknown")
    event_name = event.get("event_name", "UnknownEvent")
    risk_score = event.get("risk_score", 0)
    blast_radius = event.get("blast_radius", 0)
    recommended_response = event.get(
        "recommended_response",
        event.get("approval_status", "AUTO_REVIEW"),
    )

    recommendations = event.get("recommendations", [])
    recommendation_text = (
        "; ".join(recommendations[:3])
        if recommendations
        else "Perform standard governance review."
    )

    return (
        f"A {severity} severity governance event was detected in {provider}. "
        f"The event '{event_name}' received a risk score of {risk_score} "
        f"and an estimated blast radius of {blast_radius}. "
        f"The recommended response status is '{recommended_response}'. "
        f"Recommended remediation actions include: {recommendation_text}"
    )


def generate_ai_summary(event: dict) -> str:
    deterministic_summary = generate_deterministic_summary(event)

    endpoint = os.getenv("AZURE_OPENAI_ENDPOINT")
    api_key = os.getenv("AZURE_OPENAI_API_KEY")
    deployment = os.getenv("AZURE_OPENAI_DEPLOYMENT")

    if not endpoint:
        raise ValueError("AZURE_OPENAI_ENDPOINT is not set")
    if not api_key:
        raise ValueError("AZURE_OPENAI_API_KEY is not set")
    if not deployment:
        raise ValueError("AZURE_OPENAI_DEPLOYMENT is not set")

    if not endpoint.endswith("/"):
        endpoint += "/"

    client = OpenAI(
        api_key=api_key,
        base_url=endpoint,
    )

    response = client.chat.completions.create(
        model=deployment,
        messages=[
            {
                "role": "system",
                "content": (
                    "You are a cybersecurity executive advisor. "
                    "Rewrite security findings into concise, professional "
                    "executive summaries for CISOs and senior executives. "
                    "Preserve all facts exactly and do not invent details."
                ),
            },
            {
                "role": "user",
                "content": (
                    "Rewrite this deterministic security summary into a concise "
                    "executive risk briefing for a CISO. Use 2-4 polished sentences. "
                    "Preserve all facts exactly, make the business risk clear, "
                    "and include recommended remediation actions.\n\n"
                    f"{deterministic_summary}"
                ),
            },
        ],
        max_completion_tokens=220,
    )

    return response.choices[0].message.content.strip()


def generate_executive_summary(event: dict) -> str:
    try:
        required_vars = [
            "AZURE_OPENAI_API_KEY",
            "AZURE_OPENAI_ENDPOINT",
            "AZURE_OPENAI_DEPLOYMENT",
        ]

        if all(os.getenv(var) for var in required_vars):
            return generate_ai_summary(event)

    except Exception as e:
        print(f"[WARN] Azure OpenAI summary failed: {e}")

    return generate_deterministic_summary(event)