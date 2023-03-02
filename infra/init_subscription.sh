# Create Resource Group
az group create -n terraform-states -l canadacentral

# Create Storage Account
az storage account create -n az2tiersampletfstate001 -g terraform-states -l canadacentral --sku Standard_LRS

# Create Storage Account Container
az storage container create -n tfstatedevops --public-access off --account-name az2tiersampletfstate001
