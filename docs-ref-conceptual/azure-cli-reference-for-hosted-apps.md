---
title: Azure CLI references for Azure hosted apps | Microsoft Docs
description: Find Azure CLI core and extension reference commands to manage Azure hosted apps.  Follow links to popular articles to learn how to use the Azure CLI for Azure hoted apps.
manager: jasongroce
author: dbradish-microsoft
ms.author: dbradish
ms.tool: azure-cli
ms.topic: reference
ms.date: 06/19/2023
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
| [az staticwebapp](../latest/docs-ref-autogen/staticwebapp.yml) | Manage static web apps. | [Quickstart: Building your first static site using the Azure CLI](/azure/static-web-apps/get-started-cli) |
| [az staticwebapp appsettings](../latest/docs-ref-autogen/staticwebapp/appsettings.yml) | Manage the function app settings of a static web app. | [Add an API to Azure Static Web Apps with Azure Functions](/azure/static-web-apps/add-api) |
| [az staticwebapp environment](../latest/docs-ref-autogen/staticwebapp/environment.yml) | Manage the environment of a static web app. | [Add an API to Azure Static Web Apps with Azure Functions](/azure/static-web-apps/add-api) |
| [az staticwebapp hostname](../latest/docs-ref-autogen/staticwebapp/hostname.yml) | Manage custom hostnames of functions of a static web app. | [Add an API to Azure Static Web Apps with Azure Functions](/azure/static-web-apps/add-api) |
| [az staticwebapp users](../latest/docs-ref-autogen/staticwebapp/users.yml) | Manage users of a static web app. | [Accessing user information in Azure Static Web Apps](/azure/static-web-apps/user-information) |

## Azure Web App configuration references

| Reference | Description | More information |
|-|-|-|
| [az webapp config](../latest/docs-ref-autogen/webapp/config.yml) | Configure web apps. | [Configure an App Service app](/azure/app-service/configure-common) |
| [az webapp config access-restriction](../latest/docs-ref-autogen/webapp/config/access-restriction.yml) | Manage access restrictions on a web app. | [Integrate App Service with Application Gateway using CLI](/azure/app-service/scripts/cli-integrate-app-service-with-application-gateway) |
| [az webapp config appsettings](../latest/docs-ref-autogen/webapp/config/appsettings.yml) | Configure web app settings. Updating or removing application settings causes an app recycle. | [Configure an App Service app](/azure/app-service/configure-common) |
| [az webapp config backup](../latest/docs-ref-autogen/webapp/config/backup.yml) | Manage backups for a web app. | [Back up an app using CLI](/azure/app-service/scripts/cli-backup-onetime) |
| [az webapp config connection-string](../latest/docs-ref-autogen/webapp/config/connection-string.yml) | Manage the connection strings for a web app. | [Configure connection string](/azure/app-service/tutorial-dotnetcore-sqldb-app#configure-connection-string) |
| [az webapp config container](../latest/docs-ref-autogen/webapp/config/container.yml) | Manage container settings for a web app. | [Migrate custom software to Azure App Service using a custom container](/azure/app-service/tutorial-custom-container) |
| [az webapp config hostname](../latest/docs-ref-autogen/webapp/config/hostname.yml) | Configure hostnames for a web app. | [Configuring a custom domain name](/azure/developer/javascript/how-to/with-azure-cli/configure-app-service-custom-domain-name) |
| [az webapp config snapshot](../latest/docs-ref-autogen/webapp/config/snapshot.yml) | Manage snapshots for a web app. | [Restore an app in Azure from a snapshot](/azure/app-service/app-service-web-restore-snapshots) |
| [az webapp config ssl](../latest/docs-ref-autogen/webapp/config/ssl.yml) | Configure SSL certificates for a web app. | [Bind a custom TLS/SSL certificate to an App Service app using CLI](/azure/app-service/scripts/cli-configure-ssl-certificate) |
| [az webapp config storage-account](../latest/docs-ref-autogen/webapp/config/storage-account.yml) | Manage a web app's Azure storage account configurations. Applies only to Linux and Windows Containers web apps). | [Mount a file share to a Python function app using Azure CLI](/azure/azure-functions/scripts/functions-cli-mount-files-storage-linux) |

## Azure Web App deployment references

| Reference | Description | More information |
|-|-|-|
| [az webapp deployment](../latest/docs-ref-autogen/webapp/deployment.yml) | Manage web app deployments. |[Deploy an Azure Web App](/azure/devops/pipelines/targets/webapp)  |
| [az webapp deployment container](../latest/docs-ref-autogen/webapp/deployment/container.yml) | Manage container-based continuous deployment. | [Continuous deployment with custom containers in Azure App Service](/azure/app-service/deploy-ci-cd-custom-container) |
| [az webapp deployment slot](../latest/docs-ref-autogen/webapp/deployment/slot.yml) | Manage web app deployment slots. | [Create an App Service app and deploy code to a staging environment using Azure CLI](/azure/app-service/scripts/cli-deploy-staging-environment) |
| [az webapp deployment source](../latest/docs-ref-autogen/webapp/deployment/source.yml) | Manage web app deployment via source control. | [Secure access to application data](/azure/storage/blobs/storage-secure-access-application?tabs=azure-cli) |
| [az webapp deployment user](../latest/docs-ref-autogen/webapp/deployment/user.yml) | Manage user credentials for deployment. | [Configure the local Git deployment](/azure/key-vault/general/tutorial-net-create-vault-azure-web-app#configure-the-local-git-deployment) |

## Azure Web App WebJob references

| Reference | Description | More information |
|-|-|-|
| [az webapp webjob](../latest/docs-ref-autogen/webapp/webjob.yml) | Manage WebJobs on a web app. | [Run background tasks with WebJobs in Azure App Service](/azure/app-service/webjobs-create) |
| [az webapp webjob continuous](../latest/docs-ref-autogen/webapp/webjob/continuous.yml) | Manage continuous WebJobs on a web app. | [Run background tasks with WebJobs in Azure App Service](/azure/app-service/webjobs-create) |
| [az webapp webjob triggered](../latest/docs-ref-autogen/webapp/webjob/triggered.yml) | Manage triggered WebJobs on a web app. | [Run background tasks with WebJobs in Azure App Service](/azure/app-service/webjobs-create) |

## Additional Azure Web App references

| Reference | Description | Extension? | More information |
|-|-|-|-|
| [az webapp](../latest/docs-ref-autogen/webapp.yml) | Manage web apps. | | [Provision and deploy a web app](/azure/developer/python/azure-sdk-example-web-app) |
| [az webapp auth](../latest/docs-ref-autogen/webapp/auth.yml) | Manage authentication and authorization for a web app. | | [Authentication and authorization in Azure App Service](/azure/app-service/overview-authentication-authorization) |
| [az webapp container](/cli/azure/webapp/container) | Manage container operations for a web app. | Yes | [Deploy to Azure Web App for Containers](/azure/devops/pipelines/apps/cd/deploy-docker-webapp) |
| [az webapp cors](../latest/docs-ref-autogen/webapp/cors.yml) | Manage Cross-Origin Resource Sharing (CORS). | | [Host a RESTful API with CORS in Azure App Service](/azure/app-service/app-service-web-tutorial-rest-api) |
| [az webapp deleted](../latest/docs-ref-autogen/webapp/deleted.yml) | Manage deleted web apps. | | [Restore deleted App Service app](/azure/app-service/app-service-undelete) |
| [az webapp hybrid-connection](../latest/docs-ref-autogen/webapp/hybrid-connection.yml) | Manage Hybrid Connections for a web app. | | [Azure App Service Hybrid Connections](/azure/app-service/app-service-hybrid-connections) |
| [az webapp log](../latest/docs-ref-autogen/webapp/log.yml) | Manage logs for a web app. | | [Build an ASP.NET Core and Azure SQL Database app in Azure App Service](/azure/app-service/tutorial-dotnetcore-sqldb-app) |
| [az webapp log deployment](../latest/docs-ref-autogen/webapp/log/deployment.yml) | Manage deployment logs for a web app. | | [Build an ASP.NET Core and Azure SQL Database app in Azure App Service](/azure/app-service/tutorial-dotnetcore-sqldb-app) |
| [az webapp identity](../latest/docs-ref-autogen/webapp/identity.yml) | Manage managed service identities for a web app. | | [How to use managed identities for App Service and Azure Functions](/azure/app-service/overview-managed-identity) |
| [az webapp remote-connection](/cli/azure/webapp/remote-connection) | Create a remote connection by using a TCP tunnel to a web app. | Yes | [Open an SSH session to a Linux container in Azure App Service](/azure/app-service/configure-linux-open-ssh-session) |
| [az webapp scan](../latest/docs-ref-autogen/webapp/scan.yml) | Manage the scans for a web app. Currently available only for Linux-based web apps. | Yes | [Scan your machines](/azure/security-center/deploy-vulnerability-assessment-vm) |
| [az webapp traffic-routing](../latest/docs-ref-autogen/webapp/traffic-routing.yml) | Manage traffic routing for web apps. | | [Control Azure App Service traffic with Azure Traffic Manager](/azure/app-service/web-sites-traffic-manager) |
| [az webapp vnet-integration](../latest/docs-ref-autogen/webapp/vnet-integration.yml) | Manage the virtual network integrations for a web app. | | [Integrate your app with an Azure virtual network](/azure/app-service/web-sites-integrate-with-vnet) |

## Azure App Service plan references

See [az appservice](../latest/docs-ref-autogen/appservice.yml) for a complete list of the references available to manage [Azure App Service plans](/azure/app-service/overview-hosting-plans).

| Reference | Description | More information |
|-|-|-|
| [az appservice](../latest/docs-ref-autogen/appservice.yml) | Manage App Service plans. | [Introduction to the App Service Environments](/azure/app-service/environment/intro) |
| [az appservice ase](../latest/docs-ref-autogen/appservice/ase.yml) | Manage App Service Environments v2. | [Introduction to the App Service Environments](/azure/app-service/environment/intro) |
| [az appservice domain](../latest/docs-ref-autogen/appservice/domain.yml) | Manage custom domains. | [Map an existing custom DNS name to Azure App Service](/azure/app-service/app-service-web-tutorial-custom-domain) |
| [az appservice hybrid-connection](../latest/docs-ref-autogen/appservice/hybrid-connection.yml) | Set the key that apps use to connect to hybrid-connections in an App Service plan. | [Azure App Service Hybrid Connections](/azure/app-service/app-service-hybrid-connections) |
| [az appservice plan](../latest/docs-ref-autogen/appservice/plan.yml) | Manage App Service plans. | [Manage an App Service plan in Azure](/azure/app-service/app-service-plan-manage) |
| [az appservice vnet-integration](../latest/docs-ref-autogen/appservice/vnet-integration.yml) | List the virtual network integrations that an appservice plan uses. | [Integrate your app with an Azure virtual network](/azure/app-service/web-sites-integrate-with-vnet) |

## Azure function app references

See [az functionapp](../latest/docs-ref-autogen/functionapp.yml) for a complete list of the references available to manage [Azure function apps](/azure/app-service/overview-hosting-plans).

| Reference | Description | Extension? | More information |
|-|-|-|-|
| [az functionapp](../latest/docs-ref-autogen/functionapp.yml) | Manage function apps. | | [Manage your function app](/azure/azure-functions/functions-how-to-use-azure-function-app-settings?tabs=azurecli) |
| [az functionapp app](../latest/docs-ref-autogen/functionapp/app.yml) | Manage Azure Functions app. | Yes | [Manage your function app](/azure/azure-functions/functions-how-to-use-azure-function-app-settings?tabs=azurecli) |
| [az functionapp config](../latest/docs-ref-autogen/functionapp/config.yml) | Configure a function app. | | [Manage your function app](/azure/azure-functions/functions-how-to-use-azure-function-app-settings?tabs=azurecli) |
| [az functionapp config access-restriction](../latest/docs-ref-autogen/functionapp/config/access-restriction.yml) | Manage access restrictions on a function app. | | [Set up Azure App Service access restrictions](/azure/app-service/app-service-ip-restrictions) |
| [az functionapp config appsettings](../latest/docs-ref-autogen/functionapp/config/appsettings.yml) | Manage function app settings. | | [Manage your function app](/azure/azure-functions/functions-how-to-use-azure-function-app-settings?tabs=azurecli) |
| [az functionapp config container](../latest/docs-ref-autogen/functionapp/config/container.yml) | Manage function app container settings. | | [Create your first function on Azure Arc using a custom container](/azure/azure-functions/create-first-function-arc-custom-container) |
| [az functionapp config hostname](../latest/docs-ref-autogen/functionapp/config/hostname.yml) | Configure hostnames for a function app. | | [Azure Functions networking options](/azure/azure-functions/functions-networking-options) |
| [az functionapp config ssl](../latest/docs-ref-autogen/functionapp/config/ssl.yml) | Configure SSL certificates for a function app. | | [Add a TLS/SSL certificate in Azure App Service](/azure/app-service/configure-ssl-certificate) |
| [az functionapp cors](../latest/docs-ref-autogen/functionapp/cors.yml) | Manage Cross-Origin Resource Sharing (CORS) for a function app. | | [Manage your function app](/azure/azure-functions/functions-how-to-use-azure-function-app-settings?tabs=azurecli) |
| [az functionapp deployment](../latest/docs-ref-autogen/functionapp/deployment.yml) | Manage function app deployments. | | [Deployment technologies in Azure Functions](/azure/azure-functions/functions-deployment-technologies) |
| [az functionapp deployment container](../latest/docs-ref-autogen/functionapp/deployment/container.yml) | Manage container-based continuous deployment. | | [Create a function on Linux using a custom container](/azure/azure-functions/functions-create-function-linux-custom-image?tabs=bash%2Cazurecli) |
| [az functionapp deployment slot](../latest/docs-ref-autogen/functionapp/deployment/slot.yml) | Manage function app deployment slots. | | [Azure Functions deployment slots](/azure/azure-functions/functions-deployment-slots) |
| [az functionapp deployment source](../latest/docs-ref-autogen/functionapp/deployment/source.yml) | Manage function app deployment via source control. | | [Create a function in Azure](/azure/azure-functions/scripts/functions-cli-create-function-app-vsts-continuous) |
| [az functionapp deployment user](../latest/docs-ref-autogen/functionapp/deployment/user.yml) | Manage user credentials for deployment. | | [Securing Azure Functions](/azure/azure-functions/security-concepts) |
| [az functionapp devops-pipeline](../latest/docs-ref-autogen/functionapp/devops-pipeline.yml) | Manage Azure Function-specific integration with Azure DevOps. | | [Continuous delivery by using Azure DevOps](/azure/azure-functions/functions-how-to-azure-devops) |
| [az functionapp function](../latest/docs-ref-autogen/functionapp/function.yml) | Manage function app functions. | | [Manage your function app](/azure/azure-functions/functions-how-to-use-azure-function-app-settings) |
| [az functionapp function keys](../latest/docs-ref-autogen/functionapp/function/keys.yml) | Manage function keys. | | [Securing Azure Functions](/azure/azure-functions/security-concepts) |
| [az functionapp hybrid-connection](../latest/docs-ref-autogen/functionapp/hybrid-connection.yml) | Manage hybrid-connections from a function app. | | [Azure App Service Hybrid Connections](/azure/app-service/app-service-hybrid-connections) |
| [az functionapp identity](../latest/docs-ref-autogen/functionapp/identity.yml) | Manage a web app's managed service identity. | | [Back up App Configuration stores automatically](/azure/azure-app-configuration/howto-backup-config-store) |
| [az functionapp keys](../latest/docs-ref-autogen/functionapp/keys.yml) | Manage a function app's keys. | | [Securing Azure Functions](/azure/azure-functions/security-concepts) |
| [az functionapp log deployment](../latest/docs-ref-autogen/functionapp/log/deployment.yml) | Manage a function app's deployment logs. | | [Monitor Azure Functions](/azure/azure-functions/functions-monitoring) |
| [az functionapp plan](../latest/docs-ref-autogen/functionapp/plan.yml) | Manage the App Service plans for a function app. | | [Manage your function app](/azure/azure-functions/functions-how-to-use-azure-function-app-settings?tabs=azurecli) |
| [az functionapp vnet-integration](../latest/docs-ref-autogen/functionapp/vnet-integration.yml) | Manage virtual networks integrations of a function app. | | [Virtual network integration](/azure/azure-functions/functions-networking-options#virtual-network-integration)

## See also

* [Get started with Azure CLI](./get-started-with-azure-cli.md) to learn about installation and sign in.
* Discover additional [reference commands](../latest/docs-ref-autogen/reference-index.yml) and [available extensions](./azure-cli-extensions-list.md) in the Azure CLI documentation.
* [Learn to use Bash with the Azure CLI](./azure-cli-learn-bash.md)
