@echo off
REM use 7z.exe to compress files
del .\apiProxyIntegration.zip
7z a apiProxyIntegration.zip apiProxyIntegration.js
aws lambda update-function-code --function-name apiProxyIntegration --zip-file fileb://apiProxyIntegration.zip