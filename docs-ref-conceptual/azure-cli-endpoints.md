--- 
title: Endpoints used when installing the Azure CLI  | Microsoft Docs
description: Learn what endpoints are used when installing the Azure CLI.  These URLs are sometimes added to allowlists when working behind a firewall.
manager: mkluck
author: dbradish-microsoft
ms.author: dbradish
ms.prod: non-product-specific
ms.topic: conceptual
ms.date: 11/14/2022
ms.tool: azure-cli
---

# Overview

If your organization is secured with a firewall or proxy server, you must add certain internet protocol (IP) addresses and domain uniform resource locators (URLs) to the **allowlist** prior to installing the Azure CLI.

## Azure CLI endpoints for proxy bypass

The following tables provide lists of the endpoints and suffixes used by the Azure CLI.  These endpoints are specific to the Azure cloud where your organization is deployed.  We do not recommend adding additional Azure CLI-related URLs aside from those needed for specific Azure CLI reference groups, although you may want to add URLs related to other Microsoft products and services.

### [Public Cloud](#tab/azure-cloud)

### Endpoints

|Endpoint group | Endpoint
|-|-|
management | https://management.core.windows.net/
resource_manager | https://management.azure.com/
sql_management | https://management.core.windows.net:8443/
batch_resource_id | https://batch.core.windows.net/
gallery | https://gallery.azure.com/
active_directory | https://login.microsoftonline.com
active_directory_resource_id | https://management.core.windows.net/
active_directory_graph_resource_id | https://graph.windows.net/
microsoft_graph_resource_id | https://graph.microsoft.com/
active_directory_data_lake_resource_id | https://datalake.azure.net/
vm_image_alias_doc | https://raw.githubusercontent.com/Azure/azure-rest-api-specs/main/arm-compute/quickstart-templates/aliases.json
media_resource_id | https://rest.media.azure.net
ossrdbms_resource_id | https://ossrdbms-aad.database.windows.net
app_insights_resource_id | https://api.applicationinsights.io
log_analytics_resource_id | https://api.loganalytics.io
app_insights_telemetry_channel_resource_id | https://dc.applicationinsights.azure.com/v2/track
synapse_analytics_resource_id | https://dev.azuresynapse.net
attestation_resource_id | https://attest.azure.net
portal | https://portal.azure.com

### Endpoint suffixes

|Suffix name | Suffix
|-|-|
storage_endpoint | *.core.windows.net
storage_sync_endpoint | *.afs.azure.net
keyvault_dns | *.vault.azure.net
mhsm_dns | *.managedhsm.azure.net
sql_server_hostname | *.database.windows.net
mysql_server_endpoint | *.mysql.database.azure.com
postgresql_server_endpoint | *.postgres.database.azure.com
mariadb_server_endpoint | *.mariadb.database.azure.com
azure_datalake_store_file_system_endpoint | *.azuredatalakestore.net
azure_datalake_analytics_catalog_and_job_endpoint | *.azuredatalakeanalytics.net
acr_login_server_endpoint | *.azurecr.io
synapse_analytics_endpoint | *.dev.azuresynapse.net
attestation_endpoint | *.attest.azure.net

### [U.S. Government Cloud](#tab/us-government-cloud)

### Endpoints

|Endpoint group | Endpoint
|-|-|
management | https://management.core.usgovcloudapi.net/
resource_manager | https://management.usgovcloudapi.net/
sql_management | https://management.core.usgovcloudapi.net:8443/
batch_resource_id | https://batch.core.usgovcloudapi.net/
gallery | https://gallery.usgovcloudapi.net/
active_directory | https://login.microsoftonline.us
active_directory_resource_id | https://management.core.usgovcloudapi.net/
active_directory_graph_resource_id | https://graph.windows.net/
microsoft_graph_resource_id | https://graph.microsoft.us/
vm_image_alias_doc | https://raw.githubusercontent.com/Azure/azure-rest-api-specs/main/rm-compute/quickstart-templates/aliases.json
media_resource_id | https://rest.media.usgovcloudapi.net
ossrdbms_resource_id | https://ossrdbms-aad.database.usgovcloudapi.net
app_insights_resource_id | https://api.applicationinsights.us
log_analytics_resource_id | https://api.loganalytics.us
app_insights_telemetry_channel_resource_id | https://dc.applicationinsights.us/v2/track
synapse_analytics_resource_id | https://dev.azuresynapse.usgovcloudapi.net
portal | https://portal.azure.us

### Endpoint suffixes

|Suffix name | Suffix
|-|-|
storage_endpoint | *.core.usgovcloudapi.net
storage_sync_endpoint | *.afs.azure.us
keyvault_dns | *.vault.usgovcloudapi.net
mhsm_dns | *.managedhsm.usgovcloudapi.net
sql_server_hostname | *.database.usgovcloudapi.net
mysql_server_endpoint | *.mysql.database.usgovcloudapi.net
postgresql_server_endpoint | *.postgres.database.usgovcloudapi.net
mariadb_server_endpoint | *.mariadb.database.usgovcloudapi.net
acr_login_server_endpoint | *.azurecr.us
synapse_analytics_endpoint | *.dev.azuresynapse.usgovcloudapi.net'

### [Azure China Cloud](#tab/azure-china-cloud)

### Endpoints

|Endpoint group | Endpoint
|-|-|
management | https://management.core.chinacloudapi.cn/
resource_manager | https://management.chinacloudapi.cn
sql_management | https://management.core.chinacloudapi.cn:8443/
batch_resource_id | https://batch.chinacloudapi.cn/
gallery | https://gallery.chinacloudapi.cn/
active_directory | https://login.chinacloudapi.cn
active_directory_resource_id | https://management.core.chinacloudapi.cn/
active_directory_graph_resource_id | https://graph.chinacloudapi.cn/
microsoft_graph_resource_id | https://microsoftgraph.chinacloudapi.cn
vm_image_alias_doc | https://raw.githubusercontent.com/Azure/azure-rest-api-specs/main/rm-compute/quickstart-templates/aliases.json
media_resource_id | https://rest.media.chinacloudapi.cn
ossrdbms_resource_id | https://ossrdbms-aad.database.chinacloudapi.cn
app_insights_resource_id | https://api.applicationinsights.azure.cn
log_analytics_resource_id | https://api.loganalytics.azure.cn
app_insights_telemetry_channel_resource_id | https://dc.applicationinsights.azure.cn/v2/rack
synapse_analytics_resource_id | https://dev.azuresynapse.azure.cn
portal | https://portal.azure.cn

### Endpoint suffixes

|Suffix name | Suffix
|-|-|
storage_endpoint | *.core.chinacloudapi.cn
keyvault_dns | *.vault.azure.cn
mhsm_dns | *.managedhsm.azure.cn
sql_server_hostname | *.database.chinacloudapi.cn
mysql_server_endpoint | *.mysql.database.chinacloudapi.cn
postgresql_server_endpoint | *.postgres.database.chinacloudapi.cn
mariadb_server_endpoint | *.mariadb.database.chinacloudapi.cn
acr_login_server_endpoint | *.azurecr.cn
synapse_analytics_endpoint | *.dev.azuresynapse.azure.cn

### [Azure Germany Cloud](#tab/azure-germany-cloud)

### Endpoints

|Endpoint group | Endpoint
|-|-|
management | https://management.core.cloudapi.de/
resource_manager | https://management.microsoftazure.de
sql_management | https://management.core.cloudapi.de:8443/
batch_resource_id | https://batch.cloudapi.de/
gallery | https://gallery.cloudapi.de/
active_directory | https://login.microsoftonline.de
active_directory_resource_id | https://management.core.cloudapi.de/
active_directory_graph_resource_id | https://graph.cloudapi.de/
microsoft_graph_resource_id | https://graph.microsoft.de
vm_image_alias_doc | https://raw.githubusercontent.com/Azure/azure-rest-api-specs/main/arm-compute/quickstart-templates/aliases.json
media_resource_id | https://rest.media.cloudapi.de
ossrdbms_resource_id | https://ossrdbms-aad.database.cloudapi.de
portal | https://portal.microsoftazure.de

### Endpoint suffixes

|Suffix name | Suffix
|-|-|
storage_endpoint | *.core.cloudapi.de
keyvault_dns | *.vault.microsoftazure.de
mhsm_dns | *.managedhsm.microsoftazure.de
sql_server_hostname | *.database.cloudapi.de
mysql_server_endpoint | *.mysql.database.cloudapi.de
postgresql_server_endpoint | *.postgres.database.cloudapi.de
mariadb_server_endpoint | *.mariadb.database.cloudapi.de

---

## Extension endpoints

Azure CLI extensions are optional and installed separately.  All extensions install with endpoint **azcliprod.blob.core.windows.net** with the following exceptions:

|Extension name | Endpoint
|-|-|
| arcappliance | arcplatformcliextprod.blob.core.windows.net
| customlocation |
| arcdata | azurearcdatacli.blob.core.windows.net
| azure-batch-cli-extensions | github.com\Azure
| azure-devops |
| azure-iot |
| baremetal-infrastructure |
| csvmware |
| deploy-to-azure |
| sap-hana |
| azure-cli-ml | azurecliext.blob.core.windows.net
| azurestackhci | hybridaksstorage.z13.web.core.windows.net
| Hybridaks |
| fzf | pahealyfzf.blob.core.windows.net
|image-copy-extension | files.pythonhosted.org
| managementpartner |
| resource-graph |
| ml | azuremlsdktestpypi.blob.core.windows.net
| qbs | qbsazcliextension.blob.core.windows.net

To see a list of installed extension for the Azure CLI, enter `az` at your terminal command prompt and press **enter**.  To see a list of available extensions see [Available Azure CLI extensions](/cli/azure/azure-cli-extensions-list).

## Engineering questions
1. What about **pypi.org** and **files.pythonhosted.org**?  According to the customer request for installing the `connectedk8s` extension, they had to allow these two URLs.  I only see **files.pythonhosted.org** under `image-copy-extension`. **pypi.org** isn't in any list.

## See also

* [How to use the Azure CLI effectively - Work behind a proxy](/cli/azure/use-cli-effectively&tabs=bash%2Cbash2#work-behind-a-proxy)
* [Work with existing on-premises proxy servers](/azure/active-directory/app-proxy/application-proxy-configure-connectors-with-proxy-servers)
* [Azure Firewall threat intelligence configuration - Allowlist addresses](/azure/firewall-manager/threat-intelligence-settings#allowlist-addresses)
* Azure IP ranges and Service Tags
  [Public Cloud](https://www.microsoft.com/en-us/download/details.aspx?id=56519)
  [US Government Cloud](https://www.microsoft.com/en-us/download/details.aspx?id=57063)
  [Germany Cloud](https://www.microsoft.com/en-us/download/details.aspx?id=57064)
  [China Cloud](https://www.microsoft.com/en-us/download/details.aspx?id=57062)

omit these related links
* [Use the Azure PowerShell module behind a proxy](/powershell/azure/az-powershell-proxy)
* [Allow the Azure portal URLs on your firewall or proxy server](/azure/azure-portal/azure-portal-safelist-urls?tabs=public-cloud)
* [Allowed IP addresses and domain URLs for Azure DevOps Services](/azure/devops/organizations/security/allow-list-ip-url)
* [Access Azure Key Vault behind a firewall](/azure/key-vault/general/access-behind-firewall)