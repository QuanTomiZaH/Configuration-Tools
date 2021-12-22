#!/bin/bash

#$1 # The name of the customer
#$2 # The name of the environment
#$3 # The prefix of the deployment to use
#$4 # The azure location to deploy to
#$5 # The azure subscription to deploy to

customer=$1
environment=$2
deploymentprefix=$3
azlocation=$4
subscription=$5

az group create --subscription $subscription --location westeurope --name $deploymentprefix-$customer-$environment \
--tags Customer=$customer Stack=$environment