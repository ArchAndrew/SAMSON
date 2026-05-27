def publish_to_splunk(event: dict) -> dict:
    """
    Public showcase implementation for SAMSON SIEM forwarding.

    NOTE:
    The full private SAMSON implementation includes:
    - Splunk HEC integration
    - secure token handling
    - index and sourcetype routing
    - structured event forwarding
    - delivery validation
    - error handling and retry behavior
    - Cloudflare Tunnel-based lab forwarding

    This sanitized version preserves the integration contract
    while protecting proprietary forwarding and operational details.
    """

    return {
        "splunk_sent": False,
        "status": "public_showcase_mode",
        "message": "SIEM forwarding integration is represented but disabled in the public repository.",
        "event_preview": {
            "provider": event.get("provider", "unknown"),
            "event_name": event.get("event_name", "sanitized-event"),
            "severity": event.get("severity", "UNKNOWN"),
        },
    }