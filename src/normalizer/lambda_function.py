import json
import os
from datetime import datetime, timezone


def lambda_handler(event, context):
    normalized_event = {
        "schema_version": "1.0",
        "project": os.getenv("PROJECT", "SAMSON"),
        "environment": os.getenv("ENVIRONMENT", "dev"),
        "normalized_at": datetime.now(timezone.utc).isoformat(),
        "source_event": event,
        "event_type": event.get("source", "unknown"),
        "detail_type": event.get("detail-type", "unknown"),
    }

    print(json.dumps(normalized_event))

    return {
        "statusCode": 200,
        "body": json.dumps(normalized_event)
    }