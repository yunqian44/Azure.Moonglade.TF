# Azure.Moonglade.TF

## Description

Provision [Web App](https://docs.azure.cn/zh-cn/articles/azure-operations-guide/app-service-web/),
[Storage Account](https://docs.microsoft.com/zh-cn/azure/storage/common/storage-account-overview),
[CDN](https://docs.microsoft.com/zh-cn/azure/cdn/)
[Sql Server](https://docs.microsoft.com/zh-cn/azure/azure-sql/)
[Sql DataBase](https://docs.microsoft.com/zh-cn/azure/azure-sql/database/)

This example provides recommended settings:

- Web App Deployment
- Storage Account
- CDN
- Sql Server
- Sql DataBase
- Resource Group

## 📦 Deployment

It is recommended to use stable code from [Release](https://github.com/EdiWang/Moonglade/releases) rather than master branch.

Docker Images from ediwang/moonglade of Docker Hub

### ☁ Use Terraform Full Deploy on Azure (Recommend)


## Code directory structure description

+ ### src
    + import: There had some already existing resources via manual creation when initially create resources via terraform . You need to mark these resource and use terraform import to include them in codes.
    + model:  Provision and asseblme the actual infrastructure from Terraform projects
    + module: Following best practices for Terraform template authoring, create a template deploying infrastructure components into Azure. You can custom some minimum size common components(also call as module) in this folder. In this project most of common modules from microsoft official module templates.   

## Get started with Terraform Cloud

1. download and install the [Terraform CLI] 

    `choco install terraform` 
     
     or

    reference linking: https://www.terraform.io/downloads.html
    
1. create a service principal in Azure and add the following keys to the workspace's environment variables
    - ARM_CLIENT_ID
    - ARM_CLIENT_SECRET SENSITIVE
    - ARM_TENANT_ID
    - ARM_SUBSCRIPTION_ID

3. setings service principal Environment Variables on Windows System PC

    `setx ARM_SUBSCRIPTION_ID xxxx-xxxx-xxxx-xxxx`

    `setx ARM_CLIENT_ID xxxx-xxxx-xxxx-xxxx`    

    `setx ARM_CLIENT_SECRET xxxx-xxxx-xxxx-xxxx`

    `setx ARM_TENANT_ID xxxx-xxxx-xxxx-xxxx`

4.  plan, deploy, and destroy

    step into the working directory

    `cd scr/model/model`

    `terraform plan`

    `terraform apply` or 'terraform apply -auto-approve'

    `terraform destroy`


## Use this doc and get your Terraform on!

- https://www.terraform.io/docs/providers/azurerm/