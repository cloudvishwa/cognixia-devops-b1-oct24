#!/bin/bash


kubectl delete deployment python-app
kubectl delete deployment redis-deployment
kubectl delete service redis-service

kubectl delete service web-service