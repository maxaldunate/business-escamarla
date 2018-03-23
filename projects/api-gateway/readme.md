# API Gateway Labs

### Pricing Model & Examples

[My Summary](proxy-integration/pricing.md)


### Build an API Gateway API with Lambda Proxy Integration  

https://docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-create-api-as-simple-proxy-for-lambda.html)


* API Url  
  https://xxxxxxxx.execute-api.eu-west-1.amazonaws.com/production

* POST call  
```bash
	curl -v -X POST \
	  'https://xxxxxxxx.execute-api.us-west-1.amazonaws.com/production/Tucuman?time=nochecita' \
	  -H 'content-type: application/json' \
	  -H 'day: ElJueves' \
	  -H 'x-amz-docs-region: us-west-1' \
	  -H 'maxito-content: probemos' \
	  -d '{
	        "callerByName": "MaxAldunate"
	      }'
```

  * POST Response  
  ![](proxy-integration/post-response.json)

* GET call  
```bash
		curl -X GET \
		  'https://xxxxxxxx.execute-api.us-west-1.amazonaws.com/production/Tucuman?time=tardecita' \
		  -H 'content-type: application/json' \
		  -H 'day: Miercoles' \
		  -H 'x-amz-docs-region: us-west-1'
```

  * GET Response  
  ![](proxy-integration/get-response.json)


  