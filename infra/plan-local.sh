terraform fmt # Format files
terraform init
az account show --query id --output tsv # get subscription id
export ARM_SUBSCRIPTION_ID="$(az account show --query id --output tsv)" # set the env
terraform plan