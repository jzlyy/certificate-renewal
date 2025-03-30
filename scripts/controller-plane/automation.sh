#! /bin/bash

######Automation of control plane certificate renewal######

#Renew all certificates
sudo kubeadm certs check-expiration
sudo kubeadm certs renew all

#Triggered updates
sudo mv /etc/kubernetes/manifests/{etcd.yaml,kube-*} /tmp
sudo sleep 30
sudo mv /tmp/{etcd.yaml,kube-*} /etc/kubernetes/manifests

#Generate a new Admin user
sudo mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

#Restart the kubelet service
sudo systemctl restart kubelet

