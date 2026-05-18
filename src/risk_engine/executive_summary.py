def generate_executive_summary(event):
    provider = event.get("provider", "cloud")
    severity = event.get("severity", "UNKNOWN")
    event_name = event.get("event_name", "UnknownEvent")
    actor = event.get("actor", "unknown actor")
    risk_score = event.get("risk_score", 0)
    blast_radius = event.get("blast_radius", 0)
    framework = event.get("framework", "General")
    control = event.get("control", "N/A")
    approval_status = event.get("approval_status", "AUTO_REVIEW")

    if approval_status == "PENDING_APPROVAL":
        recommended_action = "Perform human review before authorizing remediation."
    elif approval_status == "AUTO_REVIEW":
        recommended_action = "Continue monitoring under automated governance controls."
    else:
        recommended_action = "Investigate and determine appropriate response."

    return (
        f"SAMSON detected a {severity}-risk {event_name} event in {provider.upper()}. "
        f"The activity was initiated by {actor} and received a deterministic risk score "
        f"of {risk_score}/100 with a blast radius of {blast_radius}/100. "
        f"The event maps to {framework} {control}, indicating potential governance and compliance impact. "
        f"Approval status is {approval_status}. "
        f"Recommended action: {recommended_action}"
    )