---
title: Use Azure CLI to manage Azure identities | Microsoft Docs
description: Find Azure CLI reference commands that manage the identity of Azure resources
ms.date: 08/20/2024
ms.topic: conceptual
ms.service: azure-cli
ms.custom: devx-track-azurecli, seo-azure-cli
keywords: az login, authentication types, authentication methods, azure, cli login, az login powershell, cli login, sign in, azure cli 
---

# How to work with Azure identities using the Azure CLI

There are many Azure CLI reference commands that help you to work with Azure identities. This article provides a list of Azure CLI commands and the quickstart, how-to guide or tutorial that shows the use of the command. For identity commands without an article, rely on the reference example (the link in column one).

> [!NOTE]
>
> Not all Azure CLI commands containing the word "identity" are about Microsoft Entra ID _managed_ identities. This article is an index of Azure CLI commands to help you manage any type of Azure identity.

## az acr

|Reference subgroup|Article showing reference use|
|---|---|
| [az acr identity](/cli/azure/acr/identity) | [Troubleshoot a customer-managed key](/azure/container-registry/tutorial-troubleshoot-customer-managed-keys)
| [az acr task identity](/cli/azure/acr/task/identity) | |
## az aks

|Reference subgroup|Article showing reference use
|---|---|
| [az aks pod-identity](/cli/azure/aks/pod-identity) | [Migrate from pod managed-identity to workload identity](/azure/aks/workload-identity-migrate-from-pod-identity)
|  | [Use Microsoft Entra pod-managed identities in Azure Kubernetes Service (Preview)](/azure/aks/use-azure-ad-pod-identity)
| [az aks pod-identity exception](/cli/azure/aks/pod-identity/exception) | [Troubleshoot Azure Kubernetes Service backup and restore](/azure/backup/azure-kubernetes-service-backup-troubleshoot)
|  | [Use Microsoft Entra pod-managed identities in Azure Kubernetes Service (Preview)](/azure/aks/use-azure-ad-pod-identity)

## az ams

|Reference subgroup|Article showing reference use
|---|---|
| [az ams account identity](/cli/azure/ams/account/identity) |

## az appconfig

|Reference subgroup|Article showing reference use
|---|---|
| [az appconfig identity](/cli/azure/appconfig/identity) | [Use customer-managed keys to encrypt your App Configuration data](/azure/azure-app-configuration/concept-customer-managed-keys)
|  | [How to use managed identities for Azure App Configuration](/azure/azure-app-configuration/overview-managed-identity)

## az backup

|Reference subgroup|Article showing reference use
|---|---|
| [az backup vault identity](/cli/azure/backup/vault/identity) | [Save and manage MARS agent passphrase securely in Azure Key Vault](/azure/backup/save-backup-passphrase-securely-in-azure-key-vault)
|  | [Encrypt backup data by using customer-managed keys](/azure/backup/encryption-at-rest-with-cmk)

## az batch

|Reference subgroup|Article showing reference use
|---|---|
| [az batch account identity](/cli/azure/batch/account/identity) |

## az cognitiveservices

|Reference subgroup|Article showing reference use
|---|---|
| [az cognitiveservices account identity](/cli/azure/cognitiveservices/account/identity) |

## az communication

|Reference subgroup|Article showing reference use
|---|---|
| [az communication identity](/cli/azure/communication/identity) | [How to use Managed Identity with Azure Communication Services](/azure/communication-services/how-tos/managed-identity)
| [az communication identity token](/cli/azure/communication/identity/token) | [Quickstart: Join a room call](/azure/communication-services/quickstarts/rooms/join-rooms-call)
|  | [Pre-Call diagnostic](/azure/communication-services/concepts/voice-video-calling/pre-call-diagnostics)
|  | [Adding visual effects to a video call](/azure/communication-services/concepts/voice-video-calling/video-effects)

## az containerapp

|Reference subgroup|Article showing reference use
|---|---|
| [az containerapp identity](/cli/azure/containerapp/identity) | [Managed identities in Azure Container Apps](/azure/container-apps/managed-identity)
|  | [Deploy to Azure Container Apps from Azure Pipelines](/azure/container-apps/azure-pipelines)
|  | [Deploy to Azure Container Apps with GitHub Actions](/azure/container-apps/github-actions)
|  | [Migrate a Python application to use passwordless connections with Azure SQL Database](/azure/azure-sql/database/azure-sql-passwordless-migration-python)
|  | [Migrate an application to use passwordless connections with Azure Blob Storage](/azure/storage/common/migrate-azure-credentials)
|  | [Migrate an application to use passwordless connections with Azure Database for PostgreSQL](/azure/developer/java/spring-framework/migrate-postgresql-to-passwordless-connection)
|  | [Migrate an application to use passwordless connections with Azure Service Bus](/azure/service-bus-messaging/service-bus-migrate-azure-credentials)
|  | [Tutorial: Use code interpreter sessions in LangChain with Azure Container Apps](/azure/container-apps/sessions-tutorial-langchain)
|  | [Migrate an application to use passwordless connections with Azure Event Hubs](/azure/event-hubs/passwordless-migration-event-hubs)
|  | [Tutorial: Use code interpreter sessions in Semantic Kernel with Azure Container Apps](/azure/container-apps/sessions-tutorial-semantic-kernel)

## az cosmosdb

|Reference subgroup|Article showing reference use
|---|---|
|  [az cosmosdb identity](/cli/azure/cosmosdb/identity) | [Configure managed identities with Microsoft Entra ID for your Azure Cosmos DB account](/azure/cosmos-db/how-to-setup-managed-identity)
|  | [Access Azure Key Vault from Azure Cosmos DB using a managed identity](/azure/cosmos-db/access-key-vault-managed-identity)
|  | [Create and manage container copy jobs in Azure Cosmos DB (Preview)](/azure/cosmos-db/how-to-container-copy)
|  | [Configure customer-managed keys for your Azure Cosmos DB account with Azure Managed HSM Key Vault](/azure/cosmos-db/how-to-setup-customer-managed-keys-mhsm)

## az disk-encryption-set

|Reference subgroup|Article showing reference use
|---|---|
| [az disk-encryption-set identity](/cli/azure/disk-encryption-set/identity) |

## az dt

|Reference subgroup|Article showing reference use
|---|---|
| [az dt identity](/cli/azure/dt/identity) | [Set up an Azure Digital Twins instance and authentication (CLI)](/azure/digital-twins/how-to-set-up-instance-cli)

## az eventhubs

|Reference subgroup|Article showing reference use
|---|---|
| [az eventhubs namespace identity](/cli/azure/eventhubs/namespace/identity) |

## az functionapp

|Reference subgroup|Article showing reference use
|---|---|
| [az functionapp identity](/cli/azure/functionapp/identity) | [Create your first containerized functions on Azure Container Apps](/azure/azure-functions/functions-deploy-container-apps)
|  | [Enable linting and analysis for API governance in your API center](/azure/api-center/enable-api-analysis-linting)
|  | [Tutorial: Build out an end-to-end solution](/azure/digital-twins/tutorial-end-to-end)
|  | [Ingest IoT Hub telemetry into Azure Digital Twins](/azure/digital-twins/how-to-ingest-iot-hub-data)
|  | [Set up twin-to-twin event handling](/azure/digital-twins/how-to-send-twin-to-twin-events)
|  | [Integrate Azure Digital Twins with Azure Time Series Insights](/azure/digital-twins/how-to-integrate-time-series-insights)

## az identity

|Reference subgroup|Article showing reference use
|---|---|
| [az identity](/cli/azure/identity) | [How to use managed identities for App Service and Azure Functions](/azure/app-service/overview-managed-identity)
|  | [Manage user-assigned managed identities](/entra/identity/managed-identities-azure-resources/how-manage-user-assigned-managed-identities)
|  | [Use Key Vault references as app settings in Azure App Service and Azure Functions](/azure/app-service/app-service-key-vault-references)
|  | [Transfer an Azure subscription to a different Microsoft Entra directory](/azure/role-based-access-control/transfer-subscription)
|  | [Configure a custom container for Azure App Service](/azure/app-service/configure-custom-container)
|  | [Deploy and configure workload identity on an Azure Kubernetes Service (AKS) cluster](/azure/aks/workload-identity-deploy-cluster)
|  | [Migrate custom software to Azure App Service using a custom container](/azure/app-service/tutorial-custom-container)
|  | [Provision and publish a bot](/azure/bot-service/provision-and-publish-a-bot)
|  | [Configure a user-assigned managed identity to trust an external identity provider](/entra/workload-id/workload-identity-federation-create-trust-user-assigned-managed-identity)
|  | [Assign Azure roles using Azure CLI](/azure/role-based-access-control/role-assignments-cli)
| [az identity federated-credential](/cli/azure/identity/federated-credential) | [Deploy and configure workload identity on an Azure Kubernetes Service (AKS) cluster](/azure/aks/workload-identity-deploy-cluster)
|  | [Configure a user-assigned managed identity to trust an external identity provider](/entra/workload-id/workload-identity-federation-create-trust-user-assigned-managed-identity)
|  | [Tutorial: Deploy applications using GitOps with Flux v2](/azure/azure-arc/kubernetes/tutorial-use-gitops-flux2)
|  | [Migrate from pod managed-identity to workload identity](/azure/aks/workload-identity-migrate-from-pod-identity)
|  | [Quickstart: Deploy Application Gateway for Containers ALB Controller](/azure/application-gateway/for-containers/quickstart-deploy-application-gateway-for-containers-alb-controller)
|  | [Integrate KEDA with your Azure Kubernetes Service cluster](/azure/azure-monitor/containers/integrate-keda)
|  | [Send Prometheus data to Azure Monitor by using Microsoft Entra Workload ID (preview) authentication](/azure/azure-monitor/containers/prometheus-remote-write-azure-workload-identity)
|  | [Deploy a highly available PostgreSQL database on AKS](/azure/aks/deploy-postgresql-ha)
|  | [Configure and deploy a Valkey cluster on Azure Kubernetes Service (AKS)](/azure/aks/deploy-valkey-cluster)
|  | [Securely scale your applications using the KEDA add-on and workload identity on Azure Kubernetes Service (AKS)](/azure/aks/keda-workload-identity)

## az image

|Reference subgroup|Article showing reference use
|---|---|
| [az image builder identity](/cli/azure/image/builder/identity) | [Troubleshoot Azure VM Image Builder](/azure/virtual-machines/linux/image-builder-troubleshoot)

## az iot

|Reference subgroup|Article showing reference use
|---|---|
| [az iot central app identity](/cli/azure/iot/central/app/identity) | [Export IoT data to Blob Storage](/azure/iot-central/core/howto-export-to-blob-storage)
|  | [Export IoT data to Azure Data Explorer](/azure/iot-central/core/howto-export-to-azure-data-explorer)
|  | [Export IoT data to Event Hubs](/azure/iot-central/core/howto-export-to-event-hubs)
|  | [Manage and monitor IoT Central applications](/azure/iot-central/core/howto-manage-and-monitor-iot-central)
|  | [Export IoT data to Service Bus](/azure/iot-central/core/howto-export-to-service-bus)
| [az iot hub device-identity](/cli/azure/iot/hub/device-identity) | [Create and provision an IoT Edge device on Linux using symmetric keys](/azure/iot-edge/how-to-provision-single-device-linux-symmetric)
|  | [Quickstart: Deploy your first IoT Edge module to a virtual Linux device](/azure/iot-edge/quickstart-linux)
|  | [Install and run the Spatial Analysis container (preview)](/azure/ai-services/computer-vision/spatial-analysis-container)
|  | [Tutorial: Send device data to Azure Storage using IoT Hub message routing](/azure/iot-hub/tutorial-routing)
|  | [Quickstart: Deploy your first IoT Edge module to a Windows device](/azure/iot-edge/quickstart)
|  | [Quickstart: Send telemetry from a device to an IoT hub and monitor it with the Azure CLI](/azure/iot-hub/quickstart-send-telemetry-cli)
|  | [Tutorial - Use MQTT to develop an IoT device client without using a device SDK](/azure/iot/tutorial-use-mqtt)
|  | [Tutorial: Build out an end-to-end solution](/azure/digital-twins/tutorial-end-to-end)
|  | [Create and provision an IoT Edge for Linux on Windows device using symmetric keys](/azure/iot-edge/how-to-provision-single-device-linux-on-windows-symmetric)
|  | [Tutorial: Configure your devices from a back-end service](/azure/iot-hub/tutorial-device-twins)
| [az iot hub device-identity connection-string](/cli/azure/iot/hub/device-identity/connection-string) | [Create and provision an IoT Edge device on Linux using symmetric keys](/azure/iot-edge/how-to-provision-single-device-linux-symmetric)
|  | [Quickstart: Deploy your first IoT Edge module to a virtual Linux device](/azure/iot-edge/quickstart-linux)
|  | [Install and run the Spatial Analysis container (preview)](/azure/ai-services/computer-vision/spatial-analysis-container)
|  | [Quickstart: Deploy your first IoT Edge module to a Windows device](/azure/iot-edge/quickstart)
|  | [Tutorial: Build out an end-to-end solution](/azure/digital-twins/tutorial-end-to-end)
|  | [Create and provision an IoT Edge for Linux on Windows device using symmetric keys](/azure/iot-edge/how-to-provision-single-device-linux-on-windows-symmetric)
|  | [Use Visual Studio 2022 to develop and debug modules for Azure IoT Edge](/azure/iot-edge/how-to-visual-studio-develop-module)
|  | [Tutorial: Configure your devices from a back-end service](/azure/iot-hub/tutorial-device-twins)
|  | [Tutorial: Use a simulated device to test connectivity with your IoT hub](/azure/iot-hub/tutorial-connectivity)
|  | [Tutorial: Set up and use metrics and logs with an IoT hub](/azure/iot-hub/tutorial-use-metrics-and-diags)
| [az iot hub identity](/cli/azure/iot/hub/identity) | [Configure IoT Hub file uploads using Azure CLI](/azure/iot-hub/iot-hub-configure-file-upload-cli)
| [az iot hub module-identity](/cli/azure/iot/hub/module-identity) | [Deploy Azure IoT Edge modules with Azure CLI](/azure/iot-edge/how-to-deploy-modules-cli)

## az logic

|Reference subgroup|Article showing reference use
|---|---|
| [az logic workflow identity](/cli/azure/logic/workflow/identity) |

## az monitor

|Reference subgroup|Article showing reference use
|---|---|
| [az monitor app-insights workbook identity](/cli/azure/monitor/app-insights/workbook/identity) |

## az mysql

|Reference subgroup|Article showing reference use
|---|---|
| [az mysql flexible-server identity](/cli/azure/mysql/flexible-server/identity) | [Migrate an application to use passwordless connections with Azure Database for MySQL](/azure/developer/java/spring-framework/migrate-mysql-to-passwordless-connection)
|  | [Configure passwordless database connections for Java apps on Oracle WebLogic Servers](/azure/developer/java/ee/how-to-configure-passwordless-datasource)
|  | [Use Java and JDBC with Azure Database for MySQL - Flexible Server](/azure/mysql/flexible-server/connect-java)

## az network

|Reference subgroup|Article showing reference use
|---|---|
| [az network application-gateway identity](/cli/azure/network/application-gateway/identity) |
| [az network express-route port identity](/cli/azure/network/express-route/port/identity) |

## az nexusidentity

|Reference subgroup|Article showing reference use
|---|---|
| [az nexusidentity](/cli/azure/nexusidentity) |

## az policy

|Reference subgroup|Article showing reference use
|---|---|
| [az policy assignment identity](/cli/azure/policy) | [Built-in policies for Azure Monitor](/azure/azure-monitor/essentials/diagnostics-settings-policies-deployifnotexists)

## az postgres

|Reference subgroup|Article showing reference use
|---|---|
| [az postgres flexible-server identity](/cli/azure/postgres/flexible-server/identity) |

## az redis

|Reference subgroup|Article showing reference use
|---|---|
| [az redis identity](/cli/azure/redis/identity) | [Managed identity for storage](/azure/azure-cache-for-redis/cache-managed-identity)

## az servicebus

|Reference subgroup|Article showing reference use
|---|---|
| [az servicebus namespace identity](/cli/azure/servicebus/namespace/identity) |

## az signalr

|Reference subgroup|Article showing reference use
|---|---|
| [az signalr identity](/cli/azure/signalr/identity) |

## az spring

|Reference subgroup|Article showing reference use
|---|---|
| [az spring app identity](/cli/azure/spring/app/identity) | [Migrate a Python application to use passwordless connections with Azure SQL Database](/azure/azure-sql/database/azure-sql-passwordless-migration-python)
|  | [Migrate an application to use passwordless connections with Azure Blob Storage](/azure/storage/common/migrate-azure-credentials)
|  | [Migrate an application to use passwordless connections with Azure Database for PostgreSQL](/azure/developer/java/spring-framework/migrate-postgresql-to-passwordless-connection)
|  | [Migrate an application to use passwordless connections with Azure Service Bus](/azure/service-bus-messaging/service-bus-migrate-azure-credentials)
|  | [Enable system-assigned managed identity for an application in Azure Spring Apps](/azure/spring-apps/enterprise/how-to-enable-system-assigned-managed-identity)
|  | [Migrate an application to use passwordless connections with Azure Event Hubs](/azure/event-hubs/passwordless-migration-event-hubs)
|  | [Migrate a .NET application to use passwordless connections with Azure SQL Database](/azure/azure-sql/database/azure-sql-passwordless-migration)
|  | [Migrate a Node.js application to use passwordless connections with Azure SQL Database](/azure/azure-sql/database/azure-sql-passwordless-migration-nodejs)
|  | [Migrate a Java application to use passwordless connections with Azure SQL Database](/azure/developer/java/spring-framework/migrate-sql-database-to-passwordless-connection)
|  | [Migrate an application to use passwordless connections with Azure Database for MySQL](/azure/developer/java/spring-framework/migrate-mysql-to-passwordless-connection)

## az stack-hci

|Reference subgroup|Article showing reference use
|---|---|
| [az stack-hci cluster identity](/cli/azure/stack-hci/cluster/identity) |

## az staticwebapp

|Reference subgroup|Article showing reference use
|---|---|
| [az staticwebapp identity](/cli/azure/staticwebapp/identity) |

## az synapse

|Reference subgroup|Article showing reference use
|---|---|
| [az synapse workspace managed-identity](/cli/azure/synapse/workspace/managed-identity) | [Move an Azure Synapse Analytics workspace from one region to another](/azure/synapse-analytics/how-to-move-workspace-from-one-region-to-another)

## az vm

|Reference subgroup|Article showing reference use
|---|---|
| [az vm identity](/cli/azure/vm/identity) | [Sign in to a Linux virtual machine in Azure by using Microsoft Entra ID and OpenSSH](/entra/identity/devices/howto-vm-sign-in-azure-ad-linux)
|  | [Use an Azure managed identity to authenticate to an Azure container registry](/azure/container-registry/container-registry-authentication-managed-identity)
|  | [Use the Linux diagnostic extension 4.0 to monitor metrics and logs](/azure/virtual-machines/extensions/diagnostics-linux)
|  | [Connect with Managed Identity to Azure Database for PostgreSQL](/azure/postgresql/single-server/how-to-connect-with-managed-identity)
|  | [Authenticate Azure-hosted apps to Azure resources with the Azure SDK for .NET](/dotnet/azure/sdk/authentication/azure-hosted-apps)
|  | [Migrate a Python application to use passwordless connections with Azure SQL Database](/azure/azure-sql/database/azure-sql-passwordless-migration-python)
|  | [Send Prometheus metrics from virtual machines, scale sets, or Kubernetes clusters to an Azure Monitor workspace](/azure/azure-monitor/essentials/prometheus-remote-write-virtual-machines)
|  | [Authenticating Azure-hosted apps to Azure resources with the Azure SDK for Python](/azure/developer/python/sdk/authentication-azure-hosted-apps)
|  | [Migrate an application to use passwordless connections with Azure Blob Storage](/azure/storage/common/migrate-azure-credentials)
|  | [Migrate an application to use passwordless connections with Azure Database for PostgreSQL](/azure/developer/java/spring-framework/migrate-postgresql-to-passwordless-connection)

## az vmss

|Reference subgroup|Article showing reference use
|---|---|
| [az vmss identity](/cli/azure/vmss/identity) | [Sign in to a Linux virtual machine in Azure by using Microsoft Entra ID and OpenSSH](/entra/identity/devices/howto-vm-sign-in-azure-ad-linux)
|  | [Fail to pull images from Azure Container Registry to Azure Kubernetes Service cluster](/troubleshoot/azure/azure-kubernetes/extensions/cannot-pull-image-from-acr-to-aks-cluster)
|  | [Use the Linux diagnostic extension 4.0 to monitor metrics and logs](/azure/virtual-machines/extensions/diagnostics-linux)
|  | [Send Prometheus metrics from virtual machines, scale sets, or Kubernetes clusters to an Azure Monitor workspace](/azure/azure-monitor/essentials/prometheus-remote-write-virtual-machines)
|  | [Send Prometheus data to Azure Monitor by using managed identity authentication](/azure/azure-monitor/containers/prometheus-remote-write-managed-identity)
|  | [Create a chaos experiment that uses an agent-based fault with the Azure CLI](/azure/chaos-studio/chaos-studio-tutorial-agent-based-cli)
|  | [Connect your Azure identity provider to the Azure Key Vault Secrets Store CSI Driver in Azure Kubernetes Service (AKS)](/azure/aks/csi-secrets-store-identity-access)

## az vmware

|Reference subgroup|Article showing reference use
|---|---|
| [az vmware private-cloud identity](/cli/azure/vmware/private-cloud/identity) |
| [az vmware private-cloud identity-source](/cli/azure/vmware/private-cloud/identity-source) |

## az webapp

|Reference subgroup|Article showing reference use
|---|---|
| [az webapp identity](/cli/azure/webapp/identity) | [How to use managed identities for App Service and Azure Functions](/azure/app-service/overview-managed-identity)
|  | [Tutorial: Connect to SQL Database from .NET App Service without secrets using a managed identity](/azure/app-service/tutorial-connect-msi-sql-database)
|  | [Configure a custom container for Azure App Service](/azure/app-service/configure-custom-container)
|  | [Connect to and query Azure SQL Database using Python and the pyodbc driver](/azure/azure-sql/database/azure-sql-python-quickstart)
|  | [Migrate custom software to Azure App Service using a custom container](/azure/app-service/tutorial-custom-container)
|  | [Tutorial: Connect to Azure databases from App Service without secrets using a managed identity](/azure/app-service/tutorial-connect-msi-azure-database)
|  | [Authenticate Azure-hosted apps to Azure resources with the Azure SDK for .NET](/dotnet/azure/sdk/authentication/azure-hosted-apps)
|  | [Migrate a Python application to use passwordless connections with Azure SQL Database](/azure/azure-sql/database/azure-sql-passwordless-migration-python)
|  | [Authenticating Azure-hosted apps to Azure resources with the Azure SDK for Python](/azure/developer/python/sdk/authentication-azure-hosted-apps)
|  | [Migrate an application to use passwordless connections with Azure Blob Storage](/azure/storage/common/migrate-azure-credentials)
