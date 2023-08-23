import json
import requests

def lambda_handler(event, context):
    url = "https://ij92qpvpma.execute-api.eu-west-1.amazonaws.com/candidate-email_serverless_lambda_stage/data"
    headers = { "Content-Type" : "application/json", "X-Siemens-Auth" : "test"}
    payload = {
        "subnet_id": "10.0.239.0/24",  
        "name": "YogeshBhagwat",  
        "email": "yogeshbhagwat477@gmail.com"  
    }

    payload_json = json.dumps(payload)
    
    try:
        response = requests.post(url, data=payload_json, headers=headers)  # Fixed: Used 'url' instead of 'api_url'
        
        if response.status_code == 200:
            return {
                'statusCode': 200,
                'body': 'Request successfully sent'
            }
        else:
            return {
                'statusCode': response.status_code,
                'body': 'Request failed'
            }
    
    except Exception as e:
        return {
            'statusCode': 500,
            'body': str(e)
        }

