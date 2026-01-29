RESOURCE_GROUP="rg-devops-lab"
REGISTRY_NAME="devopsautomationid$(uuidgen | tr '[:upper:]' '[:lower:]' | cut -d'-' -f1)" # Generate a random uuid to not have the same
LOCATION="eastus"

echo "Creating resource group"

az group create --name $RESOURCE_GROUP --location $LOCATION

echo "Creating ACR $REGISTRY_NAME"
az acr create --resource-group $RESOURCE_GROUP --name $REGISTRY_NAME --admin-enabled false --sku Standard

SUBSCRIPTION=$(az account list --query "[0].id" --output tsv)
az ad sp create-for-rbac --name "mdcgithubactions" --role contributor --scopes /subscriptions/$SUBSCRIPTION --sdk-auth > sp_github.json