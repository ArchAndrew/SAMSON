def map_controls(event_name: str) -> list[dict]:
    mappings = {
        "CreateAccessKey": [
            {"framework": "NIST 800-53", "control": "AC-2"},
            {"framework": "NIST 800-53", "control": "IA-2"},
            {"framework": "CIS", "control": "5.4"},
            {"framework": "HIPAA", "control": "164.308(a)(1)"},
            {"framework": "ISO 27001", "control": "A.5.15"},
            {"framework": "PCI-DSS", "control": "7.2"},
        ],
        "AttachUserPolicy": [
            {"framework": "NIST 800-53", "control": "AC-6"},
            {"framework": "CIS", "control": "1.16"},
            {"framework": "HIPAA", "control": "164.308(a)(4)"},
            {"framework": "ISO 27001", "control": "A.5.18"},
            {"framework": "PCI-DSS", "control": "7.1"},
        ],
        "Microsoft.Authorization/roleAssignments/write": [
            {"framework": "NIST 800-53", "control": "AC-6"},
            {"framework": "ISO 27001", "control": "A.5.15"},
            {"framework": "HIPAA", "control": "164.312(a)(1)"},
            {"framework": "PCI-DSS", "control": "7.2"},
        ],
        "AssumeRole": [
            {"framework": "NIST 800-53", "control": "AC-3"},
            {"framework": "NIST 800-53", "control": "IA-2"},
            {"framework": "CIS", "control": "1.22"},
            {"framework": "ISO 27001", "control": "A.5.15"},
        ],
        "CreatePolicyVersion": [
            {"framework": "NIST 800-53", "control": "AC-6"},
            {"framework": "CIS", "control": "1.16"},
            {"framework": "ISO 27001", "control": "A.5.1"},
            {"framework": "PCI-DSS", "control": "7.2"},
        ],
    }

    return mappings.get(
        event_name,
        [{"framework": "General", "control": "Governance Review"}],
    )