---
title: Azure CLI references for Azure Web Apps
description: Azure CLI reference landing page for Azure Web Apps
author: dbradish-microsoft
manager: barbkess
ms.devlang: azurecli
ms.topic: reference
ms.date: 06/30/2021
ms.author: dbradish
ms.service: azure-cli
ms.reviewer: robb
ms.custom: devx-track-azurecli
---

# Azure CLI for Azure Web Apps

The Azure Command Line Interface ([Azure CLI](./what-is-azure-cli.md)) is a set of commands you use to create and manage Azure resources. It's available across many Azure services, including Azure Web Apps, and gives you the ability to manage Azure Web Apps from a command line.

The [Azure Web Apps](/azure/app-service) CLI experience is composed of two parts: core and extension. Core Azure CLI commands ship as part of the CLI and are fully supported. An extension gives you access to experimental and pre-release commands. For more information about extension references, see [Use extensions with Azure CLI](./azure-cli-extensions-overview.md).  

Access to the following subgroups requires the [webapp](https://github.com/Azure/azure-cli-extensions/tree/main/src/webapp) extension: webapp container, webapp remote-connection, and webapp scan.

> [!NOTE]
> You're prompted to install an extension reference on first use. Or, you can use the [az extension add](/cli/azure/extension#az_extension_add) command to manually install an extension by name.

See [Azure Web Apps](/cli/azure/service-page/azure%20web%20apps) for a complete list of the Azure CLI core and extension references available for the Azure Web Apps service. For references for each subgroup, see the tables in the following sections:

- [Azure Static Web Apps](#azure-static-web-apps)
- [Azure Web App configuration](#azure-web-app-configuration)
- [Azure Web App deployment](#azure-web-app-deployment)
- [Azure Web App WebJobs](#azure-web-app-webjobs)
- [Additional Azure Web App references](#additional-azure-web-app-references)

## Azure Static Web Apps

| Reference | Description | More information |
|-|-|-|
| [az staticwebapp](/cli/azure/staticwebapp) | Manage static web apps. | [Quickstart: Building your first static site using the Azure CLI](/azure/static-web-apps/get-started-cli) |
| [az staticwebapp appsettings](/cli/azure/staticwebapp/appsettings) | Manage the function app settings of a static web app. | [Add an API to Azure Static Web Apps with Azure Functions](/azure/static-web-apps/add-api) |
| [az staticwebapp environment](/cli/azure/staticwebapp/environment) | Manage the environment of a static web app. | [Add an API to Azure Static Web Apps with Azure Functions](/azure/static-web-apps/add-api) |
| [az staticwebapp hostname](/cli/azure/staticwebapp/hostname) | Manage custom hostnames of functions of a static web app. | [Add an API to Azure Static Web Apps with Azure Functions](/azure/static-web-apps/add-api) |
| [az staticwebapp users](/cli/azure/staticwebapp/users) | Manage users of a static web app. | [Accessing user information in Azure Static Web Apps](/azure/static-web-apps/user-information) |

## Azure Web App configuration

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

## Azure Web App deployment

| Reference | Description | More information |
|-|-|-|
| [az webapp deployment](/cli/azure/webapp/deployment) | Manage web app deployments. |[Deploy an Azure Web App](/azure/devops/pipelines/targets/webapp)  |
| [az webapp deployment container](/cli/azure/webapp/deployment/container) | Manage container-based continuous deployment. | [Continuous deployment with custom containers in Azure App Service](/azure/app-service/deploy-ci-cd-custom-container) |
| [az webapp deployment slot](/cli/azure/webapp/deployment/slot) | Manage web app deployment slots. | [Create an App Service app and deploy code to a staging environment using Azure CLI](/azure/app-service/scripts/cli-deploy-staging-environment) |
| [az webapp deployment source](/cli/azure/webapp/deployment/source) | Manage web app deployment via source control. | [Secure access to application data](/azure/storage/blobs/storage-secure-access-application?tabs=azure-cli) |
| [az webapp deployment user](/cli/azure/webapp/deployment/user) | Manage user credentials for deployment. | [Configure the local Git deployment](/azure/key-vault/general/tutorial-net-create-vault-azure-web-app#configure-the-local-git-deployment) |

## Azure Web App WebJobs

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

## See also

- [Get started with Azure CLI](./get-started-with-azure-cli.md) to learn about installation and sign in.

- Discover additional [references](/cli/azure/reference-index) and [available extensions](./azure-cli-extensions-list.md) in the Azure CLI documentation.

- Learn more about extension references in [Use extensions with Azure CLI](./azure-cli-extensions-overview.md).
