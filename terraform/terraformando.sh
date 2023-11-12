#!/bin/bash

sudo apt-get update -y

sudo apt-get upgrade -y 

sudo curl -sfL https://get.k3s.io | sh -

sudo chmod 644 /etc/rancher/k3s/k3s.yaml

sudo export KUBECONFIG=/etc/rancher/k3s/k3s.yaml