@echo off
REM use 7z.exe to compress files
del .\index.zip
7z a index.zip index.js
aws lambda update-function-code --function-name apiProxyIntegration --zip-file fileb://index.zip