---
title: List of Azure services the Azure CLI can manage | Microsoft Docs
description: The Azure CLI can create and manage various Azure resources — view links to Azure services the Azure CLI can manage, organized by groups.
author: dbradish-microsoft
ms.author: dbradish
manager: barbkess
ms.date: 08/01/2021
ms.topic: conceptual
ms.prod: azure
ms.technology: azure-cli
ms.devlang: azurecli
ms.custom: devx-track-azurecli, seo-azure-cli
keywords: azure service management, azure services list, azure resources list
---

# List of Azure services the Azure CLI can manage

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
| |[Configure App Service to deploy an image from the registry](/azure/app-service/tutorial-custom-container?pivots=container-linux#configure-app-service-to-deploy-the-image-from-the-registry)
| |[Upload image data in the cloud with Azure Storage](/azure/storage/blobs/storage-upload-process-images?tabs=dotnet%2Cazure-cli#create-an-app-service-plan)
|[Azure Batch](/cli/azure/service-page/azure%20batch) | [Run your first Batch job](/azure/batch/quick-create-cli)
|[Azure Cloud Services](/cli/azure/service-page/azure%20cloud%20services%20(extended%20support))
|[Azure Container Instances](/cli/azure/service-page/azure%20container%20instances)| [Deploy a container instance in Azure](/azure/container-instances/container-instances-quickstart)
|[Azure Functions](/cli/azure/service-page/azure%20functions) | [Manage your function app](/azure/azure-functions/functions-how-to-use-azure-function-app-settings?tabs=azurecli)
| |[How to target Azure Functions runtime versions](/azure/azure-functions/set-runtime-version?tabs=azurecli)
|[Azure Kubernetes Service (AKS)](/cli/azure/service-page/azure%20kubernetes%20service%20(aks)) | [Deploy an AKS cluster](/azure/aks/kubernetes-walkthrough)
| |[Create and manage multiple node pools for a cluster in AKS](/azure/aks/use-multiple-node-pools)
|[Azure Service Fabric](/cli/azure/service-page/azure%20service%20fabric) | [Deploy Linux containers to Service Fabric](/azure/service-fabric/service-fabric-quickstart-containers-linux#create-a-service-fabric-cluster)
| |[Create a Service Fabric cluster](/azure/service-fabric/service-fabric-cluster-creation-via-arm)
|[Azure Spring Cloud](/cli/azure/service-page/azure%20spring%20cloud) | [Read a secret from Azure Key Vault in a Spring Boot application](/azure/developer/java/spring-framework/configure-spring-boot-starter-java-app-with-azure-key-vault#deploy-to-azure-spring-cloud)
|[Azure Static Web Apps](/cli/azure/staticwebapp) | [Build your first static site](/azure/static-web-apps/get-started-cli?tabs=vanilla-javascript)
|[Azure Virtual Machines](/cli/azure/service-page/azure%20virtual%20machines) | [Create a Linux VM](/azure/virtual-machines/linux/quick-create-cli)
| |[Create a Windows VM](/azure/virtual-machines/windows/quick-create-cli)
|[Azure Virtual Machine Scale Sets (VMSS)](/cli/azure/vmss) | [Create a Linux VM with Accelerated Networking](/azure/virtual-network/create-vm-accelerated-networking-cli#vmss)
|[Azure VMWare Solution](/cli/azure/service-page/azure%20vmware%20solutions) | [Attach disk pools to Azure VMware Solution hosts](/azure/azure-vmware/attach-disk-pools-to-azure-vmware-solution-hosts)
|[Azure Web Apps](/cli/azure/service-page/azure%20web%20apps) | [How to use managed identities for App Service and Azure Functions](/azure/app-service/overview-managed-identity?tabs=dotnet#using-the-azure-cli)
| |[Configure a custom container for Azure App Service](/azure/app-service/configure-custom-container?pivots=container-linux)

## Containers

Develop and manage your containerized applications faster with integrated tools.  Save costs by lifting and shifting your existing applications to [containers](/product-categories/containers/), and build microservices applications to deliver value to your users faster.

| Azure CLI references for service | Microsoft Docs
|-|-|
|[Azure Functions](/cli/azure/service-page/azure%20functions) | [Manage your function app](/azure/azure-functions/functions-how-to-use-azure-function-app-settings?tabs=azurecli)
| |[How to target Azure Functions runtime versions](/azure/azure-functions/set-runtime-version?tabs=azurecli)
|[Azure Kubernetes Service (AKS)](/cli/azure/service-page/azure%20kubernetes%20service%20(aks)) | [Deploy an AKS cluster](/azure/aks/kubernetes-walkthrough)
| |[Create and manage multiple node pools for a cluster in AKS](/azure/aks/use-multiple-node-pools)
|[Azure Red Hat OpenShift](/cli/azure/service-page/azure%20red%20hat%20openshift) | [Create an Azure Red Hat OpenShift 4 cluster](/azure/openshift/tutorial-create-cluster)
|[Azure Service Fabric](/cli/azure/service-page/azure%20service%20fabric) | [Deploy Linux containers to Service Fabric](/azure/service-fabric/service-fabric-quickstart-containers-linux#create-a-service-fabric-cluster)
| |[Create a Service Fabric cluster](/azure/service-fabric/service-fabric-cluster-creation-via-arm)
|[Azure Web Apps](/cli/azure/service-page/azure%20web%20apps) | [How to use managed identities for App Service and Azure Functions](/azure/app-service/overview-managed-identity?tabs=dotnet#using-the-azure-cli)
| |[Configure a custom container for Azure App Service](/azure/app-service/configure-custom-container?pivots=container-linux)
|[Container Instances](/cli/azure/service-page/azure%20container%20instances) | [Deploy a container instance in Azure](/azure/container-instances/container-instances-quickstart)
|[Container Registry](/cli/azure/service-page/azure%20container%20registries) | [Frequently asked questions](/azure/container-registry/container-registry-faq)
| |[Connect privately to an Azure container registry using Azure Private Link](/azure/container-registry/container-registry-private-link#set-up-private-endpoint---cli)

## Databases

Support rapid growth and innovate faster with secure, enterprise-grade, and fully managed [database services](/product-categories/databases/).

| Azure CLI references for service | Microsoft Docs
|-|-|
|[Azure API for FHIR](/cli/azure/service-page/azure%20api%20for%20fhi) | [Configure customer-managed keys at rest](/azure/healthcare-apis/azure-api-for-fhir/customer-managed-key#using-azure-cli)
|[Azure Cache for Redis](/cli/azure/service-page/azure%20cache%20for%20redis) | [Connect an App Service app to an Azure Cache for Redis](/azure/app-service/scripts/cli-connect-to-redis)
|[Azure Cosmos DB](azure-cli-reference-for-cosmos-db.md) | [Samples for Azure Cosmos DB Core (SQL) API](/azure/cosmos-db/cli-samples)
|[Azure Data Migration](/cli/azure/service-page/azure%20data%20migration) | [Migrate PostgreSQL to Azure DB](/azure/dms/tutorial-postgresql-azure-postgresql-online#provisioning-an-instance-of-dms-using-the-azure-cli)
|[Azure Database for MariaDB](/cli/azure/service-page/azure%20database%20for%20mariadb) | [Create an Azure Database for MariaDB server](/azure/mariadb/quickstart-create-mariadb-server-database-using-azure-cli)
|[Azure Database for MySQL](/cli/azure/service-page/azure%20database%20for%20mysql) | [Create a MySQL Flexible Server](/azure/mysql/flexible-server/tutorial-php-database-app#create-a-mysql-flexible-server-preview)
|[Azure Database for PostgreSQL](/cli/azure/service-page/azure%20database%20for%20postgresql) | [Create an Azure Database for PostgreSQL server](/azure/postgresql/quickstart-create-server-database-azure-cli)
|[Azure SQL Database](/cli/azure/azure-cli-reference-for-sql#sql-database) | [Create an Azure SQL Database](/azure/azure-sql/database/single-database-create-quickstart?tabs=azure-cli)
| |[Manage server-level IP firewall rules](/azure/azure-sql/database/firewall-configure#use-cli-to-manage-server-level-ip-firewall-rules)

## Developer Tools

Use Microsoft's comprehensive set of [development tools](/product-categories/developer-tools/) to build, manage, and continuously deliver cloud applications—using any platform or language.

| Azure CLI references for service | Microsoft Docs
|-|-|
|[App Configuration](/cli/azure/azure-cli-reference-for-hosted-apps?view=azure-cli-latest#azure-web-app-configuration) | [Migrate custom software to Azure App Service using a custom container](/azure/app-service/tutorial-custom-container?pivots=container-linux)
| |[Build an ASP.NET Core and Azure SQL Database app in Azure App Service](/azure/app-service/tutorial-dotnetcore-sqldb-app?pivots=platform-linux)
|[Azure DevOps](azure-cli-reference-for-devops.md) | See links in reference summary.
|[Azure DevTest Labs](/cli/azure/service-page/azure%20devtest%20labs) | [Create and manage virtual machines with DevTest Labs](/azure/devtest-labs/devtest-lab-vmcli)
|[Azure Lab Services](/cli/azure/service-page/azure%20lab%20services) | 
|[Azure Pipelines](/cli/azure/azure-cli-reference-for-devops#azure-pipelines) | [How to define pipeline variables](/azure/devops/pipelines/process/variables?view=azure-devops&tabs=azure-devops-cli)
| |[Azure Pipelines agents](/azure/devops/pipelines/agents/agents?view=azure-devops&tabs=azure-devops-cli)
| |[Create your first pipeline](/azure/devops/pipelines/create-first-pipeline?view=azure-devops&tabs=azure-cli)
|[Visual Studio](/cli/azure/service-page/visual%20studio) | 

## DevOps

Azure [DevOps](/product-categories/devops/) technologies deliver innovation faster with simple, reliable tools for continuous delivery.

| Azure CLI references for service | Microsoft Docs
|-|-|
|[Azure Artifacts](/cli/azure/azure-cli-reference-for-devops#azure-artifacts) | [Publish and download universal packages](/azure/devops/artifacts/quickstarts/universal-packages?view=azure-devops)
|[Azure Boards](/cli/azure/azure-cli-reference-for-devops#azure-boards) | [Define area paths and assign to a team](/azure/devops/organizations/settings/set-area-paths?view=azure-devops&tabs=azure-devops-cli#open-project-settings-list-project-areas)
|[Azure DevOps](/cli/azure/azure-cli-reference-for-devops) | See links in reference summary.
|[Azure DevTest Labs](/cli/azure/service-page/azure%20devtest%20labs) | [Create and manage virtual machines with DevTest Labs](/azure/devtest-labs/devtest-lab-vmcli)
|[Azure Monitor](azure-cli-reference-for-monitor.md) | [Create diagnostic settings to send platform logs and metrics to different destinations](/azure/azure-monitor/essentials/diagnostic-settings?tabs=CMD#create-using-azure-cli)
| |[How to configure Azure Activity log profiles](/azure/azure-monitor/essentials/activity-log#configure-log-profile-using-azure-cli)
|[Azure Pipelines](/cli/azure/azure-cli-reference-for-devops#azure-pipelines) | | [How to define pipeline variables](/azure/devops/pipelines/process/variables?view=azure-devops&tabs=azure-devops-cli)
| |[Azure Pipelines agents](/azure/devops/pipelines/agents/agents?view=azure-devops&tabs=azure-devops-cli)
| |[Create your first pipeline](/azure/devops/pipelines/create-first-pipeline?view=azure-devops&tabs=azure-cli)
|[Azure Repos](/cli/azure/azure-cli-reference-for-devops#azure-repos) | [Get started with Git using the Azure CLI](/azure/devops/repos/git/share-your-code-in-git-cmdline?view=azure-devops)

## Hybrid

| Azure CLI references for service | Microsoft Docs
|-|-|
|[Azure Active Directory (AD)](/cli/azure/service-page/azure%20active%20directory) | [Create an Azure service principal](create-an-azure-service-principal-azure-cli.md)
|[Azure Arc](/cli/azure/service-page/azure%20arc) | [Delete Azure Arc data controller](/azure/azure-arc/data/uninstall-azure-arc-data-controller)
|[Azure Database for PostgreSQL](/cli/azure/service-page/azure%20database%20for%20postgresql) | [Deploy a Django web app with PostgreSQL in Azure App Service](/azure/app-service/tutorial-python-postgresql-app?tabs=cmd%2Cclone&pivots=postgres-single-server)
|[Azure DevOps](azure-cli-reference-for-devops.md) | See links in reference summary.
|[Azure IoT Edge](/cli/azure/iot/edge) | [Deploy your first IoT Edge module to a virtual Linux device](/azure/iot-edge/quickstart-linux)
|[Azure Security Center](/cli/azure/service-page/azure%20security%20center) | 
|[Azure Sentinel](/cli/azure/service-page/azure%20sentinel) | 
|[Azure SQL Database](/cli/azure/azure-cli-reference-for-sql#sql-database) | [Restore a single database in Azure SQL Database to an earlier point in time](/azure/sql-database/scripts/sql-database-restore-database-cli)
|[Azure Stack HCI](/cli/azure/stack-hci) | 

## Identity

| Azure CLI references for service | Microsoft Docs
|-|-|
|[Azure Active Directory (AD)](/cli/azure/service-page/azure%20active%20directory) | [Create an Azure service principal](create-an-azure-service-principal-azure-cli.md)

## Integration

| Azure CLI references for service | Microsoft Docs
|-|-|
|[API Management](/cli/azure/service-page/api%20management) | [Mock API responses](/azure/api-management/mock-api-responses?tabs=azure-cli)
| |[Create and publish a product](/azure/api-management/api-management-howto-add-products?tabs=azure-cli)
|[Azure Logic Apps](/cli/azure/service-page/azure%20logic%20apps) | [/cli/azure/service-page/azure%20logic%20apps](/azure/logic-apps/logic-apps-enterprise-integration-create-integration-account?tabs=azure-cli)
|[Event Grid](/cli/azure/service-page/azure%20event%20grid) | [Route custom events to web endpoint](/azure/event-grid/custom-event-quickstart)
|[Service Bus](/cli/azure/service-page/azure%20service%20bus%20messaging) | [Enable dead lettering on message expiration for Azure Service Bus queues and subscriptions](/azure/service-bus-messaging/enable-dead-letter#using-azure-cli)

## Internet of Things

| Azure CLI references for service | Microsoft Docs
|-|-|
|[API Management](/cli/azure/service-page/api%20management) | [Mock API responses](/azure/api-management/mock-api-responses?tabs=azure-cli)
| |[Create and publish a product](/azure/api-management/api-management-howto-add-products?tabs=azure-cli)
|[Azure Cosmos DB](azure-cli-reference-for-cosmos-db.md) | [Samples for Azure Cosmos DB Core (SQL) API](/azure/cosmos-db/cli-samples)
|[Azure Functions](/cli/azure/service-page/azure%20functions) | [Manage your function app](/azure/azure-functions/functions-how-to-use-azure-function-app-settings?tabs=azurecli)
| |[How to target Azure Functions runtime versions](/azure/azure-functions/set-runtime-version?tabs=azurecli)
|[Azure IoT Central](azure-cli-reference-for-iot.md) | [Manage IoT Central](/azure/iot-central/core/howto-manage-iot-central-from-cli?tabs=azure-cli)
|[Azure IoT Edge](azure-cli-reference-for-iot.md) | [Deploy and monitor IoT Edge modules at scale](/azure/iot-edge/how-to-deploy-cli-at-scale)
| |[Deploy your first IoT Edge module to a virtual Linux device](/azure/iot-edge/quickstart-linux)
|[Azure IoT Hub](azure-cli-reference-for-iot.md) | [Configure IoT Hub message routing](/azure/iot-hub/tutorial-routing)
|[Azure Logic Apps](/cli/azure/service-page/azure%20logic%20apps) | [/cli/azure/service-page/azure%20logic%20apps](/azure/logic-apps/logic-apps-enterprise-integration-create-integration-account?tabs=azure-cli)
|[Azure Machine Learning](/cli/azure/service-page/azure%20machine%20learning) | [Create and manage an Azure Machine Learning compute instance](/azure/machine-learning/how-to-create-manage-compute-instance?tabs=azure-cli)
| |[Manage access to an Azure Machine Learning workspace](/azure/machine-learning/how-to-assign-roles)
|[Azure Maps](/cli/azure/service-page/azure%20maps) | xxx
|[Azure Notification Hubs](/cli/azure/service-page/azure%20notification%20hubs) | xxx
|[Azure Stream Analytics](/cli/azure/service-page/azure%20stream%20analytics) | xxx
|[Azure Time Series Insights](/cli/azure/service-page/azure%20time%20series%20insights) | xxx
|[Event Grid](/cli/azure/service-page/azure%20event%20grid) | [Route custom events to web endpoint](/azure/event-grid/custom-event-quickstart)

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