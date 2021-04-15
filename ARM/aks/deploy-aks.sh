#!/bin/bash

# parameters for Azure, edit the below variables if necessary
deploymentname="" # The name of the deployment
resourcegroup="" # The name of the resource group
templatefile="./template.json" # Location of the template file
subscription="" # The subscription where the resourcegroup is located in
acrname="" # Name of the ACR to attach

# parameters for the template.json, edit the below parameters if necessary
master_cluster_name="chdev-master-cluster" # The cluster name(the name displayed in Azure)
service_principle_appid="" # The service principal appid
service_principle_secret="" # The service principal secret

# deploy the aks cluster
az deployment group create --template-file $templatefile \
    --resource-group $resourcegroup --name $deploymentname --subscription $subscription \
    --parameters master_cluster_name=$master_cluster_name service_principle_appid=$service_principle_appid service_principle_secret=$service_principle_secret

# Attach the ACR to the newly created aks cluster
az aks update --name $master_cluster_name --subscription $subscription --resource-group $resourcegroup --attach-acr $acrname
