## ITSM 

## Terraform 
* 

## Jenkins 
* similarly for jenkins 
* download the agent.jar 
```
curl -O http://<JENKINS_URL>/jnlpJars/agent.jar
curl -O http://<JENKINS_URL>/jnlpJars/jenkins-cli.jar

```
* manage and call secret text 
* create "my-credential-id" as "Secret Text" in global credentials
```
pipeline {
    agent any
    environment {
        MY_SECRET = credentials('my-credential-id')
    }
    stages {
        stage('Example') {
            steps {
                sh 'echo $MY_SECRET'
            }
        }
    }
}
```

* how to add node using cli on jenkins 
```
java -jar agent.jar -jnlpUrl <JENKINS_URL>/computer/<NODE_NAME>/jenkins-agent.jnlp -secret <SECRET> -workDir "<WORK_DIR>"
```

## Network 
*  to chk what ports are opened
```
netstat -tulpn
```

## Linux 
* to check the top size of folder and file 
```
du -ah /path/of/folder | sort -hr | head -n 20
```
* to check if the previous command failed 
```
    if [ $? -ne 0 ]; then
      echo "##vso[task.logissue type=error]Command failed. Failing the job."
      exit 1
    fi
```

## Az-Pipeline 


## ANsible 
* variables can be stored, in multiple places
    * inventory
    * 
* to manage secerts in ansible, use ansible vault.
* Create an encrypted file:
```
ansible-vault encrypt group_vars/all/vault.yml

```
