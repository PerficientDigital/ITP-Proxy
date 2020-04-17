#!/bin/bash
eval $(minikube docker-env)
kubectl delete -n default deployment itp-proxy-deployment
docker build -t itp-proxy .
kubectl apply -f proxy-deployment.yml
kubectl expose deployment itp-proxy-deployment --target-port=80 --type=NodePort
echo "Service URL:"
minikube service itp-proxy-deployment --url