import json
import os
import urllib.request
import urllib.error


def publish_to_splunk(event: dict) -> dict:
    hec_url = os.getenv("SPLUNK_HEC_URL")
    hec_token = os.getenv("SPLUNK_HEC_TOKEN")
    index = os.getenv("SPLUNK_INDEX", "main")
    sourcetype = os.getenv("SPLUNK_SOURCETYPE", "samson:risk:event")

    if not hec_url:
        return {"splunk_sent": False, "reason": "SPLUNK_HEC_URL not set"}

    if not hec_token:
        return {"splunk_sent": False, "reason": "SPLUNK_HEC_TOKEN not set"}

    payload = {
        "index": index,
        "sourcetype": sourcetype,
        "event": event,
    }

    data = json.dumps(payload).encode("utf-8")

    req = urllib.request.Request(
        hec_url.rstrip("/") + "/services/collector",
        data=data,
        headers={
            "Authorization": f"Splunk {hec_token}",
            "Content-Type": "application/json",
            "User-Agent": "curl/8.0",
        },
        method="POST",
    )

    try:
        with urllib.request.urlopen(req, timeout=10) as response:
            body = response.read().decode("utf-8")
            return {
                "splunk_sent": True,
                "status_code": response.status,
                "response": body,
            }

    except urllib.error.HTTPError as e:
        return {
            "splunk_sent": False,
            "status_code": e.code,
            "error": e.read().decode("utf-8"),
        }

    except Exception as e:
        return {
            "splunk_sent": False,
            "error": str(e),
        }