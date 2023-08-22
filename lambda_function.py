import json
import requests

def lambda_handler(event, context):
    subnet_id = "10.0.240.0/24"
    full_name = "YogeshBhagwat"
    email = "yogeshbhagwat477@gmail.com"

    API endpoint URL
    api_url = "https://ij92qpvpma.execute-api.eu-west-1.amazonaws.com/candidate-email_serverless_lambda_stage/data"
    
    
    Headers for the request
    headers = {'X-Siemens-Auth': 'test'}
    
    Payload data
    payload = {
        "subnet_id": 10.0.240.0/24,
        "name": YogeshBhagwat,
        "email": yogeshbhagwat477@gmail.com
    }
    
    # Convert payload to JSON
    payload_json = json.dumps(payload)
    
    try:
        # Make the POST request
        response = requests.post(api_url, data=payload_json, headers=headers)
        
        # Check the response status
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
