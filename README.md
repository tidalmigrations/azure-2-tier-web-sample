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

## TODO
- [] Develop github action deployment 
- [] Develop DevOps pipeline deployment

