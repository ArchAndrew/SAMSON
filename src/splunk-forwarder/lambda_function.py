import json
import os
import urllib.request
import boto3

ssm = boto3.client("ssm")


def get_hec_token():
    parameter_name = os.environ["SPLUNK_HEC_TOKEN_PARAMETER"]
    response = ssm.get_parameter(Name=parameter_name, WithDecryption=True)
    return response["Parameter"]["Value"]


def lambda_handler(event, context):
    token = get_hec_token()

    payload = {
        "index": os.getenv("SPLUNK_INDEX", "main"),
        "sourcetype": os.getenv("SPLUNK_SOURCETYPE", "samson:risk:event"),
        "event": event
    }

    request = urllib.request.Request(
        os.environ["SPLUNK_HEC_URL"],
        data=json.dumps(payload).encode("utf-8"),
        headers={
            "Authorization": f"Splunk {token}",
            "Content-Type": "application/json"
        },
        method="POST"
    )

    with urllib.request.urlopen(request, timeout=10) as response:
        return {
            "statusCode": response.status,
            "body": response.read().decode("utf-8")
        }