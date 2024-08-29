---
title: Use Azure CLI to manage Azure managed identities | Microsoft Docs
description: Find Azure CLI reference commands that manage Azure managed identities
ms.date: 09/22/2023
ms.topic: conceptual
ms.service: azure-cli
ms.custom: devx-track-azurecli, seo-azure-cli
keywords: az login, authentication types, authentication methods, azure, cli login, az login powershell, cli login, sign in, azure cli 
---

# Work with managed identities using the Azure CLI

There are many Azure CLI reference commands that help you to work with Azure identities. This article provides a list of Azure CLI commands and the quickstart, how-to guide or tutorial that shows the use of the command.

| Reference Group | Article |
|-|-|
| [az acr identity](/cli/azure/acr/identity) | 	[Troubleshoot a customer-managed key](/azure/container-registry/tutorial-troubleshoot-customer-managed-keys) |
| [az acr task identity](/cli/azure/acr/task/identity) | 	| |
| [az aks pod-identity](/cli/azure/aks/pod-identity) | 	[Best practices for authentication and authorization in Azure Kubernetes Service (AKS)](https://learn.microsoft.com/azure/aks/operator-best-practices-identity) |
| |	[Use Microsoft Entra pod-managed identities in Azure Kubernetes Service (Preview)](https://learn.microsoft.com/azure/aks/use-azure-ad-pod-identity) |
| |	[Migrate from pod managed-identity to workload identity](https://learn.microsoft.com/azure/aks/workload-identity-migrate-from-pod-identity) |
| [az aks pod-identity exception](/cli/azure/aks/pod-identity/exception) | 	[Troubleshoot Azure Kubernetes Service backup and restore](/azure/backup/azure-kubernetes-service-backup-troubleshoot) |
| |	[Use Microsoft Entra pod-managed identities in Azure Kubernetes Service (Preview)](https://learn.microsoft.com/azure/aks/use-azure-ad-pod-identity) |
| [az ams account identity](/cli/azure/ams/account/identity) | 	| |
| [az appconfig identity](/cli/azure/appconfig/identity) | 	[How to use managed identities for Azure App Configuration](/azure/azure-app-configuration/overview-managed-identity) |
| |	[Use customer-managed keys to encrypt your App Configuration data](/azure/azure-app-configuration/concept-customer-managed-keys) |
| [az backup vault identity](/cli/azure/backup/vault/identity) | 	[Encrypt backup data by using customer-managed keys](/azure/backup/encryption-at-rest-with-cmk) |
| |	[Save and manage MARS agent passphrase securely in Azure Key Vault](/azure/backup/save-backup-passphrase-securely-in-azure-key-vault) |
| [az batch account identity](/cli/azure/batch/account/identity) | 	| |
| [az cognitiveservices account identity](/cli/azure/cognitiveservices/account/identity) | 	| |
| [az communication identity](/cli/azure/communication/identity) | 	[How to use Managed Identity with Azure Communication Services](/azure/communication-services/how-tos/managed-identity) |
| [az communication identity token](/cli/azure/communication/identity/token) | 	[Adding visual effects to a video call](/azure/communication-services/concepts/voice-video-calling/video-effects) |
| |	[Pre-Call diagnostic](/azure/communication-services/concepts/voice-video-calling/pre-call-diagnostics) |
| |	[Quickstart: Join a room call](/azure/communication-services/quickstarts/rooms/join-rooms-call) |
| [az communication identity user](/cli/azure/communication/identity/user) | 	| |
| [az communication user-identity](/cli/azure/communication/user-identity) | 	| |
| [az communication user-identity token](/cli/azure/communication/user-identity/token) | 	| |
| [az communication user-identity user](/cli/azure/communication/user-identity/user) | 	| |
| [az containerapp env identity](/cli/azure/containerapp/env/identity) | 	| |
| [az containerapp identity](/cli/azure/containerapp/identity) | 	[Managed identities in Azure Container Apps](/azure/container-apps/managed-identity) |
| |	[Migrate a Java application to use passwordless connections with Azure SQL Database](/azure/developer/java/spring-framework/migrate-sql-database-to-passwordless-connection) |
| |	[Migrate an application to use passwordless connections with Azure Database for MySQL](/azure/developer/java/spring-framework/migrate-mysql-to-passwordless-connection) |
| |	[Migrate an application to use passwordless connections with Azure Database for PostgreSQL](/azure/developer/java/spring-framework/migrate-postgresql-to-passwordless-connection) |
| |	[Migrate an application to use passwordless connections with Azure Event Hubs for Kafka](/azure/developer/java/spring-framework/migrate-kafka-to-passwordless-connection) |
| |	[Migrate an application to use passwordless connections with Azure Service Bus](/azure/service-bus-messaging/service-bus-migrate-azure-credentials) |
| [az containerapp job identity](/cli/azure/containerapp/job/identity) | 	| |
| [az cosmosdb identity](/cli/azure/cosmosdb/identity) | 	[Access Azure Key Vault from Azure Cosmos DB using a managed identity](https://learn.microsoft.com/azure/cosmos-db/access-key-vault-managed-identity) |
| |	[Configure customer-managed keys for your Azure Cosmos DB account with Azure Managed HSM Key Vault](https://learn.microsoft.com/azure/cosmos-db/how-to-setup-customer-managed-keys-mhsm) |
| |	[Configure managed identities with Microsoft Entra ID for your Azure Cosmos DB account](https://learn.microsoft.com/azure/cosmos-db/how-to-setup-managed-identity) |
| |	[Create and manage container copy jobs in Azure Cosmos DB (Preview)](https://learn.microsoft.com/azure/cosmos-db/how-to-container-copy) |
| |	[Cross Tenant CMK Troubleshooting Guide](https://learn.microsoft.com/azure/cosmos-db/troubleshoot-cmk) |
| [az disk-encryption-set identity](/cli/azure/disk-encryption-set/identity) | 	| |
| [az dt identity](/cli/azure/dt/identity) | 	[Set up an Azure Digital Twins instance and authentication (CLI)](/azure/digital-twins/how-to-set-up-instance-cli) |
| [az eventhubs namespace identity](/cli/azure/eventhubs/namespace/identity) | 	| |
| [az functionapp identity](/cli/azure/functionapp/identity) | 	[Create your first containerized functions on Azure Container Apps](/azure/azure-functions/functions-deploy-container-apps) |
| |	[Enable linting and analysis for API governance in your API center](/azure/api-center/enable-api-analysis-linting) |
| |	[Set up deployment slots to enable zero downtime deployment in Azure Logic Apps (preview)](/azure/logic-apps/set-up-deployment-slots) |
| |	[Tutorial: Build out an end-to-end solution](/azure/digital-twins/tutorial-end-to-end) |
| [az identity](/cli/azure/identity) | 	[Add Azure Dedicated Host to an Azure Kubernetes Service (AKS) cluster](https://learn.microsoft.com/azure/aks/use-azure-dedicated-hosts) |
| |	[Add Key Management Service etcd encryption to an Azure Kubernetes Service cluster](https://learn.microsoft.com/azure/aks/use-kms-etcd-encryption) |
| |	[Authenticate and authorize App Service to a vector database](/dotnet/ai/how-to/app-service-db-auth) |
| |	[Authenticate and authorize App Service to Azure OpenAI using Microsoft Entra and the Semantic Kernel SDK](/dotnet/ai/how-to/app-service-aoai-auth) |
| |	[Authentication with the Azure SDK for Go using a managed identity](/azure/developer/go/azure-sdk-authentication-managed-identity) |
| |	[Azure Container Apps image pull with managed identity](/azure/container-apps/managed-identity-image-pull) |
| |	[Configure a user-assigned managed identity to trust an external identity provider](/entra/workload-id/workload-identity-federation-create-trust-user-assigned-managed-identity) |
| |	[Configure Azure VM Image Builder permissions by using the Azure CLI](/azure/virtual-machines/linux/image-builder-permissions-cli) |
| |	[Configure cross-tenant workload identity on Azure Kubernetes Service (AKS)](https://learn.microsoft.com/azure/aks/workload-identity-cross-tenant) |
| |	[Configure customer-managed keys for an Azure Elastic SAN](/azure/storage/elastic-san/elastic-san-configure-customer-managed-keys) |
| |	[Configure customer-managed keys for Azure NetApp Files volume encryption](/azure/azure-netapp-files/configure-customer-managed-keys) |
| |	[Configure MicroProfile with Azure Key Vault](/azure/developer/java/eclipse-microprofile/configure-microprofile-with-keyvault) |
| |	[Configure passwordless database connections for Java apps on Oracle WebLogic Servers](/azure/developer/java/ee/how-to-configure-passwordless-datasource) |
| |	[Connect an Azure Database for MySQL instance to your application in Azure Spring Apps](/azure/spring-apps/enterprise/how-to-bind-mysql) |
| |	[Connect Azure Spring Apps to Key Vault using managed identities](/azure/spring-apps/enterprise/tutorial-managed-identities-key-vault) |
| |	[Connect your Azure identity provider to the Azure Key Vault Secrets Store CSI Driver in Azure Kubernetes Service (AKS)](https://learn.microsoft.com/azure/aks/csi-secrets-store-identity-access) |
| |	[Connecting from your application to resources without handling credentials](/entra/identity/managed-identities-azure-resources/overview-for-developers) |
| |	[Create a cluster with Data Lake Storage Gen2 using Azure CLI](/azure/hdinsight/hdinsight-hadoop-use-data-lake-storage-gen2-azure-cli) |
| |	[Create a Linux image and distribute it to an Azure Compute Gallery](/azure/virtual-machines/linux/image-builder-gallery) |
| |	[Create a Linux image and distribute it to an Azure Compute Gallery by using the Azure CLI](/azure/virtual-machines/linux/image-builder) |
| |	[Create a managed or user-assigned NAT gateway for your Azure Kubernetes Service (AKS) cluster](https://learn.microsoft.com/azure/aks/nat-gateway) |
| |	[Create a Windows VM by using Azure VM Image Builder](/azure/virtual-machines/windows/image-builder) |
| |	[Create an Azure Kubernetes Service cluster with API Server VNet Integration (Preview)](https://learn.microsoft.com/azure/aks/api-server-vnet-integration) |
| |	[Create an image and use a user-assigned managed identity to access files in an Azure storage account](/azure/virtual-machines/linux/image-builder-user-assigned-identity) |
| |	[Create and deploy a Django web app to Azure with a user-assigned managed identity](/azure/developer/python/tutorial-python-managed-identity-user-assigned-cli) |
| |	[Create and manage  Azure Database for PostgreSQL - Flexible Server with data  encrypted by Customer Managed Keys (CMK) using the Azure CLI](https://learn.microsoft.com/azure/postgresql/flexible-server/how-to-create-server-customer-managed-key-cli) |
| |	[Create infrastructure for deploying a highly available PostgreSQL database on AKS](https://learn.microsoft.com/azure/aks/create-postgresql-ha) |
| |	[Create the infrastructure for running a Valkey cluster on Azure Kubernetes Service (AKS)](https://learn.microsoft.com/azure/aks/create-valkey-infrastructure) |
| |	[Deploy and configure workload identity on an Azure Kubernetes Service (AKS) cluster](https://learn.microsoft.com/azure/aks/workload-identity-deploy-cluster) |
| |	[Deploy to Azure Container Instances from Azure Container Registry using a managed identity](/azure/container-instances/using-azure-container-registry-mi) |
| |	[Enable a customer-managed key](/azure/container-registry/tutorial-enable-customer-managed-keys) |
| |	[Enable Group Managed Service Accounts (GMSA) for your Windows Server nodes on your Azure Kubernetes Service (AKS) cluster](https://learn.microsoft.com/azure/aks/use-group-managed-service-accounts) |
| |	[Encrypt deployment data](/azure/container-instances/container-instances-encrypt-data) |
| |	[Expose applications to the internet with TLS Termination at Application Gateway](/azure/spring-apps/enterprise/expose-apps-gateway-tls-termination) |
| |	[Expose applications with end-to-end TLS in a virtual network](/azure/spring-apps/enterprise/expose-apps-gateway-end-to-end-tls) |
| |	[Get started with SAP Deployment Automation Framework](/azure/sap/automation/get-started) |
| |	[How to use Azure Image Builder triggers to set up an automatic image build](/azure/virtual-machines/image-builder-triggers-how-to) |
| |	[How to use managed identities for App Service and Azure Functions](/azure/app-service/overview-managed-identity) |
| |	[How to use managed identities for Azure App Configuration](/azure/azure-app-configuration/overview-managed-identity) |
| |	[How to use managed identities with Azure Container Instances](/azure/container-instances/container-instances-managed-identity) |
| |	[How to use Managed Identity with Azure Communication Services](/azure/communication-services/how-tos/managed-identity) |
| |	[Install an Application Gateway Ingress Controller (AGIC) using an existing Application Gateway](/azure/application-gateway/ingress-controller-install-existing) |
| |	[Integrate KEDA with your Azure Kubernetes Service cluster](/azure/azure-monitor/containers/integrate-keda) |
| |	[Limit network traffic with Azure Firewall in Azure Kubernetes Service (AKS)](https://learn.microsoft.com/azure/aks/limit-egress-traffic) |
| |	[Manage node pools for a cluster in Azure Kubernetes Service (AKS)](https://learn.microsoft.com/azure/aks/manage-node-pools) |
| |	[Manage user-assigned managed identities](/entra/identity/managed-identities-azure-resources/how-manage-user-assigned-managed-identities) |
| |	[Managed identities in Azure Container Apps](/azure/container-apps/managed-identity) |
| |	[Migrate an application to use passwordless connections with Azure Database for MySQL](/azure/developer/java/spring-framework/migrate-mysql-to-passwordless-connection) |
| |	[Migrate Azure Database for MySQL - Single Server to Flexible Server using Azure Database for MySQL Import CLI](https://learn.microsoft.com/azure/mysql/migrate/migrate-single-flexible-mysql-import-cli) |
| |	[Migrate custom software to Azure App Service using a custom container](/azure/app-service/tutorial-custom-container) |
| |	[Migrate from pod managed-identity to workload identity](https://learn.microsoft.com/azure/aks/workload-identity-migrate-from-pod-identity) |
| |	[Provision and publish a bot](/azure/bot-service/provision-and-publish-a-bot) |
| |	[Quickstart: Deploy Application Gateway for Containers ALB Controller](/azure/application-gateway/for-containers/quickstart-deploy-application-gateway-for-containers-alb-controller) |
| |	[Run batch endpoints from Event Grid events in storage](/azure/machine-learning/how-to-use-event-grid-batch) |
| |	[Secure access to Azure OpenAI from Azure Kubernetes Service (AKS)](https://learn.microsoft.com/azure/aks/open-ai-secure-access-quickstart) |
| |	[Securely scale your applications using the KEDA add-on and workload identity on Azure Kubernetes Service (AKS)](https://learn.microsoft.com/azure/aks/keda-workload-identity) |
| |	[Send Prometheus data to Azure Monitor by using Microsoft Entra Workload ID (preview) authentication](/azure/azure-monitor/containers/prometheus-remote-write-azure-workload-identity) |
| |	[Send Prometheus metrics from virtual machines, scale sets, or Kubernetes clusters to an Azure Monitor workspace](/azure/azure-monitor/essentials/prometheus-remote-write-virtual-machines) |
| |	[Tutorial: Connect a web app to Azure App Configuration with Service Connector](/azure/service-connector/tutorial-connect-web-app-app-configuration) |
| |	[Tutorial: Connect to a MySQL Database from Java JBoss EAP App Service with passwordless connection](/azure/service-connector/tutorial-java-jboss-connect-managed-identity-mysql-database) |
| |	[Tutorial: Connect to Azure OpenAI Service in AKS using Workload Identity (preview)](/azure/service-connector/tutorial-python-aks-openai-workload-identity) |
| |	[Tutorial: Connect to Azure storage account in Azure Kubernetes Service (AKS) with Service Connector using workload identity](/azure/service-connector/tutorial-python-aks-storage-workload-identity) |
| |	[Tutorial: Deploy a Dapr application to Azure Container Apps using the Azure CLI](/azure/container-apps/microservices-dapr) |
| |	[Tutorial: Deploy a Java app to a virtual machine scale set](/azure/devops/pipelines/apps/cd/azure/deploy-virtual-scale-set-java) |
| |	[Tutorial: Deploy a Spring application to Azure Spring Apps with a passwordless connection to an Azure database](/azure/developer/java/spring-framework/deploy-passwordless-spring-database-app) |
| |	[Update application code for the event-driven workflow (EDW) workload](https://learn.microsoft.com/azure/aks/eks-edw-refactor) |
| |	[Use a managed identity in Azure Kubernetes Service (AKS)](https://learn.microsoft.com/azure/aks/use-managed-identity) |
| |	[Use an Azure managed identity to authenticate to an Azure container registry](/azure/container-registry/container-registry-authentication-managed-identity) |
| |	[Use an Azure-managed identity in ACR Tasks](/azure/container-registry/container-registry-tasks-authentication-managed-identity) |
| |	[Use Azure VM Image Builder for Linux VMs to access an existing Azure virtual network](/azure/virtual-machines/linux/image-builder-vnet) |
| |	[Use Java and JDBC with Azure Database for MySQL - Flexible Server](https://learn.microsoft.com/azure/mysql/flexible-server/connect-java) |
| |	[Use kubenet networking with your own IP address ranges in Azure Kubernetes Service (AKS)](https://learn.microsoft.com/azure/aks/configure-kubenet) |
| |	[Use managed identities for Azure Load Testing](/azure/load-testing/how-to-use-a-managed-identity) |
| |	[Use Microsoft Entra pod-managed identities in Azure Kubernetes Service (Preview)](https://learn.microsoft.com/azure/aks/use-azure-ad-pod-identity) |
| |	[Assign Azure roles using Azure CLI](/azure/role-based-access-control/role-assignments-cli) |
| |	[Create a new VM image from an existing image by using Azure VM Image Builder in Linux](/azure/virtual-machines/linux/image-builder-gallery-update-image-version) |
| |	[Create a new Windows VM image from an existing image by using Azure VM Image Builder](/azure/virtual-machines/windows/image-builder-gallery-update-image-version) |
| |	[How to Install an Application Gateway Ingress Controller (AGIC) Using a New Application Gateway](/azure/application-gateway/ingress-controller-install-new) |
| |	[Transfer an Azure subscription to a different Microsoft Entra directory](/azure/role-based-access-control/transfer-subscription) |
| |	[Tutorial: Use deployment scripts to create a self-signed certificate](/azure/azure-resource-manager/templates/template-tutorial-deployment-script) |
| |	[View associated Azure resources for a user-assigned managed identity (Preview)](/entra/identity/managed-identities-azure-resources/how-to-view-associated-resources-for-an-identity) |
| |	[Configure a custom container for Azure App Service](/azure/app-service/configure-custom-container) |
| |	[Configure cross-tenant customer-managed keys for a new storage account](/azure/storage/common/customer-managed-keys-configure-cross-tenant-new-account) |
| |	[Configure cross-tenant customer-managed keys for an existing storage account](/azure/storage/common/customer-managed-keys-configure-cross-tenant-existing-account) |
| |	[Configure customer-managed keys for your Azure Cosmos DB account with Azure Managed HSM Key Vault](https://learn.microsoft.com/azure/cosmos-db/how-to-setup-customer-managed-keys-mhsm) |
| |	[Deploy an AI model on Azure Kubernetes Service (AKS) with the AI toolchain operator (preview)](https://learn.microsoft.com/azure/aks/ai-toolchain-operator) |
| |	[Push and pull Helm charts to an Azure container registry](/azure/container-registry/container-registry-helm-repos) |
| |	[Quickstart: Create Application Gateway for Containers - bring your own deployment](/azure/application-gateway/for-containers/quickstart-create-application-gateway-for-containers-byo-deployment) |
| |	[Quickstart: Create Application Gateway for Containers managed by ALB Controller](/azure/application-gateway/for-containers/quickstart-create-application-gateway-for-containers-managed-by-alb-controller) |
| [az identity federated-credential](/cli/azure/identity/federated-credential) | 	[Configure a user-assigned managed identity to trust an external identity provider](/entra/workload-id/workload-identity-federation-create-trust-user-assigned-managed-identity) |
| |	[Configure and deploy a Valkey cluster on Azure Kubernetes Service (AKS)](https://learn.microsoft.com/azure/aks/deploy-valkey-cluster) |
| |	[Configure cross-tenant workload identity on Azure Kubernetes Service (AKS)](https://learn.microsoft.com/azure/aks/workload-identity-cross-tenant) |
| |	[Connect your Azure identity provider to the Azure Key Vault Secrets Store CSI Driver in Azure Kubernetes Service (AKS)](https://learn.microsoft.com/azure/aks/csi-secrets-store-identity-access) |
| |	[Deploy a highly available PostgreSQL database on AKS](https://learn.microsoft.com/azure/aks/deploy-postgresql-ha) |
| |	[Deploy an AI model on Azure Kubernetes Service (AKS) with the AI toolchain operator (preview)](https://learn.microsoft.com/azure/aks/ai-toolchain-operator) |
| |	[Deploy and configure workload identity on an Azure Kubernetes Service (AKS) cluster](https://learn.microsoft.com/azure/aks/workload-identity-deploy-cluster) |
| |	[Integrate KEDA with your Azure Kubernetes Service cluster](/azure/azure-monitor/containers/integrate-keda) |
| |	[Migrate from pod managed-identity to workload identity](https://learn.microsoft.com/azure/aks/workload-identity-migrate-from-pod-identity) |
| |	[Quickstart: Deploy Application Gateway for Containers ALB Controller](/azure/application-gateway/for-containers/quickstart-deploy-application-gateway-for-containers-alb-controller) |
| |	[Secure access to Azure OpenAI from Azure Kubernetes Service (AKS)](https://learn.microsoft.com/azure/aks/open-ai-secure-access-quickstart) |
| |	[Securely scale your applications using the KEDA add-on and workload identity on Azure Kubernetes Service (AKS)](https://learn.microsoft.com/azure/aks/keda-workload-identity) |
| |	[Send Prometheus data to Azure Monitor by using Microsoft Entra Workload ID (preview) authentication](/azure/azure-monitor/containers/prometheus-remote-write-azure-workload-identity) |
| |	[Tutorial: Deploy applications using GitOps with Flux v2](/azure/azure-arc/kubernetes/tutorial-use-gitops-flux2) |
| [az image builder identity](/cli/azure/image/builder/identity) | 	[Troubleshoot Azure VM Image Builder](/azure/virtual-machines/linux/image-builder-troubleshoot) |
| [az iot central app identity](/cli/azure/iot/central/app/identity) | 	[Export IoT data to Azure Data Explorer](/azure/iot-central/core/howto-export-to-azure-data-explorer) |
| |	[Export IoT data to Blob Storage](/azure/iot-central/core/howto-export-to-blob-storage) |
| |	[Export IoT data to Event Hubs](/azure/iot-central/core/howto-export-to-event-hubs) |
| |	[Export IoT data to Service Bus](/azure/iot-central/core/howto-export-to-service-bus) |
| |	[Manage and monitor IoT Central applications](/azure/iot-central/core/howto-manage-and-monitor-iot-central) |
| [az iot hub device-identity](/cli/azure/iot/hub/device-identity) | 	[Authenticate a downstream device to Azure IoT Hub](/azure/iot-edge/how-to-authenticate-downstream-device) |
| |	[Create and manage device identities](/azure/iot-hub/create-connect-device) |
| |	[Deploy a Spatial Analysis web application](/azure/ai-services/computer-vision/spatial-analysis-web-app) |
| |	[Get started with device management (Azure CLI)](/azure/iot-hub/device-management-cli) |
| |	[Install and run the Spatial Analysis container (preview)](/azure/ai-services/computer-vision/spatial-analysis-container) |
| |	[Quickstart: Create a Stream Analytics job using Azure PowerShell](/azure/stream-analytics/stream-analytics-quick-create-powershell) |
| |	[Quickstart: Create an Azure Stream Analytics job using the Azure CLI](/azure/stream-analytics/quick-create-azure-cli) |
| |	[Quickstart: Deploy an Azure IoT hub and a storage account using an ARM template](/azure/iot-hub/horizontal-arm-route-messages) |
| |	[Quickstart: Deploy an Azure IoT hub and a storage account using Bicep](/azure/iot-hub/quickstart-bicep-route-messages) |
| |	[Quickstart: Deploy your first IoT Edge module to a virtual Linux device](/azure/iot-edge/quickstart-linux) |
| |	[Quickstart: Deploy your first IoT Edge module to a Windows device](/azure/iot-edge/quickstart) |
| |	[Quickstart: Send telemetry from a device to an IoT hub and monitor it with the Azure CLI](/azure/iot-hub/quickstart-send-telemetry-cli) |
| |	[Schedule and broadcast jobs (Azure CLI)](/azure/iot-hub/schedule-jobs-cli) |
| |	[Tutorial - Use MQTT to develop an IoT device client without using a device SDK](/azure/iot/tutorial-use-mqtt) |
| |	[Tutorial: Build out an end-to-end solution](/azure/digital-twins/tutorial-end-to-end) |
| |	[Tutorial: Configure your devices from a back-end service](/azure/iot-hub/tutorial-device-twins) |
| |	[Tutorial: Configure, connect, and verify an IoT Edge module for a GPU](/azure/iot-edge/configure-connect-verify-gpu) |
| |	[Tutorial: Send device data to Azure Storage using IoT Hub message routing](/azure/iot-hub/tutorial-routing) |
| |	[Tutorial: Send email notifications about Azure IoT Hub events using Event Grid and Logic Apps](/azure/event-grid/publish-iot-hub-events-to-logic-apps) |
| |	[Tutorial: Set up and use metrics and logs with an IoT hub](/azure/iot-hub/tutorial-use-metrics-and-diags) |
| |	[Tutorial: Visualize IoT device data from IoT Hub using Azure Web PubSub service and Azure Functions](/azure/azure-web-pubsub/tutorial-serverless-iot) |
| |	[How to automatically migrate an IoT hub using the Azure CLI](/azure/iot-hub/migrate-hub-state-cli) |
| |	[Managing public network access for your IoT hub](/azure/iot-hub/iot-hub-public-network-access) |
| |	[Tutorial: Use a simulated device to test connectivity with your IoT hub](/azure/iot-hub/tutorial-connectivity) |
| [az iot hub device-identity children](/cli/azure/iot/hub/device-identity/children) | 	| |
| [az iot hub device-identity connection-string](/cli/azure/iot/hub/device-identity/connection-string) | 	[Create and manage device identities](/azure/iot-hub/create-connect-device) |
| |	[Install and run the Spatial Analysis container (preview)](/azure/ai-services/computer-vision/spatial-analysis-container) |
| |	[Install software and set up resources for the tutorial](/azure/azure-sql-edge/tutorial-deploy-azure-resources) |
| |	[Quickstart: Create a Stream Analytics job using Azure PowerShell](/azure/stream-analytics/stream-analytics-quick-create-powershell) |
| |	[Quickstart: Create an Azure Stream Analytics job using the Azure CLI](/azure/stream-analytics/quick-create-azure-cli) |
| |	[Quickstart: Deploy your first IoT Edge module to a virtual Linux device](/azure/iot-edge/quickstart-linux) |
| |	[Quickstart: Deploy your first IoT Edge module to a Windows device](/azure/iot-edge/quickstart) |
| |	[Run Azure IoT Edge on Ubuntu Virtual Machines](/azure/iot-edge/how-to-install-iot-edge-ubuntuvm) |
| |	[Run Azure IoT Edge on Ubuntu Virtual Machines by using Bicep](/azure/iot-edge/how-to-install-iot-edge-ubuntuvm-bicep) |
| |	[Tutorial: Build out an end-to-end solution](/azure/digital-twins/tutorial-end-to-end) |
| |	[Tutorial: Configure your devices from a back-end service](/azure/iot-hub/tutorial-device-twins) |
| |	[Tutorial: Set up and use metrics and logs with an IoT hub](/azure/iot-hub/tutorial-use-metrics-and-diags) |
| |	[Tutorial: Use a simulated device to test connectivity with your IoT hub](/azure/iot-hub/tutorial-connectivity) |
| |	[Tutorial: Visualize IoT device data from IoT Hub using Azure Web PubSub service and Azure Functions](/azure/azure-web-pubsub/tutorial-serverless-iot) |
| |	[Use Visual Studio 2022 to develop and debug modules for Azure IoT Edge](/azure/iot-edge/how-to-visual-studio-develop-module) |
| [az iot hub device-identity parent](/cli/azure/iot/hub/device-identity/parent) | 	| |
| [az iot hub identity](/cli/azure/iot/hub/identity) | 	[Configure IoT Hub file uploads using Azure CLI](/azure/iot-hub/iot-hub-configure-file-upload-cli) |
| [az iot hub module-identity](/cli/azure/iot/hub/module-identity) | 	[Deploy Azure IoT Edge modules with Azure CLI](/azure/iot-edge/how-to-deploy-modules-cli) |
| |	[Give Azure IoT Edge modules access to a device's local storage](/azure/iot-edge/how-to-access-host-storage-from-module) |
| [az iot hub module-identity connection-string](/cli/azure/iot/hub/module-identity/connection-string) | 	| |
| [az logic workflow identity](/cli/azure/logic/workflow/identity) | 	| |
| [az ml computetarget amlcompute identity](/cli/azure/ml/computetarget/amlcompute/identity) | 	[Create an Azure Machine Learning compute cluster with CLI v1](/azure/machine-learning/v1/how-to-create-attach-compute-cluster) |
| |	[Install & use the CLI (v1)](/azure/machine-learning/v1/reference-azure-machine-learning-cli) |
| |	[Use Managed identities with Azure Machine Learning  CLI v1](/azure/machine-learning/v1/how-to-use-managed-identities) |
| [az ml[v1] computetarget amlcompute identity](/cli/azure/ml[v1]/computetarget/amlcompute/identity) | 	| |
| [az monitor app-insights workbook identity](/cli/azure/monitor/app-insights/workbook/identity) | 	| |
| [az mysql flexible-server identity](/cli/azure/mysql/flexible-server/identity) | 	[Configure passwordless database connections for Java apps on Oracle WebLogic Servers](/azure/developer/java/ee/how-to-configure-passwordless-datasource) |
| |	[Migrate an application to use passwordless connections with Azure Database for MySQL](/azure/developer/java/spring-framework/migrate-mysql-to-passwordless-connection) |
| |	[Use Java and JDBC with Azure Database for MySQL - Flexible Server](https://learn.microsoft.com/azure/mysql/flexible-server/connect-java) |
| [az network application-gateway identity](/cli/azure/network/application-gateway/identity) | 	| |
| [az network express-route port identity](/cli/azure/network/express-route/port/identity) | 	| |
| [az nexusidentity](/cli/azure/nexusidentity) | 	| |
| [az policy assignment identity](/cli/azure/policy/assignment/identity) | 	| |
| [az policy ment identity](/cli/azure/policy) | 	[Built-in policies for Azure Monitor](/azure/azure-monitor/essentials/diagnostics-settings-policies-deployifnotexists) |
| |	[Remediate non-compliant resources with Azure Policy](/azure/governance/policy/how-to/remediate-resources) |
| [az postgres flexible-server identity](/cli/azure/postgres/flexible-server/identity) | 	| |
| [az redis identity](/cli/azure/redis/identity) | 	[Managed identity for storage](/azure/azure-cache-for-redis/cache-managed-identity) |
| [az servicebus namespace identity](/cli/azure/servicebus/namespace/identity) | 	| |
| [az signalr identity](/cli/azure/signalr/identity) | 	| |
| [az spring app identity](/cli/azure/spring/app/identity) | 	[Enable system-assigned managed identity for an application in Azure Spring Apps](/azure/spring-apps/enterprise/how-to-enable-system-assigned-managed-identity) |
| |	[Manage user-assigned managed identities for an application in Azure Spring Apps](/azure/spring-apps/enterprise/how-to-manage-user-assigned-managed-identities) |
| |	[Migrate a Java application to use passwordless connections with Azure SQL Database](/azure/developer/java/spring-framework/migrate-sql-database-to-passwordless-connection) |
| |	[Migrate an application to use passwordless connections with Azure Database for MySQL](/azure/developer/java/spring-framework/migrate-mysql-to-passwordless-connection) |
| |	[Migrate an application to use passwordless connections with Azure Database for PostgreSQL](/azure/developer/java/spring-framework/migrate-postgresql-to-passwordless-connection) |
| |	[Migrate an application to use passwordless connections with Azure Event Hubs for Kafka](/azure/developer/java/spring-framework/migrate-kafka-to-passwordless-connection) |
| |	[Migrate an application to use passwordless connections with Azure Service Bus](/azure/service-bus-messaging/service-bus-migrate-azure-credentials) |
| |	[Quickstart: Load application secrets using Key Vault](/azure/spring-apps/enterprise/quickstart-key-vault-enterprise) |
| [az spring-cloud app identity](/cli/azure/spring-cloud/app/identity) | 	| |
| [az stack-hci arc-setting](/cli/azure/stack-hci/arc-setting) | 	| |
| [az stack-hci cluster](/cli/azure/stack-hci/cluster) | 	| |
| [az stack-hci cluster identity](/cli/azure/stack-hci/cluster/identity) | 	| |
| [az staticwebapp identity](/cli/azure/staticwebapp/identity) | 	| |
| [az synapse workspace managed-identity](/cli/azure/synapse/workspace/managed-identity) | 	[Move an Azure Synapse Analytics workspace from one region to another](/azure/synapse-analytics/how-to-move-workspace-from-one-region-to-another) |
| [az vm identity](/cli/azure/vm/identity) | 	[Authentication with the Azure SDK for Go using a managed identity](/azure/developer/go/azure-sdk-authentication-managed-identity) |
| |	[Configure storage for Azure Application Consistent Snapshot tool](/azure/azure-netapp-files/azacsnap-configure-storage) |
| |	[Connect with Managed Identity to Azure Database for PostgreSQL](https://learn.microsoft.com/azure/postgresql/single-server/how-to-connect-with-managed-identity) |
| |	[Connect with managed identity to Azure Database for PostgreSQL - Flexible Server](https://learn.microsoft.com/azure/postgresql/flexible-server/how-to-connect-with-managed-identity) |
| |	[Connect your Azure identity provider to the Azure Key Vault Secrets Store CSI Driver in Azure Kubernetes Service (AKS)](https://learn.microsoft.com/azure/aks/csi-secrets-store-identity-access) |
| |	[Create a chaos experiment that uses an agent-based fault with the Azure CLI](/azure/chaos-studio/chaos-studio-tutorial-agent-based-cli) |
| |	[Migrate a Java application to use passwordless connections with Azure SQL Database](/azure/developer/java/spring-framework/migrate-sql-database-to-passwordless-connection) |
| |	[Migrate an application to use passwordless connections with Azure Database for MySQL](/azure/developer/java/spring-framework/migrate-mysql-to-passwordless-connection) |
| |	[Migrate an application to use passwordless connections with Azure Database for PostgreSQL](/azure/developer/java/spring-framework/migrate-postgresql-to-passwordless-connection) |
| |	[Migrate an application to use passwordless connections with Azure Event Hubs for Kafka](/azure/developer/java/spring-framework/migrate-kafka-to-passwordless-connection) |
| |	[Migrate an application to use passwordless connections with Azure Service Bus](/azure/service-bus-messaging/service-bus-migrate-azure-credentials) |
| |	[Send Prometheus metrics from virtual machines, scale sets, or Kubernetes clusters to an Azure Monitor workspace](/azure/azure-monitor/essentials/prometheus-remote-write-virtual-machines) |
| |	[Sign in to a Linux virtual machine in Azure by using Microsoft Entra ID and OpenSSH](/entra/identity/devices/howto-vm-sign-in-azure-ad-linux) |
| |	[Use an Azure managed identity to authenticate to an Azure container registry](/azure/container-registry/container-registry-authentication-managed-identity) |
| |	[Use the Linux diagnostic extension 4.0 to monitor metrics and logs](/azure/virtual-machines/extensions/diagnostics-linux) |
| [az vmss identity](/cli/azure/vmss/identity) | 	[Connect your Azure identity provider to the Azure Key Vault Secrets Store CSI Driver in Azure Kubernetes Service (AKS)](https://learn.microsoft.com/azure/aks/csi-secrets-store-identity-access) |
| |	[Create a chaos experiment that uses an agent-based fault with the Azure CLI](/azure/chaos-studio/chaos-studio-tutorial-agent-based-cli) |
| |	[Send Prometheus data to Azure Monitor by using managed identity authentication](/azure/azure-monitor/containers/prometheus-remote-write-managed-identity) |
| |	[Send Prometheus metrics from virtual machines, scale sets, or Kubernetes clusters to an Azure Monitor workspace](/azure/azure-monitor/essentials/prometheus-remote-write-virtual-machines) |
| |	[Sign in to a Linux virtual machine in Azure by using Microsoft Entra ID and OpenSSH](/entra/identity/devices/howto-vm-sign-in-azure-ad-linux) |
| |	[Use the Linux diagnostic extension 4.0 to monitor metrics and logs](/azure/virtual-machines/extensions/diagnostics-linux) |
| |	[Fail to pull images from Azure Container Registry to Azure Kubernetes Service cluster](/troubleshoot/azure/azure-kubernetes/extensions/cannot-pull-image-from-acr-to-aks-cluster) |
| [az vmware private-cloud](/cli/azure/vmware/private-cloud) | 	| |
| [az vmware private-cloud identity](/cli/azure/vmware/private-cloud/identity) | 	| |
| [az vmware private-cloud identity-source](/cli/azure/vmware/private-cloud/identity-source) | 	| |
| [az webapp identity](/cli/azure/webapp/identity) | 	[Authenticate and authorize App Service to a vector database](/dotnet/ai/how-to/app-service-db-auth) |
| |	[Authenticate and authorize App Service to Azure OpenAI using Microsoft Entra and the Semantic Kernel SDK](/dotnet/ai/how-to/app-service-aoai-auth) |
| |	[Configure a custom container for Azure App Service](/azure/app-service/configure-custom-container) |
| |	[Connect to and query Azure SQL Database using Python and the pyodbc driver](/azure/azure-sql/database/azure-sql-python-quickstart) |
| |	[Create and deploy a Django web app to Azure with a user-assigned managed identity](/azure/developer/python/tutorial-python-managed-identity-user-assigned-cli) |
| |	[How to use managed identities for App Service and Azure Functions](/azure/app-service/overview-managed-identity) |
| |	[Migrate a Java application to use passwordless connections with Azure SQL Database](/azure/developer/java/spring-framework/migrate-sql-database-to-passwordless-connection) |
| |	[Migrate an application to use passwordless connections with Azure Database for MySQL](/azure/developer/java/spring-framework/migrate-mysql-to-passwordless-connection) |
| |	[Migrate an application to use passwordless connections with Azure Database for PostgreSQL](/azure/developer/java/spring-framework/migrate-postgresql-to-passwordless-connection) |
| |	[Migrate an application to use passwordless connections with Azure Event Hubs for Kafka](/azure/developer/java/spring-framework/migrate-kafka-to-passwordless-connection) |
| |	[Migrate an application to use passwordless connections with Azure Service Bus](/azure/service-bus-messaging/service-bus-migrate-azure-credentials) |
| |	[Migrate custom software to Azure App Service using a custom container](/azure/app-service/tutorial-custom-container) |
| |	[Tutorial: Connect to SQL Database from .NET App Service without secrets using a managed identity](/azure/app-service/tutorial-connect-msi-sql-database) |
| |	[Tutorial: Connect to Azure databases from App Service without secrets using a managed identity](/azure/app-service/tutorial-connect-msi-azure-database) |



## See also

* Azure CLI [samples](./samples-index.md) and an [A to Z list](./reference-docs-index.md) of reference commands used in Azure articles.
