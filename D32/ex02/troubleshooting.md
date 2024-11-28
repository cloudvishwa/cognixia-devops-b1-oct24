## Application DB connection issues

* Login to DB , check the ping to the port 
```
redis-cli -h <localhost> -p 6379 ping
```
If this is successfull, then go next, if not redeploy the redis.

* Check labels between service.yaml and deployment.yaml, for both pods labels.
```
  template:
    metadata:
      labels:
        app: nginx-pod
```
```
spec:
  type: NodePort
  selector:
    app: nginx-pod
```
*  Check port expose for python containers
* On Python pod , login and run below to check if python pod is able to connect to the redis 
```
apt-get update && apt-get install -y redis-tools
redis-cli -h redis-service -p 6379 ping
```