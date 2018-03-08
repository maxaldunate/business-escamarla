'use strict';

exports.handler = function(event, context, callback) {

    var subs = [
        {
            Id:1,
            Description:"Basic"
        },
        {
            Id:2,
            Description:"Professional"
        },
        {
            Id:3,
            Description:"Enterprise"
        }
        
    ];

    var response = {
        statusCode: 200,
        body: subs
    };
    callback(null, response);

};