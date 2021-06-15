---
title: Cross-service links for working with the Azure CLI
description: Links to popular tutorials, quickstarts, samples, concepts, and how-to guides for services that work with Azure CLI.
author: dbradish-microsoft
ms.author: dbradish
manager: barbkess
ms.date: 03/31/2021
ms.topic: conceptual
ms.prod: azure
ms.technology: azure-cli
ms.devlang: azurecli
ms.custom: devx-track-azurecli
---

# Popular articles using the Azure CLI

The Azure CLI is used in many Azure services resulting in articles being spread across document repositories.  This page provides links to select popular articles.  

## AI + Machine Learning

| Area | Type | Link | Description |
|-|-|-|-|
| Machine Learning | Conceptual |[Deploy machine learning models to Azure](/azure/machine-learning/how-to-deploy-and-where) | Deploy your machine learning or deep learning model as a web service in the Azure cloud. |
| Machine Learning | Conceptual | [Set up a Python development environment for Azure Machine Learning](/azure/machine-learning/how-to-configure-environment) | Configure a Python development environment for Azure Machine Learning. |
| Cognitive Services | How-to-guide | [Create LUIS resources](/azure/cognitive-services/luis/luis-how-to-azure-subscription) | Provide authentication to your Language Understanding app. |
| Machine Learning | How-to-guide | [Manage access to an Azure Machine Learning workspace](/azure/machine-learning/how-to-assign-roles) | Manage access to an Azure Machine Learning workspace. |

## Analytics

| Area | Type | Link | Description |
|-|-|-|-|
| Event Hubs | Sample | [Git repositories with samples for Azure Event Hubs](/azure/event-hubs/event-hubs-samples) | Review key features in Azure Event Hubs.|
| HDInsight | How-to-guide | [Use Azure Data Lake Storage Gen2 with Azure HDInsight clusters](/azure/hdinsight/hdinsight-hadoop-use-data-lake-storage-gen2) | Use HDInsight clusters. | 

## Blockchain

| Area | Type | Link | Description |
|-|-|-|-|
| Blockchain | Quickstart | [Quickstart: Create an Azure Blockchain Service blockchain member using Azure CLI](/azure/blockchain/service/create-member-cli) | deploy a new blockchain member and consortium in Azure Blockchain Service using Azure CLI. |

## Compute

| Area | Type | Link | Description |
|-|-|-|-|
| Azure Kubernetes Service (AKS) | Quickstart | [Quickstart: Deploy an Azure Kubernetes Service cluster using the Azure CLI](/azure/aks/kubernetes-walkthrough) | Deploy an AKS cluster using the Azure CLI. |
| Azure Kubernetes Service (AKS) | Tutorial | [Tutorial: Deploy an Azure Kubernetes Service (AKS) cluster](/azure/aks/tutorial-kubernetes-deploy-cluster) | Deploy a Kubernetes AKS cluster that can authenticate to an Azure container registry. |
| Azure Kubernetes Service (AKS) | Tutorial | [Tutorial: Deploy and use Azure Container Registry](/azure/aks/tutorial-kubernetes-prepare-acr) | Deploy an ACR instance and push a container image to it. |
| Azure Function | Conceptual | [Manage your function app](/azure/azure-functions/functions-how-to-use-azure-function-app-settings) | Manage a Azure Function app by using Azure CLI. |
| Virtual Machines | Quickstart | [Quickstart: Create a Linux virtual machine with the Azure CLI](/azure/virtual-machines/linux/quick-create-cli) | Deploy a Linux virtual machine in Azure CLI. |

## Containers

| Area | Type | Link | Description |
|-|-|-|-|
| Container Instances | Quickstart | [Quickstart: Deploy a container instance in Azure using the Azure CLI](/azure/container-instances/container-instances-quickstart) | Use Azure CLI to deploy an isolated Docker container and make its application available.
| Container Instances | Tutorial | [Tutorial: Create an Azure container registry and push a container image](/azure/container-instances/container-instances-tutorial-prepare-acr) | Create an Azure Container Registry instance with Azure CLI.
|  Container Instances | Tutorial | [Tutorial: Deploy a container application to Azure Container Instances](/azure/container-instances/container-instances-tutorial-deploy-app) | Deploying the container to Azure Container Instances.
| Container Registry | Conceptual | [Deploy container instances into an Azure virtual network](/azure/container-instances/container-instances-vnet) | Use Azure CLI to deploy container groups to either a new or existing virtual network.

## Databases

| Area | Type | Link | Description |
|-|-|-|-|
| Azure SQL | Quickstart | [Quickstart: Create an Azure SQL Database single database](/azure/azure-sql/database/single-database-create-quickstart) | Create a single database in Azure SQL Database using an Azure CLI script. |
| Azure SQL | How-to-guide | [Configure and manage Azure AD authentication with Azure SQL](/azure/azure-sql/database/authentication-aad-configure) |  Create and populate an Azure Active Directory instance. |
| Azure SQL | Conceptual | [Azure SQL Database serverless](/azure/azure-sql/database/serverless-tier-overview) | Learn about Azure SQL Database serverless. |
| Azure SQL | Conceptual | [Use auto-failover groups to enable transparent and coordinated failover of multiple databases](/azure/azure-sql/database/auto-failover-group-overview) | Manage the replication and failover to another region. |
| Azure SQL | Conceptual | [Azure SQL Database and Azure Synapse IP firewall rules](/azure/azure-sql/database/firewall-configure) | Learn about Azure SQL Database and Azure Synapse IP firewall rules in Azure CLI. |

## Developer Tools

| Area | Type | Link | Description |
|-|-|-|-|
| App Service | Conceptual | [How to use managed identities for App Service and Azure Functions](/azure/app-service/overview-managed-identity) | create a managed identity for App Service and Azure Functions applications and how to use it to access other resources.
| App Service | Quickstart |[Quickstart: Create a Python app using Azure App Service on Linux](/azure/app-service/quickstart-python) | o deploy a sample with either the Flask or Django frameworks. Th
| App Service | Conceptual | [Advanced usage of authentication and authorization in Azure App Service](/azure/app-service/app-service-authentication-how-to) | ticle shows you how to customize the built-in authentication and authorization in App Service, and to manage identity from your application
| App Service | Tutorial | [Tutorial: Secure Azure SQL Database connection from App Service using a managed identity](/azure/app-service/app-service-web-tutorial-connect-msi) | your sample app will connect to SQL Database securely without the need of username and passwords.

## DevOps

| Area | Type | Link | Description |
|-|-|-|-|
| Azure DevOps | Conceptual | [Define variables](/azure/devops/pipelines/process/variables) | Learn how to define variables in a pipeline. |
| Azure DevOps | Conceptual | [Azure Pipelines agents](/azure/devops/pipelines/agents/agents) |  Learn about agents for Azure Pipelines. |
| Azure DevOps | Conceptual | [Add & use variable groups](/azure/devops/pipelines/library/variable-groups) | Use a variable group to store values across multiple pipelines. |
| Azure DevOps | Conceptual | [Agent pools](/azure/devops/pipelines/agents/pools-queues) | Manage agents by using agent pools. |
| Azure DevOps | Conceptual | [Add users and manage access in Azure DevOps](/azure/devops/organizations/accounts/add-organization-users) | Manage user access through Direct assignment for Azure DevOps. |
| Azure DevOps | Conceptual | [Create a project in Azure DevOps](/azure/devops/organizations/projects/create-project) | Use Azure DevOps to create a project and establish a repository for source code. |
| Azure DevOps | Conceptual | [Get started with Git from the command line](/azure/devops/repos/git/share-your-code-in-git-cmdline) | Share your code in a Git repo in Azure Repos using Azure CLI. |

## Hybrid

| Area | Type | Link | Description |
|-|-|-|-|
Azure Stack Hub| Quickstart: Linux VM |[Create a Linux server virtual machine in Azure Stack Hub using the Azure CLI](/azure-stack/user/azure-stack-quick-create-vm-linux-cli) | Create an Ubuntu Server 16.04 LTS virtual machine, connect to the virtual machine with a remote client, and install an NGINX web server.
Azure Stack Hub| Quickstart: Windows VM |[Create a Windows Server virtual machine in Azure Stack Hub using the Azure CLI](/azure-stack/user/azure-stack-quick-create-vm-windows-cli) |Create a Windows Server 2016 virtual machine, connect the virtual machine with a remote client, and install the IIS web server.
Azure Stack Hub| How-to guide: ASDK resources |[Manage and deploy resources to Azure Stack Hub using the Azure CLI](/azure-stack/user/azure-stack-version-profiles-azurecli2) | Set up the Azure CLI to manage Azure Stack Development Kit (ASDK) resources from Linux, Mac, and Windows client platforms.

## Identity

| Area | Type | Link | Description |
|-|-|-|-|
| Active Directory | How-to-guide | [Sign in to Windows virtual machine in Azure using Azure Active Directory authentication](/azure/active-directory/devices/howto-vm-sign-in-azure-ad-windows) | Sign in to a virtual machine in Azure uses Active Directory. |
| Active Directory | How-to-guide | [Create, list, or delete a user-assigned managed identity using the Azure CLI](/azure/active-directory/managed-identities-azure-resources/how-to-manage-ua-identity-cli) | Manage a user-assigned managed identity using Azure CLI. |
| Active Directory | Sample | [How to use managed identities for Azure resources on an Azure VM for sign-in](/azure/active-directory/managed-identities-azure-resources/how-to-use-vm-sign-in) | Sign-in using managed identities for Azure resources service principal, and guidance on important topics such as error handling. |

## Integration

| Area | Type | Link | Description |
|-|-|-|-|
| Service Bus Messaging | Conceptual | [Azure Service Bus to Event Grid integration overview](/azure/service-bus-messaging/service-bus-to-event-grid-integration-concept) | Learn about Azure Service Bus to Event Grid integration. |
| Event Grid | Tutorial | [Tutorial: Stream big data into a data warehouse](/azure/event-grid/event-grid-event-hubs-integration) | Stream big data into a data warehouse. |

## Internet of Things

| Area | Type | Link | Description |
|-|-|-|-|
| IoT Edge | Quickstart | [Quickstart: Deploy your first IoT Edge module to a virtual Linux device](/azure/iot-edge/quickstart-linux) | Deploy containerized code to a virtual Linux IoT Edge device. |
| IoT Hub | Quickstart | [Quickstart: Send telemetry from a device to an IoT hub and read it with a service application (.NET)](/azure/iot-hub/quickstart-send-telemetry-dotnet) | Send telemetry through IoT Hub to a service application. |
| IoT Edge | Quickstart | [Quickstart: Deploy your first IoT Edge module to a Windows device](/azure/iot-edge/quickstart) | Deploy code to a Linux on Windows IoT Edge device. |
| IoT Hub | Quickstart | [Quickstart: Send telemetry from a device to an IoT hub and read it with a back-end application (Node.js)](/azure/iot-hub/quickstart-send-telemetry-node) |  Send telemetry  through Azure IoT Hub to a back-end application.

## Management and Governance

| Area | Type | Link | Description |
|-|-|-|-|
| Azure Resource Manager | How-to-guide | [Move resources to a new resource group or subscription](/azure/azure-resource-manager/management/move-resource-group-and-subscription) | Move Azure resources to another Azure subscription or resource group. |
| Azure Resource Manager | How-to-guide | [Use tags to organize your Azure resources and management hierarchy](/azure/azure-resource-manager/management/tag-resources) | Apply tags to your Azure resources, resource groups, and subscriptions to organize them.
| Azure Resource Manager | Tutorial | [Tutorial: Add parameters to your ARM template](/azure/azure-resource-manager/templates/template-tutorial-add-parameters) | Improve the Azure Resource Manager template by adding parameters.

## Migration

| Area | Type | Link | Description |
|-|-|-|-|
| Azure Java | Conceptual | [Migrate Tomcat applications to containers on Azure Kubernetes Service](/azure/developer/java/migration/migrate-spring-boot-to-azure-kubernetes-service) | Migrate a Spring Boot application to Azure Kubernetes Service. |
| Azure Java | Conceptual | [Migrate Tomcat applications to containers on Azure Kubernetes Service](/azure/developer/java/migration/migrate-tomcat-to-containers-on-azure-kubernetes-service) | Migrate a Tomcat application to Azure Kubernetes Service. |

## Networking

| Area | Type | Link | Description |
|-|-|-|-|
| Virtual Networking | Quickstart | [Quickstart: Create a virtual network using the Azure CLI](/azure/virtual-network/quick-create-cli) | Deploy two VMs into the virtual network. |

## Security

| Area | Type | Link | Description |
|-|-|-|-|
| Azure Key Vault | Conceptual | [Azure Key Vault configuration provider in ASP.NET Core](/aspnet/core/security/key-vault-configuration) | Load app configuration values from Azure Key Vault secrets. |
| Azure Key Vault | Tutorial | [Tutorial: Use a managed identity to connect Key Vault to an Azure web app in .NET](/azure/key-vault/general/tutorial-net-create-vault-azure-web-app) | Create and deploy Azure web application to Azure App Service. |
| Azure Key Vault | Quickstart | [Quickstart: Set and retrieve a secret from Azure Key Vault using Azure CLI](/azure/key-vault/secrets/quick-create-cli) | Create a key vault in Azure Key Vault with Azure CLI. |

## Storage

| Area | Type | Link | Description |
|-|-|-|-|
| Storage | How-to-guide | [Create a storage account](/azure/storage/common/storage-account-create) | Create a storage account using Azure CLI. 
| File storage | How-to-guide | [Create an Azure file share](/azure/storage/files/storage-how-to-create-file-share) | Create an Azure file share. |
| File storage | How-to-guide | [Enable Azure Active Directory Domain Services authentication on Azure Files](/azure/storage/files/storage-files-identity-auth-active-directory-domain-service-enable) |  Enable and configure Azure AD DS for authentication with Azure file shares. |
| Blob storage | Tutorial | [Tutorial: Upload image data in the cloud with Azure Storage](/azure/storage/blobs/storage-upload-process-images) | Deploy a web app. |

## See also

* [Get started with the Azure CLI](get-started-with-azure-cli.md)
* [Full command reference list for the Azure CLI](../latest/docs-ref-autogen/reference-index.yml)
* [Services the Azure CLI can manage](azure-services-the-azure-cli-can-manage.md)