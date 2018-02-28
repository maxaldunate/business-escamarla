'use strict';
//console.log('Loading hello world function');
 
exports.handler = function(event, context, callback) {
    let name = "you";
    let city = 'World';
    let time = 'day';
    let day = '';
    let responseCode = 200;
    //console.log("request: " + JSON.stringify(event));
    
    // This is a simple illustration of app-specific logic to return the response. 
    // Although only 'event.queryStringParameters' are used here, other request data, 
    // such as 'event.headers', 'event.pathParameters', 'event.body', 'event.stageVariables', 
    // and 'event.requestContext' can be used to determine what response to return. 
    //
    if (event.queryStringParameters !== null && event.queryStringParameters !== undefined) {
        if (event.queryStringParameters.name !== undefined && 
            event.queryStringParameters.name !== null && 
            event.queryStringParameters.name !== "") {
            //console.log("Received name: " + event.queryStringParameters.name);
            name = event.queryStringParameters.name;
        }
    }
    
    if (event.pathParameters !== null && event.pathParameters !== undefined) {
        if (event.pathParameters.proxy !== undefined && 
            event.pathParameters.proxy !== null && 
            event.pathParameters.proxy !== "") {
            //console.log("Received proxy: " + event.pathParameters.proxy);
            city = event.pathParameters.proxy;
        }
    }
    
    if (event.headers !== null && event.headers !== undefined) {
        if (event.headers['day'] !== undefined && event.headers['day'] !== null && event.headers['day'] !== "") {
            //console.log("Received day: " + event.headers.day);
            day = event.headers.day;
        }
    }
    
    if (event.body !== null && event.body !== undefined) {
        let body = JSON.parse(event.body)
        if (body.time) 
            time = body.time;
    }
 
    let greeting = 'Good ' + time + ', ' + name + ' of ' + city + '. ';
    if (day) greeting += 'Happy ' + day + '!';

    var responseBody = {
        message: greeting,
        input: event
    };
    
    console.log("ok -2");
    // The output from a Lambda proxy integration must be 
    // of the following JSON object. The 'headers' property 
    // is for custom response headers in addition to standard 
    // ones. The 'body' property  must be a JSON string. For 
    // base64-encoded payload, you must also set the 'isBase64Encoded'
    // property to 'true'.
    var response = {
        statusCode: responseCode,
        headers: {
            "x-custom-header" : "my custom header value"
        },
        body: JSON.stringify(responseBody)
    };
    //console.log("response: " + JSON.stringify(response))

    // Load the AWS SDK for Node.js
    var AWS = require('aws-sdk');
    console.log("ok -1");

    // Set the region 
    AWS.config.update({region: 'eu-west-1'});
    console.log("ok 0");

    // Create the DynamoDB service object
    var ddb = new AWS.DynamoDB({apiVersion: '2012-10-08'});
    console.log("ok 1");

    var dbParams = {
      TableName: 'products',
      Item: event.body
    };
    console.log("ok 2");

    // Call DynamoDB to add the item to the table
    ddb.putItem(dbParams, function(err, data) {
        console.log("ok 3");
      if (err) {
        console.log("ok 4");
        console.log("Insert Error");
        callback(err);
      } else {
        //console.log("Insert Success", data);
        callback(null, response);
        console.log("ok 5");
      }
    });

};