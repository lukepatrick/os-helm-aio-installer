#!/bin/bash
#This program cleans up the infrastructure and all delployed apps

source ~/os-helm-aio-installer/os-helm-cleanup.sh

# Remove Dashboard
helm delete --purge dashboard

# Remove Weave
kubectl delete --namespace kube-system -f scope.yaml

# Remove previous Helm deployments (client-side):
rm -rf ~/.helm

# Kill any previous running Helm server services:
pkill -f 'helm serve'

# Remove any previous OSH deployments/folders:
rm -rf ~/openstack-helm

#Remove helm repo from local
helm repo remove local
