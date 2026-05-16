def map_controls(event_name: str) -> list[dict]:
    mappings = {
        "CreateAccessKey": [
            {"framework": "NIST 800-53", "control": "AC-2"},
            {"framework": "NIST 800-53", "control": "IA-2"},
            {"framework": "CIS", "control": "5.4"},
        ],
        "AttachUserPolicy": [
            {"framework": "NIST 800-53", "control": "AC-6"},
            {"framework": "CIS", "control": "1.16"},
        ],
        "Microsoft.Authorization/roleAssignments/write": [
            {"framework": "NIST 800-53", "control": "AC-6"},
            {"framework": "ISO 27001", "control": "A.5.15"},
        ],
    }

    return mappings.get(event_name, [{"framework": "General", "control": "Governance Review"}])