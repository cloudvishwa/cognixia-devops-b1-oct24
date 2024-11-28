## how to build and push the docker image using azure pipeline 

* Create ACR 
* Enable admin via the accesskeys
* login to acr from your vm , 
``` 
docker login <login sever>
username
password
```
* create the docker tag for this new repo
``` 
docker tag old iamge;v1 to vishwa28nov24.azurecr.io/pythonapp:v1
```
Then do docker push

* then create the azure pipeline