# azure-2-tier-web-sample

This repository serves as an example of a typical small two-tier web application, deployed to Azure.  The application code and the terraform (infrastructure as code) to deploy it are all contained within.

## Technology Stack
* Azure App Service
* Azure SQL Server (DTU pricing)
* Terraform
* .NET 6 application (C#)

## Architecture

![architecture diagram](./diagram.png)


## Deployment Requirements
For the purpose of demonstration, you can deploy locally with the `az` CLI utility for authentication to azure, and the `terraform` command  to provision your resources.  Make sure you have Contributor permissions to a new subscription for demonstration purposes.

## Steps to deploy
From the infra/ directory:

```
az login

# Confirm you are using the right subscription with:
az account show

# If not, change with:
az account set --subscription="xxxxxx-xxxx-xxxx-xxxx-xxxxxx"

# FIRST TIME run?
./init_subscription.sh    # sets up remote terraform state
terraform init

# To see the changes this terraform would do (non-destructive):
terraform plan -var-file prod/shared.tfvars

# To both plan and apply, use:
terraform apply -var-file prod/shared.tfvars
```

## Steps to Cleanup
To clean up after yourself, simply:

```
terraform destroy -var-file prod/shared.tfvars
```

## To Pipeline This
To pipeline this, we'll need to create a service principal (or have one provided to us), and use our pipeline tool's secrets manager to securely deploy.

```
# Create Service Principal 
az ad sp create-for-rbac --name az2tiersample
```

### GitHub Actions
Within the GitHub repository where we are going to be deploying from: select settings -> secrets

Add the following secrets:

1. `AZURE_AD_CLIENT_ID` – The service principal ID from above
2. `AZURE_AD_CLIENT_SECRET` – The secret that was created as part of the Azure Service Principal
3. `AZURE_AD_TENANT_ID` – The Azure AD tenant ID to where the service principal was created
4. `AZURE_SUBSCRIPTION_ID` – Subscription ID of where you want to deploy the Terraform

Then follow the steps in github to create the action, or write your own yaml in `.github/workflows/<name of action>.yml`

> **Note**
> There is a sample github action in this repository that you can take and run with. It includes integration with github pull requests.  This requires an additional SECRET to be set, namely `GITHUB_TOKEN`.

## TODO
- [ ] Develop github action deployment 
- [ ] Develop DevOps pipeline deployment

