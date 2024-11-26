## Task of stage1-7 enhancement 
* Check for failed commands in the cmdline. -- Done 
* Auotmate the authentication for auzre portal for terraform in the pipeline - Done 
* Automate the agent registration in the azure pp -- Done
```
./config.sh --unattended --url https://dev.azure.com/<OrganizationName> --auth pat --token <YourPersonalAccessToken> --pool <AgentPoolName> --agent <AgentName> --acceptTeeEula --work _work
```

* upload the mvn build to artifacts and pull the artifacts in next stage. -- Done
* approval options for another email ID. -- This works on release pipelines. 


* convert the line terraform execution to task based    -- Done 
* convert the line mvn execution to task based          -- Done
* convert the line docker execution to task based       -- module ready in azure
* convert the line docker compose execution to task based -- module ready in azure
* convert the line ansible execution to task based 

## Task in terraform 
* create the subnet name as below format in terraform automatically
"<projname>-<env>-<sub>-<integer starting for 1>"
example -- proj1-sub-1
input: projectname  and env 
