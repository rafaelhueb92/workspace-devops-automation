terraform fmt # Format files
terraform init
export ARM_SUBSCRIPTION_ID="$(az account show --query id --output tsv)" # set the env
terraform plan