def calculate_blast_radius(resource_type: str, privilege_level: str) -> int:
    if privilege_level == "admin":
        return 90

    if resource_type in ["iam_user", "service_principal"]:
        return 70

    return 30