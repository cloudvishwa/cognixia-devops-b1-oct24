## Simple example for pods and service using yaml file.
* Attached are the simple yaml files.

* how to run 
```
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
```

* how to check
```
kubectl get pods
kubectl get svc
kubectl describe pod <podname>
```
* note that the pod is exposed on the nodeport on port "30007"

* How to test the website
```
curl $(minikube ip):30007
```

* Clean up 
```
kubectl delete deployment nginx-1
kubectl delete service nginx-service
```