#!/bin/bash

function _create_cluster () {
    kind create cluster \
        --config ./k8s/kind/config.yaml  \
        --name api-devops-challenge
    
    _apply_manifests
    _clean
}

function _clean () {
    rm -f get-docker.sh
}

function _apply_manifests () {
    export KUBECONFIG=$HOME/.kube/config
    kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.13.11/config/manifests/metallb-native.yaml
    sleep 60
    kubectl apply -f ./k8s/metallb/metallb.yaml
    kubectl apply -f ./k8s/metrics-server/components.yaml
    sleep 10
    kubectl apply -f ./k8s/deployment/deployment.yaml
    kubectl apply -f ./k8s/service/service.yaml
    kubectl apply -f ./k8s/ingress/deploy.yaml
    sleep 360
    echo -e "\n---> Caso oocorra problema ao aplicar o ingress, aguarde mais alguns minutos e tente rodar executar novamente de forma mannual: \n"
    echo -e "Command:kubectl apply -f ./k8s/ingress/ingress.yaml"
    echo -e "\nAplicando ingress:\n"
    kubectl apply -f ./k8s/ingress/ingress.yaml
}

#Create Clustes and apply manifests
[ ! -z "`kind version`" ] && _create_cluster
