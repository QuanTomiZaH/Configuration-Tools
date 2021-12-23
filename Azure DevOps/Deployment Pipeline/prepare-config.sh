#!/bin/bash
# $1 - customer
# $2 - environment
# $3 - resource_prefix
# $4 - the agent build path
CUSTOMER="$1" # The customer name - this is manually added in the deployment yaml
ENVIRONMENT="$2" # The environment to deploy - this is manually added in the deployment yaml
RESOURCE_PREFIX="$3" # The prefix used for this deployment. Multiple resources created and named based off this prefix
AGENT_BUILDPATH="$4" # The path of the Agent where the documents will be, this has to be specified because we checkout multiple repositories

# Set naming for Azure Commands
AZURE_RESOURCE_GROUP="$RESOURCE_PREFIX-$CUSTOMER-$ENVIRONMENT"
AZURE_STORAGE_ACCOUNT="$RESOURCE_PREFIX$CUSTOMER$ENVIRONMENT"

# The following commands generate a Helm values file to overwrite the defaults defined in ./<path>.yaml
AZURE_STORAGE_KEY=$(az storage account keys list -n ${AZURE_STORAGE_ACCOUNT} --query [0].value --output tsv)
AZURE_PUBLIC_IP_RESOURCE="$RESOURCE_PREFIX-$CUSTOMER-$ENVIRONMENT-public-ip"
AZURE_PUBLIC_IP=$(az network public-ip show -n ${AZURE_PUBLIC_IP_RESOURCE} -g ${AZURE_RESOURCE_GROUP} --query ipAddress -o tsv)
RESOURCE_GROUP_ID=$(az group show --name "$RESOURCE_PREFIX-$CUSTOMER-$ENVIRONMENT" | jq -r '.id')

## Create the environment-values.yaml to be used by helm for configuring the customer environment.
echo "azure_storage_account_key: \"${AZURE_STORAGE_KEY}\"" >> $AGENT_BUILDPATH/<path>.yaml
echo "resource_group_id: \"$RESOURCE_GROUP_ID\"" >> $AGENT_BUILDPATH/<path>.yaml

echo "ingress-nginx:" >> $AGENT_BUILDPATH/<path>.yaml
echo "  controller:" >> $AGENT_BUILDPATH/<path>.yaml
echo "    service:" >> $AGENT_BUILDPATH/<path>.yaml
echo "      loadBalancerIP: $AZURE_PUBLIC_IP" >> $AGENT_BUILDPATH/<path>.yaml