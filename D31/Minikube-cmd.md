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

kubectl create deployment nginx-nov24 --image=nginx
kubectl get pods
kubectl get deployment
kubectl describe pod nginx-nov24-7d78d97dff-mwc68
kubectl delete pod nginx-nov24-7d78d97dff-mwc68
[azureuser@lab-vm1 ~]$ kubectl get pods
NAME                           READY   STATUS    RESTARTS      AGE
nginx-nov24-7d78d97dff-fszf6   1/1     Running   0             3s