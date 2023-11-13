#!/bin/bash

sudo apt-get update -y

sudo apt-get upgrade -y 

sudo curl -sfL https://get.k3s.io | sh -

sudo chmod 644 /etc/rancher/k3s/k3s.yaml

sudo export KUBECONFIG=/etc/rancher/k3s/k3s.yaml

export KUBECONFIG=/etc/rancher/k3s/k3s.yaml
kubectl get pods --all-namespaces
helm ls --all-namespaces

cat << eof > deployment.yaml
apiVersion: v1
kind: Namespace
metadata:
  name: projeto-fsharp

---
apiVersion: v1
kind: Service
metadata:
  name: projeto-fsharp
  namespace: projeto-fsharp
spec:
  type: NodePort
  ports:
    - port: 8085
      targetPort: 8085
      nodePort: 30085
  selector:
    app: projeto-fsharp

---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: projeto-fsharp
  namespace: projeto-fsharp
spec:
  replicas: 1
  selector:
    matchLabels:
      app: projeto-fsharp
  template:
    metadata:
      labels:
        app: projeto-fsharp
    spec:
      containers:
        - name: projeto-fsharp
          image: ghcr.io/richardneves/datapi-devops-challenge/datapi-devops-challenge:latest
          ports:
            - containerPort: 8085
          resources:
            requests:
              memory: "256Mi"
              cpu: "0.25"
            limits:
              memory: "512Mi"
              cpu: "0.5"
          imagePullPolicy: Always
eof

k3s kubectl apply -f deployment.yaml