@echo off

aws cloudformation create-stack^
  --stack-name "dz-impro-servers"^
  --template-body file://servers.json^
  --parameters ParameterKey="ProjectName",ParameterValue="dzarq"^
               ParameterKey="Prefix",ParameterValue="dz"^
			   ParameterKey="AZone",ParameterValue="eu-west-1a"^
			   ParameterKey="VpcId",ParameterValue="vpc-203fdb46"^
			   ParameterKey="KeyName",ParameterValue="kp-wordpress-instance"
			   