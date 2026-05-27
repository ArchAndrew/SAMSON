def calculate_governance_risk(event: dict) -> int:
    event_name = event.get("event_name", "")

    high_risk_events = {
        "CreateAccessKey",
        "AttachUserPolicy",
        "PutUserPolicy",
        "Microsoft.Authorization/roleAssignments/write",
    }

    if event_name in high_risk_events:
        return 85

    return 40