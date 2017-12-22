@echo off

aws cloudformation create-stack^
  --stack-name "dzarq-improvements" --template-body file://dzarq.json^
  --parameters ParameterKey="ProjectName",ParameterValue="dzarq"^
               ParameterKey="Prefix",ParameterValue="dz"^
			   ParameterKey="VpcCdir",ParameterValue="10.0.0.0/16"^
               ParameterKey="SubnetCidrA",ParameterValue="10.0.0.0/24"^
			   ParameterKey="SubnetCidrB",ParameterValue="10.0.1.0/24"^
			   ParameterKey="SubnetCidrC",ParameterValue="10.0.2.0/24"


REM aws cloudformation update-stack 
REM    --stack-name "dzarq-improvements" 
REM    --template-url "https://s3-eu-west-1.amazonaws.com/dzarq/cli/dzarq.json"
