

# How to deploy aks resource:

#    Green field deployment
1. Open bash and login to Azure
    <!-- az login -->
2. Create a resource group in Azure
    <!-- az group create --name <resourcegroupname> --location <locationname> -->
3. Create a service principal within the RG for aks
    <!-- az ad sp create-for-rbac --skip-assignment --name <newServicePrincipalname> -->
4. Assign contributor role to the Service Principal
    <!-- az role assignment create --assignee <ServicePrincipalAppId> --role Contributor --subscription <SubscriptionId> -->
5. Edit all necessary variables/parameters in the "deploy-aks.sh" script
6. Run the shell script "deploy-aks.sh"
7. After deploying the aks cluster attach the ACR(azure container registries) to the aks
   az aks update -n <myAKSCluster> -g <myResourceGroup> --attach-acr <acr-name>

#    Redeploy aks cluster
1. Destroy the AKS cluster in the Azure Portal
2. Open bash and login to Azure
    <!-- az login -->
3. Run the shell script "deploy-aks.sh"

#    Rotate the Service Principal Credentials
1. Open bash and login to Azure
    <!-- az login -->
2. Run the following command
    <!-- az ad sp credential reset --name <APP_ID> -->