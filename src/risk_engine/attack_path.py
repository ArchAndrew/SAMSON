def identify_attack_path(event_name: str, provider: str) -> dict:
    paths = {
        "CreateAccessKey": {
            "attack_path": [
                "IAM user access key created",
                "Long-lived credential available",
                "Potential persistence established",
                "Credential can be used outside normal login flow",
            ],
            "primary_risk": "credential_persistence",
        },
        "AttachUserPolicy": {
            "attack_path": [
                "Policy attached to identity",
                "Permissions expanded",
                "Privilege escalation possible",
                "High-impact API actions may become available",
            ],
            "primary_risk": "privilege_escalation",
        },
        "Microsoft.Authorization/roleAssignments/write": {
            "attack_path": [
                "Azure role assignment created",
                "Identity receives new permissions",
                "Scope may include subscription or resource group",
                "Privilege escalation or lateral movement possible",
            ],
            "primary_risk": "azure_rbac_escalation",
        },
    }

    return paths.get(event_name, {
        "attack_path": [
            f"{provider} governance event observed",
            "Event requires contextual review",
            "No predefined attack path matched",
        ],
        "primary_risk": "governance_review",
    })