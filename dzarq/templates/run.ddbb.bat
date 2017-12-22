@echo off

aws cloudformation create-stack^
  --stack-name "dzarq-improvements-servers"^
  --template-body file://ddbb.json^
  --parameters ParameterKey="ProjectName",ParameterValue="dzarq"^
               ParameterKey="Prefix",ParameterValue="dz"^
			   ParameterKey="DBName",ParameterValue="" ^
			   