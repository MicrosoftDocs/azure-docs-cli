---
title: Azure CLI references for Azure hosted apps | Microsoft Docs
description: Find Azure CLI core and extension reference commands to manage Azure hosted apps.  Follow links to popular articles to learn how to use the Azure CLI for Azure hoted apps.
author: dbradish-microsoft
manager: barbkess
ms.devlang: azurecli
ms.topic: reference
ms.date: 09/21/2021
ms.author: dbradish
ms.service: azure-cli
ms.reviewer: robb
ms.custom: devx-track-azurecli, seo-azure-cli
keywords: azure cli references, azure hosted apps, azure web apps, Azure static web app, azure app service
---

# Azure CLI reference commands for Azure hosted apps

The Azure Command-Line Interface ([CLI](./what-is-azure-cli.md)) is a set of commands you use to create and manage Azure resources. It's available across many Azure services and gives you the ability to manage hosted apps from a command-line.

The Azure CLI commands for [Azure App Service](/azure/app-service) are composed of two parts: **core** and **extension**. Core Azure CLI commands ship as part of the CLI and are fully supported. An extension gives you access to experimental and pre-release commands. For more information about extension references, see [Use extensions with Azure CLI](./azure-cli-extensions-overview.md).  

Access to the following `az webapp` references requires the [webapp](https://github.com/Azure/azure-cli-extensions/tree/main/src/webapp) extension: `az webapp container`, `az webapp remote-connection`, and `az webapp scan`. Access to the `az functionapp app` reference requires the [deploy-to-azure](https://github.com/Azure/deploy-to-azure-cli-extension) extension.

> [!NOTE]
> You're prompted to install an extension reference on first use. Or, you can use the [az extension add](/cli/azure/extension#az_extension_add) command to manually install an extension by name.

See [Azure Web Apps](/cli/azure/service-page/azure%20web%20apps) for an alphabetic list of Azure CLI core and extension references available for the Azure Web App service. For references in each subgroup, see the tables in the following sections:

- [Azure Static Web Apps](#azure-static-web-app-references)
- [Azure Web App configuration](#azure-web-app-configuration-references)
- [Azure Web App deployment](#azure-web-app-deployment-references)
- [Azure Web App WebJobs](#azure-web-app-webjob-references)
- [Additional Azure Web App references](#additional-azure-web-app-references)

For other hosted app references, see the following sections:

- [Azure App Service plans](#azure-app-service-plan-references)
- [Azure function apps](#azure-function-app-references)

## Azure Static Web App references

| Reference | Description | More information |
|-|-|-|
| [az staticwebapp](/cli/azure/staticwebapp) | Manage static web apps. | [Quickstart: Building your first static site using the Azure CLI](/azure/static-web-apps/get-started-cli) |
| [az staticwebapp appsettings](/cli/azure/staticwebapp/appsettings) | Manage the function app settings of a static web app. | [Add an API to Azure Static Web Apps with Azure Functions](/azure/static-web-apps/add-api) |
| [az staticwebapp environment](/cli/azure/staticwebapp/environment) | Manage the environment of a static web app. | [Add an API to Azure Static Web Apps with Azure Functions](/azure/static-web-apps/add-api) |
| [az staticwebapp hostname](/cli/azure/staticwebapp/hostname) | Manage custom hostnames of functions of a static web app. | [Add an API to Azure Static Web Apps with Azure Functions](/azure/static-web-apps/add-api) |
| [az staticwebapp users](/cli/azure/staticwebapp/users) | Manage users of a static web app. | [Accessing user information in Azure Static Web Apps](/azure/static-web-apps/user-information) |

## Azure Web App configuration references

| Reference | Description | More information |
|-|-|-|
| [az webapp config](/cli/azure/webapp/config) | Configure web apps. | [Configure an App Service app](/azure/app-service/configure-common) |
| [az webapp config access-restriction](/cli/azure/webapp/config/access-restriction) | Manage access restrictions on a web app. | [Integrate App Service with Application Gateway using CLI](/azure/app-service/scripts/cli-integrate-app-service-with-application-gateway) |
| [az webapp config appsettings](/cli/azure/webapp/config/appsettings) | Configure web app settings. Updating or removing application settings causes an app recycle. | [Configure an App Service app](/azure/app-service/configure-common) |
| [az webapp config backup](/cli/azure/webapp/config/backup) | Manage backups for a web app. | [Back up an app using CLI](/azure/app-service/scripts/cli-backup-onetime) |
| [az webapp config connection-string](/cli/azure/webapp/config/connection-string) | Manage the connection strings for a web app. | [Configure connection string](/azure/app-service/tutorial-dotnetcore-sqldb-app#configure-connection-string) |
| [az webapp config container](/cli/azure/webapp/config/container) | Manage container settings for a web app. | [Migrate custom software to Azure App Service using a custom container](/azure/app-service/tutorial-custom-container) |
| [az webapp config hostname](/cli/azure/webapp/config/hostname) | Configure hostnames for a web app. | [Configuring a custom domain name](/azure/developer/javascript/how-to/with-azure-cli/configure-app-service-custom-domain-name) |
| [az webapp config snapshot](/cli/azure/webapp/config/snapshot) | Manage snapshots for a web app. | [Restore an app in Azure from a snapshot](/azure/app-service/app-service-web-restore-snapshots) |
| [az webapp config ssl](/cli/azure/webapp/config/ssl) | Configure SSL certificates for a web app. | [Bind a custom TLS/SSL certificate to an App Service app using CLI](/azure/app-service/scripts/cli-configure-ssl-certificate) |
| [az webapp config storage-account](/cli/azure/webapp/config/storage-account) | Manage a web app's Azure storage account configurations. Applies only to Linux and Windows Containers web apps). | [Mount a file share to a Python function app using Azure CLI](/azure/azure-functions/scripts/functions-cli-mount-files-storage-linux) |

## Azure Web App deployment references

| Reference | Description | More information |
|-|-|-|
| [az webapp deployment](/cli/azure/webapp/deployment) | Manage web app deployments. |[Deploy an Azure Web App](/azure/devops/pipelines/targets/webapp)  |
| [az webapp deployment container](/cli/azure/webapp/deployment/container) | Manage container-based continuous deployment. | [Continuous deployment with custom containers in Azure App Service](/azure/app-service/deploy-ci-cd-custom-container) |
| [az webapp deployment slot](/cli/azure/webapp/deployment/slot) | Manage web app deployment slots. | [Create an App Service app and deploy code to a staging environment using Azure CLI](/azure/app-service/scripts/cli-deploy-staging-environment) |
| [az webapp deployment source](/cli/azure/webapp/deployment/source) | Manage web app deployment via source control. | [Secure access to application data](/azure/storage/blobs/storage-secure-access-application?tabs=azure-cli) |
| [az webapp deployment user](/cli/azure/webapp/deployment/user) | Manage user credentials for deployment. | [Configure the local Git deployment](/azure/key-vault/general/tutorial-net-create-vault-azure-web-app#configure-the-local-git-deployment) |

## Azure Web App WebJob references

| Reference | Description | More information |
|-|-|-|
| [az webapp webjob](/cli/azure/webapp/webjob) | Manage WebJobs on a web app. | [Run background tasks with WebJobs in Azure App Service](/azure/app-service/webjobs-create) |
| [az webapp webjob continuous](/cli/azure/webapp/webjob/continuous) | Manage continuous WebJobs on a web app. | [Run background tasks with WebJobs in Azure App Service](/azure/app-service/webjobs-create) |
| [az webapp webjob triggered](/cli/azure/webapp/webjob/triggered) | Manage triggered WebJobs on a web app. | [Run background tasks with WebJobs in Azure App Service](/azure/app-service/webjobs-create) |

## Additional Azure Web App references

| Reference | Description | Extension? | More information |
|-|-|-|-|
| [az webapp](/cli/azure/webapp) | Manage web apps. | | [Provision and deploy a web app](/azure/developer/python/azure-sdk-example-web-app) |
| [az webapp auth](/cli/azure/webapp/auth) | Manage authentication and authorization for a web app. | | [Authentication and authorization in Azure App Service](/azure/app-service/overview-authentication-authorization) |
| [az webapp container](/cli/azure/webapp/container) | Manage container operations for a web app. | Yes | [Deploy to Azure Web App for Containers](/azure/devops/pipelines/apps/cd/deploy-docker-webapp) |
| [az webapp cors](/cli/azure/webapp/cors) | Manage Cross-Origin Resource Sharing (CORS). | | [Host a RESTful API with CORS in Azure App Service](/azure/app-service/app-service-web-tutorial-rest-api) |
| [az webapp deleted](/cli/azure/webapp/deleted) | Manage deleted web apps. | | [Restore deleted App Service app](/azure/app-service/app-service-undelete) |
| [az webapp hybrid-connection](/cli/azure/webapp/hybrid-connection) | Manage Hybrid Connections for a web app. | | [Azure App Service Hybrid Connections](/azure/app-service/app-service-hybrid-connections) |
| [az webapp log](/cli/azure/webapp/log) | Manage logs for a web app. | | [Build an ASP.NET Core and Azure SQL Database app in Azure App Service](/azure/app-service/tutorial-dotnetcore-sqldb-app) |
| [az webapp log deployment](/cli/azure/webapp/log/deployment) | Manage deployment logs for a web app. | | [Build an ASP.NET Core and Azure SQL Database app in Azure App Service](/azure/app-service/tutorial-dotnetcore-sqldb-app) |
| [az webapp identity](/cli/azure/webapp/identity) | Manage managed service identities for a web app. | | [How to use managed identities for App Service and Azure Functions](/azure/app-service/overview-managed-identity) |
| [az webapp remote-connection](/cli/azure/webapp/remote-connection) | Create a remote connection by using a TCP tunnel to a web app. | Yes | [Open an SSH session to a Linux container in Azure App Service](/azure/app-service/configure-linux-open-ssh-session) |
| [az webapp scan](/cli/azure/webapp/scan) | Manage the scans for a web app. Currently available only for Linux-based web apps. | Yes | [Scan your machines](/azure/security-center/deploy-vulnerability-assessment-vm) |
| [az webapp traffic-routing](/cli/azure/webapp/traffic-routing) | Manage traffic routing for web apps. | | [Control Azure App Service traffic with Azure Traffic Manager](/azure/app-service/web-sites-traffic-manager) |
| [az webapp vnet-integration](/cli/azure/webapp/vnet-integration) | Manage the virtual network integrations for a web app. | | [Integrate your app with an Azure virtual network](/azure/app-service/web-sites-integrate-with-vnet) |

## Azure App Service plan references

See [az appservice](/cli/azure/appservice) for a complete list of the references available to manage [Azure App Service plans](/azure/app-service/overview-hosting-plans).

| Reference | Description | More information |
|-|-|-|
| [az appservice](/cli/azure/appservice) | Manage App Service plans. | [Introduction to the App Service Environments](/azure/app-service/environment/intro) |
| [az appservice ase](/cli/azure/appservice/ase) | Manage App Service Environments v2. | [Introduction to the App Service Environments](/azure/app-service/environment/intro) |
| [az appservice domain](/cli/azure/appservice/domain) | Manage custom domains. | [Map an existing custom DNS name to Azure App Service](/azure/app-service/app-service-web-tutorial-custom-domain) |
| [az appservice hybrid-connection](/cli/azure/appservice/hybrid-connection) | Set the key that apps use to connect to hybrid-connections in an App Service plan. | [Azure App Service Hybrid Connections](/azure/app-service/app-service-hybrid-connections) |
| [az appservice plan](/cli/azure/appservice/plan) | Manage App Service plans. | [Manage an App Service plan in Azure](/azure/app-service/app-service-plan-manage) |
| [az appservice vnet-integration](/cli/azure/appservice/vnet-integration) | List the virtual network integrations that an appservice plan uses. | [Integrate your app with an Azure virtual network](/azure/app-service/web-sites-integrate-with-vnet) |

## Azure function app references

See [az functionapp](/cli/azure/functionapp) for a complete list of the references available to manage [Azure function apps](/azure/app-service/overview-hosting-plans).

| Reference | Description | Extension? | More information |
|-|-|-|-|
| [az functionapp](/cli/azure/functionapp) | Manage function apps. | | [Manage your function app](/azure/azure-functions/functions-how-to-use-azure-function-app-settings?tabs=azurecli) |
| [az functionapp app](/cli/azure/functionapp/app) | Manage Azure Functions app. | Yes | [Manage your function app](/azure/azure-functions/functions-how-to-use-azure-function-app-settings?tabs=azurecli) |
| [az functionapp config](/cli/azure/functionapp/config) | Configure a function app. | | [Manage your function app](/azure/azure-functions/functions-how-to-use-azure-function-app-settings?tabs=azurecli) |
| [az functionapp config access-restriction](/cli/azure/functionapp/config/access-restriction) | Manage access restrictions on a function app. | | [Set up Azure App Service access restrictions](/azure/app-service/app-service-ip-restrictions) |
| [az functionapp config appsettings](/cli/azure/functionapp/config/appsettings) | Manage function app settings. | | [Manage your function app](/azure/azure-functions/functions-how-to-use-azure-function-app-settings?tabs=azurecli) |
| [az functionapp config container](/cli/azure/functionapp/config/container) | Manage function app container settings. | | [Create your first function on Azure Arc using a custom container](/azure/azure-functions/create-first-function-arc-custom-container) |
| [az functionapp config hostname](/cli/azure/functionapp/config/hostname) | Configure hostnames for a function app. | | [Azure Functions networking options](/azure/azure-functions/functions-networking-options) |
| [az functionapp config ssl](/cli/azure/functionapp/config/ssl) | Configure SSL certificates for a function app. | | [Add a TLS/SSL certificate in Azure App Service](/azure/app-service/configure-ssl-certificate) |
| [az functionapp cors](/cli/azure/functionapp/cors) | Manage Cross-Origin Resource Sharing (CORS) for a function app. | | [Manage your function app](/azure/azure-functions/functions-how-to-use-azure-function-app-settings?tabs=azurecli) |
| [az functionapp deployment](/cli/azure/functionapp/deployment) | Manage function app deployments. | | [Deployment technologies in Azure Functions](/azure/azure-functions/functions-deployment-technologies) |
| [az functionapp deployment container](/cli/azure/functionapp/deployment/container) | Manage container-based continuous deployment. | | [Create a function on Linux using a custom container](/azure/azure-functions/functions-create-function-linux-custom-image?tabs=bash%2Cazurecli) |
| [az functionapp deployment slot](/cli/azure/functionapp/deployment/slot) | Manage function app deployment slots. | | [Azure Functions deployment slots](/azure/azure-functions/functions-deployment-slots) |
| [az functionapp deployment source](/cli/azure/functionapp/deployment/source) | Manage function app deployment via source control. | | [Create a function in Azure](/azure/azure-functions/scripts/functions-cli-create-function-app-vsts-continuous) |
| [az functionapp deployment user](/cli/azure/functionapp/deployment/user) | Manage user credentials for deployment. | | [Securing Azure Functions](/azure/azure-functions/security-concepts) |
| [az functionapp devops-pipeline](/cli/azure/functionapp/devops-pipeline) | Manage Azure Function-specific integration with Azure DevOps. | | [Continuous delivery by using Azure DevOps](/azure/azure-functions/functions-how-to-azure-devops) |
| [az functionapp function](/cli/azure/functionapp/function) | Manage function app functions. | | [Manage your function app](/azure/azure-functions/functions-how-to-use-azure-function-app-settings) |
| [az functionapp function keys](/cli/azure/functionapp/function/keys) | Manage function keys. | | [Securing Azure Functions](/azure/azure-functions/security-concepts) |
| [az functionapp hybrid-connection](/cli/azure/functionapp/hybrid-connection) | Manage hybrid-connections from a function app. | | [Azure App Service Hybrid Connections](/azure/app-service/app-service-hybrid-connections) |
| [az functionapp identity](/cli/azure/functionapp/identity) | Manage a web app's managed service identity. | | [Back up App Configuration stores automatically](/azure/azure-app-configuration/howto-backup-config-store) |
| [az functionapp keys](/cli/azure/functionapp/keys) | Manage a function app's keys. | | [Securing Azure Functions](/azure/azure-functions/security-concepts) |
| [az functionapp log deployment](/cli/azure/functionapp/log/deployment) | Manage a function app's deployment logs. | | [Monitor Azure Functions](/azure/azure-functions/functions-monitoring) |
| [az functionapp plan](/cli/azure/functionapp/plan) | Manage the App Service plans for a function app. | | [Manage your function app](/azure/azure-functions/functions-how-to-use-azure-function-app-settings?tabs=azurecli) |
| [az functionapp vnet-integration](/cli/azure/functionapp/vnet-integration) | Manage virtual networks integrations of a function app. | | [Virtual network integration](/azure/azure-functions/functions-networking-options#virtual-network-integration)

## See also

- [Get started with Azure CLI](./get-started-with-azure-cli.md) to learn about installation and sign in.

- Discover additional [references](/cli/azure/reference-index) and [available extensions](./azure-cli-extensions-list.md) in the Azure CLI documentation.

- Learn more about extension references in [Use extensions with Azure CLI](./azure-cli-extensions-overview.md).
