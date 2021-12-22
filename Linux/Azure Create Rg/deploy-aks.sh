#!/bin/bash

# parameters for Azure, edit the below variables if necessary. This can also be parsed through in the Azure Devops varibales view/library.
#$1 # The name of the deployment
#$2 # The name of the resource group
#$3 # Location of the template file
#$4 # The subscription ID
#$5 # Name of the ACR to attach
#$6 # The cluster name(the name displayed in Azure)
#$7 # The service principal appid
#$8 # The service principal secret
#$9 # Extra variables to be added(e.g. Kubernetes version)

# Parameters for the Az CLI
deploymentname=$1
resourcegroup=$2
templatefile=$3
subscription=$4

# parameters for the aks-cluster.json
master_cluster_name=$5
service_principle_appid=$6
service_principle_secret=$7

# deploy the aks cluster
echo 'Creating the AKS Cluster:'
az deployment group create --template-file $templatefile \
    --resource-group $resourcegroup --name $deploymentname --subscription $subscription \
    --parameters master_cluster_name=$master_cluster_name service_principle_appid=$service_principle_appid service_principle_secret=$service_principle_secret $8

# Attach the ACR to the newly created aks cluster
#echo 'Attaching the ACR:'
#az aks update --name $master_cluster_name --subscription $subscription --resource-group $resourcegroup --attach-acr $acrname
