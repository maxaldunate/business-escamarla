'use strict';
var AWS = require('aws-sdk');

exports.handler = function(event, context, callback) {

    let bodyParsed = "no body";
    try {
        bodyParsed = JSON.parse(event.body);        
    } catch (e) {
        console.log("ERROR PARSER: ", e);
        var resp = {
            statusCode: 400,
            body: JSON.stringify({error:"error parsing your request", message:e.message})
        };
        callback(null, resp);
        return;
    }

    var response = {
        statusCode: 200,
        body: JSON.stringify({id: event.requestContext.requestId})
    };
    callback(null, response);
    
    AWS.config.update({region: 'eu-west-1'});
    var ddb = new AWS.DynamoDB.DocumentClient({apiVersion: '2012-10-08'});

    let body = "no body";
    if (event.body !== null && event.body !== undefined) {
        body = bodyParsed
    }
    body.requestId = event.requestContext.requestId;
    var params = {
      TableName: 'products',
      Item: body
    };

    ddb.put(params, function(err, data) {
      if (err) {
        console.log("Error", err);
      } else {
        console.log("Success", data);
      }
    });
};