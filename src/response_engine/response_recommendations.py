def generate_recommendations(event_name: str, risk_score: int) -> list[str]:
    recommendations = []

    if risk_score >= 80:
        recommendations.append("Require immediate security review.")
        recommendations.append("Notify security leadership.")
        recommendations.append("Validate change authorization.")

    if event_name == "CreateAccessKey":
        recommendations.append("Verify that the access key is required.")
        recommendations.append("Ensure MFA is enabled for the IAM user.")
        recommendations.append("Rotate and remove unused access keys.")

    if event_name == "Microsoft.Authorization/roleAssignments/write":
        recommendations.append("Confirm the role assignment was approved.")
        recommendations.append("Review granted permissions for least privilege.")
        recommendations.append("Validate scope and expiration settings.")

    if not recommendations:
        recommendations.append("Perform standard governance review.")

    return recommendations