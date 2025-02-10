#!/bin/bash
sudo apt update
sudo apt install curl -y
echo 'INSTALLING k3s'
sudo sh -c "curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC='--node-ip 192.168.56.110 --flannel-iface eth1 --token mycoolandepictoken' sh -"
sudo kubectl create -f /home/vagrant/app1-deploy.yaml
sudo kubectl apply -f /home/vagrant/app1-service.yaml
sudo kubectl create -f /home/vagrant/app2-deploy.yaml
sudo kubectl apply -f /home/vagrant/app2-service.yaml
sudo kubectl create -f /home/vagrant/app3-deploy.yaml
sudo kubectl apply -f /home/vagrant/app3-service.yaml
sudo kubectl apply -f /home/vagrant/ingress.yaml
