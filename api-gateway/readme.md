# API Gateway Labs

### Build an API Gateway API with Lambda Proxy Integration
[Link](https://docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-create-api-as-simple-proxy-for-lambda.html)

* API Url  
  https://xxxxxxxx.execute-api.eu-west-1.amazonaws.com/production

* POST
```
	curl -v -X POST \
	  'https://r275xc9bmd.execute-api.us-west-2.amazonaws.com/test/Seattle?time=evening' \
	  -H 'content-type: application/json' \
	  -H 'day: Thursday' \
	  -H 'x-amz-docs-region: us-west-2' \
	  -d '{
		"callerName": "John"
	}'
```



