@echo off

aws cloudformation create-stack^
  --stack-name "dz-servers"^
  --template-body file://servers.json^
  --parameters ParameterKey="ProjectName",ParameterValue="dzarq"^
               ParameterKey="Prefix",ParameterValue="dz"^
			   ParameterKey="AZone",ParameterValue="eu-west-1a"^
			   ParameterKey="VpcId",ParameterValue="vpc-acd233ca"^
			   ParameterKey="WebServerSecurityGroup",ParameterValue="sg-89b09df2"^
			   ParameterKey="KeyName",ParameterValue="kp-wordpress-instance"
