## 
```
kubectl run nginx-pod --image=nginx --restart=Never
kubectl get pods
kubectl describe pod nginx-pod

kubectl expose pod nginx-pod --type=ClusterIP --port=8080 --target-port=80
kubectl get svc

kubectl delete service nginx-pod
kubectl get svc
kubectl expose pod nginx-pod --type=NodePort --port=8080 --target-port=80
kubectl get svc
curl 192.168.49.2:30321