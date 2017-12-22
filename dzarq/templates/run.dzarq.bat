@echo off

aws s3 sync . s3://dzarq/cli

aws cloudformation create-stack^
  --stack-name "dzarq-improvements"^
  --template-url "https://s3-eu-west-1.amazonaws.com/dzarq/cli/dzarq.json"^
  --parameters ParameterKey="ProjectName",ParameterValue="dzarq"^
               ParameterKey="Prefix",ParameterValue="dz"
