---
title: List of Azure services the Azure CLI can manage | Microsoft Docs
description: The Azure CLI can create and manage various Azure resources — view links to Azure services the Azure CLI can manage, organized by groups.
manager: mkluck
author: dbradish-microsoft
ms.author: dbradish
ms.date: 08/01/2021
ms.topic: conceptual
ms.service: azure-cli
ms.devlang: azurecli
ms.custom: devx-track-azurecli, seo-azure-cli
keywords: azure service management, azure services list, azure resources list
---

# List of Azure services the Azure CLI can manage

The Azure CLI is available across many Azure services, and is a flexible yet powerful tool to create and manage Azure resources.  This article provides the list of Azure services the Azure CLI can manage.

## AI + Machine Learning

Use AI + Machine Learning to create the next generation of applications using artificial intelligence capabilities for any developer and any scenario.

| Azure CLI references for service | Microsoft Docs
|-|-|
|[Azure Bot Service](/cli/azure/service-page/azure%20bot%20service)| [Identify providers](/azure/bot-service/bot-builder-concept-identity-providers)
|[Azure Databricks](/cli/azure/service-page/azure%20databricks)| [Build a data pipeline](/azure/devops/pipelines/apps/cd/azure/build-data-pipeline)
|[Azure Cognitive Search](/cli/azure/service-page/azure%20cognitive%20search)|[Manage your Azure Cognitive Search service](/azure/search/search-manage-azure-cli)
|[Azure Cognitive Services](/cli/azure/service-page/azure%20cognitive%20service) | [How to create and manage LUIS resources](/azure/cognitive-services/LUIS/luis-how-to-azure-subscription?tabs=without-portal)
|| [Configure Azure Cognitive Services virtual networks](/azure/cognitive-services/cognitive-services-virtual-networks?tabs=azure-cli)
|| [Quickstart: Create a Cognitive Services resource](/azure/cognitive-services/cognitive-services-apis-create-account-cli)
|[Azure Machine Learning](/cli/azure/service-page/azure%20machine%20learning)| [Manage roles in your workspace](/azure/machine-learning/how-to-assign-roles)
|| [Create and manage an Azure Machine Learning compute instance](/azure/machine-learning/how-to-create-manage-compute-instance?tabs=azure-cli)
|| [Create an Azure Machine Learning compute cluster](/azure/machine-learning/how-to-create-attach-compute-cluster?tabs=azure-cli)
|| [Configure a private endpoint for an Azure Machine Learning workspace](/azure/machine-learning/how-to-configure-private-link?tabs=azure-cli)

## Analytics

Use Azure Analytics to gather, store, process, analyze, and visualize data of any variety, volume, or velocity.

| Azure CLI references for service | Microsoft Docs
|-|-|
|[Azure Data Explorer](/cli/azure/service-page/azure%20data%20explorer) | [Create an Azure Data Explorer cluster and database by using Azure CLI](/azure/data-explorer/create-cluster-database-cli)
|| [Ingest data from Apache Kafka into Azure Data Explorer](/azure/data-explorer/ingest-data-kafka)
|[Azure Data Factory](/cli/azure/service-page/azure%20data%20factory) | [Quickstart: Create an Azure Data Factory](/azure/data-factory/quickstart-create-data-factory-azure-cli)
|[Data Lake Analytics](/cli/azure/service-page/azure%20data%20lake%20analytics) | [Manage Azure Data Lake Analytics](/azure/data-lake-analytics/data-lake-analytics-manage-use-cli)
|[Azure Data Lake Storage](/cli/azure/service-page/azure%20data%20lake%20storage) |[Get started with Azure Data Lake Storage Gen1](/azure/data-lake-store/data-lake-store-get-started-cli-2.0)
|| [Get started with Azure Data Lake Analytics](/azure/data-lake-analytics/data-lake-analytics-get-started-cli)
|[Azure Data Share](azure-cli-reference-for-data-share.md) | [Tutorial: Share data using Azure Data Share](/azure/data-share/share-your-data?tabs=azure-cli)
|| [Accept and receive data using Azure Data Share](/azure/data-share/subscribe-to-data-share?tabs=azure-cli)
|[Azure Databricks](/cli/azure/service-page/azure%20databricks) | [Quickstart: Run a Spark job on Azure Databricks Workspace](/azure/databricks/scenarios/quickstart-create-databricks-workspace-portal?tabs=azure-cli)
|| [Build a data pipeline by using Azure Data Factory, DevOps, and ML](/azure/devops/pipelines/apps/cd/azure/build-data-pipeline?view=azure-devops&preserve-view=true)
|[Azure HDInsight](/cli/azure/service-page/azure%20hdinsight) | [Manage Azure HDInsight clusters](/azure/hdinsight/hdinsight-administer-use-command-line)
|| [Create an Apache Kafka REST proxy enabled cluster in HDInsight](/azure/hdinsight/kafka/tutorial-cli-rest-proxy)
|[Event Hubs](/cli/azure/service-page/azure%20event%20hubs) | [Route custom events to Azure Event Hubs](/azure/event-grid/custom-event-to-eventhub)
|| [Use Azure Event Hubs to receive change notifications](/graph/change-notifications-delivery#using-azure-event-hubs-to-receive-change-notifications)
|| [Visualize data anomalies in real-time events sent to Azure Event Hubs](/azure/event-hubs/event-hubs-tutorial-visualize-anomalies)
|[Azure Stream Analytics](/cli/azure/service-page/azure%20stream%20analytics) | [Create an Azure Stream Analytics job](/azure/stream-analytics/quick-create-azure-cli)
|[Azure Synapse Analytics](/cli/azure/service-page/azure%20synapse%20analytics) | [Create an Azure synapse workspace](/azure/synapse-analytics/quickstart-create-workspace-cli)
|| [Create a Synapse SQL pool](/azure/synapse-analytics/sql-data-warehouse/create-data-warehouse-azure-cli)
|[Power BI Embedded](../latest/docs-ref-autogen/powerbi.yml) | [Create Power BI Embedded capacity](/power-bi/developer/embedded/azure-pbie-create-capacity?tabs=CLI)

## Blockchain

Build and manage blockchain based applications with a suite of integrated tools.

| Azure CLI references for service | Microsoft Docs
|-|-|
|[Blockchain](/cli/azure/service-page/azure%20blockchain)|
|[Azure Cosmos DB](azure-cli-reference-for-cosmos-db.md) | [Create an Azure Cosmos account](/azure/cosmos-db/create-sql-api-dotnet-v4#create-account)
|| [Configure an IP access control policy](/azure/cosmos-db/how-to-configure-firewall#configure-ip-firewall-cli)
|| [Create custom role definitions](/azure/cosmos-db/how-to-setup-rbac#using-the-azure-cli)
|[Azure Logic Apps](/cli/azure/service-page/azure%20logic%20apps) | [Create and manage workflows in multi-tenant Azure Logic Apps](/azure/logic-apps/quickstart-logic-apps-azure-cli)
|| [Create and manage integration accounts for B2B enterprise integrations](/azure/logic-apps/logic-apps-enterprise-integration-create-integration-account?tabs=azure-cli)
|| [Create a Logic App sample script](/azure/logic-apps/sample-logic-apps-cli-script)

## Compute

Access cloud compute capacity and scale on demand—and only pay for the resources you use.  Whether you’re building new applications or deploying existing ones, Azure compute provides the infrastructure you need to run your apps.

| Azure CLI references for service | Microsoft Docs
|-|-|
|[App Service](/cli/azure/service-page/azure%20app%20service) | [How to use managed identities for App Service and Azure Functions](/azure/app-service/overview-managed-identity?tabs=dotnet#using-the-azure-cli)
| |[Configure App Service to deploy an image from the registry](/azure/app-service/tutorial-custom-container?pivots=container-linux#configure-app-service-to-deploy-the-image-from-the-registry)
| |[Upload image data in the cloud with Azure Storage](/azure/storage/blobs/storage-upload-process-images?tabs=dotnet%2Cazure-cli#create-an-app-service-plan)
|[Azure Batch](/cli/azure/service-page/azure%20batch) | [Run your first Batch job](/azure/batch/quick-create-cli)
|[Azure Cloud Services](/cli/azure/service-page/azure%20cloud%20services%20(extended%20support))
|[Azure Container Instances](/cli/azure/service-page/azure%20container%20instances)| [Deploy a container instance in Azure](/azure/container-instances/container-instances-quickstart)
|[Azure Functions](/cli/azure/service-page/azure%20functions) | [Manage your function app](/azure/azure-functions/functions-how-to-use-azure-function-app-settings?tabs=azure-cli)
| |[How to target Azure Functions runtime versions](/azure/azure-functions/set-runtime-version?tabs=azurecli)
|[Azure Kubernetes Service (AKS)](/cli/azure/service-page/azure%20kubernetes%20service%20(aks)) | [Deploy an AKS cluster](/azure/aks/kubernetes-walkthrough)
| |[Create and manage multiple node pools for a cluster in AKS](/azure/aks/use-multiple-node-pools)
|[Azure Service Fabric](/cli/azure/service-page/azure%20service%20fabric) | [Deploy Linux containers to Service Fabric](/azure/service-fabric/service-fabric-quickstart-containers-linux#create-a-service-fabric-cluster)
| |[Create a Service Fabric cluster](/azure/service-fabric/service-fabric-cluster-creation-via-arm)
|[Azure Spring Cloud](/cli/azure/service-page/azure%20spring%20cloud) | [Read a secret from Azure Key Vault in a Spring Boot application](/azure/developer/java/spring-framework/configure-spring-boot-starter-java-app-with-azure-key-vault#deploy-to-azure-spring-cloud)
|[Azure Static Web Apps](../latest/docs-ref-autogen/staticwebapp.yml) | [Build your first static site](/azure/static-web-apps/get-started-cli?tabs=vanilla-javascript)
|[Azure Virtual Machines](./azure-cli-reference-for-virtual-machines.md) | [Create a Linux VM](/azure/virtual-machines/linux/quick-create-cli)
| |[Create a Windows VM](/azure/virtual-machines/windows/quick-create-cli)
|[Azure Virtual Machine Scale Sets (VMSS)](../latest/docs-ref-autogen/vmss.yml) | [Create a Linux VM with Accelerated Networking](/azure/virtual-network/create-vm-accelerated-networking-cli#vmss)
|[Azure VMWare Solution](/cli/azure/service-page/azure%20vmware%20solution) | [Attach disk pools to Azure VMware Solution hosts](/azure/azure-vmware/attach-disk-pools-to-azure-vmware-solution-hosts)
|[Azure Web Apps](/cli/azure/service-page/azure%20web%20apps) | [How to use managed identities for App Service and Azure Functions](/azure/app-service/overview-managed-identity?tabs=dotnet#using-the-azure-cli)
| |[Configure a custom container for Azure App Service](/azure/app-service/configure-custom-container?pivots=container-linux)

## Containers

Develop and manage your containerized applications faster with integrated tools.  Save costs by lifting and shifting your existing applications to containers, and build microservices applications to deliver value to your users faster.

| Azure CLI references for service | Microsoft Docs
|-|-|
|[Azure Functions](/cli/azure/service-page/azure%20functions) | [Manage your function app](/azure/azure-functions/functions-how-to-use-azure-function-app-settings?tabs=azure-cli)
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

Support rapid growth and innovate faster with secure, enterprise-grade, and fully managed database services.

| Azure CLI references for service | Microsoft Docs
|-|-|
|[Azure API for FHIR](/cli/azure/service-page/azure%20api%20for%20fhir) | [Configure customer-managed keys at rest](/azure/healthcare-apis/azure-api-for-fhir/customer-managed-key#using-azure-cli)
|[Azure Cache for Redis](/cli/azure/service-page/azure%20cache%20for%20redis) | [Connect an App Service app to an Azure Cache for Redis](/azure/app-service/scripts/cli-connect-to-redis)
|[Azure Cosmos DB](azure-cli-reference-for-cosmos-db.md) | [Samples for Azure Cosmos DB Core (SQL) API](/azure/cosmos-db/cli-samples)
|[Azure Data Migration](/cli/azure/service-page/azure%20data%20migration) | [Migrate PostgreSQL to Azure DB](/azure/dms/tutorial-postgresql-azure-postgresql-online#provisioning-an-instance-of-dms-using-the-azure-cli)
|[Azure Database for MariaDB](/cli/azure/service-page/azure%20database%20for%20mariadb) | [Create an Azure Database for MariaDB server](/azure/mariadb/quickstart-create-mariadb-server-database-using-azure-cli)
|[Azure Database for MySQL](/cli/azure/service-page/azure%20database%20for%20mysql) | [Create a MySQL Flexible Server](/azure/mysql/flexible-server/tutorial-php-database-app#create-a-mysql-flexible-server-preview)
|[Azure Database for PostgreSQL](/cli/azure/service-page/azure%20database%20for%20postgresql) | [Create an Azure Database for PostgreSQL server](/azure/postgresql/quickstart-create-server-database-azure-cli)
|[Azure SQL Database](./azure-cli-reference-for-sql.md) | [Create an Azure SQL Database](/azure/azure-sql/database/single-database-create-quickstart?tabs=azure-cli)
| |[Manage server-level IP firewall rules](/azure/azure-sql/database/firewall-configure#use-cli-to-manage-server-level-ip-firewall-rules)

## Developer Tools

Use Microsoft's comprehensive set of development tools to build, manage, and continuously deliver cloud applications—using any platform or language.

| Azure CLI references for service | Microsoft Docs
|-|-|
|[App Configuration](./azure-cli-reference-for-hosted-apps.md) | [Migrate custom software to Azure App Service using a custom container](/azure/app-service/tutorial-custom-container?pivots=container-linux)
| |[Build an ASP.NET Core and Azure SQL Database app in Azure App Service](/azure/app-service/tutorial-dotnetcore-sqldb-app?pivots=platform-linux)
|[Azure DevOps](azure-cli-reference-for-devops.md) | See links in reference summary.
|[Azure DevTest Labs](/cli/azure/service-page/azure%20devtest%20labs) | [Create and manage virtual machines with DevTest Labs](/azure/devtest-labs/devtest-lab-vmcli)
|[Azure Lab Services](/cli/azure/service-page/azure%20lab%20services) |
|[Azure Pipelines](./azure-cli-reference-for-devops.md) | [How to define pipeline variables](/azure/devops/pipelines/process/variables?view=azure-devops&preserve-view=true&tabs=azure-devops-cli)
| |[Azure Pipelines agents](/azure/devops/pipelines/agents/agents?view=azure-devops&preserve-view=true&tabs=azure-devops-cli)
| |[Create your first pipeline](/azure/devops/pipelines/create-first-pipeline?view=azure-devops&preserve-view=true&tabs=azure-cli)
|[Visual Studio](/cli/azure/service-page/visual%20studio) |

## DevOps

Azure DevOps technologies deliver innovation faster with simple, reliable tools for continuous delivery.

| Azure CLI references for service | Microsoft Docs
|-|-|
|[Azure Artifacts](./azure-cli-reference-for-devops.md) | [Publish and download universal packages](/azure/devops/artifacts/quickstarts/universal-packages?view=azure-devops&preserve-view=true)
|[Azure Boards](./azure-cli-reference-for-devops.md) | [Define area paths and assign to a team](/azure/devops/organizations/settings/set-area-paths?view=azure-devops&preserve-view=true&tabs=azure-devops-cli#open-project-settings-list-project-areas)
|[Azure DevOps](./azure-cli-reference-for-devops.md) | See links in reference summary.
|[Azure DevTest Labs](/cli/azure/service-page/azure%20devtest%20labs) | [Create and manage virtual machines with DevTest Labs](/azure/devtest-labs/devtest-lab-vmcli)
|[Azure Monitor](azure-cli-reference-for-monitor.md) | [Create diagnostic settings to send platform logs and metrics to different destinations](/azure/azure-monitor/essentials/diagnostic-settings?tabs=CMD#create-using-azure-cli)
| |[How to configure Azure Activity log profiles](/azure/azure-monitor/essentials/activity-log#configure-log-profile-using-azure-cli)
|[Azure Pipelines](./azure-cli-reference-for-devops.md) | [How to define pipeline variables](/azure/devops/pipelines/process/variables?view=azure-devops&preserve-view=true&tabs=azure-devops-cli)
| |[Azure Pipelines agents](/azure/devops/pipelines/agents/agents?view=azure-devops&preserve-view=true&tabs=azure-devops-cli)
| |[Create your first pipeline](/azure/devops/pipelines/create-first-pipeline?view=azure-devops&preserve-view=true&tabs=azure-cli)
|[Azure Repos](./azure-cli-reference-for-devops.md) | [Get started with Git using the Azure CLI](/azure/devops/repos/git/share-your-code-in-git-cmdline?view=azure-devops&preserve-view=true)

## Hybrid

| Azure CLI references for service | Microsoft Docs
|-|-|
|[Azure Active Directory (AD)](/cli/azure/service-page/azure%20active%20directory) | [Create an Azure service principal](create-an-azure-service-principal-azure-cli.md)
|[Azure Arc](/cli/azure/service-page/azure%20arc) | [Delete Azure Arc data controller](/azure/azure-arc/data/uninstall-azure-arc-data-controller)
|[Azure Database for PostgreSQL](/cli/azure/service-page/azure%20database%20for%20postgresql) | [Deploy a Django web app with PostgreSQL in Azure App Service](/azure/app-service/tutorial-python-postgresql-app?tabs=cmd%2Cclone&pivots=postgres-single-server)
|[Azure DevOps](azure-cli-reference-for-devops.md) | See links in reference summary.
|[Azure IoT Edge](../latest/docs-ref-autogen/iot/edge.yml) | [Deploy your first IoT Edge module to a virtual Linux device](/azure/iot-edge/quickstart-linux)
|[Microsoft Defender for Cloud](/cli/azure/service-page/azure%20security%20center) |
|[Microsoft Sentinel](/cli/azure/service-page/azure%20sentinel) |
|[Azure SQL Database](./azure-cli-reference-for-sql.md) | [Restore a single database in Azure SQL Database to an earlier point in time](/azure/sql-database/scripts/sql-database-restore-database-cli)
|[Azure Stack HCI](../latest/docs-ref-autogen/stack-hci.yml) |

## Identity

| Azure CLI references for service | Microsoft Docs
|-|-|
|[Azure Active Directory (AD)](/cli/azure/service-page/azure%20active%20directory) | [Create an Azure service principal](create-an-azure-service-principal-azure-cli.md)

## Integration

| Azure CLI references for service | Microsoft Docs
|-|-|
|[API Management](/cli/azure/service-page/api%20management) | [Mock API responses](/azure/api-management/mock-api-responses?tabs=azure-cli)
| |[Create and publish a product](/azure/api-management/api-management-howto-add-products?tabs=azure-cli)
|[Azure Logic Apps](/cli/azure/service-page/azure%20logic%20apps) | [Create and manage integration accounts for B2B enterprise integrations in Azure Logic Apps](/azure/logic-apps/logic-apps-enterprise-integration-create-integration-account?tabs=azure-cli)
|[Event Grid](/cli/azure/service-page/azure%20event%20grid) | [Route custom events to web endpoint](/azure/event-grid/custom-event-quickstart)
|[Service Bus](/cli/azure/service-page/azure%20service%20bus%20messaging) | [Enable dead lettering on message expiration for Azure Service Bus queues and subscriptions](/azure/service-bus-messaging/enable-dead-letter#using-azure-cli)

## Internet of Things

| Azure CLI references for service | Microsoft Docs
|-|-|
|[API Management](/cli/azure/service-page/api%20management) | [Mock API responses](/azure/api-management/mock-api-responses?tabs=azure-cli)
| |[Create and publish a product](/azure/api-management/api-management-howto-add-products?tabs=azure-cli)
|[Azure Cosmos DB](azure-cli-reference-for-cosmos-db.md) | [Samples for Azure Cosmos DB Core (SQL) API](/azure/cosmos-db/cli-samples)
|[Azure Functions](/cli/azure/service-page/azure%20functions) | [Manage your function app](/azure/azure-functions/functions-how-to-use-azure-function-app-settings?tabs=azure-cli)
| |[How to target Azure Functions runtime versions](/azure/azure-functions/set-runtime-version?tabs=azurecli)
|[Azure IoT Central](../latest/docs-ref-autogen/iot/central.yml) | [Manage IoT Central](/azure/iot-central/core/howto-manage-iot-central-from-cli?tabs=azure-cli)
|[Azure IoT Edge](../latest/docs-ref-autogen/iot/edge.yml) | [Deploy and monitor IoT Edge modules at scale](/azure/iot-edge/how-to-deploy-cli-at-scale)
| |[Deploy your first IoT Edge module to a virtual Linux device](/azure/iot-edge/quickstart-linux)
|[Azure IoT Hub](../latest/docs-ref-autogen/iot/hub.yml) | [Configure IoT Hub message routing](/azure/iot-hub/tutorial-routing)
|[Azure Logic Apps](/cli/azure/service-page/azure%20logic%20apps) | [Create and manage integration accounts for B2B enterprise integrations in Azure Logic Apps](/azure/logic-apps/logic-apps-enterprise-integration-create-integration-account?tabs=azure-cli)
|[Azure Machine Learning](/cli/azure/service-page/azure%20machine%20learning) | [Create and manage an Azure Machine Learning compute instance](/azure/machine-learning/how-to-create-manage-compute-instance?tabs=azure-cli)
| |[Manage access to an Azure Machine Learning workspace](/azure/machine-learning/how-to-assign-roles)
|[Azure Maps](../latest/docs-ref-autogen/maps.yml) |
|[Azure Notification Hubs](/cli/azure/service-page/azure%20notification%20hubs) | [Set up push notifications in a notification hub](/azure/notification-hubs/configure-notification-hub-portal-pns-settings?tabs=azure-cli)
| | [Create an Azure notification hub using the Azure CLI](/azure/notification-hubs/create-notification-hub-azure-cli)
|[Azure Stream Analytics](/cli/azure/service-page/azure%20stream%20analytics) | [Create an Azure Stream Analytics job using the Azure CLI](/azure/stream-analytics/quick-create-azure-cli)
|[Azure Time Series Insights](/cli/azure/service-page/azure%20time%20series%20insights) | [Authentication and authorization for Azure Time Series Insights API](/azure/time-series-insights/time-series-insights-authentication-and-authorization)
| | [Create an Azure Time Series Insights Gen2 environment using the Azure CLI](/azure/time-series-insights/how-to-create-environment-using-cli)
|[Event Grid](/cli/azure/service-page/azure%20event%20grid) | [Route custom events to web endpoint](/azure/event-grid/custom-event-quickstart)

## Management and Governance

| Azure CLI references for service | Microsoft Docs
|-|-|
|[Automation](../latest/docs-ref-autogen/automation.yml) | [Enable Update Management using Azure Resource Manager template](/azure/automation/update-management/enable-from-template)
|[Azure Advisor](../latest/docs-ref-autogen/advisor.yml) | [Create Azure Advisor alerts on new recommendations using an ARM template](/azure/advisor/advisor-alerts-arm?tabs=CLI)
|[Azure Backup](../latest/docs-ref-autogen/backup.yml) | [Selective disk backup and restore for Azure virtual machines](/azure/backup/selective-disk-backup-restore)
| | [Back up a virtual machine in Azure with the Azure CLI](/azure/backup/quick-backup-vm-cli)
|[Azure Blueprint](../latest/docs-ref-autogen/blueprint.yml) | [Define and Assign an Azure Blueprint with Azure CLI](/azure/governance/blueprints/create-blueprint-azurecli)
|[Azure Cost Management and Billing](/cli/azure/service-page/azure%20cost%20management%20+%20billing) | [Create and manage exported data](/azure/cost-management-billing/costs/tutorial-export-acm-data?tabs=azure-cli)
| |[Programmatically create Azure Enterprise Agreement subscriptions with the latest APIs](/azure/cost-management-billing/manage/programmatically-create-subscription-enterprise-agreement?tabs=azure-cli)
|[Azure Managed Applications](/cli/azure/service-page/azure%20managed%20applications) | [Create and publish a managed application definition](/azure/azure-resource-manager/managed-applications/publish-service-catalog-app?tabs=azure-cli)
| | [Create managed application with custom actions and resources](/azure/azure-resource-manager/managed-applications/tutorial-create-managed-app-with-custom-provider?tabs=azurecli-interactive)
|[Azure Monitor](azure-cli-reference-for-monitor.md) | [Create diagnostic settings to send platform logs and metrics to different destinations](/azure/azure-monitor/essentials/diagnostic-settings?tabs=CMD#create-using-azure-cli)
| |[How to configure Azure Activity log profiles](/azure/azure-monitor/essentials/activity-log#configure-log-profile-using-azure-cli)
|[Azure Policy](/cli/azure/service-page/azure%20policy) | [Create an Azure policy definition with Azure CLI](/azure/governance/policy/tutorials/create-and-manage#create-a-policy-definition-with-azure-cli)
| |[Remediate non-compliant resources with Azure Policy remediation tasks](/azure/governance/policy/how-to/remediate-resources#create-a-remediation-task-through-azure-cli)
|[Azure Resource Manager](/cli/azure/service-page/azure%20resource%20manager) | [Use tags to organize your Azure resources and management hierarchy](/azure/azure-resource-manager/management/tag-resources#azure-cli)
| | [Manage Azure Resource Manager resource groups by using Azure CLI](/azure/azure-resource-manager/management/manage-resource-groups-cli)
|[Azure Resource Manager templates](../latest/docs-ref-autogen/group.yml) | [Azure Resource Manager template specs](/azure/azure-resource-manager/templates/template-specs?tabs=azure-cli)
| | [Create and deploy template spec](/azure/azure-resource-manager/templates/quickstart-create-template-specs?tabs=azure-cli)
|[Traffic Manager](../latest/docs-ref-autogen/network/traffic-manager.yml) | [Create a Traffic Manager profile for a highly available web application using Azure CLI](/azure/traffic-manager/quickstart-create-traffic-manager-profile-cli)

## Media

| Azure CLI references for service | Microsoft Docs
|-|-|
|[Content Delivery Network](/cli/azure/service-page/content%20delivery%20network) | [Create an Azure CDN profile and endpoint using the Azure CLI](/azure/cdn/scripts/cli/cdn-azure-cli-create-endpoint)
|[Media Services](/cli/azure/service-page/azure%20media%20services) | [Encode a remote file based on URL and stream the video - Azure CLI](/azure/media-services/latest/stream-files-cli-quickstart)
| | [Create and monitor Media Services events with Event Grid using the Azure CLI](/azure/media-services/latest/monitoring/job-state-events-cli-how-to)

## Migration

| Azure CLI references for service | Microsoft Docs
|-|-|
|[Azure Cost Management and Billing](/cli/azure/service-page/azure%20cost%20management%20+%20billing) | [Explore and analyze costs with cost analysis](/azure/cost-management-billing/costs/quick-acm-cost-analysis)
| |[Programmatically create Azure Enterprise Agreement subscriptions with the latest APIs](/azure/cost-management-billing/manage/programmatically-create-subscription-enterprise-agreement?tabs=azure-cli)

## Mobile

| Azure CLI references for service | Microsoft Docs
|-|-|
|[API Management](/cli/azure/service-page/api%20management) | [Mock API responses](/azure/api-management/mock-api-responses?tabs=azure-cli)
| |[Create and publish a product](/azure/api-management/api-management-howto-add-products?tabs=azure-cli)
|[App Service](/cli/azure/service-page/azure%20app%20service) | [How to use managed identities for App Service and Azure Functions](/azure/app-service/overview-managed-identity?tabs=dotnet#using-the-azure-cli)
| |[Configure App Service to deploy an image from the registry](/azure/app-service/tutorial-custom-container?pivots=container-linux#configure-app-service-to-deploy-the-image-from-the-registry)
| |[Upload image data in the cloud with Azure Storage](/azure/storage/blobs/storage-upload-process-images?tabs=dotnet%2Cazure-cli#create-an-app-service-plan)
|[Azure Cognitive Search](/cli/azure/service-page/azure%20cognitive%20search)|[Manage your Azure Cognitive Search service](/azure/search/search-manage-azure-cli)
|[Azure Communication Service](/cli/azure/service-page/azure%20communication%20service) | [Create and manage Communication Services resources](/azure/communication-services/quickstarts/create-communication-resource?tabs=linux&pivots=platform-azcli)
|[Azure Data Migration](/cli/azure/service-page/azure%20data%20migration) | [Migrate PostgreSQL to Azure DB](/azure/dms/tutorial-postgresql-azure-postgresql-online#provisioning-an-instance-of-dms-using-the-azure-cli)
|[Azure Notification Hubs](/cli/azure/service-page/azure%20notification%20hubs) | [Set up push notifications in a notification hub](/azure/notification-hubs/configure-notification-hub-portal-pns-settings?tabs=azure-cli)
| | [Create an Azure notification hub using the Azure CLI](/azure/notification-hubs/create-notification-hub-azure-cli?tabs=azure-cli)
|[Spatial Anchors](/cli/azure/service-page/azure%20spatial%20anchors) | [Create a Spatial Anchors resource](/azure/spatial-anchors/quickstarts/get-started-android?tabs=azure-cli#create-a-spatial-anchors-resource)

## Networking

| Azure CLI references for service | Microsoft Docs
|-|-|
|[Azure DNS](../latest/docs-ref-autogen/network/dns.yml) | [Import and export a DNS zone file using the Azure CLI](/azure/dns/dns-import-export)
| | [Host reverse DNS lookup zones in Azure DNS](/azure/dns/dns-reverse-dns-hosting)
|[Azure Private Link](../latest/docs-ref-autogen/network/private-link-service.yml) | [Create a Private Link service using Azure CLI](/azure/private-link/create-private-link-service-cli)
|[Content Delivery Network](/cli/azure/service-page/content%20delivery%20network) | [Create an Azure CDN profile and endpoint using the Azure CLI](/azure/cdn/scripts/cli/cdn-azure-cli-create-endpoint)
|[Load Balancer](../latest/docs-ref-autogen/network/lb.yml) | [Backend pool management](/azure/load-balancer/backend-pool-management)
| | [Monitoring load balancer](/azure/load-balancer/monitor-load-balancer)
|[Traffic Manager](../latest/docs-ref-autogen/network/traffic-manager.yml) | [Create a Traffic Manager profile for a highly available web application using Azure CLI](/azure/traffic-manager/quickstart-create-traffic-manager-profile-cli)
|[Virtual Network](../latest/docs-ref-autogen/network/vnet.yml) | [Create a Linux virtual machine with Accelerated Networking using Azure CLI](/azure/virtual-network/create-vm-accelerated-networking-cli)
| | [Create a virtual network peering - Resource Manager, different subscriptions and Azure Active Directory tenants](/azure/virtual-network/create-peering-different-subscriptions)
| | [Add or remove a subnet delegation](/azure/virtual-network/manage-subnet-delegation#azure-cli)

## Security

| Azure CLI references for service | Microsoft Docs
|-|-|
|[Azure Active Directory (AD)](/cli/azure/service-page/azure%20active%20directory) | [Create an Azure service principal](create-an-azure-service-principal-azure-cli.md)
|[Azure Dedicated HSM](/cli/azure/service-page/azure%20dedicated%20hsm) | [Deploying HSMs into an existing virtual network using the Azure CLI](/azure/dedicated-hsm/tutorial-deploy-hsm-cli)
|[Microsoft Defender for Cloud](/cli/azure/service-page/azure%20security%20center) |
|[Microsoft Sentinel](/cli/azure/service-page/azure%20sentinel) |
|[Key Vault](/cli/azure/service-page/azure%20key%20vault) | [Use a managed identity to connect Key Vault to an Azure web app in .NET](/azure/key-vault/general/tutorial-net-create-vault-azure-web-app)
| | [Set and retrieve a secret from Azure Key Vault using Azure CLI](/azure/key-vault/secrets/quick-create-cli)
|[Microsoft Azure Attestation](/cli/azure/service-page/azure%20attestation) | [Set up Azure Attestation with Azure CLI](/azure/attestation/quickstart-azure-cli)

## Storage

| Azure CLI references for service | Microsoft Docs
|-|-|
|[Azure Backup](../latest/docs-ref-autogen/backup.yml) | [Selective disk backup and restore for Azure virtual machines](/azure/backup/selective-disk-backup-restore)
| | [Back up a virtual machine in Azure with the Azure CLI](/azure/backup/quick-backup-vm-cli)
|[Azure Data Lake Storage](/cli/azure/service-page/azure%20data%20lake%20storage) |[Get started with Azure Data Lake Storage Gen1](/azure/data-lake-store/data-lake-store-get-started-cli-2.0)
|| [Get started with Azure Data Lake Analytics](/azure/data-lake-analytics/data-lake-analytics-get-started-cli)
|[Azure Data Share](azure-cli-reference-for-data-share.md) | [Tutorial: Share data using Azure Data Share](/azure/data-share/share-your-data?tabs=azure-cli)
|| [Accept and receive data using Azure Data Share](/azure/data-share/subscribe-to-data-share?tabs=azure-cli)
|[Azure Disk Storage](/cli/azure/service-page/azure%20disk%20storage) |
|[Azure HPC Cache](/cli/azure/service-page/azure%20hpc%20cache) | [Create an Azure HPC Cache](/azure/hpc-cache/hpc-cache-create?tabs=azure-cli)
| | [Manage your cache](/azure/hpc-cache/hpc-cache-manage?tabs=azure-cli)
|[Azure NetApp Files](/cli/azure/service-page/azure%20netapp%20files) | [Set up Azure NetApp Files and create an NFS volume](/azure/azure-netapp-files/azure-netapp-files-quickstart-set-up-account-create-volumes?tabs=azure-cli)
|[Azure Storage](./azure-cli-reference-for-storage.md) | [Configure Azure Storage firewalls and virtual networks](/azure/storage/common/storage-network-security?tabs=azure-cli)
| | [Create a storage account](/azure/storage/common/storage-account-create?tabs=azure-cli)
| | [Create an Azure file share](/azure/storage/files/storage-how-to-create-file-share?tabs=azure-cli)
|[Storage Accounts](./azure-cli-reference-for-storage.md) | [Create a storage account](/azure/storage/common/storage-account-create?tabs=azure-cli)
| | [Manage storage account access keys](/azure/storage/common/storage-account-keys-manage?tabs=azure-cli)

## Web

| Azure CLI references for service | Microsoft Docs
|-|-|
|[App Service](/cli/azure/service-page/azure%20app%20service) | [How to use managed identities for App Service and Azure Functions](/azure/app-service/overview-managed-identity?tabs=dotnet#using-the-azure-cli)
| |[Configure App Service to deploy an image from the registry](/azure/app-service/tutorial-custom-container?pivots=container-linux#configure-app-service-to-deploy-the-image-from-the-registry)
| |[Upload image data in the cloud with Azure Storage](/azure/storage/blobs/storage-upload-process-images?tabs=dotnet%2Cazure-cli#create-an-app-service-plan)
|[API Management](/cli/azure/service-page/api%20management) | [Mock API responses](/azure/api-management/mock-api-responses?tabs=azure-cli)
| |[Create and publish a product](/azure/api-management/api-management-howto-add-products?tabs=azure-cli)
|[Azure Cognitive Search](/cli/azure/service-page/azure%20cognitive%20search)|[Manage your Azure Cognitive Search service](/azure/search/search-manage-azure-cli)
|[Azure Communication Service](/cli/azure/service-page/azure%20communication%20service) | [Create and manage Communication Services resources](/azure/communication-services/quickstarts/create-communication-resource?tabs=linux&pivots=platform-azcli)
|[Azure Notification Hubs](/cli/azure/service-page/azure%20notification%20hubs) | [Set up push notifications in a notification hub](/azure/notification-hubs/configure-notification-hub-portal-pns-settings?tabs=azure-cli)
| | [Create an Azure notification hub using the Azure CLI](/azure/notification-hubs/create-notification-hub-azure-cli?tabs=azure-cli)
|[Azure SignalR](/cli/azure/service-page/azure%20signalr) | [Azure SignalR Service authentication](/azure/azure-signalr/signalr-concept-authenticate-oauth)
| | [Use private endpoints for Azure SignalR Service](/azure/azure-signalr/howto-private-endpoints#create-a-private-endpoint-using-azure-cli)
|[Azure Spring Cloud](/cli/azure/service-page/azure%20spring%20cloud) | [Read a secret from Azure Key Vault in a Spring Boot application](/azure/developer/java/spring-framework/configure-spring-boot-starter-java-app-with-azure-key-vault#deploy-to-azure-spring-cloud)
|[Azure Web Apps](/cli/azure/service-page/azure%20web%20apps) | [How to use managed identities for App Service and Azure Functions](/azure/app-service/overview-managed-identity?tabs=dotnet#using-the-azure-cli)
| |[Configure a custom container for Azure App Service](/azure/app-service/configure-custom-container?pivots=container-linux)
|[Content Delivery Network](/cli/azure/service-page/content%20delivery%20network) | [Create an Azure CDN profile and endpoint using the Azure CLI](/azure/cdn/scripts/cli/cdn-azure-cli-create-endpoint)
|[Azure Static Web Apps](../latest/docs-ref-autogen/staticwebapp.yml) | [Build your first static site](/azure/static-web-apps/get-started-cli?tabs=vanilla-javascript)

## See also

- [Get started with the Azure CLI](get-started-with-azure-cli.md)
- [Command reference list for the Azure CLI](../latest/docs-ref-autogen/reference-index.yml)
