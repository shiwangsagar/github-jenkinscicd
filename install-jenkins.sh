#!/bin/bash

# Install kind
curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.20.0/kind-linux-amd64
chmod +x ./kind
sudo mv ./kind /usr/local/bin/kind

# Create a Kubernetes cluster
# kind create cluster --name k8s --config cluster.yaml

curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

docker run --name jenkins -d -p 8080:8080 -u 0  -v /var/run/docker.sock:/var/run/docker.sock -v $(which docker):$(which docker)  brainupgrade/jenkins:2.414.1x3
# kubectl apply -f https://raw.githubusercontent.com/brainupgrade-in/dockerk8s/main/kubernetes/lab/07-statefulset/jenkins/jenkins.yaml