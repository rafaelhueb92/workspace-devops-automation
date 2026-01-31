echo "Prepare Terraform Backend"

RESOURCE_GROUP="rg-tfstate"
STORAGE_ACCOUNT="tfstatecurso$RANDOM"
CONTAINER_NAME="tfstate"
LOCATION="eastus"

az group create --name $RESOURCE_GROUP --location $LOCATION

az storage account create \
  --name $STORAGE_ACCOUNT \
  --resource-group $RESOURCE_GROUP \
  --location $LOCATION \
  --sku Standard_LRS \
  --encryption-services blob

az storage container create \
  --name $CONTAINER_NAME \
  --account-name $STORAGE_ACCOUNT \
  --auth-mode login

echo "Create SP for credentials"

echo "==================================================================================="

SUBSCRIPTION=$(az account list --query "[0].id" --output tsv)
az ad sp create-for-rbac --name "mdcgithubactions" --role contributor --scopes /subscriptions/$SUBSCRIPTION --sdk-auth

echo "Copy this json into the secret AZURE_CREDENTIALS of the repo"