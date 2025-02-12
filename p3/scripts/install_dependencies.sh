#!/bin/sh

sudo apt update
sudo apt install -y wget curl

# Docker installation
sudo apt install -y docker.io
sudo usermod -aG docker $USER

# kubectl installation
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

# k3d intallation
wget -q -O - https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash

## Creating the k3d cluster
sudo k3d cluster create mycluster --port "30001:30001@server:0"

# ArgoCD installation
sudo kubectl create namespace argocd
sudo kubectl create namespace dev
sudo kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
