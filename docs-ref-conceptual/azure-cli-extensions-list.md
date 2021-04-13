---
title: Available extensions for the Azure CLI
description: A complete list of the officially supported extensions for the Azure CLI.
author: haroldrandom
ms.author: jianzen
manager: yonzhan,yungezz
ms.date: 02/18/2021
ms.topic: article
ms.prod: azure
ms.technology: azure-cli
ms.devlang: azure-cli
---

# Available extensions for the Azure CLI

This article is a complete list of the available extensions for the Azure CLI which are supported by Microsoft.  Run [az extension list-available](/cli/azure/extension#az_extension_list_available) to get this list from the Azure CLI.  

Extensions install automatically on first use, or you can use [az extension add](/cli/azure/extension#az_extension_add) to manually install an extension.

```azurecli-interactive
# get a list of extensions
az extension list-available --output table

# install the account extension
az extension add --name account
```
See [Reference types and status](/cli/azure/reference-types-and-status#reference-status) for support information.

| Reference | Extension | Minimum Version | Description | Status | Release Notes
|------|---------|---------|---------|---------|---------|
| [az account](/cli/azure/ext/account/account) | account | 2.3.1 | Microsoft Azure Command-Line Tools SubscriptionClient Extension | GA | [history](https://github.com/Azure/azure-cli-extensions/blob/master/src/account/HISTORY.rst)
| [az ad](/cli/azure/ext/account/ad) | ad | 2.15.0 | Microsoft Azure Command-Line Tools DomainServicesResourceProvider Extension | GA | [history](https://github.com/Azure/azure-cli-extensions/blob/master/src/ad/HISTORY.rst)
| [az aem](/cli/azure/ext/account/aem) | aem | 2.19.1 | Manage Azure Enhanced Monitoring Extensions for SAP | Experimental | [history](https://github.com/Azure/azure-cli-extensions/blob/master/src/aem/HISTORY.rst)
| [az ai-examples](/cli/azure/ext/account/ai-examples) | ai-examples | 2.2.0 | Add AI powered examples to help content. | Preview | [history](https://github.com/Azure/azure-cli-extensions/blob/master/src/ai-examples/HISTORY.rst)
| [az aks](/cli/azure/ext/account/ai-examples) | aks-preview | 2.0.49 | Provides a preview for upcoming AKS features | Preview | [history](https://github.com/Azure/azure-cli-extensions/blob/master/src/aks-preview/HISTORY.rst)
| [az mysql](/cli/azure/ext/rdbms-connect/mysq) | rdbms-connect | 2.19.0 | Manage Azure Database for MySQL servers |Experimental | [history](https://github.com/Azure/azure-cli-extensions/blob/master/src/rdbms-connect/HISTORY.rst)
| [az netappfiles](/cli/azure/ext/netappfiles-preview/netappfiles) | netappfiles-preview | 2.0.56 | Provides a preview for upcoming Azure NetApp Files (ANF) features. | Preview | [history](https://github.com/Azure/azure-cli-extensions/tree/master/src/netappfiles-preview/HISTORY.rst)
| [az postgres](/cli/azure/ext/rdbms-connect/postgres) | rdbms-connect | 2.19.0 | Manage Azure Database for PostgreSQL servers | GA | [history](https://github.com/Azure/azure-cli-extensions/blob/master/src/rdbms-connect/HISTORY.rst)

.
.
.
.
# abc
| [az alertsmanagement](https://github.com/Azure/azure-cli-extensions) | 0.1.0 | Microsoft Azure Command-Line Tools Alerts Extension |  |
| [az alias](https://github.com/Azure/azure-cli-extensions) | 0.5.2 | Support for command aliases | Yes |
| [az application-insights](https://github.com/Azure/azure-cli-extensions/tree/master/src/application-insights) | 0.1.13 | Support for managing Application Insights components and querying metrics, events, and logs from such components. | Yes |
| [az attestation](https://github.com/Azure/azure-cli-extensions/tree/master/src/attestation) | 0.2.0 | Microsoft Azure Command-Line Tools AttestationManagementClient Extension |  |
| [az automation](https://github.com/Azure/azure-cli-extensions/tree/master/src/automation) | 0.1.0 | Microsoft Azure Command-Line Tools AutomationClient Extension |  |
| [az azure-batch-cli-extensions](https://github.com/Azure/azure-batch-cli-extensions) | 6.0.0 | Additional commands for working with Azure Batch service |  |
| [az azure-cli-ml](https://docs.microsoft.com/python/api/overview/azure/ml/?view=azure-ml-py) | 1.22.0.1 | Microsoft Azure Command-Line Tools AzureML Command Module |  |
| [az azure-devops](https://github.com/Microsoft/azure-devops-cli-extension) | 0.18.0 | Tools for managing Azure DevOps. |  |
| [az azure-firewall](https://github.com/Azure/azure-cli-extensions/tree/master/src/azure-firewall) | 0.9.0 | Manage Azure Firewall resources. | Yes |
| [az azure-iot](https://github.com/azure/azure-iot-cli-extension) | 0.10.9 | The Azure IoT extension for Azure CLI. |  |
| [az baremetal-infrastructure](https://github.com/Azure/azure-baremetalinfrastructure-cli-extension) | 0.0.2 | Additional commands for working with BareMetal instances. |  |
| [az blockchain](https://github.com/Azure/azure-cli-extensions) | 0.1.0 | Microsoft Azure Command-Line Tools BlockchainManagementClient Extension |  |
| [az blueprint](https://github.com/Azure/azure-cli-extensions/tree/master/src/blueprint) | 0.2.1 | Microsoft Azure Command-Line Tools Blueprint Extension |  |
| [az cli-translator](https://github.com/Azure/azure-cli-extensions/tree/master/src/cli-translator) | 0.3.0 | Translate ARM template to executable Azure CLI scripts. |  |
| [az codespaces](https://github.com/Azure/azure-cli-extensions) | 0.3.0 | The Azure CLI Codespaces extension | Yes |
| [az communication](https://github.com/Azure/azure-cli-extensions/tree/master/src/communication) | 0.1.0 | Microsoft Azure Command-Line Tools CommunicationServiceManagementClient Extension |  |
| [az confluent](https://github.com/Azure/azure-cli-extensions/tree/master/src/confluent) | 0.1.0 | Microsoft Azure Command-Line Tools ConfluentManagementClient Extension |  |
| [az connectedk8s](https://github.com/Azure/azure-cli-extensions/tree/master/src/connectedk8s) | 0.2.9 | Microsoft Azure Command-Line Tools Connectedk8s Extension | Yes |
| [az connectedmachine](https://github.com/Azure/azure-cli-extensions/tree/master/src/connectedmachine) | 0.3.0 | Microsoft Azure Command-Line Tools ConnectedMachine Extension |  |
| [az connection-monitor-preview](https://github.com/Azure/azure-cli-extensions/tree/master/src/connection-monitor-preview) | 0.1.0 | Microsoft Azure Command-Line Connection Monitor V2 Extension | Yes |
| [az cosmosdb-preview](https://github.com/Azure/azure-cli-extensions) | 0.3.0 | Microsoft Azure Command-Line Tools Cosmosdb-preview Extension | Yes |
| [az costmanagement](https://github.com/Azure/azure-cli-extensions) | 0.1.0 | Microsoft Azure Command-Line Tools CostManagementClient Extension |  |
| [az csvmware](https://github.com/Azure/az-vmware-cli) | 0.3.0 | Manage Azure VMware Solution by CloudSimple. | Yes |
| [az custom-providers](https://github.com/Azure/azure-cli-extensions) | 0.1.0 | Microsoft Azure Command-Line Tools Custom Providers Extension |  |
| [az databox](https://github.com/Azure/azure-cli-extensions) | 0.1.0 | Microsoft Azure Command-Line Tools DataBox Extension |  |
| [az databricks](https://github.com/Azure/azure-cli-extensions/tree/master/src/databricks) | 0.7.2 | Microsoft Azure Command-Line Tools DatabricksClient Extension |  |
| [az datafactory](https://github.com/Azure/azure-cli-extensions/tree/master/src/datafactory) | 0.2.0 | Microsoft Azure Command-Line Tools DataFactoryManagementClient Extension |  |
| [az datashare](https://github.com/Azure/azure-cli-extensions) | 0.1.1 | Microsoft Azure Command-Line Tools DataShareManagementClient Extension |  |
| [az db-up](https://github.com/Azure/azure-cli-extensions/tree/master/src/db-up) | 0.2.1 | Additional commands to simplify Azure Database workflows. | Yes |
| [az deploy-to-azure](https://github.com/Azure/deploy-to-azure-cli-extension) | 0.2.0 | Deploy to Azure using Github Actions. | Yes |
| [az desktopvirtualization](https://github.com/Azure/azure-cli-extensions/tree/master/src/desktopvirtualization) | 0.1.0 | Microsoft Azure Command-Line Tools DesktopVirtualizationAPIClient Extension |  |
| [az dev-spaces](https://github.com/Azure/azure-cli-extensions/tree/master/src/dev-spaces) | 1.0.6 | Dev Spaces provides a rapid, iterative Kubernetes development experience for teams. |  |
| [az dev-spaces-preview](https://github.com/Azure/azure-cli-extensions) | 0.1.6 | Dev Spaces provides a rapid, iterative Kubernetes development experience for teams. | Yes |
| [az dms-preview](https://github.com/Azure/azure-cli-extensions/tree/master/src/dms-preview) | 0.12.0 | Support for new Database Migration Service scenarios. | Yes |
| [az eventgrid](https://github.com/Azure/azure-cli-extensions) | 0.4.9 | Microsoft Azure Command-Line Tools EventGrid Command Module. | Yes |
| [az express-route](https://github.com/Azure/azure-cli-extensions/tree/master/src/express-route) | 0.1.3 | Manage ExpressRoutes with preview features. | Yes |
| [az express-route-cross-connection](https://github.com/Azure/azure-cli-extensions/tree/master/src/express-route-cross-connection) | 0.1.1 | Manage customer ExpressRoute circuits using an ExpressRoute cross-connection. |  |
| [az footprint](https://github.com/Azure/azure-cli-extensions/tree/master/src/footprint) | 1.0.0 | Microsoft Azure Command-Line Tools FootprintMonitoringManagementClient Extension |  |
| [az front-door](https://github.com/Azure/azure-cli-extensions/tree/master/src/front-door) | 1.0.11 | Manage networking Front Doors. |  |
| [az fzf](https://github.com/phealy/azure-cli-fzf) | 1.0.2 | Microsoft Azure Command-Line Tools fzf Extension |  |
| [az guestconfig](https://github.com/Azure/azure-cli-extensions/tree/master/src/guestconfig) | 0.1.0 | Microsoft Azure Command-Line Tools GuestConfigurationClient Extension |  |
| [az hack](https://github.com/Azure/azure-cli-extensions/tree/master/src/hack) | 0.4.3 | Microsoft Azure Command-Line Tools Hack Extension | Yes |
| [az hardware-security-modules](https://github.com/Azure/azure-cli-extensions) | 0.1.0 | Microsoft Azure Command-Line Tools AzureDedicatedHSMResourceProvider Extension |  |
| [az healthcareapis](https://github.com/Azure/azure-cli-extensions/tree/master/src/healthcareapis) | 0.3.1 | Microsoft Azure Command-Line Tools HealthcareApisManagementClient Extension |  |
| [az hpc-cache](https://github.com/Azure/azure-cli-extensions/tree/master/src/hpc-cache) | 0.1.2 | Microsoft Azure Command-Line Tools StorageCache Extension | Yes |
| [az image-copy-extension](https://github.com/Azure/azure-cli-extensions/tree/master/src/image-copy) | 0.2.8 | Support for copying managed vm images between regions |  |
| [az import-export](https://github.com/Azure/azure-cli-extensions) | 0.1.1 | Microsoft Azure Command-Line Tools StorageImportExport Extension |  |
| [az interactive](https://github.com/Azure/azure-cli) | 0.4.4 | Microsoft Azure Command-Line Interactive Shell | Yes |
| [az internet-analyzer](https://github.com/Azure/azure-cli-extensions) | 0.1.0rc5 | Microsoft Azure Command-Line Tools Internet Analyzer Extension | Yes |
| [az ip-group](https://github.com/Azure/azure-cli-extensions) | 0.1.2 | Microsoft Azure Command-Line Tools IpGroup Extension | Yes |
| [az k8sconfiguration](https://github.com/Azure/azure-cli-extensions/tree/master/src/k8sconfiguration) | 0.2.3 | Microsoft Azure Command-Line Tools K8sconfiguration Extension | Yes |
| [az keyvault-preview](https://github.com/Azure/azure-keyvault-cli-extension) | 0.1.3 | Preview Azure Key Vault commands. | Yes |
| [az kusto](https://github.com/Azure/azure-cli-extensions/tree/master/src/kusto) | 0.2.0 | Microsoft Azure Command-Line Tools KustoManagementClient Extension |  |
| [az log-analytics](https://github.com/Azure/azure-cli-extensions/tree/master/src/log-analytics) | 0.2.2 | Support for Azure Log Analytics query capabilities. | Yes |
| [az log-analytics-solution](https://github.com/Azure/azure-cli-extensions) | 0.1.1 | Support for Azure Log Analytics Solution |  |
| [az logic](https://github.com/Azure/azure-cli-extensions/tree/master/src/logic) | 0.1.2 | Microsoft Azure Command-Line Tools LogicManagementClient Extension |  |
| [az maintenance](https://github.com/Azure/azure-cli-extensions/tree/master/src/maintenance) | 1.1.0 | Microsoft Azure Command-Line Tools MaintenanceClient Extension | Yes |
| [az managementpartner](https://github.com/Azure/azure-cli-extensions) | 0.1.3 | Support for Management Partner preview |  |
| [az mesh](https://github.com/Azure/azure-cli-extensions) | 0.10.6 | Support for Microsoft Azure Service Fabric Mesh - Public Preview | Yes |
| [az mixed-reality](https://github.com/Azure/azure-cli-extensions) | 0.0.2 | Mixed Reality Azure CLI Extension. | Yes |
| [az monitor-control-service](https://github.com/Azure/azure-cli-extensions/tree/master/src/monitor-control-service) | 0.1.0 | Microsoft Azure Command-Line Tools MonitorClient Extension | Yes |
| [az netappfiles-preview](https://github.com/Azure/azure-cli-extensions/tree/master/src/netappfiles-preview) | 0.3.2 | Provides a preview for upcoming Azure NetApp Files (ANF) features. | Yes |
| [az next](https://github.com/Azure/azure-cli-extensions) | 0.1.0 | Microsoft Azure Command-Line Tools Next Extension |  |
| [az notification-hub](https://github.com/Azure/azure-cli-extensions) | 0.2.0 | Microsoft Azure Command-Line Tools Notification Hub Extension |  |
| [az offazure](https://github.com/Azure/azure-cli-extensions/tree/master/src/offazure) | 0.1.0 | Microsoft Azure Command-Line Tools AzureMigrateV2 Extension |  |
| [az peering](https://github.com/Azure/azure-cli-extensions) | 0.2.0 | Microsoft Azure Command-Line Tools PeeringManagementClient Extension |  |
| [az portal](https://github.com/Azure/azure-cli-extensions) | 0.1.1 | Microsoft Azure Command-Line Tools Portal Extension |  |
| [az powerbidedicated](https://github.com/Azure/azure-cli-extensions/tree/master/src/powerbidedicated) | 0.2.0 | Microsoft Azure Command-Line Tools PowerBIDedicated Extension | Yes |
| [az privatedns](https://github.com/Azure/azure-cli-extensions) | 0.1.1 | Commands to manage Private DNS Zones | Yes |
| [az providerhub](https://github.com/Azure/azure-cli-extensions/tree/master/src/providerhub) | 0.1.0 | Microsoft Azure Command-Line Tools Providerhub Extension |  |
| [az quantum](https://github.com/Azure/azure-cli-extensions) | 0.1.0 | Microsoft Azure Command-Line Tools Quantum Extension | Yes |
| [az resource-graph](https://github.com/Azure/azure-cli-extensions/tree/master/src/resource-graph) | 1.1.0 | Support for querying Azure resources with Resource Graph. | Yes |
| [az sap-hana](https://github.com/Azure/azure-hanaonazure-cli-extension) | 0.6.4 | Additional commands for working with SAP HanaOnAzure instances. |  |
| [az scheduled-query](https://github.com/Azure/azure-cli-extensions) | 0.2.1 | Microsoft Azure Command-Line Tools Scheduled_query Extension | Yes |
| [az sentinel](https://github.com/Azure/azure-cli-extensions/tree/master/src/sentinel) | 0.1.0 | Microsoft Azure Command-Line Tools SecurityInsights Extension |  |
| [az spring-cloud](https://github.com/Azure/azure-cli-extensions/tree/master/src/spring-cloud) | 2.1.1 | Microsoft Azure Command-Line Tools spring-cloud Extension |  |
| [az ssh](https://github.com/Azure/azure-cli-extensions/tree/master/src/ssh) | 0.1.0 | SSH into VMs | Yes |
| [az stack-hci](https://github.com/Azure/azure-cli-extensions/tree/master/src/stack-hci) | 0.1.2 | Microsoft Azure Command-Line Tools AzureStackHCIClient Extension |  |
| [az storage-blob-preview](https://github.com/Azure/azure-cli-extensions) | 0.4.0 | Microsoft Azure Command-Line Tools Storage-blob-preview Extension | Yes |
| [az storage-preview](https://github.com/Azure/azure-cli-extensions/tree/master/src/storage-preview) | 0.7.0 | Provides a preview for upcoming storage features. | Yes |
| [az storagesync](https://github.com/Azure/azure-cli-extensions) | 0.1.0 | Microsoft Azure Command-Line Tools MicrosoftStorageSync Extension |  |
| [az stream-analytics](https://github.com/Azure/azure-cli-extensions) | 0.1.0 | Microsoft Azure Command-Line Tools stream-analytics Extension |  |
| [az subscription](https://github.com/Azure/azure-cli-extensions) | 0.1.4 | Support for subscription management preview. | Yes |
| [az support](https://github.com/azure/azure-cli-extensions/tree/master/src/support) | 1.0.2 | Microsoft Azure Command-Line Tools Support Extension |  |
| [az synapse](https://github.com/Azure/azure-cli-extensions) | 0.3.0 | Microsoft Azure Command-Line Tools Synapse Extension | Yes |
| [az timeseriesinsights](https://github.com/Azure/azure-cli-extensions/tree/master/src/timeseriesinsights) | 0.2.0 | Microsoft Azure Command-Line Tools TimeSeriesInsightsClient Extension |  |
| [az virtual-network-tap](https://github.com/Azure/azure-cli-extensions/tree/master/src/virtual-network-tap) | 0.1.0 | Manage virtual network taps (VTAP). | Yes |
| [az virtual-wan](https://github.com/Azure/azure-cli-extensions/tree/master/src/virtual-wan) | 0.2.4 | Manage virtual WAN, hubs, VPN gateways and VPN sites. | Yes |
| [az vm-repair](https://github.com/Azure/azure-cli-extensions/tree/master/src/vm-repair) | 0.3.4 | Auto repair commands to fix VMs. |  |
| [az vmware](https://github.com/Azure/az-vmware-cli) | 1.0.0 | Azure VMware Solution commands. |  |
| [az webapp](https://github.com/Azure/azure-cli-extensions/tree/master/src/webapp) | 0.3.1 | Additional commands for Azure AppService. | Yes |