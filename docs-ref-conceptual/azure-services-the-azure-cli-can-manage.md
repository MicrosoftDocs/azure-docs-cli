---
title: Azure services the Azure CLI can manage
description: Azure services the Azure CLI can manage - AI, ML, Analytics, Blockchain, Compute, Containers, Databases, DevOps, Identity, Integration, IoT, Networking, Security, Storage, Web, Mixed Reality, Multicloud, Management, Governance, Media, Migration, Mobile, Machine, Learning, Developer Tools, Hybrid
author: dbradish-microsoft
ms.author: dbradish
manager: barbkess
ms.date: 06/25/2021
ms.topic: conceptual
ms.prod: azure
ms.technology: azure-cli
ms.devlang: azurecli
ms.custom: devx-track-azurecli
---

# Azure services the Azure CLI can manage

The Azure CLI is available across many Azure services, and is a flexible yet powerful tool to create and manage Azure resources.  This article provides the list of Azure services the Azure CLI can manage.

## AI + Machine Learning

Use [AI + Machine Learning](/services/#ai-machine-learning) to create the next generation of applications using artificial intelligence capabilities for any developer and any scenario.

| Azure CLI references for service | Microsoft Docs
|-|-|
|[Azure Bot Service](/cli/azure/service-page/azure%20bot%20service)| [Identify providers](/azure/bot-service/bot-builder-concept-identity-providers)
|[Azure Databricks](/cli/azure/service-page/azure%20databricks)| [Build a data pipeline](/azure/devops/pipelines/apps/cd/azure/build-data-pipeline)
|[Azure Cognitive Search](/cli/azure/service-page/azure%20cognitive%20search)|[Manage your Azure Cognitive Search service](/azure/search/search-manage-azure-cli)
|[Azure Cognitive Services](/cli/azure/service-page/azure%20cognitive%20service) | [How to create and manage LUIS resources](/azure/cognitive-services/LUIS/luis-how-to-azure-subscription?tabs=cli)
|| [Configure Azure Cognitive Services virtual networks](/azure/cognitive-services/cognitive-services-virtual-networks?tabs=azure-cli)
|| [Quickstart: Create a Cognitive Services resource](/azure/cognitive-services/cognitive-services-apis-create-account-cli)
|[Azure Machine Learning](/cli/azure/service-page/azure%20machine%20learning)| [Manage roles in your workspace](/azure/machine-learning/how-to-assign-roles)
|| [Create and manage an Azure Machine Learning compute instance](/azure/machine-learning/how-to-create-manage-compute-instance?tabs=azure-cli)
|| [Create an Azure Machine Learning compute cluster](/azure/machine-learning/how-to-create-attach-compute-cluster?tabs=azure-cli)
|| [Configure a private endpoint for an Azure Machine Learning workspace](/azure/machine-learning/how-to-configure-private-link?tabs=azure-cli)

## Analytics

Use [Azure Analytics](/services/#ai-machine-learning) to gather, store, process, analyze, and visualize data of any variety, volume, or velocity.

| Azure CLI references for service | Microsoft Docs
|-|-|
|[Azure Data Explorer](/cli/azure/service-page/azure%20data%20explorer) | [Ingest blobs into Azure Data Explorer by subscribing to Event Grid notifications](/azure/data-explorer/ingest-data-event-grid)
|| [Ingest data from Apache Kafka into Azure Data Explorer](/azure/data-explorer/ingest-data-kafka)
|[Azure Data Factory](/cli/azure/service-page/azure%20data%20factory) | [Quickstart: Create an Azure Data Factory](/azure/data-factory/quickstart-create-data-factory-azure-cli)
|[Data Lake Analytics](/cli/azure/service-page/azure%20data%20lake%20analytics) | [Manage Azure Data Lake Analytics](/azure/data-lake-analytics/data-lake-analytics-manage-use-cli)
|[Azure Data Lake Storage](/cli/azure/service-page/azure%20data%20lake%20storage) |[Get started with Azure Data Lake Storage Gen1](/azure/data-lake-store/data-lake-store-get-started-cli-2.0)
|| [Get started with Azure Data Lake Analytics](/azure/data-lake-analytics/data-lake-analytics-get-started-cli)
|[Azure Data Share](azure-cli-reference-for-data-share.md) | [Tutorial: Share data using Azure Data Share](/azure/data-share/share-your-data?tabs=azure-cli)
|| [Accept and receive data using Azure Data Share](/azure/data-share/subscribe-to-data-share?tabs=azure-cli)
|[Azure Databricks](/cli/azure/service-page/azure%20databricks) | [Quickstart: Run a Spark job on Azure Databricks Workspace](/azure/databricks/scenarios/quickstart-create-databricks-workspace-portal?tabs=azure-cli)
|| [Build a data pipeline by using Azure Data Factory, DevOps, and ML](/azure/devops/pipelines/apps/cd/azure/build-data-pipeline?view=azure-devops)
|[Azure HDInsight](/cli/azure/service-page/azure%20hdinsight) | [Manage Azure HDInsight clusters](/azure/hdinsight/hdinsight-administer-use-command-line)
|| [Create an Apache Kafka REST proxy enabled cluster in HDInsight](/azure/hdinsight/kafka/tutorial-cli-rest-proxy)
|[Event Hubs](/cli/azure/service-page/azure%20event%20hubs) | [Route custom events to Azure Event Hubs](/azure/event-grid/custom-event-to-eventhub)
|| [Use Azure Event Hubs to receive change notifications](/graph/change-notifications-delivery#using-azure-event-hubs-to-receive-change-notifications)
|| [Visualize data anomalies in real-time events sent to Azure Event Hubs](/azure/event-hubs/event-hubs-tutorial-visualize-anomalies)
|[Azure Stream Analytics](/cli/azure/service-page/azure%20stream%20analytics) | [Create an Azure Stream Analytics job](/azure/stream-analytics/quick-create-azure-cli)
|[Azure Synapse Analytics](/cli/azure/service-page/azure%20synapse%20analytics) | [Create an Azure synapse workspace](/azure/synapse-analytics/quickstart-create-workspace-cli)
|| [Create a Synapse SQL pool](/azure/synapse-analytics/sql-data-warehouse/create-data-warehouse-azure-cli)
|[Power BI Embedded](/cli/azure/powerbi) | [Create Power BI Embedded capacity](/power-bi/developer/embedded/azure-pbie-create-capacity?tabs=CLI)

## Blockchain

Build and manage [blockchain](/services/#blockchain) based applications with a suite of integrated tools.

| Azure CLI references for service | Microsoft Docs
|-|-|
|[Blockchain](/cli/azure/service-page/azure%20blockchain)|[Create an Azure Blockchain Service blockchain member](/azure/blockchain/service/create-member-cli)
|| [Manage Azure Blockchain Service](/azure/blockchain/service/manage-cli)
|[Azure Cosmos DB](azure-cli-reference-for-cosmos-db.md) | [Create an Azure Cosmos account](/azure/cosmos-db/create-sql-api-dotnet-v4#create-account)
|| [Configure an IP access control policy](/azure/cosmos-db/how-to-configure-firewall#configure-ip-firewall-cli)
|| [Create custom role definitions](/azure/cosmos-db/how-to-setup-rbac#using-the-azure-cli)
|[Azure Logic Apps](/cli/azure/service-page/azure%20logic%20apps) | [Create and manage workflows in multi-tenant Azure Logic Apps](/azure/logic-apps/quickstart-logic-apps-azure-cli)
|| [Create and manage integration accounts for B2B enterprise integrations](/azure/logic-apps/logic-apps-enterprise-integration-create-integration-account?tabs=azure-cli)
|| [Create a Logic App sample script](/azure/logic-apps/sample-logic-apps-cli-script)

## Compute

Access cloud compute capacity and scale on demand—and only pay for the resources you use.  Whether you’re building new applications or deploying existing ones, [Azure compute](/product-categories/compute/) provides the infrastructure you need to run your apps.

| Azure CLI references for service | Microsoft Docs
|-|-|
|[App Service](/cli/azure/service-page/azure%20app%20service) | [How to use managed identities for App Service and Azure Functions](/azure/app-service/overview-managed-identity?tabs=dotnet#using-the-azure-cli)
|| [Configure App Service to deploy an image from the registry](/azure/app-service/tutorial-custom-container?pivots=container-linux#configure-app-service-to-deploy-the-image-from-the-registry)
||[Upload image data in the cloud with Azure Storage](/azure/storage/blobs/storage-upload-process-images?tabs=dotnet%2Cazure-cli#create-an-app-service-plan)
|[Azure Batch](/cli/azure/service-page/azure%20batch)
|[Azure Cloud Services](/cli/azure/service-page/azure%20cloud%20services%20(extended%20support))
|[Azure Container Instances](/cli/azure/service-page/azure%20container%20instances)
|[Azure Functions](/cli/azure/service-page/azure%20app%20functions) | [Manage your function app](/azure/azure-functions/functions-how-to-use-azure-function-app-settings?tabs=azurecli)
|| [How to target Azure Functions runtime versions](/azure/azure-functions/set-runtime-version?tabs=azurecli)
|[Azure Kubernetes Service (AKS)](/cli/azure/service-page/azure%20kubernetes%20service%20(aks)) | xxx
|[Azure Service Fabric](/cli/azure/service-page/azure%20service%20fabric) | xxx
|[Azure Spring Cloud](/cli/azure/service-page/azure%20spring%20cloud) | xxx
|[Azure Static Web Apps](/cli/azure/staticwebapp) | xxx
|[Azure Virtual Machines](/cli/azure/service-page/azure%20virtual%20machines) | xxx
|[Azure Virtual Machine Scale Sets (VMSS)](/cli/azure/vmss) | xxx
|[Azure VMWare Solution](/cli/azure/service-page/azure%20vmware%20solutions) | xxx
|[Azure Web Apps](/rest/api/appservice/webapps) | xxx

## Containers

Develop and manage your containerized applications faster with integrated tools.  Save costs by lifting and shifting your existing applications to [containers](/product-categories/containers/), and build microservices applications to deliver value to your users faster.

| Azure CLI references for service | Microsoft Docs
|-|-|
|[Azure Functions](/azure/azure-functions/) | xxx
|[Azure Kubernetes Service (AKS)](/azure/aks/) | xxx
|[Azure Red Hat OpenShift](/azure/openshift/) | xxx
|[Azure Service Fabric](/azure/service-fabric/) | xxx
|[Azure Web Apps](/rest/api/appservice/webapps) | xxx
|[Container Instances](/azure/container-instances/) | xxx
|[Container Registry](/azure/container-registry/) | xxx
|[Service Fabric](/azure/service-fabric/) | xxx

## Databases

Support rapid growth and innovate faster with secure, enterprise-grade, and fully managed [database services](/product-categories/databases/).

| Azure CLI references for service | Microsoft Docs
|-|-|
|[Azure API for FHIR](/azure/healthcare-apis/overview) | xxx
|[Azure Cache for Redis](/azure/azure-cache-for-redis/) | xxx
|[Azure Cosmos DB](/azure/cosmos-db/) | xxx
|[Azure Data Migration](/azure/dms/) | xxx
|[Azure Database for MariaDB](/azure/mariadb/) | xxx
|[Azure Database for MySQL](/azure/mysql/) | xxx
|[Azure Database for PostgreSQL](/azure/postgresql/) | xxx
|[Azure SQL Database](/azure/sql-database/) | xxx

## Developer Tools

Use Microsoft's comprehensive set of [development tools](/product-categories/developer-tools/) to build, manage, and continuously deliver cloud applications—using any platform or language.

| Azure CLI references for service | Microsoft Docs
|-|-|
|[App Configuration](/azure/azure-app-configuration/) | xxx
|[Azure DevOps](/azure/devops/) | xxx
|[Azure DevTest Labs](/azure/lab-services/) | xxx
|[Azure Lab Services](/azure/lab-services/classroom-labs/) | xxx
|[Azure Pipelines](/azure/devops/pipelines/) | xxx
|[Visual Studio](/visualstudio/codespaces/overview/what-is-vsonline) | xxx

## DevOps

Azure [DevOps](/product-categories/devops/) technologies deliver innovation faster with simple, reliable tools for continuous delivery.

| Azure CLI references for service | Microsoft Docs
|-|-|
|[Azure Artifacts](/azure/devops/artifacts/) | xxx
|[Azure Boards](/devops/boards/) | xxx
|[Azure DevOps](/azure/devops/) | xxx
|[Azure DevTest Labs](/azure/lab-services/) | xxx
|[Azure Monitor](/azure/azure-monitor/) | xxx
|[Azure Pipelines](/azure/devops/pipelines/) | xxx
|[Azure Repos](/azure/devops/repos/) | xxx

## Hybrid

| Azure CLI references for service | Microsoft Docs
|-|-|
|[Azure Active Directory (AD)](/azure/active-directory/) | xxx
|[Azure Arc](/azure/azure-arc/servers/overview) | xxx
|[Azure Database for PostgreSQL](/azure/postgresql/) | xxx
|[Azure DevOps](/azure/devops/) | xxx
|[Azure IoT Edge](/azure/iot-edge/) | xxx
|[Azure Security Center](/azure/security-center/) | xxx
|[Azure Sentinel](/azure/sentinel/overview) | xxx
|[Azure SQL Database](/azure/sql-database/) | xxx
|[Azure Stack HCI](/azure-stack/hci/) | xxx

## Identity

| Azure CLI references for service | Microsoft Docs
|-|-|
|[Azure Active Directory (AD)](/azure/active-directory/) | xxx

## Integration

| Azure CLI references for service | Microsoft Docs
|-|-|
|[API Management](/azure/api-management/) | xxx
|[Azure Logic Apps](/azure/logic-apps/) | xxx
|[Event Grid](/azure/event-grid/) | xxx
|[Service Bus](/azure/service-bus/) | xxx

## Internet of Things

| Azure CLI references for service | Microsoft Docs
|-|-|
|[API Management](/azure/api-management/) | xxx
|[Azure Cosmos DB](/azure/cosmos-db/) | xxx
|[Azure Functions](/azure/azure-functions/) | xxx
|[Azure IoT Central](/azure/iot-central/) | xxx
|[Azure IoT Edge](/azure/iot-edge/) | xxx
|[Azure IoT Hub](/azure/iot-hub/) | xxx
|[Azure Logic Apps](/azure/logic-apps/) | xxx
|[Azure Machine Learning](/azure/machine-learning/) | xxx
|[Azure Maps](/azure/azure-maps/) | xxx
|[Azure Notification Hubs](/azure/notification-hubs/) | xxx
|[Azure Stream Analytics](/azure/stream-analytics/) | xxx
|[Azure Time Series Insights](/azure/time-series-insights/) | xxx
|[Event Grid](/azure/event-grid/) | xxx

## Management and Governance

| Azure CLI references for service | Microsoft Docs
|-|-|
|[Automation](/azure/automation/automation-intro) | xxx
|[Azure Advisor](/azure/advisor/) | xxx
|[Azure Backup](/azure/backup/) | xxx
|[Azure Blueprint](/azure/governance/blueprints/) | xxx
|[Azure Cost Management and Billing](/azure/cost-management-billing/) | xxx
|[Azure Managed Applications](/azure/azure-resource-manager/managed-applications/) | xxx
|[Azure Monitor](/azure/azure-monitor/) | xxx
|[Azure Policy](/azure/governance/policy/) | xxx
|[Azure Resource Manager](/azure/azure-resource-manager/) | xxx
|[Azure Resource Manager templates](/azure/azure-resource-manager/templates/template-tutorial-deployment-script) | xxx
|[Traffic Manager](/azure/traffic-manager/) | xxx

## Media

| Azure CLI references for service | Microsoft Docs
|-|-|
|[Content Delivery Network](/azure/cdn/) | xxx
|[Media Services](/azure/media-services/) | xxx

## Migration

| Azure CLI references for service | Microsoft Docs
|-|-|
|[Azure Cost Management and Billing](/azure/cost-management-billing/) | xxx

## Mobile

| Azure CLI references for service | Microsoft Docs
|-|-|
|[API Management](/azure/api-management/) | xxx
|[App Service](/azure/app-service/) | xxx
|[Azure Cognitive Search](/azure/search/) | xxx
|[Azure Communication Service](/azure/communication-services/) | xxx
|[Azure Data Migration](/azure/dms/) | xxx
|[Azure Notification Hubs](/azure/notification-hubs/) | xxx
|[Spatial Anchors](/windows/mixed-reality/mixed-reality) | xxx

## Networking

| Azure CLI references for service | Microsoft Docs
|-|-|
|[Azure DNS](/azure/dns/) | xxx
|[Azure Private Link](/azure/private-link/) | xxx
|[Content Delivery Network](/azure/cdn/) | xxx
|[Load Balancer](/azure/load-balancer/) | xxx
|[Traffic Manager](/azure/traffic-manager/) | xxx
|[Virtual Network](/azure/virtual-network/) | xxx

## Security

| Azure CLI references for service | Microsoft Docs
|-|-|
|[Azure Active Directory (AD)](/azure/active-directory/) | xxx
|[Azure Dedicated HSM](/azure/dedicated-hsm/) | xxx
|[Azure Security Center](/azure/security-center/) | xxx
|[Azure Sentinel](/azure/sentinel/overview) | xxx
|[Key Vault](/azure/key-vault/) | xxx
|[Microsoft Azure Attestation](/azure/attestation/overview) | xxx

## Storage

| Azure CLI references for service | Microsoft Docs
|-|-|
|[Azure Backup](/azure/backup/) | xxx
|[Azure Data Lake Storage](/azure/storage/blobs/data-lake-storage-introduction/) | xxx
|[Azure Data Share](/azure/data-share/) | xxx
|[Azure Disk Storage](/azure/virtual-machines/windows/managed-disks-overview) | xxx
|[Azure HPC Cache](/azure/hpc-cache/hpc-cache-overview) | xxx
|[Azure NetApp Files](/azure/azure-netapp-files/) | xxx
|[Azure Storage](/azure/storage/) | xxx
|[Managed Disks](/azure/virtual-machines/windows/managed-disks-overview/) | xxx
|[Storage Accounts](/azure/storage/common/storage-account-overview/) | xxx

## Web

| Azure CLI references for service | Microsoft Docs
|-|-|
|[App Service](/azure/app-service/)
|[API Management](/azure/api-management/)
|[Azure Cognitive Search](/azure/search/)
|[Azure Communication Service](/azure/communication-services/)
|[Azure Notification Hubs](/azure/notification-hubs/)
|[Azure SignalR](/azure/azure-signalr/)
|[Azure Spring Cloud](/azure/spring-cloud/)
|[Azure Web Apps](/rest/api/appservice/webapps)
|[Content Delivery Network](/azure/cdn/)
|[Notification Hubs](/azure/notification-hubs/)
|[Static Web Apps](/azure/static-web-apps/overview)

## See also

- [Get started with the Azure CLI](get-started-with-azure-cli.md)
- [Command reference list for the Azure CLI](/cli/azure/reference-index)
