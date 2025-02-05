#!/bin/bash
sudo apt update
sudo apt install curl -y
echo 'INSTALLING k3s'
export $(grep -v '^#' /home/vagrant/.env | xargs)
sudo sh -c "curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC='--node-ip 192.168.56.110 --flannel-iface eth1 --token $TOKEN' sh -"
sleep 10
sudo sh -c "sudo kubectl create configmap hello-world --from-file /home/vagrant/app1.html"
sleep 10
sudo sh -c "sudo cp /home/vagrant/app1.html /usr/share/nginx/html"
sudo sh -c "sudo kubectl apply -f /home/vagrant/app1.yaml"
sleep 10
sudo sh -c "sudo cp /home/vagrant/app1.html /usr/share/nginx/html"
