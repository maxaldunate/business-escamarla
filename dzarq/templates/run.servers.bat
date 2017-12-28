@echo off

aws cloudformation update-stack^
  --stack-name "dz-servers"^
  --template-body file://servers.json^
  --parameters ParameterKey="ProjectName",ParameterValue="dzarq"^
               ParameterKey="Prefix",ParameterValue="dz"^
			   ParameterKey="AZone",ParameterValue="eu-west-1a"^
			   ParameterKey="SubnetId",ParameterValue="subnet-86c68edd"^
			   ParameterKey="VpcId",ParameterValue="vpc-e34baa85"^
			   ParameterKey="WebServerSecurityGroup",ParameterValue="sg-5a6f4021"^
			   ParameterKey="KeyName",ParameterValue="kp-wordpress-instance"
