---
title: Azure CLI release notes
description: Learn about the latest updates to Azure CLI
author: sptramer
ms.author: sttramer
manager: carmonm
ms.date: 11/04/2019
ms.topic: article
ms.prod: azure
ms.technology: azure-cli
ms.devlang: azurecli
---

# Azure CLI release notes

## November 4, 2019

Version 2.0.76

### ACR

* Added a preview parameter `--pack-image-tag` to command `az acr pack build`.
* Supported enabling auditing on creating a registry
* Supported Repository-scoped RBAC

### AKS

* Added `--enable-cluster-autoscaler`, `--min-count` and `--max-count` to the `az aks create` command, which enables cluster autoscaler for the node pool.
* Added the above flags as well as `--update-cluster-autoscaler` and `--disable-cluster-autoscaler` to the `az aks update` command, allowing updates to cluster autoscaler.

### AppConfig

* Added appconfig feature command group to manage feature flags stored in an App Configuration.
* Minored bug fix for appconfig kv export to file command. Stop reading dest file contents during export.

### AppService

* `az appservice plan create`: Added support to set 'persitescaling' on appservice plan create.
* Fixed an issue where webapp config ssl bind operation was removing existing tags from the resource
* Added `--build-remote` flag for `az functionapp deployment source config-zip` to support remote build action during function app deployment.
* Changed default node version on function apps to ~10 for Windows
* Added `--runtime-version` property to `az functionapp create`

### ARM

* `az deployment/group deployment validate`: Added `--handle-extended-json-format` parameter to support multiline and comments in json template when deployment.
* Bumped azure-mgmt-resource to 2019-07-01

### Backup

* Added AzureFiles backup support

### Compute

* `az vm create`: Added warning when specifying accelerated networking and an existing NIC together.
* `az vm create`: Added `--vmss` to specify an existing virtual machine scale set that the virtual machine should be assigned to.
* `az vm/vmss create`: Added a local copy of image alias file so that it can be accessed in a restricted network environment.
* `az vmss create`: Added `--orchestration-mode` to specify how virtual machines are managed by the scale set.
* `az vm/vmss update`: Added `--ultra-ssd-enabled` to allow updating ultra SSD setting.
* [BREAKING CHANGE] `az vm extension set`: Fixed bug where users could not set an extension on a VM with `--ids`.
* Added new commands `az vm image terms accept/cancel/show` to manage Azure Marketplace image terms.
* Updated VMAccessForLinux to version 1.5

### CosmosDB

* [BREAKING CHANGE] `az sql container create`: Changed `--partition-key-path` to required parameter
* [BREAKING CHANGE] `az gremlin graph create`: Changed `--partition-key-path` to required parameter
* `az sql container create`: Added `--unique-key-policy` and `--conflict-resolution-policy`
* `az sql container create/update`: Updated the `--idx` default schema
* `gremlin graph create`: Added `--conflict-resolution-policy`
* `gremlin graph create/update`: Updated the `--idx` default schema
* Fixed typo in help message
* database: Added deprecation infomation
* collection: Added deprecation infomation

### IoT

* Added new routing source type: DigitalTwinChangeEvents
* Fixed missing features in `az iot hub create`

### Key Vault

* Fixed an unexpected error when certificate file does not exist
* Fixed `az keyvault recover/purge` not working

### NetAppFiles

* Upgraded azure-mgmt-netapp to 0.6.0 to use API version 2019-07-01. This new API version includes:

    - Volume creation `--protocol-types` accepts now "NFSv4.1" not "NFSv4"
    - Volume export policy property now named 'nfsv41' not 'nfsv4'
    - Volume `--creation-token` renamed to `--file-path`
    - Snapshot creation date now named just 'created'

### Network

* `az network private-dns link vnet create/update`: Support cross-tenant virtual network linking.
* [BREAKING CHANGE] `az network vnet subnet list`: Changed `--resource-group` and `--vnet-name` to be required now.
* `az network public-ip prefix create`: Supported to specify IP address version (IPv4, IPv6) when creation
* Bumped azure-mgmt-network to 7.0.0 and api-version to 2019-09-01
* `az network vrouter`: Supported new service virtual router and virtual router peering
* `az network express-route gateway connection`: Supported `--internet-security`

### Profile

* Fixed `az account get-access-token --resource-type ms-graph` not working
* Removed warning from `az login`

### RBAC

* Fixed `az ad app update --id {} --display-name {}` doesn't work

### ServiceFabric

* `az sf cluster create`: Fixed an issue by modifying service fabric linux and windows template.json compute vmss from standard to managed disks

### SQL

* Added `--compute-model`, `--auto-pause-delay`, and `--min-capacity` parameters to support CRUD operations for new SQL Database offering: Serverless compute model.

### Storage

* `az storage account create/update`: Added --enable-files-adds parameter and Azure Active Directory Properties Argument group to support Azure Files Active Directory Domain Service Authentication
* Expanded `az storage account keys list/renew` to support listing or regenerating Kerberos keys of storage account.

## October 15, 2019

Version 2.0.75

### AKS

* Changed `--load-balancer-sku` default value to `standard` if supported by the kubernetes version
* Changed `--vm-set-type` default value to `virtualmachinescalesets` if supported by the kubernetes version

### AMS

* [BREAKING CHANGE] Changed the name of `job start` to `job create`
* [BREAKING CHANGE] Changed the `--ask` parameter of `content-key-policy create` to use a 32-character hex string instead of UTF8

### AppService

* Added commands `webapp config access-restriction show|set|add|remove`
* Added better error handling to `webapp up`
* Added support for `Isolated` SKU to `appservice plan update`

### ARM

* Added `--handle-extended-json-format` parameter `deployment create` to support multiline and comments in json template

### Compute

* Added `--enable-agent` parameter to `vm create`
* Changed `vm create` to use standard public IP SKU automatically when using zones
* Changed `vm create` to automatically create a valid computer name for a VM if none is provided
* Added `--computer-name-prefix` parameter to `vmss create` to support custom computer name prefix of virtual machines in the VMSS
* Add `--workspace` parameter to `vm create` to enable log analytics workspace automatically
* Updated galleries API version to 2019-07-01

### Core

* Added syntax check for `--set` parameter in generic update command

### IoT

* Fixed an issue where `iot hub show` would incorrectly error with "resource not found"

### Monitor

* Added support for CRUD to `monitor log-analytics workspace`

### Network

* Added support for cross-tenant virtual linking to `network private-dns link vnet [create|update]`
* [BREAKING CHANGE] Changed `network vnet subnet list` to require `--resource-group` and `--vnet-name` parameters

### SQL

* Added commands to `sql mi ad-admin` that support setting an AAD administrator on managed instances

### Storage

* Added `--preserve-s2s-access-tier` parameter `storage copy` to preserve access tier during service to service copy
* Added `--enable-large-file-share` parameter to `storage account [create|update]` to support large file shares for storage account

## September 24, 2019

Version 2.0.74

### ACR

* Added a required `--type` parameter to `acr config retention update`
* [BREAKING CHNAGE] Renamed parameter `--name -n` changed to `--registry -r ` for `acr config` command group

### AKS

* Added `--load-balancer-sku` parameter to `aks create` command, which allows for creating AKS cluster with SLB
* Added `--load-balancer-managed-outbound-ip-count`, `--load-balancer-outbound-ips` and `--load-balancer-outbound-ip-prefixes` parameters to `aks [create|update]` commands, which allow for updating load balancer profile of an AKS cluster with SLB
* Added `--vm-set-type` parameter to `aks create` command, which allows to specify vm types of an AKS Cluster (vmas or vmss)

### ARM

* Added `--handle-extended-json-format` parameter to `group deployment create` command to support multiline and comments in json template

### Compute

* Added `--terminate-notification-time` parameter to `vmss [create|update]` commands to support terminate scheduled event configurability
* Added `--enable-terminate-notification` parameter to `vmss update` command to support terminate scheduled event configurability
* Added `--priority,` `--eviction-policy,` `--max-billing` parameters to `[vm|vmss] create` commands
* Changed `disk create` to allow specifying the exact size of the disk upload
* Added support for incremental snapshots for managed disks to `snapshot create`

### Cosmos DB

* Added `--type <key-type>` parameter to `cosmosdb keys list` command to show key, read only keys or connection strings
* Added `cosmosdb keys regenerate` command
* [DEPRECATED] Deprecated `cosmosdb list-connection-strings`, `cosmosdb regenerate-key` and `cosmosdb list-read-only-keys` commands

### EventGrid

* Fixed the endpoint help text to refer to the right parameter

### Key Vault

* Fixed issue where logging in with a tenant (`login -t`) could cause `keyvault create` to fail

### Monitor

* Fixed issue where `:` character was not allowed in `--condition` argument to `monitor metrics alert create`

### Policy

* Added support for Policy API version 2019-06-01
* Added `--enforcement-mode` parameter to `policy assignment create` command

### Storage

* Added `--blob-type` parameter to `az storage copy` command

## September 10, 2019

### ACR

* Added command group `acr config retention` to configure retention policy

### AKS

* Added support for ACR integration with the following commands:
  * Added `--attach-acr` parameter to `aks [create|update]` to attach an ACR to an AKS cluster
  * Added `--detach-acr` parameter to `aks update` to detach the ACR from an AKS cluster

### ARM

* Updated to use API version 2019-05-10

### Batch

* Added new JSON configuration settings to `--json-file` for `batch pool create`:
  * Added `MountConfigurations` for file system mounts (see https://docs.microsoft.com/en-us/rest/api/batchservice/pool/add#request-body for details)
  * Added optional property `publicIPs` on `NetworkConfiguration` for public IPs on pools
    (see https://docs.microsoft.com/en-us/rest/api/batchservice/pool/add#request-body for details)
* Added support for shared image galleries to `--image`
* [BREAKING CHANGE] Changed default value of `--start-task-wait-for-success` on `batch pool create` to be `true`
* [BREAKING CHANGE] Changed default value for `Scope` on `AutoUserSpecification` to always be Pool (was `Task` on Windows nodes, `Pool` on Linux nodes)
  * This argument can only be set from a JSON configuration with `--json-file`

### HDInsight

* GA release
* [BREAKING CHANGE] Changed parameter `--workernode-count/-c` of `az hdinsight resize` to be required.

### Key Vault

* Fixed issue where subnets couldn't be deleted from network rules
* Fixed issue where duplicated subnets and IP addresses could be added to network rules

### Network

* Added `--interval` parameter to `network watcher flow-log` to set traffic analysis interval value
* Added `network application-gateway identity` to manage gateway identity
* Added support for setting Key Vault ID to `network application-gateway ssl-cert`
* Added `network express-route peering peer-connection [show|list]`

### Policy

* Updated to use API version 2019-01-01

## August 27, 2019

Version 2.0.72

### ACR

* [BREAKING CHANGE] Removed support for the `classic` SKU

### API Management

* [PREVIEW] Added `apim` command group

### AppService

* Fixed issue with `webapp webjob continuous start` command when specifying a slot
* Changed `webapp up` to detect `env` folder and remove it from the file used for deployment

### Keyvault

* Fixed a bug in `keyvault secret set` that igored the `--expires` argument

### Network

* Added support for IPv6 addresses to `--private-ip-address-version` arguments
* Added new commands `network private-endpoint [create|update|list-types]` for private endpoint management
* Added command group `network private-link-service`
* Added `--private-endpoint-network-policies` and `--private-link-service-network-policies` arguments to `network vnet subnet update`

### RBAC

* Fixed issue with `ad app update --homepage` where homepage would not be updated

### ServiceFabric

* Added support for mixed-case Key Vault names
* Fixed issue when using certificates in Key Vault
* Fixed issue with using PFX certificate files
* Fixed issue with `sf cluster certificate add` when Key Vault resource group wasn't specified
* Fixed issue with `sf cluster set` not working

### SignalR

* Added new commands:
  * `signalr cors`: Manage SignalR CORS
  * `signalr restart`: Restart a SignalR service
  * `signalr update`: Update a SignalR service
* Added `--service-mode` argument to `signalr create`

### Storage

* Added `storage account revoke-delegation-keys` command

## August 13, 2019

Version 2.0.71

### AppService

* Fixed issue where `webapp webjob continuous` commands were failing for slots

### BotService

* [BREAKING CHANGE] Removed support for creating v3 SDK bots

### CognitiveServices

* Added `cognitiveservices account network-rule` commands

### Cosmos DB

* Removed warning when updating multiple write locations
* Added CRUD commands for CosmosDB SQL, MongoDB, Cassandra, Gremlin and Table resources and resource's throughput

### HDInsight

This release contains a large number of breaking changes.

* [BREAKING CHANGE] Renamed parameters for `hdinsight create`:
  * Renamed `--storage-default-container` to `--storage-container`
  * Renamed `--storage-default-filesystem` to `--storage-filesystem`
* [BREAKING CHANGE] Changed the `--name` argument of `application create` to represent the application name instead of the cluster name
* Added `--cluster-name` argument to `application create` to replace old `--name` functionality
* [BREAKING CHANGE] Renamed parameters for `application create`:
  * Renamed `--application-type` to `--type`
  * Renamed `--marketplace-identifier` to `--marketplace-id`
  * Renamed `--https-endpoint-access-mode` to `--access-mode`
  * Renamed  `--https-endpoint-destination-port` to `--destination-port`
* [BREAKING CHANGE] Removed parameters for `application create`:
  * `--https-endpoint-location`
  * `--https-endpoint-public-port`
  * `--ssh-endpoint-destination-port`
  * `--ssh-endpoint-location`
  * `--ssh-endpoint-public-port`
* [BREAKING CHNAGE] Renamed `--target-instance-count` to `--workernode-count` for `hdinsight resize`
* [BREAKING CHANGE] Changed all commands in the `hdinsight script-action` group to use the `--name` parameter as the name of the script action.
* Added `--cluster-name` argument to all `hdinsight script-action` commands to replace old `--name` functionality
* [BREAKING CHANGE] Renamed `--script-execution-id` to `--execution-id` for all `hdinsight script-action` commands
* [BREAKING CHANGE] Renamed `hdinsight script-action show` to `hdinsight script-action show-execution-details`
* [BREAKING CHNAGE] Changed parameters to `hdinsight script-action execute --roles` to be space-separated instead of comma-separated
* [BREAKING CHANGE] Removed the `--persisted` parameter of `hdinsight script-action list`
* Changed the `hdinsight create --cluster-configurations` parameter to accept a path to a local JSON file or a JSON string
* Added command `hdinsight script-action list-execution-history`
* Changed `hdinsight monitor enable --workspace` to accept a Log Analytics workspace ID or workspace name
* Added the `hdinsight monitor enable --primary-key` argument, which is needed if a workspace ID is provided as the parameter
* Added more examples and updated descriptions for help messages

### Interactive

* Fixed a loading error

### Kubernetes

* Changed to use `https` if dashboard container port is using `https`

### Network

* Added `--yes` argument `network dns record-set cname delete`

### Profile

* Added `--resource-type` argument to `account get-access-token` to get resource access tokens

### ServiceFabric

* Added all supported os version for sf cluster create
* Fixed primary certificate validation bug

### Storage

* Added command `storage copy`

## July 30, 2019

Version 2.0.70

### ACR

* Fixed issue #9952 (a regression in the `acr pack build` command)
* Removed the default builder image name in `acr pack build`

### Appservice

* Changed `webapp config ssl` to show a message if a resource is not found
* Fixed issue where `functionapp create` does not accept `Standard_RAGRS` storage account type
* Fixed an issue where `webapp up` would fail if run using older versions of python

### Network

* Removed invalid parameter `--ids` from `network nic ip-config add` (fixes #9861)
* Fixes #9604. Added `--root-certs` parameter to `network application-gateway http-settings [create|update]` to support user associate trusted root certificates.
* Fixed arguent `--subscription` for `network dns record-set ns create` (#9965)

### RBAC

* Added `user update` command
* [DEPRECATED] Deprecated `--upn-or-object-id` from user-related commands
    * Use replacement argument `--id`
* Added `--id` argument to user-related commands

### SQL

* Added management commands for managed instance keys and TDE protector

### Storage

* Added `storage remove` command
* Fixed an issue with `storage blob update`

### VM

* Changed `list-skus` to use newer api-version to output zone details
* Changed default of `--single-placement-group` to `false` for `vmss create`
* Added ability to select ZRS storage SKUs for `[snapshot|disk] create`
* Added new command group `vm host` to support dedicated hosts
* Added parameters `--host` and `--host-group` on `vm create` to set VM dedicated host

## July 16, 2019

Version 2.0.69

### Appservice

* Changed `webapp identity` commands to return a proper error message if ResourceGroupName or App name are invalid
* Fixed `webapp list` to return the correct value for numberOfSites if no ResourceGroup was provided
* Fixed side-effects of `appservice plan create` and `webapp create`

### Core

* Fixed issue where `--subscription` would appear despite being not applicable

### Batch

* [BREAKING CHANGE] Replaced `batch pool node-agent-skus list` with `batch pool supported-images list`
* Added support for security rules blocking network access to a pool based on the source port of the traffic when using the `--json-file` option of `batch pool create network`
* Added support for executing the task in the container working directory or in the Batch task working directory when using the `--json-file` option of `batch task create`
* Fixed error in `--application-package-references` option of `batch pool create` where it would only work with defaults

### Eventhubs

* Added validation for parameter `--rights` of `authorizationrule` commands

### RDBMS

* Added optional parameter to specify replica SKU for create replica command
* Fixed the issue with CI test failure with creating MySQL replica

### Relay

* Fixed issue with hybrid connection when client authroization disabled [#8775](https://github.com/azure/azure-cli/issues/8775)
* Added parameter `--requires-transport-security` to `relay wcfrelay create`

### Servicebus

* Added validation for parameter `--rights` of `authorizationrule` commands

### Storage

* Enable Files AADDS for storage account update
* Fixed issue `storage blob service-properties update --set`

## July 2, 2019

Version 2.0.68

### Core

* Command modules are now consolidated into a single Python distributable. This deprecates direct use of many `azure-cli-` packages on PyPI.
  This should reduce install size and only affect users who have directly installed via `pip`.

### ACR

* Added support for Timer Triggers to Task

### Appservice

* Changed `functionapp create` to enable application insights by default
* [BREAKING CHANGE] Removed deprecated `functionapp devops-build` command.
  *  Use the new command `az functionapp devops-pipeline` instead
* Added Linux Consumption function app plan support to `functionapp deployment config-zip`

### Cosmos DB

* Added support for disabling TTL

### DLS

* Updated ADLS version (0.0.45)

### Feedback

* When reporting a failed extension command, `az feedback` now attempts to open the browser to the project/repo url of the
  extension from the index

### HDInsight

* [BREAKING CHANGE] Changed `oms` command group name to `monitor`
* [BREAKING CHANGE] Made `--http-password/-p` a required parameter 
* Added completers for `--cluster-admin-account` and `cluster-users-group-dns` parameters completer 
* Changed `cluster-users-group-dns` parameter to be required when `—esp` is present
* Added a timeout for all existing argument auto-completers
* Added a timeout for transforming resource name to resource id
* Changed Auto-completers to select resources from any resource group. It can be a different resource group than the one specified with `-g`
* Added support for `--sub-domain-suffix` and `--disable_gateway_auth` parameters in the `hdinsight application create` command

### Managed Services

* Introducing managed service command module in preview

### Profile
* Suppress `--subscription` argument for logout command

### RBAC

* [BREAKING CHANGE] Removed `--password` argument for `create-for-rbac`
* Added `--assignee-principal-type` parameter to `create` command to avoid intermittent failures caused by AAD graph server replication latency
* Fixed a crash in `ad signed-in-user` when listing owned objects
* Fixed issue where `ad sp` would not find the right application from a service principal

### RDBMS

* Added support for replication for MariaDB

### SQL

* Documented allowed values for `sql db create --sample-name`

### Storage

* Added user delegation SAS token support with `--as-user` to `storage blob generate-sas` 
* Added user delegation SAS token support with `--as-user` to `storage container generate-sas` 

### VM

* Fixed bug where `vmss create` returns an error message when run with `--no-wait`
* Removed client-side validation for `vmss create --single-placement-group`. Does not fail if `--single-placement-group` is
  set to `true` and`--instance-count` is greater than 100 or availability zones are specified, but leaves this validation
  to the compute service
* Fixed bug where `[vm|vmss] extension image list` fails when used with `--latest`


## June 18, 2019

Version 2.0.67

### Core

This release introduces a new [Preview] tag to more clearly communicate to customers
when a command group, command or argument is in preview status. This was previously
called out in help text or communicated implicitly by the command module version number.
The CLI will be removing version numbers for individual packages in the future. If a command is
in preview, all of its arguments are as well. If a command group is
labeled as being in preview, then all commands and arguments are considered to be in
preview as well.

As a result of this change, several command groups may seem to "suddenly" appear to be
in a preview status with this release. What actually happened is that most packages were
in a preview status, but are being deemed GA with this release

### ACR
* Added 'acr check-health' command
* Improved error handling for AAD tokens and for retrieving external commands

### ACS
* Deprecated ACS commands are now hidden from help view

### AMS
* [BREAKING CHANGE] Changed to return ISO 8601 time strings for archive-window-length and key-frame-interval-duration

### AppService
* Added location based routing for `webapp deleted list` and `webapp deleted restore`
* Fixed issue where webapp up logged target URL ("You can launch the app at...") was not clickable in Azure Cloud Shell
* Fixed an issue where creating apps with the some SKUs was failing with an AlwaysOn error
* Added pre-validation to `[appservice|webapp] create`
* Fixed `[webapp|functionapp] traffic-routing` to use the correct actionHostName
* Added slot support to `functionapp` commands

### Batch
* Fixed AAD auth regression caused by over-aggressive error reporting for Shared Key Auth

### BatchAI
* BatchAI commands are now deprecated and hidden

### BotService
* Added "discontinued support"/"maintenance mode" warning messages for commands that support the v3 SDK

### CosmosDB
* [DEPRECATED] Deprecated the `cosmosdb list-keys` command
* Added the `cosmosdb keys list` command - replaces `cosmosdb list-keys`
* `cosmsodb create/update`: Added new format for --location to allow setting "isZoneRedundant" property. Deprecated old format

### EventGrid
* Added `eventgrid domain` commands for domain CRUD operations
* Added `eventgrid domain topic` commands for domain topics CRUD operations
* Added `--odata-query` argument to `eventgrid [topic|event-subscription] list` for filtering results using OData syntax
* `event-subscription create/update`: Added servicebusqueue as new values for the `--endpoint-type` parameter
* [BREAKING CHANGE] Removed support for `--included-event-types All` with `eventgrid event-subscription [create|update]`

### HDInsight
* Added support for `--ssh-public-key` parameter in `hdinsight create` command

### IoT
* Added support to regenerate authorization policy keys
* Added SDK and support for DigitalTwin Repository Provisioning Service

### Network
* Added Zone support for Nat Gateway
* Added command `network list-service-tags`
* Fixed issue with `dns zone import` where users could not import wildcard A records
* Fixed issue with `watcher flow-log configure` where flow logging could not be enabled in certain regions

### Resource
* Added `az rest` command for making REST calls
* Fixed error when using `policy assignment list` with a resource group or subscription level `--scope`

### ServiceBus
* Fixed issue with `servicebus topic create --max-size` [#9319](https://github.com/azure/azure-cli/issues/9319)

### SQL
* Changed `--location` to be optional for `sql [server|mi] create` - uses resource group location if not specified
* Fixed "'NoneType' object is not iterable" error for `sql db list-editions --available`

### SQLVm
* [BREAKING CHNAGE] Changed `sql vm create` to require `--license-type` parameter
* Changed to allow setting SQL image SKU when creating or updating a sql vm

### Storage
* Fixed issue with missing account key for `storage container generate-sas`
* Fixed issue with `storage blob sync` on Linux

### VM
* [PREVIEW] Added `vm image template` commands to build VM images

## June 4, 2019

Version 2.0.66

### Core
* Fixed bug where commands fail if `--output yaml` is used with `--query`

### ACR
* Added 'acr pack' command group for creating quick build Tasks using Buildpacks.

### ACS
* Allow enabling/disabling AKS kube-dashboard addon
* Print a friendly message when the subscription is not whitelisted to use Azure Red Hat OpenShift

### Batch
* Improved error handling when not logged in to an account \[[#9165](https://github.com/Azure/azure-cli/issues/9165)\]\[[#8978](https://github.com/Azure/azure-cli/issues/8978)\]

### IoT
* Added support for manual failover

### Network
* Added `network application-gateway waf-policy` commands to support custom WAF rules.
* Added `--waf-policy` and `--max-capacity` arguments to `network application-gateway [create|update]` 

### Resource
* Improved error message from `deployment create` when there is no TTY available

### Role
* Updated help text.

### Compute
* Added support to `vm create` for VMs from a managed image with data-disk luns that do not start from 0 or that skip numbers

## May 21, 2019

Version 2.0.65

### Core
* Added better feedback for authentication errors
* Fixed issue where the CLI would load extensions that were not compatible with its core version
* Fixed issue with launching when `clouds.config` is corrupted

### ACR
* Added support for Managed Identities to Tasks

### ACS
* Fixed `openshift create` command when used with customer AAD client

### AppService
* [DEPRECATED] Deprecated `functionapp devops-build` command - will be removed in next release
* Changed `functionapp devops-pipeline` to fetch build log from Azure DevOps in verbose mode
* [BREAKING CHANGE] Removed `--use_local_settings` flag from `functionapp devops-pipeline` command - was a no-op
* Changed `webapp up` to return JSON output if `--logs` is not used
* Added support for writing default resources to local config for `webapp up`
* Added support to `webapp up` for redeploying an app without using the `--location` argument
* Fixed an issue where for Linux Free SKU ASP creation use Free as SKU value was not working

### BotService
* Changed to allow all casing for `--lang` parameters for commands
* Updated description for command module

### Consumption
* Added missing required parameter when running `consumption usage list --billing-period-name`

### IoT
* Added support to list all keys

### Network
* [BREAKING CHANGE]: Removed `network interface-endpoints` command group - use `network private-endpoints` 
* Added `--nat-gateway` argument to `network vnet subnet [create|update]` for attaching to a NAT gateway
* Fixed issue with `dns zone import` where record names could not match a record type

### RDBMS
* Added postgres and mysql support for geo replication

### RBAC
* Added support for management group scope to `role assignment`

### Storage
* `storage blob sync`: add sync command for storage blob

### Compute
* Added `--computer-name` to `vm create` for setting a VM's computer name
* Renamed `--ssh-key-value` renamed to `--ssh-key-values` for `[vm|vmss] create` - can now accept multiple ssh public key values or paths
  * __Note__: This is **not** a breaking change - `--ssh-key-value` will be parsed correctly as it matches only `--ssh-key-values`
* Changed the `--type` argument of `ppg create` to be optional

## May 6, 2019

Version 2.0.64

### ACS
* [BREAKING CHANGE] Removed `--fqdn` flag on `openshift` commands
* Changed to use Azure Red Hat Openshift GA API Version
* Added `customer-admin-group-id` flag to `openshift create`
* [GA] Removed `(PREVIEW)` from `aks create` option `--network-policy`

### Appservice
* [DEPRECATED] Deprecated `functionapp devops-build` command
  * Renamed to `functionapp devops-pipeline`
* Fixed getting the correct username for cloudshell which was causing `webapp up` to fail
* Updated `appservice plan --sku` documentation updated to reflect the supported appserviceplans
* Added optional arguments for resource group and plan to `webapp up`
* Added support to `webapp ssh` to respect `AZURE_CLI_DISABLE_CONNECTION_VERIFICATION` environment variable
* Added `appserviceplan create` support for Linux Free SKU
* Changed `webapp up` to have a 30s sleep after setting `SCM_DO_BUILD_DURING_DEPLOYMENT=true` appsetting to handle kudu cold start
* Added support for `powershell` runtime to `functionapp create` on Windows
* Added `create-remote-connection` command

### Batch
* Fixed bug in validator for `--application-package-references` options

### Botservice
* [BREAKING CHANGE] Changed `bot create -v v4 -k webapp` to create an empty Web App Bot by default (i.e. no bot is deployed to the App Service)
* Added `--echo` flag to `bot create` to use the old behavior with `-v v4`
* [BREAKING CHANGE] Changed the default value of  `--version` to `v4`
  * __NOTE:__ `bot prepare-publish` still uses the its old default
* [BREAKING CHANGE] Changed `--lang` to no longer default to `Csharp`. If the command requires `--lang` and it is not provided, the command will now error out
* [BREAKING CHANGE] Changed the `--appid` and `--password` args for `bot create` to be required and can now be created via `ad app create`
* Added `--appid` and `--password` validation
* [BREAKING CHANGE] Changed `bot create -v v4` to not create or use a Storage Account or Application Insights
* [BREAKING CHANGE] Changed `bot create -v v3` to require a region where Application Insights is available
* [BREAKING CHANGE] Changed `bot update` to now affect only specific properties of a bot
* [BREAKING CHANGE] Changed `--lang` flags to accept `Javascript` instead of `Node`
* [BREAKING CHANGE] Removed `Node` as an allowed `--lang` value
* [BREAKING CHANGE] Changed `bot create -v v4 -k webapp` to no longer set `SCM_DO_BUILD_DURING_DEPLOYMENT` to true. All deployments through Kudu will act according to their default behavior
* Changed `bot download` for bots without `.bot` files to create the language-specific configuration file with values from the Application Settings for the bot
* Added `Typescript` support to `bot prepare-deploy`
* Added warning message to `bot prepare-deploy` for `Javascript` and `Typescript` bots for when `--code-dir` does not contain `package.json`
* Changed `bot prepare-deploy` to return `true` if successful
* Added verbose logging to `bot prepare-deploy`
* Added more available Application Insights regions to `az bot create -v v3`

### Configure
* Added support for folder based argument default value configurations

### Eventhubs
* Added `namespace network-rule` commands
* Added `--default-action` argument for network rules to `namespace [create|update]`

### Network
* [BREAKING CHANGE] Replaced `--cache` arugment with `--defer` for `vnet [create|update]` 

### Policy Insights
* Added support for `--expand PolicyEvaluationDetails` to query policy evaluation details on the resource

### Role
* [DEPRECATED] Changed `create-for-rbac` hide '--password' argument - support will be removed in May 2019

### Service Bus
* Added `namespace network-rule` commands
* Added `--default-action` argument for network rules to `namespace [create|update]`
* Fixed `topic [create|update]` to allow `--max-size` support for 10, 20, 40 and 80GB values with premium SKU

### SQL
* Added `sql virtual-cluster [list|show|delete]` commands

### VM
* Added `--protect-from-scale-in` and `--protect-from-scale-set-actions` to `vmss update` to enable updates to the protection policy of VMSS VM instances
* Added `--instance-id` to `vmss update` to enable generic update of VMSS VM instances
* Added `--instance-id` to `vmss wait`
* Added new `ppg` command group for managing Proximity Placement Groups
* Added `--ppg` to `[vm|vmss] create` and `vm availability-set create` for managing PPGs
* Added `--hyper-v-generation` parameter to `image create`

## April 23, 2019

Version 2.0.63

### ACS
* Changed `aks get-credentials` to prompt to overwrite duplicated values
* Removed `(PREVIEW)` from Dev Spaces commands "aks use-dev-spaces" and "aks remove-dev-spaces"

### AMS
* Fixed bug with asset and account filters update

### AppService
* Added support for ASE and timeout to `webapp ssh`
* Added support for establishing CI CD to an Azure DevOps pipeline from a Github repository to Function apps
* Added `--github-pat` argument to `functionapp devops-build create` to accept Github personal access token
* Added `--github-repository` argument to `functionapp devops-build create` to accept Github repository that contains a functionapp source code
* Fixed issue where `az webapp up --logs` was failing with a error and updating default .NETCORE version to 2.1
* Removed unnecessary functionapp settings when creating a function app with consumption plan
* Changed `webapp up` so the default asp string now appends number at the end to create a new ASP based on SKU options
* Added `-b` as an option to `webapp up` to launch the app in the browser
* Changed `webapp deployment source config zip` to handle `AZURE_CLI_DISABLE_CONNECTION_VERIFICATION` environment variable

### Deployment Manager
* [PREVIEW] Create and manage artifacts that support rollouts

### Lab
* Fixed bug which would cause an early exit

### Network
* Added auto name server delegation to `dns zone create` in parent during child zone creation

### Resource
* [DEPRECATED] Deprecated `--link-id`, `--target-id` and `--filter-string` arguments of `resource link`
  * Use the arguments `--link`, `--target`, and `--filter` instead
* Fixed issue where `resource link [create|update]` commands would not work
* Fixed an issue where deleting using a resource ID could crash on error

### SQL
* Added support for custom time zone on managed instances
* Changed to allow elastic pool name to be used with `sql db update`
* Added `--no-wait` support to `sql server [create|update]`
* Added command `sql server wait`

### Storage
* Fixed issue with double-encoded SAS tokens in `storage blob generate-sas`

### VM
* Added `--skip-shutdown` flag to `vm|vmss stop` to power-off VMs without shutdown
* Added `--storage-account-type` argument to `sig image-version create` to set the publishing profile's account type
* Added `--target-regions` argument to `sig image-version create` to allow setting region-specific storage account types

## April 9, 2019

### Core
* Fixed issue where some extensions showed a version of `Unknown` and could not be updated

### ACR
* Added support running an image contextlessly

### AMS
* [DEPRECATED]: Deprecated the `--bitrate` parameter of `account-filter` and `asset-filter`
* [BREAKING CHANGE]: Renamed the `--bitrate` parameter to `--first-quality`
* Added new encryption parameters support in `ams streaming-policy create`
* Added new paramter `--filters` to `ams streaming-locator create`

### AppService
* Added `--logs` support to `webapp up`
* Fixed `functionapp devops-build create` command `azure-pipelines.yml` generation issues
* Improved `unctionapp devops-build create` error handling and indicators
* [BREAKING CHANGE] Removed the `--local-git` flag for `devops-build` command, local git detection and handling are compulsory for creating Azure DevOps pipelines
* Added support for Linux functions plan creation
* Added ability to switch a plan underneath a function app using `functionapp update --plan`
* Added support for Azure Functions premium plan scale out settings

### CDN
* Added support for `Microsoft_Standard` and `Standard_ChinaCdn`

### Feedback
* Changed `feedback` to show metadata on recently run commands
* Changed `feedback` to prompt user to assist in issue creation process by opening a brower and using an issue template
* Changed `feedback` to print out issue body when run with '--verbose'

### Monitor
* Fixed issue where "count" was not a permitted value with `metrics alert [create|update]` 

### Network
* Fixed table format not displaying with `vnet-gateway list-bgp-peer-status`
* Added `list-request-headers` and `list-response-headers` commands to `application-gateway rewrite-rule`
* Added `list-server-variables` command to `application-gateway rewrite-rule condition`
* Fixed an issue where updating link state on an express-route port would throw an unknown attribute exception `express-route port update`

### PrivateDNS
* Added `network private-dns` for Private DNS zones

### Resource
* Fixed issue with `deployment create` and `group deployment create` where a parameters file with an empty set of parameters would not work

### Role
* Fixed `create-for-rbac` to handle `--years` correctly
* [BREAKING CHANGE] Changed `role assignment delete` to prompt when deleting all assignments under the subscription unconditionally

### SQL
* Updated `sql mi [create|update]` with the properties proxyOverride and publicDataEndpointEnabled

### Storage
* [BREAKING CHANGE] Removed result of `storage blob delete`
* Added `--full-uri` to `storage blob generate-sas` to create the full uri for the blob with sas
* Added `--file-snapshot` to `storage file copy start` to copy file from snapshot
* Changed `storage blob copy cancel` to only show the error instead of exception for NoPendingCopyOperation

## March 26, 2019


### Core
* Fixed issues with dev extension incompatibility
* Error handling now points customers to issues page

### Cloud
* Fixed a 'subscription not found' error in `cloud set`

### ACR
* Fixed redundant sources in image import
* Added `--auth-mode` to `acr build`, `acr run`, `acr task create`, and `acr task update` commands
* Added 'acr task credential' command group for managing credentials for a Task
* Added '--no-wait' to `acr build` command

### AppService
* Fixed bug where `webapp up` was not handling running from empty directory or unknown code scenario correctly
* Fixed bug where slots didn't work for `[webapp|functionapp] config ssl bind`

### BOT Service
* Added `bot prepare-deploy` to prepare for deploying bots via `webapp`
* Changed `bot create --kind registration` to show password if the password is not provided
* [BREAKING CHANGE] Changed `--endpoint` in `bot create --kind registration` to default to an empty string instead of being required
* Added `SCM_DO_BUILD_DURING_DEPLOYMENT` to ARM template's Application Settings for v4 Web App Bots

### CDN
* Added support for `--no-wait` to `cdn endpoint [create|update|start|stop|delete|load|purge]`  
* [BREAKING CHANGE]: Changed `cdn endpoint create` default query string caching behaviour. No longer defaults to "IgnoreQueryString". It is now set by the service

### Cosmosdb
* Added support for `--enable-multiple-write-locations` on account update
* Added `network-rule` subgroup with commands `add`, `remove`, and `list` for managing VNET rules of a Cosmos DB account

### Interactive
* Fixed incompatibility with Interactive extension installed through azdev

### Monitor
* Changed to allow dimension value `*` for `monitor metrics alert [create|update]`

### Network
* Added `rewrite-rule` command group to `application-gateway`

### Profile
* Added tenant level account support for managed service identity to `login`

### Postgres 
* Added postgresql `replica` commands and `restart server` command
* Changed to get default location from resource group when not provided for creating servers and add validation for retention days

### Resource
* Improved table output for `deployment [create|list|show]`
* Fixed issue with `deployment [create|validate]` where type secureObject was not recognized

### Graph
* Added support for `--end-date` to `ad [app|sp] credential reset`
* Added support to add permissions with `ad app permission add`
* Fixed a bug with `ad app permission list` when there were no permissions
* Changed `ad sp delete` to skip role assignment delete if the current account has no subscription
* Changed `ad app create` to have `--identifier-uris` default to empty list if not provided

### storage
* Added `--snapshot` to `storage file download-batch` to download from a share snapshot
* Changed `storage blob [download-batch|upload-batch]` progress bar to be less verbose and indicate current blob
* Fixed issue with `storage account update` when updating encryption parameters
* Fixed issue where `storage blob show` would fail when using oauth (`--auth-mode=login`)

### VM
* Added `image update` command

## March 12, 2019

Version 2.0.60

### Core

* Fixed an incorrect error in `cloud set` about subscription not found

### ACR

* Fixed redundant sources in image import

### ACS

* Changed to ignore the `--listen-address` parameter for `aks browse` if it is not supported by kubectl 

### AppService

* Added `[webapp|functionapp] deployment list-publishing-credentials` to get the Kudu publishing url and its credentials
* Removed erroneous print statement for `webapp auth update`
* Fixed `functionapp` to set the correct image for runtime in Linux App Service plans
* Removed preview tag for `webapp up` and added improvements to the command

### Botservice

* Added `SCM_DO_BUILD_DURING_DEPLOYMENT` to ARM template's Application Settings for v4 Web App Bots
* Added `Microsoft-BotFramework-AppId` and `Microsoft-BotFramework-AppPassword` to ARM template's Application Settings for v4 Web App Bots
* Removed single quotes from `bot publish` command output at end of `bot create`
* Changed `bot publish` to be asynchronous

### Container

* Added `--no-wait` argument to `container [start|restart]`

### EventHub

* Added `--skip-empty-archives` flag to `eventhub create|update` to support empty archives in capture

### Find

* Major functionality update

### HDInsight

* Added the `--storage-account-managed-identity` parameter to `hdinsight create` to support ADLS Gen2 MSI

### Network

* Fixed issue with `vpn-connection update` where updating a VPN connection between gateways in different subscriptions would fail

### Rdbms

* Minor fixes to get default location from resource group when not provided for creating servers and add validation for retention days

### Role

* Fixed `role definition update` to use ID to resolve definition correctly
* Changed `ad app credential reset` to remove the assumption that app's service principal always exists

### Service Fabric

* Fixed issue with `sf cluster list` was not iterable

## February 26, 2019

Version 2.0.59

### Core

* Fixed issue where in some instances using `--subscription NAME` would throw an exception

### ACR

* Added `--target` parameter for `acr build`, `acr task create` and `acr task update` commands
* Improved error handling for runtime commands when not logged into Azure

### ACS

* Added `--listen-address` option to `aks port-forward`

### AppService

* Added `functionapp devops-build` command

### Batch
* [BREAKING CHANGE] Removed the `batch pool upgrade os` command
* [BREAKING CHANGE] Removed the `Pacakges` property from `Application` responses
* Added the `batch application package list` command to list packages of an application
* [BREAKING CHANGE] Changed `--application-id` to `--application-name` in all `batch application` commands, 
* Added the `--json-file` argument to commands for requesting the raw API response
* Updated validation to automatically include `https://` in all endpoints if missing

### CosmosDB

* Added `network-rule` subgroup with commands `add`, `remove`, and `list` for managing VNET rules of a Cosmos DB account

### Kusto

* [BREAKING CHANGE] Changed `hot_cache_period` and `soft_delete_period` types for database to ISO8601 duration format

### Network

* Added `--express-route-gateway-bypass` argument to `vpn-connection [create|update]`
* Added command groups from `express-route` extensions
* Added `express-route gateway` and `express-route port` command groups
* Added argument `--legacy-mode` to `express-route peering [create|update]` 
* Added arguments `--allow-classic-operations` and `--express-route-port` to `express-route [create|update]`
* Added `--gateway-default-site` argument to `vnet-gateway [create|update]`
* Added `ipsec-policy` commands to `vnet-gateway`

### Resource

* Fixed issue with `deployment create` where type field was case-sensitive
* Added support for URI-based parameters file to `policy assignment create`
* Added support for URI-based parameters and definitions to `policy set-definition update`
* Fixed handling of parameters and rules for `policy definition update`
* Fixed issue with `resource show/update/delete/tag/invoke-action` where cross-subscription IDs did not properly honor the subscription ID

### Role

* Added support for app roles to `ad app [create|update]`

### VM

* Fixed issue with `vm create where `--accelerated-networking` was not enabled by default for Ubuntu 18.0

## February 12, 2019

Version 2.0.58

### Core

* `az --version` now displays a notification if you have packages that can be updated
* Fixed regression where `--ids` could no longer be used with JSON output

### ACR
* [BREAKING CHANGE] Removed `acr build-task` command group
* [BREAKING CHANGE] Removed `--tag` and `--manifest` options from from `acr repository delete`

### ACS
* Added support for case-insensitive names to `aks [enable-addons|disable-addons]`
* Added support for Azure Active Directory updating operation using `aks update-credentials --reset-aad`
* Added clarification that `--output` is ignored for `aks get-credentials`

### AMS
* Added `ams streaming-endpoint [start | stop | create | update] wait` commands
* Added `ams live-event [create | start | stop | reset] wait` commands

### Appservice
* Added ability to create and configure functions using ACR containers
* Added support for updating webapp configurations through json
* Improved help for `appservice-plan-update`
* Added support for app insights on functionapp create
* Fixed issues with webapp SSH

### Botservice
* Improved UX for `bot publish`
* Added warning for timeouts when running `npm install` during `az bot publish`
* Removed invalid char `.` from `--name`  in `az bot create`
* Changed to stop randomizing resource names when creating Azure Storage, App Service Plan, Function/Web App and Application Insights
* [DEPRECATED] Deprecated `--proj-name` argument in favor of `--proj-file-path`
* Changed `az bot publish` to remove fetched IIS Node.js deployment files if they did not already exist
* Added `--keep-node-modules` argument to `az bot publish` to not delete `node_modules` folder on App Service
* Added `"publishCommand"` key-value pair to output from `az bot create` when creating an Azure Function or Web App bot
  * The value of `"publishCommand"` is an `az bot publish` command prepopulated with the required parameters to publish the newly created bot
* Updated `"WEBSITE_NODE_DEFAULT_VERSION"` in ARM template for v4 SDK bots to use 10.14.1 instead of 8.9.4

### Key Vault
* Fixed issue with `keyvault secret backup` where some users received an `unexpected_keyword` error when using `--id`

### Monitor
* Changed `monitor metrics alert [create|update]` to allow dimension value `*`

### Network
* Changed `dns zone export` to ensure exported CNAMEs are FQDNs
* Added `--gateway-name` parameter to `nic ip-config address-pool [add|remove]` to support application gateway backend address pools
* Added `--traffic-analytics` and `--workspace` arguments to `network watcher flow-log configure` to support traffic analytics through a Log Analytics workspace
* Added `--idle-timeout` and `--floating-ip` to `lb inbound-nat-pool [create|update]`

### Policy Insights
* Added `policy remediation` commands to support resource policy remediation features

### RDBMS
* Improved help message and command parameters

### Redis
* Added commands for managing firewall-rules (create, update, delete, show, list)
* Added commands for managing server-link (create, delete, show, list)
* Added commands for managing patch-schedule (create, update, delete, show)
* Added support for Availability Zones and Minimum TLS Version to `redis create
* [BREAKING CHANGE] Removed `redis update-settings` and `redis list-all` commands
* [BREAKING CHANGE] Parameter for `redis create`: 'tenant settings' is not accepted in key[=value] format
* [DEPRECATED] Added warning message for deprecating `redis import-method` command

### Role
* [BREAKING CHANGE] Moved `az identity` command here from `vm` commands

### SQL VM
* [DEPRECATED] Deprecated `--boostrap-acc-pwd` argument due to typo

### VM
* Changed `vm list-skus` to allow use of `--all` in place of `--all true`
* Added `vmss run-command [invoke | list | show]`
* Fixed bug where `vmss encryption enable` would fail if run previously
* [BREAKING CHANGE] Moved `az identity` command to `role` commands

## January 31, 2019

Version 2.0.57

### Core

* Hot Fix for [issue 8399](https://github.com/Azure/azure-cli/issues/8399).

## January 28, 2019

Version 2.0.56

### ACR
* Added support for VNet/IP rules

### ACS
* Added Virtual Nodes Preview
* Added Managed OpenShift commands
* Added support for service principal updates operation with `aks update-credentials -reset-service-principal`

### AMS
* [BREAKING CHANGE] Renamed `ams asset get-streaming-locators` to `ams asset list-streaming-locators`
* [BREAKING CHANGE] Renamed `ams streaming-locator get-content-keys` to `ams streaming-locator list-content-keys`

### Appservice
* Added support for app insights on `functionapp create`
* Added support for app service plan creation (including Elastic Premium) to Function Apps
* Fixed app setting issues with Elastic Premium plans

### Container
* Added `container start` command
* Changed to allow using decimal values for CPU during container creation

### EventGrid
* Added `--deadletter-endpoint` parameter to `event-subscription [create|update]`
* Added storagequeue and hybridconnection as new values for 'event-subscription [create|update] --endpoint-type`
* Added `--max-delivery-attempts` and `--event-ttl` parameters to `event-subscription create` to specify the retry policy for events
* Added a warning message to `event-subscription [create|update]` when webhook as destination is used for an event subscription
* Added source-resource-id parameter for all event subscription related commands and mark all other source resource related parameters as deprecated

### HDInsight
* [BREAKING CHANGE] Removed the `--virtual-network` and `--subnet-name` parameters from `hdinsight [application] create`
* [BREAKING CHANGE] Changed `hdinsight create --storage-account` to accept name or id of storage account instead of blob endpoints
* Added `--vnet-name` and `--subnet-name` parameters to `hdinsight create`
* Added support for Enterprise Security Package and disk encryption to `hdinsight create` 
* Added `hdinsight rotate-disk-encryption-key` command
* Added `hdinsight update` command

### IoT
* Added encoding format to routing-endpoint command

### Kusto
* Preview release

### Monitor
* Changed ID comparison to be case insensitive

### Profile
* Enable tenant level account for managed service identity for `login`

### Network
* Fixed issue with `express-route update`: where `--bandwidth` argument was ignored
* Fixed issue with `ddos-protection update` where set comprehension caused stack trace

### Resource
* Added support for URI parameters file to `group deployment create`
* Added support for managed identity to `policy assignment [create|list|show]`

### SQL Virtual Machine
* Preview release

### Storage
* Changed fix to update only properties that are changed on the same object
* Fixed #8021, binary data is encoded in base 64 when returned

### VM
* Changed `vm encryption enable` to validate disk encryption keyvault and that key encryption keyvault exists
* Added `--force` flag to `vm encryption enable`

## January 15, 2019

Version 2.0.55

### ACR
* Changed to allow force push a helm chart that doesn't exist
* changed to allow runtime operations without ARM requests
* [DEPRECATED] Deprecated `--resource-group` parameter in the commands:
  * `acr login`
  * `acr repository`
  * `acr helm`

### ACS
* Added support for new ACI regions

### Appservice
* Fixed issue with uploading certificates for apps that are hosted on an ASE, where the ASE RG & App RG are different
* Changed `webapp up` to use SKU P1V1 as default for Linux
* Fixed `[webapp|functionapp] deployment source config-zip` to show the right error message when a deployment fails 
* Added `webapp ssh` command

### Botservice
* Added deployment status updates to `bot create`

### Configure
* Added `none` as a configurable output format

### CosmosDB
* Added support for creating database with shared throughput

### HDInsight
* Added commands for managing applications
* Added commands for managing script actions
* Added commands for managing Operations Management Suite (OMS)
* Added support to list regional usage to `hdinsight list-usage`
* [BREAKING CHANGE] Removed default cluster type from `hdinsight create`

### Network
* Added `--custom-headers` and `--status-code-ranges` arguments to `traffic-manager profile [create|update]`
* Added new routing types: Subnet and Multivalue
* Added `--custom-headers` and `--subnets` arguments to `traffic-manager endpoint [create|update]`  
* Fixed issue where supplying `--vnets ""` to `ddos-protection update` caused an error

### Role
* [DEPRECATED] Deprecated `--password` argument for `create-for-rbac`. Use secure passwords generated by the CLI instead

### Security
* Initial Release

### Storage
* [BREAKING CHANGE] Changed `storage [blob|file|container|share] list` default number of results to be 5,000. Use `--num-results *` for original behavior of returning all results
* Added `--marker` parameter to `storage [blob|file|container|share] list`
* Added log marker for next page to STDERR for `storage [blob|file|container|share] list` 
* Added `storage blob service-properties update` command with support for static websites

### VM
* Changed `vm [disk|unmanaged-disk]` and `vmss disk` to have more consistent parameters
* Added support for cross tenant image referencing to `[vm|vmss] create`
* Fixed bug with default configuration in `vm diagnostics get-default-config --windows-os`
* Added argument `--provision-after-extensions` to `vmss extension set` to define what extensions must be provisioned before the extension being set
* Added argument `--replica-count` to `sig image-version update` for setting the default replication count
* Fixed bug with `image create --source` where source os disk is mistaken for a VM with the same name, even if the full resource ID is provided

## December 20, 2018

Version 2.0.54
### Appservice
* Fixed issue where `webapp up` would fail to redeploy
* Added support for listing and restoring webapp snapshots
* Added support for `--runtime` flag to Windows function apps

### IoTCentral
* Fixed update command API call

### Role
* [BREAKING CHANGE] Changed `ad [app|sp] list` to only list the first 100 objects by default

### SQL
* Added support for custom collation on managed instances

### VM
* Added `---os-type` parameter to `disk create`

## December 18, 2018

Version 2.0.53
### ACR
* Added support for image import from external Container Registries
* Condensed the table layout for task list
* Added support for Azure DevOps URLs

### ACS
* Added Virtual Nodes Preview
* Removed "(PREVIEW)" from AAD arguments to `aks create`
* [DEPRECATED] Deprecated `az acs` commands. The ACS service will retire on January 31, 2020
* Added support of Network Policy when creating new AKS clusters
* Removed requirement of `--nodepool-name` argument for `aks scale` if there's only one nodepool

### Appservice
* Fixed issue where `webapp config container` did not honor `--slot` parameter

### Botservice
* Added support for `.bot` file parsing when calling `bot show`
* Fixed AppInsights provisioning bug
* Fixed whitespace bug when dealing with file paths
* Reduced Kudu network calls
* General command UX improvements

### Consumption
* Fixed bugs for budget API to show notifications

### CosmosDB
* Added support for updating account from multi-master to single-master

### Maps
* Added support for the S1 SKU to `maps account [create|update]`

### Network
* Added support for `--format` and `--log-version` to `watcher flow-log configure`
* Fixed issue with `dns zone update` where using "" to clear resolution and registration VNets didn't work

### Resource
* Fixed handling of scope parameter for management groups in `policy assignment [create|list|delete|show|update]` 
* Added new command `resource wait`

### Storage
*  Added ability to update log schema version for storage services in `storage logging update`

### VM
* Fixed crash in `vm identity remove` when the specified vm has no assigned managed service identities

## December 4, 2018

Version 2.0.52
### Core
* Added support for cross tenant resource provisioning for multi-tenant service principal
* Fixed bug where ids piped from a command with tsv output was improperly parsed

### Appservice
* [PREVIEW] Added `webapp up` command that helps in creating & deploying contents to app
* Fixed a bug on container based windows app due to backend change

### Network
* Added `--exclusion` argument to `application-gateway waf-config set` to support WAF exclusions

### Role
* Added support for custom identifiers for password credential 

### VM
* [DEPRECATED] Deprecated `vm extension [show|wait] --expand` parameter
* Added `--force` parameter to `vm restart` to redeploy unresponsive VMs
* Changed `[vm|vmss] create --authentication-type` to accept "all" to create a VM with both password and ssh authentication
* Added `image create --os-disk-caching` parameter to set os disk caching for an image

## November 20, 2018

Version 2.0.51
### Core
* Changed MSI login to not reuse subscription name in identity

### ACR
* Added context token to task step
* Added support for setting secrets in acr run to mirror acr task
* Improved support for `--top` and `--orderby` for `show-tags` and `show-manifests` commands

### Appservice
* Changed zip deployment default timeout to poll for the status increased to 5 mins, also adding a timeout property to customize this value
* Updated the default `node_version`. Resetting slot swap action, during a two phase swap preserves all the appsettings & connection strings
* Removed client-side SKU check for Linux app service plan create
* Fixed error when trying to get zipdeploy status

### IotCentral
* Added subdomain availability check when creating an IoT Central application

### KeyVault
* Fixed bug where errors may have been ignored

### Network
* Added `root-cert` subcommands to `application-gateway` to handle trusted root certifcates
* Added `--min-capacity` and `--custom-error-pages` options to `application-gateway [create|update]`:
* Added `--zones` for availability zone support to `application-gateway create` 
* Added arguments `--file-upload-limit`, `--max-request-body-size` and `--request-body-check` to `application-gateway waf-config set`

### Rdbms
* Added mariadb vnet commands

### Rbac
* Fixed an issue with attempting to update immutable credentials in `ad app update`
* Added output warnings to communicate breaking changes in the near future for `ad [app|sp] list` 

### Storage
* Improved handling of corner cases for storage copy commands
* Fixed issue with `storage blob copy start-batch` not using login credentials when the destination and source accounts are the same
* Fixed bug with`storage [blob|file] url` where `sas_token` wasn't incorporated into URL
* Added breaking change warning to `[blob|container] list`: will soon output only first 5000 results by default

### VM
* Added support to `[vm|vmss] create --storage-sku` to specify the storage account SKU for managed OS and data disks separately
* Changed version name parameters to `sig image-version` to be `--image-version -e`
* Deprecated `sig image-version` argument `--image-version-name`, replaced by `--image-version`
* Added support to use local OS disk to `[vm|vmss] create --ephemeral-os-disk`
* Added support for `--no-wait` to `snapshot create/update`
* Added `snapshot wait` command
* Added support for using instance name with `[vm|vmss] extension set --extension-instance-name`

## November 6, 2018

Version 2.0.50

### Core
* Added support for service principal sn+issuer auth

### ACR
* Added support for commit and pull request git events for Task source trigger
* Changed to use default Dockerfile if it's not specified in build command

### ACS
* [BREAKING CHANGE] Removed `enable_cloud_console_aks_browse` to enable 'az aks browse' by default

### Advisor
* GA release

### AMS
* Added new command groups:
  *  `ams account-filter`
  *  `ams asset-filter`
  *  `ams content-key-policy`
  *  `ams live-event`
  *  `ams live-output`
  *  `ams streaming-endpoint`
  *  `ams mru`
* Added new commands:
  * `ams account check-name`
  * `ams job update`
  * `ams asset get-encryption-key`
  * `ams asset get-streaming-locators`
  * `ams streaming-locator get-content-keys`
* Added encryption parameters support to `ams streaming-policy create`
* Added support to `ams transform output remove` now can be performed by passing the output index to remove
* Added `--correlation-data` and `--label` arguments to `ams job` command group
* Added `--storage-account` and `--container` arguments to `ams asset` command group
* Added default values for expiry time (Now+23h) and permissions (Read) in `ams asset get-sas-url` command 
* [BREAKING CHANGE] Replaced `ams streaming locator` command with `ams streaming-locator`
* [BREAKING CHANGE] Updated `--content-keys` argument of `ams streaming locator`
* [BREAKING CHANGE] Renamed `--content-policy-name` to `--content-key-policy-name` in `ams streaming locator` command
* [BREAKING CHANGE] Replaced `ams streaming policy` command with `ams streaming-policy`
* [BREAKING CHANGE] Replaced `--preset-names` argument with `--preset` in `ams transform` command group. Now you can only set 1 output/preset at a time (to add more you have to run `ams transform output add`). Also, you can set custom StandardEncoderPreset by passing the path to your custom JSON
* [BREAKING CHANGE] Renamed `--output-asset-names ` to `--output-assets` in `ams job start` command. Now it accepts a space-separated list of assets in 'assetName=label' format. An asset without label can be sent like this: 'assetName='

### AppService
* Fixed a bug in `az webapp config backup update` that prevents setting a backup schedule if one is not already set

### Configure
* Added YAML to output format options

### Container
* Changed to show identity when exporting a container group to yaml

### EventHub
* Added `--enable-kafka` flag to support Kafka in `eventhub namespace [create|update]`

### Interactive
* Interactive now installs the `interactive` extension, which will allow for faster updates and support

### Monitor
* Added support for metric names  which include characters forward-slash (/) and period (.) to `--condition` in `monitor metrics alert [create|update]`

### Network
* Deprecated `network interface-endpoint` command names in favor of `network private-endpoint`
* Fixed issue with where `--peer-circuit` argument in `express-route peering connection create`would not accept an ID
* Fixed issue where `--ip-tags` did not work correctly with `public-ip create` 

### Profile
* Added `--use-cert-sn-issuer` to `az login` for service principal login with cert auto-rolls

### RDBMS
* Added mysql replica commands

### Resource
* Added support for management groups and subscriptions to `policy definition|set-definition` commands

### Role
* Added support for API permission management, signed-in-user, and application password & certificate credential management
* Changed `ad sp create-for-rbac` to clarify the confusion between displayName and service principal name
* Added support to grant permissions to AAD apps

### Storage
* Added support to connect to storage services only with SAS and endpoints (without an account name or a key) as described in
  `Configure Azure Storage connection strings <https://docs.microsoft.com/azure/storage/common/storage-configure-connection-string>`

### VM
* Added `storage-sku` argument to `image create` for setting the image's default storage account type
* Fixed bug with `vm resize` where `--no-wait` option causes command to crash
* Changed `vm encryption show` table output format to show status
* Changed `vm secret format` to require json/jsonc output. Warns user and defaults to json output if an undesired output format is selected
* Improved argument validation for `vm create --image`

## October 23, 2018

Version 2.0.49

### Core
* Fixed issue with `--ids` where `--subscription` would take precedence over the subscription in `--ids`
* Added explicit warnings when parameters would be ignored by use of `--ids`

### ACR
* Fixed an ACR Build encoding issue in Python2

### CDN
* [BREAKING CHANGE] Changed `cdn endpoint create`'s default query string caching behaviour to no longer defaults to "IgnoreQueryString". It is now set by the service

### Container
* Added `Private` as a valid type to pass to '--ip-address'
* Changed to allow using only subnet ID to setup a virtual network for the container group
* Changed to allow using vnet name or resource id to enable using vnets from different resource groups
* Added `--assign-identity` for adding a MSI identity to a container group
* Added `--scope` to create a role assignment for the system assigned MSI identity
* Added a warning when creating a container group with an image without a long running process
* Fixed table output issues for `list` and `show` commands

### CosmosDB
* Added `--enable-multiple-write-locations` support to `cosmosdb create`

### Interactive
* Changed to ensure global subscription parameter appears in parameters

### IoT Central
* Added template and display name options for IoT Central Application creation
* [BREAKING CHANGE] Removed support for the F1 SKU; Use S1 SKU instead

### Monitor
* Changes to `monitor activity-log list`:
  * Added support for listing all events at the subscription level
  * Added `--offset` parameter to more easily create time queries
  * Improved validation for `--start-time` and `--end-time` to use wider range of ISO8601 formats and more user-friendly datetime formats
  * Added `--namespace` as alias for deprecated option `--resource-provider`
  * Deprecated `--filters` because no values other than those with strongly-typed options are supported by the service
* Changes to `monitor metrics list`:
  * Added `--offset` parameter to more easily create time queries
  * Improved validation for `--start-time` and `--end-time` to use wider range of ISO8601 formats and more user-friendly datetime formats
* Improved validation for `--event-hub` and `--event-hub-rule` arguments to `monitor diagnostic-settings create`

### Network
* Added `--app-gateway-address-pools` and `--gateway-name` arguments to `nic create`, to support adding application
  gateway backend address pools to a NIC
* Added `--app-gateway-address-pools` and `--gateway-name` arguments to `nic ip-config create/update`, to support adding application
  gateway backend address pools to a NIC

### ServiceBus
* Added Read-Only `migration_state` to MigrationConfigProperties to show current Service Bus Standard to Premium namespace migration state

### SQL
* Fixed `sql failover-group create` and `sql failover-group update` to work with Manual failover policy

### Storage
* Fixed `az storage cors list` output formatting, all items show correct "Service" key
* Added `--bypass-immutability-policy` parameter for immutability-policy blocked container deletion

### VM
* Enforce disk caching mode be `None` for Lv/Lv2 series of machines in `[vm|vmss] create`
* Updated supported size list supporting networking accelerator for `vm create`
* Added strong typed arguments for ultrassd iops and mbps configs for `disk create`

## October 16, 2018

Version 2.0.48

### VM
* Fixed SDK issue that caused Homebrew instllation to fail

## October 9, 2018

Version 2.0.47

### Core
* Improved error handling for "Bad Request" errors

### ACR
* Added support for similar table format as helm client

### ACS
* Added `aks [create|scale] --nodepool-name` to configure nodepool name, truncated to 12 characters, default - nodepool1 
* Fixed to fall back to 'scp' when Parimiko fails
* Changed `aks create` to no longer require `--aad-tenant-id`
* Improved merging of Kubernetes credentials when duplicate entries are present

### Container
* Changed `functionapp create` to support creating a Linux consumption plan type with a specific runtime
* [PREVIEW] Added support for hosting webapps on Windows containers

### Event Hub
* Fixed `eventhub update` command
* [BREAKING CHANGE] Changed `list` commands to handle errors for resource(s) NotFound(404) in the typical way instead of showing empty list

### Extensions
* Fixed issue with attempting to add an extension that is already installed

### HDInsight
* Initial release

### IoT
* Added extension installation comand to first-run banner

### KeyVault
* Changed to restrict keyvault storage commmands to the latest API profile

### Network
* Fixed `network dns zone create`: Command succeeds even if the user has configured a default location. See #6052
* Deprecated `--remote-vnet-id` for `network vnet peering create`
* Added `--remote-vnet` to `network vnet peering create` which accepts a name or ID
* Added support for multiple subnet prefixes to `network vnet create` with `--subnet-prefixes`
* Added support for multiple subnet prefixes to `network vnet subnet [create|update]` with `--address-prefixes`
* Fixed issue with `network application-gateway create` that prevented creating gateways with `WAF_v2` or `Standard_v2` SKU
* Added `--service-endpoint-policy` convenience argument to `network vnet subnet update`

### Role
* Added support for listing Azure AD app owners to `ad app owner`
* Added support for listing Azure AD service principal owners to `ad sp owner`
* Changed to ensure role definition create & update commands accept multiple permission configurations
* Changed `ad sp create-for-rbac` to ensure home page URI is always "https"

### Service Bus
* [BREAKING CHANGE] Changed `list` commands to handle errors for resource(s) NotFound(404) in the typical way instead of showing empty list

### VM
* Fixed empty `accessSas` field in `disk grant-access`
* Changed `vmss create` to reserve large enough frontend port range to handle overprovisioning
* Fixed update commands for `sig`
* Added `--no-wait` support for managing image versions in `sig`
* Changed `vm list-ip-addresses` to show availability zone of public IP addresses
* Changed `[vm|vmss] disk attach` to set disk's default lun to the first available spot

## September 21, 2018

Version 2.0.46

### ACR
* Added ACR Task commands
* Added quick run command
* Deprecated `build-task` command group
* Added `helm` command group to support managing helm charts with ACR
* Added support for idempotent create for managed registry
* Added a no-format flag for displaying build logs

### ACS
* Changed the `install-connector` command to set the AKS Master FQDN
* Fixed creating role assignment for vnet-subnet-id when not specifying service principal and skip-role-assignemnt

### AppService

* Added support for webjobs (continuous and triggered) operations management
* az webapp config set supports --fts-state propertyAlso added support fot az functionapp config set & show
* Added support for bring your own storage for webapps
* Added support for listing and restoring deleted webapps

### Batch
* Changed adding tasks through `--json-file` to support AddTaskCollectionParameter syntax
* Updated documentation of accepted `--json-file` formats
* Added `--max-tasks-per-node-option` to `batch pool create`
* Changed behavior of `batch account` to show currently logged in account if no options are specified

### Batch AI 
* Fixed auto storage account creation failure in `batchai cluster create` command

### Cognitive Services
* Added completer for  `--sku`, `--kind`, `--location` arguments
* Added command `cognitiveservices account list-usage`
* Added command `cognitiveservices account list-kinds`
* Added command `cognitiveservices account list`
* Deprecated `cognitiveservices list`
* Changed `--name` to be optional for `cognitiveservices account list-skus`

### Container
* Added ability to restart and stop a running container group
* Added `--network-profile` for passing in a network profile
* Added `--subnet`, `--vnet_name`, to allow creating container groups in a VNET
* Changed table output to show the status of the container group

### Datalake
* Added commands for virtual network rules

### Interactive Shell
* Fixed error on Windows where commands fail to run properly
* Fixed command loading problem in interactive that was caused by deprecated objects

### IoT
* Added support for routing IoT Hubs

### Key Vault
* Fixed Key Vault key import for RSA keys

### Network
* Add `network public-ip prefix` commands to support public IP prefixes features
* Add `network service-endpoint` commands to support service endpoint policy features
* Add `network lb outbound-rule` commands to support creation of Standard Load Balancer outbound rules
* Add `--public-ip-prefix` to `network lb frontend-ip create/update` to support frontend IP configurations using public IP prefixes
* Add `--enable-tcp-reset` to `network lb rule/inbound-nat-rule/inbound-nat-pool create/update`
* Add `--disable-outbound-snat` to `network lb rule create/update`
* Allow `network watcher flow-log show/configure` to be used with classic NSGs
* Add `network watcher run-configuration-diagnostic` command
* Fix `network watcher test-connectivity` command and add `--method`, `--valid-status-codes` and `--headers` properties
* `network express-route create/update`: Add `--allow-global-reach` flag
* `network vnet subnet create/update`: Add support for `--delegation`
* Added `network vnet subnet list-available-delegations` command
* `network traffic-manager profile create/update`: Added support for `--interval`, `--timeout` and `--max-failures` for Monitor configuration
  Deprecated options `--monitor-path`, `--monitor-port` and `--monitor-protocol` in favor of `--path`, `--port`, `--protocol`
* `network lb frontend-ip create/update`: Fixed the logic for setting private IP allocation methodIf a private IP address is provided, the
  allocation will be staticIf no private IP address is provided, or empty string is provided for private IP address, allocation is dynamic.
* `dns record-set * create/update`: Add support for `--target-resource`
* Add `network interface-endpoint` commands to query interface endpoint objects
* Add `network profile show/list/delete` for partial management of network profiles
* Add `network express-route peering connection` commands to manage peering connections between ExpressRoutes

### RDBMS
* Added support for MariaDB service

### Reservation
* Added CosmosDb in the reserved resource enum type
* Added name property in Patch model

### Manage App
* Fixed bug in `managedapp create --kind MarketPlace` causing instance creation of a Marketplace managed app to crash
* Changed `feature` commands to be restricted to supported profiles

### Role
* Added support for listing user's group memberships

### SignalR
* First release

### Storage
* Added `--auth-mode login` parameter for use of user's login credentials for blob and queue authorization
* Added `storage container immutability-policy/legal-hold` to manage immutable storage

### VM
* Fixed issue where `vm create --generate-ssh-keys` overwrites private key file if public key file is missing (#4725, #6780)
* Added support for shared image gallery through `az sig`

## August 28, 2018

Version 2.0.45

### Core

* Fixed issue of loading empty configuration file
* Added support for profile `2018-03-01-hybrid` for Azure Stack

### ACR

* Added a workaround for runtime operations without ARM requests
* Changed to exclude version control files (eg, .git, .gitignore) from uploaded tar by default in `build` command

### ACS

* Changed `aks create` to defaults to `Standard_DS2_v2` VMs
* Changed `aks get-credentials` to now call new apis to get cluster credential

### AppService

* Added support for CORS on functionapp & webapp
* Added ARM tag support on create commands
* Changed `[webapp|functionapp] identity show` to exit with code 3 upon a missing resource

### Backup

* Changed `backup vault backup-properties show` to exit with code 3 upon a missing resource

### Bot Service

* Initial Bot Service CLI Release

### Cognitive Services

* Added new parameter `--api-properties,` which is required for creating some of the services

### IoT

* Fixed issue with associating linked hubs

### Monitor

* Added `monitor metrics alert` commands for near-realtime metric alerts
* Deprecated `monitor alert` commands

### Network

* Changed `network application-gateway ssl-policy predefined show` to exit with code 3 upon a missing resource

### Resource

* Changed `provider operation show` to exit with code 3 upon a missing resource

### Storage

* Changed `storage share policy show` to exit with code 3 upon a missing resource

### VM

* Changed `vm/vmss identity show` to exit with code 3 upon a missing resource 
* Deprecated `--storage-caching` for `vm create`

## Auguest 14, 2018

Version 2.0.44

### Core

* Fixed numeric display in `table` output
* Added YAML output format

### Telemetry

* Improved telemetry reporting

### ACR

* Added `content-trust policy` commands
* Fixed issue where `.dockerignore` was not handled properly

### ACS

* Changed `az acs/aks install-cli` to install under `%USERPROFILE%\.azure-kubectl` on Windows
* Changed `az aks install-connector` to detect if the cluster has RBAC and configure ACI Connector appropriately
* Changed to role assignment to the subnet when it's provided
* Added new option to "skip role assignment" for subnet when it's provided                                 
* Changed to skip role assignment to subnet when assignment already exists                

### AppService

* Fixed a bug that prevent from creating a function-app using storage accounts in external resource groups
* Fixed a crash on zip deployment

### BatchAI

* Changed logger output for auto-storage account creation to specifies "resource *group*".        

### Container

* Added `--secure-environment-variables` for passing secure environment variables to a container      

### IoT

* [BREAKING CHANGE] Removed deprecated commands which have moved to the iot extension
* Updated elements to not assume `azure-devices.net` domain

### Iot Central

* Initial release of IoT Central module

### KeyVault


* Added commands for managing storage accounts and sas-definitions
* Added commands for network-rules                                                           
* Added `--id` parameter to secret, key, and certificate operations
* Added support for KV mgmt multi-api version
* Added support for KV data plane multi-api version

### Relay

* Initial release

### Sql

* Added `sql failover-group` commands

### Storage

* [BREAKING CHANGE] Changed `storage account show-usage` to require `--location` parameter and will list by region
* Changed `--resource-group` parameter to be optional for `storage account` commands
* Removed 'Failed precondition' warnings for individual failures in batch commands for single aggregated message
* Changed `[blob|file] delete-batch` commands to no longer output array of nulls
* Changed `blob [download|upload|delete-batch]` commands to read sas-token from container url

### VM

* Added common filters to `vm list-skus` for ease of use

## July 31, 2018

Version 2.0.43

### ACR

* Added `--with-secure-properties` flag to `acr build-task show` command
* Added `acr build-task update-build` command

### ACS

* Changed to return return 0 (success) when ending `az aks browse` by pressing [Ctrl+C]

### Batch

* Fixed bug when showing AAD token in cloudshell

### Container

* Removed requirement for `--log-analytics-workspace-key` for name or ID when in set subscription

### Network

* Added dns support to 2017-03-09-profile for Azure Stack 

### Resource

* Added `--rollback-on-error` to `group deployment create` to execute a known-good deployment on error
* Fixed issue where `--parameters {}` with `group deployment create` resulted in an error

### Role

* Added support for stack profile 2017-03-09-profile
* Fixed issue where generic update parameters to `app update` would not work correctly

### Search

* Added commands for Azure Search service

### Service Bus

* Added migration command group to migrate a namespace from Service Bus Standard to Premium
* Added new optional properties to Service Bus queue and Subscription
  *  `--enable-batched-operations` and `--enable-dead-lettering-on-message-expiration` in `queue`
  *  `--dead-letter-on-filter-exceptions` in `subscriptions`

### Storage

* Added support for download of large files using a single connection
* Converted `show` commands that were missed from failing with exit code 3 upon a missing resource

### VM

* Added support to list availability sets by subscription
* Added support for `StandardSSD_LRS`
* Added support for application security group on creating VM scale set
* [BREAKING CHANGE] Changed `[vm|vmss] create`, `[vm|vmss] identity assign`, and `[vm|vmss] identity remove` to output user assigned identities in dictionary format

## July 18, 2018

Version 2.0.42

### Core

* Added support for browser-based login in WSL bash window
* Added `--force-string` flag to all generic update commands
* [BREAKING CHANGE] Changed 'show' commands to log error message and fail with exit code of 3 upon a missing resource

### ACR

* [BREAKING CHANGE] Updated '--no-push' to a pure flag in 'acr build' command
* Added `show` and `update` commands under `acr repository` group
* Added `--detail` flag for `show-manifests` and `show-tags` to show more detailed information
* Added `--image` parameter to support get build details or logs by an image

### ACS

* Changed `az aks create` to error out if `--max-pods` is less than 5

### AppService

* Added support for PremiumV2 skus

### Batch

* Fixed bug on using token credential on cloud shell mode
* Changed JSON input to be case-insensitive

### Batch AI

* Fixed `az batchai job exec` command

### Container

* Removed the requirement for username and password for non dockerhub registries
* Fixed error when creating container groups from yaml file

### Network

* Added `--no-wait` support to `network nic [create|update|delete]` 
* Added `network nic wait`
* Deprecated `--ids` argument for `network vnet [subnet|peering] list`
* Added `--include-default` flag to include default security rules in the output of `network nsg rule list`  

### Resource

* Added `--no-wait` support to `group deployment delete`
* Added `--no-wait` support to `deployment delete`
* Added `deployment wait` command
* Fixed issue where the subscription-level `az deployment` commands erroneously appeared for profile 2017-03-09-profile

### SQL

* Fixed 'The provided resource group name ... did not match the name in the Url' error when specifying elastic pool name for `sql db copy` and `sql db replica create` commands
* Allow configuring default sql server by executing `az configure --defaults sql-server=<name>`
* Implemented table formatters for `sql server`, `sql server firewall-rule`, `sql list-usages`, and `sql show-usage` commands

### Storage

* Added `pageRanges` property to `storage blob show` output that will be populated for page blobs

### VM

* [BREAKING CHANGE] Changed `vmss create` to use `Standard_DS1_v2` as the default instance size
* Added `--no-wait` support to `vm extension [set|delete]` and `vmss extension [set|delete]`
* Added `vm extension wait`

## July 3, 2018

Version 2.0.41

### AKS

* Changed monitoring to use subscription ID

## July 3, 2018

Version 2.0.40

### Core

* Added a new authorization code flow for interactive login

### ACR

* Added polling build status
* Added support for case-insensitive enum values
* Added `--top` and `--orderby` parameters for `show-manifests`

### ACS

* [BREAKING CHANGE] Enable Kubernetes role-based access control by default
* Added `--disable-rbac` argument and deprecated `--enable-rbac` since it's the default now
* Updated options for `aks browse` command. Added `--listen-port` support
* Updated the default helm chart package for `aks install-connector` command. Use virtual-kubelet-for-aks-latest.tgz
* Added `aks enable-addons` and `aks disable-addons` commands to update an existing cluster

### AppService

* Added support for disabling identity via `webapp identity remove`
* Removed `preview` tag for Identity feature

### Backup

* Updated module definition

### BatchAI

* Fixed table output for `batchai cluster node list` and `batchai job node list` commands

### Cloud

* Added `acr login` server suffix to cloud config

### Container

* Changed `container create` to default to long running operation
* Added Log Analytics parameters `--log-analytics-workspace` and `--log-analytics-workspace-key`
* Added `--protocol` parameter to specify which network protocol to use

### Extension

* Changed `extension list-available` to only show extensions compatible with CLI version

### Network

* Fixed issue where record types were case-sensitive ([#6602](https://github.com/Azure/azure-cli/issues/6602))

### Rdbms

* Added `[postgres|myql] server vnet-rule` commands

### Resource

* Added new operation group `deployment`

### VM

* Added support for removing system assigned identity

## June 25, 2018

Version 2.0.39

### CLI

* Updated file trimming in MSI installer to fix extension installation issue

## June 19, 2018

Version 2.0.38

### Core

* Added global support for `--subscription` to most commands

### ACR

* Added `azure-storage-blob` as dependency
* Changed default CPU configuration with `acr build-task create` to use 2 cores

### ACS

* Updated options of `aks use-dev-spaces` command. Added `--update` support
* Changed `aks get-credentials --admin` to not eplace the user context in `$HOME/.kube/config`
* Exposed read-only `nodeResourceGroup` property on managed clusters
* Fixed `acs browse` command error
* Made `--connector-name` optional for `aks install-connector`, `aks upgrade-connector` and `aks remove-connector`
* Added new Azure Container Instance regions for `aks install-connector`
* Added the normalized location into the helm release name and node name to `aks install-connector`

### AppService

* Added support for newer versions of urllib
* Added support to `functionapp create` to use appservice plan from external resource groups

### Batch

* Removed `azure-batch-extensions` dependency

### Batch AI

* Added support for workspaces. Workspaces allow to group clusters, file-servers and experiments in groups removing
   limitation on number of resources can be created
* Added support for experiments. Experiments allow to group jobs in collections removing limitation on number of
   created jobs
* Added support to configure `/dev/shm` for jobs running in a docker container
* Added `batchai cluster node exec` and `batchai job node exec` commands. These commands allow to execute any
  commands directly on nodes and provide functionality for port forwarding.
* Added support for `--ids` to `batchai` commands
* [BREAKING CHANGE] All clusters and fileservers must be created under workspaces
* [BREAKING CHANGE] Jobs must be created under experiments
* [BREAKING CHANGE] Removed `--nfs-resource-group` from `cluster create` and `job create` commands. To mount
  an NFS belonging to a different workspace/resource group provide file server's ARM ID via `--nfs` option
* [BREAKING CHANGE] Removed `--cluster-resource-group` from `job create` command. To submit a job on a cluster
  belonging to a different workspace/resource group provide cluster's ARM ID via `--cluster` option
* [BREAKING CHANGE] Removed `location` attribute from jobs, cluster and file servers. Location now is an attribute of
  a workspace.
* [BREAKING CHANGE] Removed `--location` from `job create`, `cluster create` and `file-server create` commands
* [BREAKING CHANGE] Changed names of short options to make interface more consistent:
  - Renamed [`--config`, `-c`] to [`--config-file`, `-f`]
  - Renamed [`--cluster`, `-r`] to [`--cluster`, `-c`]
  - Renamed [`--cluster`, `-n`] to [`--cluster`, `-c`]
  - Renamed [`--job`, `-n`] to [`--job`, `-j`]

### Maps

* [BREAKING CHANGE] Changed `maps account create` to require accepting Terms of Service either by interactive prompt or `--accept-tos` flag

### Network

* Added support for `https` to `network lb probe create` [#6571](https://github.com/Azure/azure-cli/issues/6571)
* Fixed issue where `--endpoint-status` was case sensitive. [#6502](https://github.com/Azure/azure-cli/issues/6502)

### Reservations

* [BREAKING CHANGE] Added required parameter `ReservedResourceType` to `reservations catalog show`
* Added parameter `Location`to `reservations catalog show`
* [BREAKING CHANGE] Removed `kind` from `ReservationProperties`
* [BREAKING CHANGE] Renamed `capabilities` to `sku_properties` in `Catalog`
* [BREAKING CHANGE] Removed `size` and `tier` properties from `Catalog`
* Added parameter `InstanceFlexibility` to `reservations reservation update`

### Role

* Improved error handling

### SQL

* Fixed confusing error when running `az sql db list-editions` for a location that is not available to your subscription

### Storage

* Changed table output for `storage blob download` to be more readable

### VM

* Improved refine vm size check for accelerated networking support in `vm create`
* Added warning for `vmss create` that the default vm size will be switched from `Standard_D1_v2` to `Standard_DS1_v2`
* Added `--force-update` to `[vm|vmss] extension set` to update the extension even when the configuration has not changed

## June 13, 2018

Version 2.0.37

### Core

* Improved interactive telemetry

## June 13, 2018

Version 2.0.36

### AKS

* Added advanced networking options to `aks create`
* Added arguments to `aks create` to enable monitoring and HTTP routing
* Added `--no-ssh-key` argument to `aks create`
* Added `--enable-rbac` argument to `aks create`
* [PREVIEW] Added support for Azure Active Directory authentication to `aks create`

### AppService

* Fixed an issue with incompatible urllib versions

## June 5, 2018

Version 2.0.35

### Interactive

* Added limits to the dependencies of interactive mode

## June 5, 2018

Version 2.0.34

### Core

* Added support for cross tenant resource referencing
* Improved telemetry upload reliability

### ACR

* Added support for VSTS as a remote source location
* Added `acr import` command

### AKS

* Changed `aks get-credentials` to create the kube config file with more secure filesystem permissions

### Batch

* Fixed bug in Pool list table formatting [[Issue #4378](https://github.com/Azure/azure-cli/issues/4378)]

### IOT

* Added support for creating Basic Tier IoT Hubs

### Network

* Improved `network vnet peering`

### Policy Insights

* Initial Release

### ARM

* Added `account management-group` commands.

### SQL

* Added new managed instance commands:
  * `sql mi create`
  * `sql mi show`
  * `sql mi list`
  * `sql mi update`
  * `sql mi delete`
* Added new managed database commands:
  * `sql midb create`
  * `sql midb show`
  * `sql midb list`
  * `sql midb restore`
  * `sql midb delete`

### Storage

* Added extra mimetypes for json and javascript to be inferred from file extensions

### VM

* Changed `vm list-skus` to use fixed columns and add warning that `Tier` and `Size` will be removed
* Added `--accelerated-networking` option to `vm create`
* Added `--tags` to `identity create`

## May 22, 2018

Version 2.0.33

### Core

* Added support for expanding `@` in file names

### ACS

* Added new Dev-Spaces commands `aks use-dev-spaces` and `aks remove-dev-spaces`
* Fixed typo in help message

### AppService

* Improved generic update commands
* Added async support for `webapp deployment source config-zip`

### Container

* Added support for exporting a container group in yaml format
* Added support for using a yaml file to create / update a container group

### Extension

* Improved removal of extensions

### Interactive

* Changed logging to mute parser for completions
* Improved handling of bad help caches

### KeyVault

* Fixed keyvault commands to work in cloud shell or VMs with identity

### Network

* Fix issue where `network watcher show-topology` would not work with vnet and/or subnet name [#6326](https://github.com/Azure/azure-cli/issues/6326)
* Fix issue where some `network watcher` commands would claim Network Watcher is not enabled for regions when it actually is [#6264](https://github.com/Azure/azure-cli/issues/6264)

### SQL

* [BREAKING CHANGE] Changed response objects returned from `db` and `dw` commands:
    * Renamed `serviceLevelObjective` property to `currentServiceObjectiveName`
    * Removed `currentServiceObjectiveId` and `requestedServiceObjectiveId` properties
    * Changed `maxSizeBytes` property to be an integer value instead of a string
* [BREAKING CHANGE] Changed the following `db` and `dw` properties to be read-only:
    * `requestedServiceObjectiveName`.  To update, use the `--service-objective` parameter or set the `sku.name` property
    * `edition`. To update, use the `--edition` parameter or set the `sku.tier` property
    * `elasticPoolName`. To update, use the `--elastic-pool` parameter or set the `elasticPoolId` property
* [BREAKING CHANGE] Changed the following `elastic-pool` properties to be read-only:
    * `edition`. To update, use the `--edition` parameter
    * `dtu`. To update, use the `--capacity` parameter
    *  `databaseDtuMin`. To update, use the `--db-min-capacity` parameter
    *  `databaseDtuMax`. To update, use the `--db-max-capacity` parameter
* Added `--family` and `--capacity` parameters to `db`, `dw`, and `elastic-pool` commands.
* Added table formatters to `db`, `dw`, and `elastic-pool` commands.

### Storage

* Added completer for `--account-name` argument
* Fixed problem with `storage entity query`

### VM

* [BREAKING CHANGE] Removed `--write-accelerator` from `vm create`. The same support can be accessed through `vm update` or `vm disk attach`
* Fixed extension image matching in `[vm|vmss] extension`
* Added `--boot-diagnostics-storage` to `vm create` to capture boot log
* Added `--license-type` to `[vm|vmss] update`

## May 7, 2018

Version 2.0.32

### Core

* Fixed an unhandled exception when retrieving secrets from a service principal account with cert
* Added limited support for positional arguments
* Fix issue where `--query` could not be used with `--ids`. [#5591](https://github.com/Azure/azure-cli/issues/5591)
* Improved piping scenarios from commands when using `--ids`. Supports `-o tsv` with a query specified or `-o json` without specifying a query
* Added command suggestions on error if users have typo in their commands
* Improved error when users type `az ''`
* Added support custom resource types for command modules and extensions

### ACR

* Added ACR Build commands
* Improved resource not found error messages
* Improved resource creation performance and error handling
* Improved acr login in non-standard consoles and WSL
* Improved repository commands error messages
* Updated table columns and ordering

### ACS

* Added warning that `az aks` is a preview service
* Fixed the permission issue in `aks install-connector` when `--aci-resource-group` is not specified

### AMS

* Initial release - Manage Azure Media Services resources

### Appservice

* Fixed a bug in `webapp delete` when `--slot` is provided
* Removed `--runtime-version` from `webapp auth update`
* Added support for min\_tls\_version & https2.0
* Added support for multicontainers

### Batch AI

* Changed `batchai create cluster` to respect vm priority configured in the cluster's configuration file

### Cognitive Services

* Fixed typo in example for `cognitiveservices account create` [#5603](https://github.com/Azure/azure-cli/issues/5603)

### Consumption

* Added new commands for budget API

### Container

* Removed requirement for `--registry-server` for `container create` when a registry server is included in the image name

### Cosmos DB

* Introducing VNET support for Azure CLI - Cosmos DB

### DMS

* Initial release - Adds support for the SQL to Azure SQL migration scenario

### Extension

* Fixed bug where extension metadata stopped being shown

### Interactive

* Allow interactive completers to function with positional arguments
* More user-friendly output when users type '\'
* Fixed completions for parameters with no help
* Fixed descriptions for command-groups

### Lab

* Fixed regressions from knack conversion

### Network

* [BREAKING CHANGE] Removed the `--ids` parameter for:
  * `express-route auth list`
  * `express-route peering list`
  * `nic ip-config list`
  * `nsg rule list`
  * `route-filter rule list`
  * `route-table route list`
  * `traffic-manager endpoint list`

### Profile

* Fixed `disk create` source detection
* [BREAKING CHANGE] Removed `--msi-port` and `--identity-port` as they are no longer used
* Fixed typo in `account get-access-token` short summary

### Redis

* Deprecated `redis patch-schedule patch-schedule show` in favor of `redis patch-schedule show`
* Deprecated `redis list-all`. This functionality has been folded into `redis list`
* Deprecated `redis import-method` in favor of `redis import`
* Added support for `--ids` to various commands

### Role

* [BREAKING CHANGE] Removed deprecated `ad sp reset-credentials`

### Storage

* Allow destination sas-token to apply to source for blob copy if source sas and account key are unspecified
* Exposed --socket-timeout for blob uploads and downloads
* Treat blob names that start with path separators as relative paths
* Allow `storage blob copy --source-sas` with starting query char, '?'
* Fixed `storage entity query --marker` to accept list of key=values

### VM

* Fixed an invalid detection logic on unmanaged blob uri
* Added support disk encryption w/o user provided service principals
* [BREAKING CHANGE] Do not use VM 'ManagedIdentityExtension' for MSI support
* Added support for eviction policy to `vmss`
* [BREAKING CHANGE] Removed `--ids` from:
  * `vm extension list`
  * `vm secret list`
  * `vm unmanaged-disk list`
  * `vmss nic list`
* Added write accelerator support
* Added `vmss perform-maintenance`
* Fixed `vm diagnostics set` to detect VM's OS type reliably
* Changed `vm resize` to check if the requested size is different than currently set and update only on change


## April 10, 2018

Version 2.0.31

### ACR

* Improved error handling of wincred fallback

### ACS

* Changed aks created SPNs to be valid for 5 years

### Appservice

* [BREAKING CHANGE]: Removed `assign-identity`
* Fixed uncaught exception for nonexistant webapp plans

### BatchAI

* Added support for 2018-03-01 API

  - Job level mounting
  - Environment variables with secret values
  - Performance counters settings
  - Reporting of job specific path segment
  - Support for subfolders in list files api
  - Usage and limits reporting
  - Allow to specify caching type for NFS servers
  - Support for custom images
  - Added pyTorch toolkit support

* Added `job wait` command which allows to wait for the job completion and reports job exit code
* Added `usage show` command to list current Batch AI resources usage and limits for different regions
* National clouds are supported
* Added job command line arguments to mount filesystems on the job level in addition to config files
* Added more options to customize clusters - vm priority, subnet, initial nodes count for auto-scale clusters,
  specifying custom image
* Added command line option to specify caching type for Batch AI managed NFS
* Simplified specifying mount filesystem in config files. Now you can omit credentials for Azure File Share and
  Azure Blob Containers - CLI will populate missing credentials using storage account key provided via command line
  parameters or specified via environment variable or will query the key from Azure Storage (if the storage account
  belongs to the current subscription)
* Job file stream command now auto-completes when the job is completed (succeeded, failed, terminated or deleted)
* Improved `table` output for `show` operations
* Added `--use-auto-storage` option for cluster creation. This option make it simpler to manage storage accounts
  and mount Azure File Share and Azure Blob Containers to clusters
* Added `--generate-ssh-keys` option to `cluster create` and `file-server create`
* Added ability to provide node setup task via command line
* [BREAKING CHANGE] Moved `job stream-file` and `job list-files` commands under `job file` group
* [BREAKING CHANGE] Renamed `--admin-user-name` to `--user-name` in `file-server create` command to be consistent with
  `cluster create` command

### Billing

* Added enrollment account commands

### Consumption

* Added `marketplace` commands
* [BREAKING CHANGE] Renamed `reservations summaries` to `reservation summary`
* [BREAKING CHANGE] Renamed `reservations details` to `reservation detail`
* [BREAKING CHANGE] Removed `--reservation-order-id` and `--reservation-id` short options for `reservation` commands
* [BREAKING CHANGE] Removed `--grain` short options for `reservation summary` commands
* [BREAKING CHANGE] Removed `--include-meter-details` short options for `pricesheet` commands

### Container

* Added git repo volume mount parameters `--gitrepo-url` `--gitrepo-dir` `--gitrepo-revision` and `--gitrepo-mount-path`
* Fixed [#5926](https://github.com/Azure/azure-cli/issues/5926): `az container exec` failing when --container-name specified

### Extension

* Changed distribution check message to be debug-level

### Interactive

* Changed to stop completions upon unrecognized commands
* Added event hooks before and after command subtree is created
* Added completion for `--ids` parameters

### Network

* Fixed [#5936](https://github.com/Azure/azure-cli/issues/5936): `application-gateway create` tags could not bet set
* Added argument `--auth-certs` to attach authentication certificates for `application-gateway http-settings [create|update]`. [#4910](https://github.com/Azure/azure-cli/issues/4910)
* Added `ddos-protection` commands to create DDoS protection plans
* Added support for `--ddos-protection-plan` to `vnet [create|update]` to associate a VNet to a DDoS protection plan
* Fixed issue with `--disable-bgp-route-propagation` flag in `network route-table [create|update]`
* Removed dummy arguments `--public-ip-address-type` and `--subnet-type` for `network lb [create|update]`
* Added support for TXT records with RFC 1035 escape sequences to `network dns zone [import|export]` and `network dns record-set txt add-record`

### Profile

* Added support for Azure Classic accounts in `account list`
* [BREAKING CHANGE] Removed `--msi` & `--msi-port` arguments

### RDBMS

* Added `georestore` command
* Removed storage size restriction from `create` command

### Resource

* Added support for `--metadata` to `policy definition create`
* Added support for `--metadata`, `--set`, `--add`, `--remove` to `policy definition update`

### SQL

* Added `sql elastic-pool op list` and `sql elastic-pool op cancel`

### Storage

* Improved error messages for malformed connection strings

### VM

* Added support to configure platform fault domain count to `vmss create`
* Changed `vmss create` to default to Standard LB for zonal, large or single-placement-group disabled scale-set
* [BREAKING CHANGE]: Removed `vm assign-identity`, `vm remove-identity and `vm format-secret`
* Added support for Public-IP SKU to `vm create`
* Added `--keyvault` and `--resource-group` arguments to `vm secret format` to support scenarios where the command
  is unable to resolve the vault ID. [#5718](https://github.com/Azure/azure-cli/issues/5718)
* Better errors for `[vm|vmss create]` when a resource group's location has no zone support


## March 27, 2018

Version 2.0.30

### Core

* Show message for extensions marked as preview in help

### ACS

* Fix SSL certificate verification error for `aks install-cli` in Cloud Shell

### Appservice

* Added HTTPS-only support to `webapp update`
* Added support for slots to `az webapp identity [assign|show]` and `az functionapp identity [assign|show]`

### Backup

* Added new command `az backup protection isenabled-for-vm`. This command can be used to check if a VM is backed up by any vault in the subscription
* Enabled Azure object IDs for `--resource-group` and `--vault-name` parameters for the following commands:
  * `backup container show`
  * `backup item set-policy`
  * `backup item show`
  * `backup job show`
  * `backup job stop`
  * `backup job wait`
  * `backup policy delete`
  * `backup policy get-default-for-vm`
  * `backup policy list-associated-items`
  * `backup policy set`
  * `backup policy show`
  * `backup protection backup-now`
  * `backup protection disable`
  * `backup protection enable-for-vm`
  * `backup recoverypoint show`
  * `backup restore files mount-rp`
  * `backup restore files unmount-rp`
  * `backup restore restore-disks`
  * `backup vault delete`
  * `backup vault show`
* Changed `--name` parameters to accept the output format from `backup ... show` commands

### Container

* Added `container exec` command. Executes commands in a container for a running container group
* Allow table output for creating and updating a container group

### Extension

* Added message for `extension add` if extension is in preview
* Changed `extension list-available` to show full extension data with `--show-details`
* [BREAKING CHANGE] Changed `extension list-available` to show simplified extension data by default

### Interactive

* Changed completions to activate as soon as command table loading is done
* Fixed bug with using `--style` parameter
* Interactive lexer instantiated after command table dump if missing
* Improved completer support

### Lab

* Fixed bugs with `create environment` command

### Monitor

* Added support for `--top`, `--orderby` and `--namespace` to `metrics list` [#5785](https://github.com/Azure/azure-cli/issues/5785)
* Fixed [#4529](https://github.com/Azure/azure-cli/issues/5785): `metrics list` Accepts a space-separated list of metrics to retrieve
* Added support for `--namespace` to `metrics list-definitions` [#5785](https://github.com/Azure/azure-cli/issues/5785)

### Network

* Added support for Private DNS zones

### Profile

* Added warning for `--identity-port` and `--msi-port` to `login`

### RDBMS

* Added business model GA API version 2017-12-01

### Resource

* [BREAKING CHANGE]: Changed `provider operation [list|show]` to not require `--api-version`

### Role

* Added support for required access configurations and native clients to `az ad app create`
* Changed `rbac` commands to return less than 1000 IDs on object resolution
* Added credential management commands `ad sp credential [reset|list|delete]`
* [BREAKING CHANGE] Removed 'properties' from `az role assignment [list|show]` output
* Added support for `dataActions` and `notDataActions` permissions to `role definition`

### Storage

* Fixed issue when uploading file with size between 195GB and 200GB
* Fixed [#4049](https://github.com/Azure/azure-cli/issues/4049): Problems with append blob uploads ignoring condition parameters

### VM

* Added warning to `vmss create` for upcoming breaking changes for sets with 100+ instances
* Added zone resilient support to `vm [snapshot|image]`
* Changed disk instance view to report better encryption status
* [BREAKING CHANGE] Changed `vm extension delete` to no longer return output

## March 13, 2018

Version 2.0.29

### ACR

* Added support for `--image` parameter to `repository delete`
* Deprecated `--manifest` and `--tag` parameters of the `repository delete` command
* Added `repository untag` command to remove a tag without deleting data

### ACS

* Added `aks upgrade-connector` command to upgrade an existing connector
* Changed `kubectl` config files to use a more readable block-style YAML

### Advisor

* [BREAKING CHANGE] Renamed `advisor configuration get` to `advisor configuration list`
* [BREAKING CHANGE] Renamed `advisor configuration set` to `advisor configuration update`
* [BREAKING CHANGE] Removed `advisor recommendation generate`
* Added `--refresh` parameter to `advisor recommendation list`
* Added `advisor recommendation show` command

### Appservice

* Deprecated `[webapp|functionapp] assign-identity`
* Added managed identity commands `webapp identity [assign|show]` and `functionapp identity [assign|show]`

### Eventhubs

* Initial release

### Extension

* Added check to warn user if used distro is different then the one stored in package source file, as this may lead into errors

### Interactive

* Fixed [#5625](https://github.com/Azure/azure-cli/issues/5625): Persist history across different sessions
* Fixed [#3016](https://github.com/Azure/azure-cli/issues/3016): History not recorded while in scope
* Fixed [#5688](https://github.com/Azure/azure-cli/issues/5688): Completions did not appear if command table loading encountered an exception
* Fixed progress meter for long running operations

### Monitor

* Deprecated the `monitor autoscale-settings` commands
* Added `monitor autoscale` commands
* Added `monitor autoscale profile` commands
* Added `monitor autoscale rule` commands

### Network

* [BREAKING CHANGE] Removed `--tags` parameter from  `route-filter rule create`
* Removed some erroneous default values for the following commands:
  * `network express-route update`
  * `network nsg rule update`
  * `network public-ip update`
  * `traffic-manager profile update`
  * `network vnet-gateway update`
* Added `network watcher connection-monitor` commands`
* Added `--vnet` and `--subnet` parameters to `network watcher show-topology`

### Profile

* Deprecated `--msi` parameter for `az login`
* Added `--identity` parameter for `az login` to replace `--msi`

### RDBMS

* [PREVIEW] Changed to use the API 2017-12-01-preview

### Service Bus

* Initial release

### Storage

* Fixed [#4971](https://github.com/Azure/azure-cli/issues/4971): `storage blob copy` now supports other Azure clouds
* Fixed [#5286](https://github.com/Azure/azure-cli/issues/5286): Batch commands `storage blob [delete-batch|download-batch|upload-batch]` no longer throw an error upon precondition failures

### VM

* Added support to `[vm|vmss] create` to attach unmanaged data disks and configure caching
* Deprecated `[vm|vmss] assign-identity` and `[vm|vmss] remove-identity`
* Added `vm identity [assign|remove|show]` and `vmss identity [assign|remove|show]` commands to replace deprecated commands
* Changed default priority in `vmss create` to None

## February 27, 2018

Version 2.0.28

### Core

* Fixed [#5184](https://github.com/Azure/azure-cli/issues/5184): Homebrew install issue
* Added support for extension telemetry with custom keys
* Added HTTP logging to `--debug`

### ACS

* Changed to use the the `virtual-kubelet-for-aks` Helm chart for `aks install-connector` by default
* Fixed issue: Insuffient permission for service principals to create ACI container group issue
* Added `--aci-container-group`, `--location`, and `--image-tag` parameters to `aks install-connector`
* Removed deprecation notice from `aks get-versions`

### Appservice

* Updates for new SDK version (azure-mgmt-web 0.35.0)
* Fixed [#5538](https://github.com/Azure/azure-cli/issues/5538): `Free` reported as invalid SKU

### Cognitive Services

* Updated the 'notice' when creating a new Cognitive Services account

### Consumption

* Added new commands for pricesheet API
* Updated the existing Usage Details and Reservation Details formats

### Container

* Added `--secrets` and `--secrets-mount-path` arguments to `container create` to use secrets in ACI

### Network

* Fixed [#5559](https://github.com/Azure/azure-cli/issues/5559): Missing client in `network vnet-gateway vpn-client generate`

### Resource

* Changed `group deployment export` to display a partial template and errors on failure

### Role

* Added `role assignment list-changelogs` to allow auditing of service principal roles

### SQL

* Added zone redundancy support for databases and elastic pools on creation and update

### Storage

* Enabled specifying destination-path/prefix for `storage blob [upload-batch|download-batch]`

### VM

* Added suport for attaching/detatching disks on a single VMSS instance


## February 13, 2018

Version 2.0.27

### Core

* Changed authentication to key on both subscription ID and name on MSI login

### ACS

* [BREAKING CHANGE] Renamed `aks get-versions` to `aks get-upgrades` in the interest of accuracy
* Changed `aks get-versions` to show Kubernetes versions available for `aks create`
* Changed `aks create` defaults to letting the server choose the version of Kubernetes
* Updated help messages referring to the service principal generated by AKS
* Changed default node sizes for `aks create` from "Standard\_D1\_v2" to "Standard\_DS1\_v2"
* Improved reliability when locating the dashboard pod for `az aks browse`
* Fixed `aks get-credentials` to handle Unicode errors when loading Kubernetes configuration files
* Added a message to `az aks install-cli` to help get `kubectl` in `$PATH`

### Appservice

* Fixed issue where `webapp [backup|restore]` failed because of a null reference
* Added support for default app service plans through `az configure --defaults appserviceplan=my-asp`

### CDN

* Added `cdn custom-domain [enable-https|disable-https]` commands

### Container

* Added `--follow` option to `az container logs` for streaming logs
* Added `container attach` command that attaches local standard output and error streams to a container in a container group

### CosmosDB

* Added support for setting capabilities

### Extension

* Added support for `--pip-proxy` parameter to `az extension [add|update]` commands
* Added support for `--pip-extra-index-urls` argument to `az extension [add|update]` commands

### Feedback

* Added extension information to telemetry data

### Interactive

* Fixed issue where user is prompted to login when using interactive mode in Cloud Shell
* Fixed regression with missing parameter completions

### IoT

* Fixed issue where `iot dps access policy [create|update]` would return a 'not found' error on success
* Fixed issue where `iot dps linked-hub [create|update]` would return a 'not found' error on success
* Added `--no-wait` support to `iot dps access policy [create|update]` and `iot dps linked-hub [create|update]`
* Changed `iot hub create` to allow specifying the number of partitions

### Monitor

* Fixed `az monitor log-profiles create` command

### Network

* Fixed the `--tags` option for the following commands:
  * `network public-ip create`
  * `network lb create`
  * `network local-gateway create`
  * `network nic create`
  * `network vnet-gateway create`
  * `network vpn-connection create`

### Profile

* Enabled `az login` in from interactive mode

### Resource

* Added back `feature show`

### Role

* Added `--available-to-other-tenants` argument to `ad app update`

### SQL

* Added `sql server dns-alias` commands
* Added `sql db rename`
* Added support for the `--ids` argument to all sql commands

### Storage

* Added `storage blob service-properties delete-policy` and `storage blob undelete` commands to enable soft-delete

### VM

* Fixed a crash when VM encryption may not be fully initialized
* Added principal ID output on enabling MSI
* Fixed `vm boot-diagnostics get-boot-log`


## January 31, 2018

Version 2.0.26

### Core

* Added support raw token retrival in MSI context
* Removed polling indicator string after finishing LRO on Windows cmd.exe
* Added a warning that appears when using a configured default has been changed to an INFO level entry. Use `--verbose` to see
* Add a progress indicator for wait commands

### ACS

* Clarified `--disable-browser` argument
* Improved tab completion for `--vm-size` arguments

### Appservice

* Fixed `webapp log [tail|download]`
* Removed the `kind` check on webapps and functions

### CDN

* Fixed missing client issue with `cdn custom-domain create`

### CosmosDB

* Fixed parameter description for failover policies

### Interactive

* Fixed issue where command option completions no longer appeared

### Network

* Added protection for `--cert-password` to `application-gateway create`
* Fixed issue with `application-gateway update` where `--sku` erroneously applied a default value
* Added protection for `--shared-key` and `--authorization-key` to `vpn-connection create`
* Fixed missing client issue with `asg create`
* Added `--file-name / -f` parameter for exported names to `dns zone export`
* Fixed the following issues with `dns zone export`:
  * Fixed issue where long TXT records were incorrectly exported
  * Fixed issue where quoted TXT records were incorrectly exported without escaped quotes
* Fixed issue where certain records were imported twice with `dns zone import`
* Restored `vnet-gateway root-cert` and `vnet-gateway revoked-cert` commands

### Profile

* Fixed `get-access-token` to work inside a VM with identity

### Resource

* Fixed bug with `deployment [create|validate]` where warning was incorrectly displayed when a template 'type' field contained uppercase values

### Storage

* Fixed issue with migrating Storage V1 accounts to Storage V2
* Added progress reporting for all upload/download commands
* Fixed bug preventing "-n" arg option with `storage account check-name`
* Added 'snapshot' column to table output for `blob [list|show]`
* Fixed bugs with various parameters that needed to be parsed as ints

### VM

* Added `vm image accept-terms` command to allow creating VMs from images with additional charges
* Fixed `[vm|vmss create]` to ensure commands can run under proxy with unsigned certificates
* [PREVIEW] Added support for "low" priority to VMSS
* Added protection for `--admin-password` to `[vm|vmss] create`


## January 17, 2018

Version 2.0.25

### ACR

* Added acr login fallback on Windows credential errors
* Enabled registry logs

### ACS

* Fixed `get-credentials` command
* Removed SPN role requirement

### Appservice

* Fixed bug with `config ssl upload` where `hosting_environment_profile` was null
* Added support for custom URLs to `browse`
* Fixed slot support for `log tail`

### Backup

* Changed `--container-name` option of `backup item list` to be optional
* Added storage account options to `backup restore restore-disks`
* Fixed location check in `backup protection enable-for-vm` to be case insensitive
* Fixed issue where commands failed with an invalid container name
* Changed `backup item list` to include 'Health Status' by default

### Batch

* Changed `batch login` to return authentication details

### Cloud

* Changed to not require endpoints when setting `--profile` on a cloud

### Consumption

* Added new commands for reservations: `consumption reservations summaries` and `consumption reservations details`

### Event Grid

* [BREAKING CHANGE] Moved the `az eventgrid topic event-subscription` commands to `eventgrid event-subscription`
* [BREAKING CHANGE] Moved the `az eventgrid resource event-subscription` commands to `eventgrid event-subscription`
* [BREAKING CHANGE] Removed the `eventgrid event-subscription show-endpoint-url` command. Use `eventgrid event-subscription show --include-full-endpoint-url` instead
* Added command `eventgrid topic update`
* Added command `eventgrid event-subscription update`
* Added `--ids` parameter for `eventgrid topic` commands
* Added tab completion support for topic names

### Interactive

* Fixed issue where interactive mode did not work with Python 2.x
* Fixed errors on startup
* Fixed issue with some commands not running in interactive mode

### IoT

* Added support for device provisioning service
* Added deprecation messages in commands and command help
* Added IoT check to inform users of the IoT Extension

### Monitor

* Added multi-diagnostic setting support. The `--name` parameter is now required for `az monitor diagnostic-settings create`
* Added command `monitor diagnostic-settings categories` to get diagnostic settings category

### Network

* Fixed issue when trying to change to/from active-standby mode with `vnet-gateway update`
* Added support for HTTP2 to `application-gateway [create|update]`

### Profile

* Added support for login with user assigned identities

### Role

* Added `--assignee-object-id` argument to `role assignment create` to bypass graph query

### Service Fabric

* Added detailed errors to validation response when creating cluster
* Fixed missing client issue with several commands

### VM

* [PREVIEW] Cross-zone support for `vmss`
* [BREAKING CHANGE] Changed single-zone `vmss` default to "Standard" load balancer
* [BREAKING CHANGE] Changed `externalIdentities` to `userAssignedIdentities` for EMSI
* [PREVIEW] Added support for OS disk swap
* Added support for using VM images from other subscriptions
* Added `--plan-name`, `--plan-product`, `--plan-promotion-code` and `--plan-publisher` arguments to `[vm|vmss] create`
* Fixed error issues with `[vm|vmss] create`
* Fixed excessive resource usage caused by `vm image list --all`

## December 19, 2017

Version 2.0.23

* Added support for login with user assigned identities

### Container

* Fixed incorrect order of parameters for container logs

### Network

* Added `--disable-bgp-route-propagation` argument to `route-table [create|update]`
* Added `--ip-tags` argument to `public-ip [create|update]`

### Storage

* Added support for storage V2

### VM

* [PREVIEW] Added support for user-assigned identities for VMs and VMSSes


## December 5, 2017

Version 2.0.22

* Removed `az component` commands. Use `az extension` instead

### Core
* Modified the `AZURE_US_GOV_CLOUD` AAD authority endpoint from login.microsoftonline.com to login.microsoftonline.us
* Fixed issue where telemetry would continuously resend

### ACS

* Added `aks install-connector` and `aks remove-connector` commands
* Improved error reporting for `acs create`
* Fixed usage of `aks get-credentials -f` without fully-qualified path

### Advisor

* Initial release

### Appservice

* Fixed cert name generation with `webapp config ssl upload`
* Fixed `webapp [list|show]` and `functionapp [list|show]` to display correct apps
* Added default value for `WEBSITE_NODE_DEFAULT_VERSION`

### Consumption

* Aded support for API version 2017-11-30

### Container

* Fixed default ports regression

### Monitor

* Added multi-dimension support to metrics command

### Resource

* Added `--include-response-body` argument to `resource show`

### Role

* Added display of default assignments for "classic" administraors to `role assignment list`
* Added suport to `ad sp reset-credentials` for adding credentials instead of overwriting
* Improved error reporting for `ad sp create-for-rbac`

### SQL

* Added `sql db list-usages` and `sql db show-usage` commands
* Added `sql server conn-policy show` and `sql server conn-policy update` commands

### VM

* Added zone information to `az vm list-skus`


## November 14, 2017

Version 2.0.21

### ACR

* Added support for creating webhooks in replication regions


### ACS

* Changed all wording of "agent" to "node" in AKS
* Deprecated `--orchestrator-release` option for `acs create`
* Changed default VM size for AKS to `Standard_D1_v2`
* Fixed `az aks browse` on Windows
* Fixed `az aks get-credentials` on Windows

### Appservice

* Added deployment source `config-zip` for webapps and function apps
* Added `--docker-container-logging` option to `az webapp log config`
* Removed the `storage` option from the parameter `--web-server-logging` of `az webapp log config`
* Improved error messages for `deployment user set`
* Added support for creating Linux function apps
* Fixed `list-locations`

### Batch

* Fixed bug in pool create command when a resource ID was used with the `--image` flag

### Batchai

* Added short option, `-s`, for `--vm-size` when providing VM size in `file-server create` command
* Added storage account name and key arguments to `cluster create` parameters
* Fixed documentation for `job list-files` and `job stream-file`
* Added short option, `-r`, for `--cluster-name` when providing cluster name in `job create` command

### Cloud

* Changed `cloud [register|update]` to prevent registering clouds that have missing required endpoints

### Container

* Added support to open multiple ports
* Added container group restart policy
* Added support to mount Azure File share as a volume
* Updated helper docs

### Data Lake Analytics

* Changed `[job|account] list` to return more concise information

### Data Lake Store

* Changed `account list` to return more concise information

### Extension

* Added `extension list-available` to allow listing official Microsoft extensions
* Added `--name` to `extension [add|update]` to allow installing extensions by name

### IoT

* Added support for certificate authorities (CA) and certificate chains

### Monitor

* Added `activity-log alert` commands

### Network

* Added support for CAA DNS records
* Fixed issue where endpoints could not be updated with `traffic-manager profile update`
* Fixed issue where `vnet update --dns-servers` didn't work depending on how the VNET was created
* Fixed issue where relative DNS names were incorrectly imported by `dns zone import`

### Reservations

* Initial preview release

### Resource

* Added support for resource IDs to `--resource` parameter and resource-level locks

### SQL

* Added `--ignore-missing-vnet-service-endpoint` parameter to `sql server vnet-rule [create|update]`

### Storage

* Changed `storage account create` to use SKU `Standard_RAGRS` as default
* Fixed bugs when dealing with file/blob names that include non-ascii chars
* Fixed bug that prevented using `--source-uri` with `storage [blob|file] copy start-batch`
* Added commands to glob and delete multiple objects with `storage [blob|file] delete-batch`
* Fixed issue when enabling metrics with `storage metrics update`
* Fixed issue with files over 200GB when using `storage blob upload-batch`
* Fixed issue where `--bypass` and `--default-action` were ignored by `storage account [create|update]`

### VM

* Fixed a bug with `vmss create` that prevented using the `Basic` size tier
* Added `--plan` arguments to `[vm|vmss] create` for custom images with billing information
* Added `vm secret `[add|remove|list]` commands
* Renamed `vm format-secret` to `vm secret format`
* Added `--encrypt format` argument to `vm encryption enable`

## October 24, 2017

Version 2.0.20

### Core

* Updated `2017-03-09-profile` to consume `MGMT_STORAGE` API version `2016-01-01`

### ACR

* Updated resource management to point to `2017-10-01` API version
* Changed 'bring your own storage' SKU to Classic
* Renamed registry SKUs to Basic, Standard, and Premium

### ACS

* [PREVIEW] Added `az aks` commands
* Fixed kubernetes `get-credentials`

### Appservice

* Fixed issue where downloaded `webapp` logs may be invalid

### Component

* Added clearer deprecation message for all installers and confirmation prompt

### Monitor

* Added `action-group` commands

### Resource

* Fixed incompatibility with most recent version of msrest dependency in `group export`
* Fixed `policy assignment create` to work with built in policy definitions and policy set definitions

### VM

* Added `--accelerated-networking` argument to `vmss create`


## October 9, 2017

Version 2.0.19

### Core

* Added handling of ADFS authority URLs with a trailing slash to Azure Stack

### Appservice

* Added generic update with new command `webapp update`

### Batch

* Updated to Batch SDK 4.0.0
* Updated `--image` option of VirtualMachineConfiguration to support ARM image references in addition to publish:offer:sku:version
* Added support for the new CLI extension model for Batch Extensions commands
* Removed Batch support from the component model

### Batchai

* Initial release of Batch AI module

### Keyvault

* Fixed Key Vault authentication issue when using ADFS on Azure Stack. [(#4448)](https://github.com/Azure/azure-cli/issues/4448)

### Network

* Changed `--server` argument of `application-gateway address-pool create` to be optional, allowing for empty address pools
* Updated `traffic-manager` to support latest features

### Resource

* Added support for `--resource-group/-g` options for resource group name to `group`
* Added commands for `account lock` to work with subscription-level locks
* Added commands for `group lock` to work with group-level locks
* Added commands for `resource lock` to work with resource-level locks

### Sql

* Added support for SQL Transparent Data Encryption (TDE) and TDE with Bring Your Own Key
* Added `db list-deleted` command and `db restore --deleted-time` parameter, allowing the ability to find and restore deleted databases
* Added `db op list` and `db op cancel`, allowing the ability to list and cancel in-progress operations on database

### Storage

* Added support for file share snapshot

### Vm

* Fixed a bug in `vm show` where using `-d` caused a crash on missing private ip addresses
* [PREVIEW] Added support for rolling upgrade to `vmss create`
* Added support for updating encryption settings with `vm encryption enable`
* Added `--os-disk-size-gb` parameter to `vm create`
* Added `--license-type` parameter for Windows to `vmss create`


## September 22, 2017

Version 2.0.18

### Resource

* Added support for showing built-in policy definitions
* Added support mode parameter for creating policy definitions
* Added support for UI definitions and templates to `managedapp definition create`
* [BREAKING CHANGE] Changed `managedapp` resource type from `appliances` to `applications` and `applianceDefinitions` to `applicationDefinitions`

### Network

* Added support for availability zone to `network lb` and `network public-ip` subcommands
* Added support for IPv6 Microsoft Peering to `express-route`
* Added `asg` application security group commands
* Added `--application-security-groups` argument to `nic [create|ip-config create|ip-config update]`
* Added `--source-asgs` and `--destination-asgs` arguments to `nsg rule [create|update]`
* Added `--ddos-protection` and `--vm-protection` arguments to `vnet [create|update]`
* Added `network [vnet-gateway|vpn-client|show-url]` commands

### Storage

* Fixed issue where `storage account network-rule` commands may fail after updating the SDK

### Eventgrid

* Updated Azure Event Grid Python SDK to use newer API version "2017-09-15-preview"

### SQL

* Changed `sql server list` argument `--resource-group` to be optional. If not specified, all sql servers in the subscription will be returned
* Added `--no-wait` param to `db [create|copy|restore|update|replica create|create|update]` and `dw [create|update]`

### Keyvault

* Added support for Keyvault commands from behind a proxy

### VM

* Added for support to availability zone to `[vm|vmss|disk] create`
* Fixed issue where using`--app-gateway ID` with `vmss create` would cause a failure
* Added `--asgs` argument to `vm create`
* Added support for running commands on VMs with `vm run-command`
* [PREVIEW] Added support for VMSS disk encryption with `vmss encryption`
* Added support for performing maintenance on VMs with `vm perform-maintenance`

### ACS

* [PREVIEW] Added `--orchestrator-release` argument to `acs create` for ACS preview regions

### Appservice

* Added ability to update and show authentication settings with `webapp auth [update|show]`

### Backup

* Preview release


## September 11, 2017

Version 2.0.17

### Core

* Enabled command module to set its own correlation ID in telemetry
* Fixed JSON dump issue when telemetry is set to diagnostics mode

### Acs

* Added `acs list-locations` command
* Made `ssh-key-file` come with expected default value

### Appservice

* Added ability to create a webapp in a resource group other than the active service plan's

### CDN

* Fixed 'CustomDomain is not interable' bug for `cdn custom-domain create`

### Extension

* Initial Release

### Keyvault

* Fixed issue where permissions were case sensitive for `keyvault set-policy`

### Network

* Renamed `vnet list-private-access-services` to `vnet list-endpoint-services`
* Renamed `--private-access-services` argument to `--service-endpoints` for `vnet subnet create/update`
* Added support for multiple IP ranges and port ranges to `nsg rule create/update`
* Added support for SKU to `lb create`
* Added support for SKU to `public-ip create`

### Resource

* Allow passing in resource policy parameter definitions in `policy definition create`, and `policy definition update`
* Allow passing in parameter values for `policy assignment create`
* Allow for passing JSON or file for all params
* Incremented API version

### SQL

* Added `sql server vnet-rule` commands

### VM

* Fixed: Don't assign access unless `--scope` is provided
* Fixed: Use the same extension naming as portal does
* Removed `subscription` from the `[vm|vmss] create` output
* Fixed: `[vm|vmss] create` storage SKU is not applied on data disks with an image
* Fixed: `vm format-secret --secrets` would not accept newline separated IDs

## August 31, 2017

Version 2.0.16

### Keyvault

* Fixed bug when trying to automatically resolve secret encoding with `secret download`

### Sf

* Deprecating all commands in favor of Service Fabric CLI (sfctl)

### Storage

* Fixed issue where storage accounts could not be created in regions that don't support the NetworkACLs feature
* Determine content type and content encoding during blob and file upload if neither content type and content encoding are specified

## August 28, 2017

Version 2.0.15

### CLI

* Added legal note to `--version`

### ACS

* Corrected preview regions
* Formatted default `dns_name_prefix` properly
* Optimized acs command output

### Appservice

* [BREAKING CHANGE] Fixed inconsistencies in the output of `az webapp config appsettings [delete|set]`
* Added a new alias of `-i` for `az webapp config container set --docker-custom-image-name`
* Exposed `az webapp log show`
* Exposed new arguments from `az webapp delete` to retain app service plan, metrics or dns registration
* Fixed: Detect slot settings correctly

### IoT

* Fixed #3934: Policy creation no longer clears existing policies

### Network

* [BREAKING CHANGE] Renamed `vnet list-private-access-services` to `vnet list-endpoint-services`
* [BREAKING CHANGE] Renamed option `--private-access-services` to `--service-endpoints` for `vnet subnet [create|update]`
* Added support for multiple IP and port ranges to `nsg rule [create|update]`
* Added support for SKU to `lb create`
* Added support for SKU to `public-ip create`

### Profile

* Exposed `--msi` and `--msi-port` to login using a virtual machine's identity

### Service Fabric

* Preview release
* Simplified registry user/password rules for command
* Fixed password prompt for user even after passing in the param
* Added support for empty `registry_cred`

### Storage

* Enabled setting blob tier
* Added `--bypass` and `--default-action` arguments to `storage account [create|update]` to support service tunneling
* Added commands to add VNET rules and IP based rules to `storage account network-rule`
* Enabled service encryption by customer managed key
* [BREAKING CHANGE] Renamed `--encryption` option to `--encryption-services` for `az storage account create and az storage account update` command
* Fixed #4220: `az storage account update encryption` - syntax mismatch

### VM

* Fixed issue where extra, erroneous information was displayed for `vmss get-instance-view` when using `--instance-id *`
* Added support for `--lb-sku` to `vmss create`:
* Removed human names from the admin name blacklist for `[vm|vmss] create`
* Fixed issue where `[vm|vmss] create` would throw an error if unable to extract plan information from an image
* Fixed a crash when creating a vmms scaleset with an internal LB
* Fixed issue where `--no-wait` argument did not work wth `vm availability-set create`


## August 15, 2017

Version 2.0.14

### ACS

* Corrected sshMaster0 port number for kubernetes

### Appservice

* Fixed an exception when creatng a new git based Linux webapp

### Event Grid

* Added SDK dependencies

## August 11, 2017

Version 2.0.13

### ACS

* Added more preview regions

### Batch

* Updated to Batch SDK 3.1.0 and Batch Management SDK 4.1.0
* Added a new command show the task counts of a job
* Fixed bug in resource file SAS URL processing
* Batch account endpoint now supports optional 'https://' prefix
* Support for adding lists of more than 100 tasks to a job
* Added debug logging for loading Extensions command module

### Component

* Added deprecation warning to 'az component' commands

### Container

* `create`: Fixed issue where equals sign was not allowed inside an environment variable


### Data Lake Store

* Enabled progress control

### Event Grid

* Initial release

### Network

* `lb`: Fixed issue where the certain child resource names did not resolve correctly when omitted
* `application-gateway {subresource} delete`: Fixed issue where `--no-wait` was not honored
* `application-gateway http-settings update`: Fixed issue where `--connection-draining-timeout` could not be turned off
* Fixed error unexpected keyword argument `sa_data_size_kilobyes` with `az network vpn-connection ipsec-policy add`

### Profile

* `account list`: Added `--refresh` to sync up the latest subscriptions from server

### Storage

* Enable update storage account with system assigned identity

### VM

* `availability-set`: Exposed fault domain count on convert
* Exposed `list-skus` command
* Support to assign identity w/o creating role assignments
* Apply storage sku on attaching data disks
* Removed default os-disk name and storage SKU when using managed disks


## July 28, 2017

Version 2.0.12

* Added container commands
* Added billing and consumption modules

```text
azure-cli (2.0.12)

acr (2.0.9)
acs (2.0.11)
appservice (0.1.11)
batch (3.0.3)
billing (0.1.3)
cdn (0.0.6)
cloud (2.0.7)
cognitiveservices (0.1.6)
command-modules-nspkg (2.0.1)
component (2.0.6)
configure (2.0.10)
consumption (0.1.3)
container (0.1.7)
core (2.0.12)
cosmosdb (0.1.11)
dla (0.0.10)
dls (0.0.11)
feedback (2.0.6)
find (0.2.6)
interactive (0.3.7)
iot (0.1.10)
keyvault (2.0.8)
lab (0.0.9)
monitor (0.0.8)
network (2.0.11)
nspkg (3.0.1)
profile (2.0.9)
rdbms (0.0.5)
redis (0.2.7)
resource (2.0.11)
role (2.0.9)
sf (1.0.5)
sql (2.0.8)
storage (2.0.11)
vm (2.0.11)
```

### Core

* Output sdk auth info for service principals with certificates
* Fixed deployment progress exceptions
* Use arm endpoint from the current cloud to create subscription client
* Improved concurrent handling of clouds.config file (#3636)
* Refresh client request id for each command execution
* Create subscription clients with right SDK profile (#3635)
* Progress Reporting for template deployments (#3510)
* Added support for picking table output fields through jmespath query  (#3581)
* Improved the muting of parse args and append history with gestures (#3434)
* Create subscription clients with right SDK profile
* Move all existing recording files to latest folder
* Fixed idempotency for VM/VMSS create (#3586)
* Command paths are no longer case sensitive
* Certain boolean-type parameters are no longer case sensitive
* Support login to ADFS on prem server like Azure Stack
* Fixed concurrent writes to clouds.config (#3255)

### ACR

* Added `show-usage` command for managed registries
* Support SKU update for managed registries
* Added managed registries with managed SKU
* Added webhooks for managed registries with acr webhook command module
* Added AAD authentication with acr login command
* Added delete command for docker repositories, manifests, and tags

### ACS

* Support for API version 2017-07-01

### Appservice

* Fixed bug where listing Linux webapp would return nothing
* Support to retrieve creds from acr
* Remove all commands under `appservice web`
* Mask docker registry passwords from command output (#3656)
* Ensure default browser is used on macOS without errors (#3623)
* Improve the help of `webapp log tail` and `webapp log download` (#3624)
* Exposed `traffic-routing` command to configure static routing (#3566)
* Added reliability fixes in configuring source control (#3245)
* Removed unsupported `--node-version` argument from `webapp config update` for Windows webapps. Instead use `webapp config appsettings set --settings WEBSITE_NODE_DEFAULT_VERSION=...`

### Batch

* Updated to Batch SDK 3.0.0 with support for low-priority VMs in pools
* Renamed `pool create` option `--target-dedicated` to `--target-dedicated-nodes`
* Added `pool create` options `--target-low-priority-nodes` and `--application-licenses`

### CDN

* Provided a better error message for `cdn endpoint list` when the profile specified by `--profile-name` does not exist

### Cloud

* Changed API version of cloud metadata endpoint to YYYY-MM-DD format
* Gallery endpoint isn't required
* Support for registering cloud just with ARM resource manager endpoint
* Provided an option for `cloud set` to choose the profile while selecting current cloud
* Exposed `endpoint_vm_image_alias_doc`

### CosmosDB

* Fixed allowing creation of collection with custom partition key
* Added support for collection default TTL

### Data Lake Analytics

* Added commands for compute policy management under the `dla account compute-policy` heading
* Added `dla job pipeline show`
* Added `dla job recurrence list`

### Data Lake Store

* Added support for user managed key vault key rotation in `dls account update`
* Updated underlying Data Lake Store filesystem SDK version, addressing a performance issue
* Added command `dls enable-key-vault`. This command attempts to enable a user provided Key Vault for use encrypting the data ina Data Lake Store account

### Interactive

* Improved the start up time by using cached commands
* Increased test coverage
* Enhanced the '?' gesture to also inject into the next command
* Fixed interactive errors with the profile 2017-03-09-profile-preview (#3587)
* Allowed `--version` as a parameter for interactive mode (#3645)
* Stop interactive mode throwing errors from validation completions (#3570)
* Progress reporting for template deployments (#3510)
* Added `--progress` flag
* Removed `--debug` and `--verbose` from completions
* Removed `interactive` from completions (#3324)

### IoT

* Fixed policy creation no longer clears existing policies. (#3934)

### Key vault

* Added commands for key vault recovery features:
  * `keyvault` subcommands `purge`, `recover`, `keyvault list-deleted`
  * `keyvault secret` subcommands `backup`, `restore`, `purge`, `recover`, `list-deleted`
  * `keyvault certificate` subcommands `purge`, `recover`, `list-deleted`
  * `keyvault key` subcommands `purge`, `recover`, `list-deleted`
* Added service principal key vault integration (#3133)
* Updated key vault dataplane to 0.3.2. (#3307)

### Lab

* Added support for claiming any vm in the lab through `az lab vm claim`
* Added table output formatter for `az lab vm list` and `az lab vm show`

### Monitor

* Fix for template file with `monitor autoscale-settings get-parameters-template` command (#3349)
* Renamed `monitor alert-rule-incidents list` to `monitor alert list-incidents`
* Renamed `monitor alert-rule-incidents show` to `monitor alert show-incident`
* Renamed `monitor metric-defintions list` to `monitor metrics list-definitions`
* Renamed `monitor alert-rules` to `monitor alert`
* Changed `monitor alert create`:
  * `condition` and `action` subcommands no longer accept JSON
  * Add numerous parameters to simplify the rule creation process
  * `location` no longer required
  * Add name and ID support for target
  * Remove `--alert-rule-resource-name`
  * Rename `is-enabled` to `enabled`, no longer required
  * `description` defaults now based on the supplied condition
  *  Add examples to help clarifiy the new format
* Support names or IDs for `monitor metric` commands
* Added convenience arguments and examples to `monitor alert rule update`

### Network

* Added `list-private-access-services` command
* Added `--private-access-services` argument to `vnet subnet create` and `vnet subnet update`
* Fixed issue where `application-gateway redirect-config create` would fail
* Fixed issue where `application-gateway redirect-config update` with `--no-wait` would not work
* Fixed bug when using `--servers` argument with `application-gateway address-pool create` and `application-gateway address-pool update`
* Added `application-gateway redirect-config` commands
* Added commands to `application-gateway ssl-policy`: `list-options`, `predefined list`, `predefined show`
* Added arguments to `application-gateway ssl-policy set`: `--name`, `--cipher-suites`, `--min-protocol-version`
* Added arguments to `application-gateway http-settings create` and `application-gateway http-settings update`: `--host-name-from-backend-pool`, `--affinity-cookie-name`,
  `--enable-probe`, `--path`
* Added arguments to `application-gateway url-path-map create` and `application-gateway url-path-map update`: `--default-redirect-config`, `--redirect-config`
* Added argument `--redirect-config` to `application-gateway url-path-map rule create`
* Added support for `--no-wait` to `application-gateway url-path-map rule delete`
* Added arguments to `application-gateway probe create` and `application-gateway probe update`: `--host-name-from-http-settings`, `--min-servers`, `--match-body`, `--match-status-codes`
* Added argument `--redirect-config` to `application-gateway rule create` and `application-gateway rule update`
* Added support for `--accelerated-networking` to `nic create` and `nic update`
* Removed `--internal-dns-name-suffix` argument from `nic create`
* Added support for `--dns-servers` to `nic update` and `nic create`: Add support for --dns-servers
* Fixed bug where `local-gateway create` ignored `--local-address-prefixes`
* Added support for `--dns-servers` to `vnet update`
* Fixed bug when creating a peering without route filtering with `express-route peering create`
* Fixed bug where `--provider` and `--bandwidth` arguments did not work with `express-route update`
* Fixed bug with `network watcher show-topology` defaulting logic
* Improved output formatting for `network list-usages`
* Use default frontend IP for `application-gateway http-listener create` if only one exists
* Use default address pool, HTTP settings, and HTTP listener for `application-gateway rule create` if only one exists
* Use default frontend IP and backend pool for `lb rule create` if only one exists
* Use default frontend IP for `lb inbound-nat-rule create` if only one exists

### Profile

* Support login inside a VM with a managed identity
* Support output for `account show` in SDK auth file format
* Show deprecation warnings when using '--expanded-view'
* Added `get-access-token` command to provide raw AAD token
* Support login with a user account with no associated subscriptions

### RDBMS

* Support listing servers across a subscription (#3417)
* Fixed `%s` not processed becasue of missing `% server_type` (#3393)
* Fixed doc source map and added CI task to verify (#3361)
* Fixed MySQL and PostgreSQL help (#3369)

### Resource

* Improved prompts for missing parameters for `group deployment create`
* Improved parsing of `--parameters KEY=VALUE` syntax
* Fixed issues where `group deployment create` parameter files were no longer recognized using `@<file>` syntax
* Support `--ids` argument for `resource` and `managedapp` commands
* Fixed up some parsing and error messages (#3584)
* Fixed `--resource-type` parsing for the `lock` command to accept `<resource-namespace>` and `<resource-type>`
* Added parameter checking for template link templates (#3629)
* Added support for specifying deployment parameters using `KEY=VALUE` syntax

### Role

* Support output in SDK auth file format for `create-for-rbac`
* Cleaned up role assignments and related AAD application when deleting a service principal (#3610)
* Include time format in `app create` args `--start-date` and `--end-date` descriptions
* Show deprecation warnings when using `--expanded-view`
* Added key vault integration to the `create-for-rbac` and `reset-credentials` commands

### Service Fabric
* Fixed an issue with large files in applications being truncated on upload (#3666)
* Added tests for Service Fabric commands (#3424)
* Fixed numerous Service Fabric commands (#3234)

### SQL

* Removed broken `sql server create` `--identity` parameter
* Removed password values from `sql server create` and `sql server update` command output
* Added commands `sql db list-editions` and `sql elastic-pool list-editions`

### Storage

* Removed `--marker` option from `storage blob list`, `storage container list`, and `storage share list` commands (#3745)
* Enabled creating an https-only storage account
* Updated storage metrics, logging and cors commands (#3495)
* Rephrased exception message from CORS add (#3638) (#3362)
* Converted generator to a list in download batch command dry run mode (#3592)
* Fixed blob download batch dryrun issue (#3640) (#3592)

### VM

* Support configuring nsg
* Fixed a bug where the DNS server would not be configured correctly
* Support managed service identities
* Fixed issue where `cmss create` with an existing load balancer required `--backend-pool-name`
* Make datadisks created with `vm image create` lun start with 0


## May 10, 2017

Version 2.0.6

* documentdb renamed to cosmosdb
* Add rdbms (mysql, postgres)
* Include Data Lake Analytics and Data Lake Store modules
* Include Cognitive Services module
* Include Service Fabric module
* Include Interactive module (rename of az-shell)
* Add support for CDN commands
* Remove Container module
* Add 'az -v' as shortcut for 'az --version' ([#2926](https://github.com/Azure/azure-cli/issues/2926))
* Improve performance of package load and command execution ([#2819](https://github.com/Azure/azure-cli/issues/2819))

```text
azure-cli (2.0.6)

acr (2.0.4)
acs (2.0.6)
appservice (0.1.6)
batch (2.0.4)
cdn (0.0.2)
cloud (2.0.2)
cognitiveservices (0.1.2)
command-modules-nspkg (2.0.0)
component (2.0.4)
configure (2.0.6)
core (2.0.6)
cosmosdb (0.1.6)
dla (0.0.6)
dls (0.0.6)
feedback (2.0.2)
find (0.2.2)
interactive (0.3.1)
iot (0.1.5)
keyvault (2.0.4)
lab (0.0.4)
monitor (0.0.4)
network (2.0.6)
nspkg (3.0.0)
profile (2.0.4)
rdbms (0.0.1)
redis (0.2.3)
resource (2.0.6)
role (2.0.4)
sf (1.0.1)
sql (2.0.3)
storage (2.0.6)
vm (2.0.6)
```

### Core

* core: capture exceptions caused by unregistered provider and auto-register it
* perf: persist adal token cache in memory till process exits ([#2603](https://github.com/Azure/azure-cli/issues/2603))
* Fix bytes returned from hex fingerprint -o tsv ([#3053](https://github.com/Azure/azure-cli/issues/3053))
* Enhanced Key Vault Certificate Download and AAD SP Integration ([#3003](https://github.com/Azure/azure-cli/issues/3003))
* Add Python location to ‘az —version’ ([#2986](https://github.com/Azure/azure-cli/issues/2986))
* login: support login when there are no subscriptions ([#2929](https://github.com/Azure/azure-cli/issues/2929))
* core: fix a failure when login using a service principal twice ([#2800](https://github.com/Azure/azure-cli/issues/2800))
* core: Allow file path of accessTokens.json to be configurable through an env var ([#2605](https://github.com/Azure/azure-cli/issues/2605))
* core: Allow configured defaults to apply on optional args ([#2703](https://github.com/Azure/azure-cli/issues/2703))
* core: Improved performance
* core: Custom CA Certs - Support setting REQUESTS_CA_BUNDLE environment variable
* core: Cloud configuration - use 'resource manager' endpoint if 'management' endpoint not set

### ACS

* fix the master and agent count to be integer instead of string
* expose 'az acs create --no-wait' and 'az acs wait' for async creation
* expose 'az acs create --validate' for dry-run validations
* remove windows profile before PUT call for scale command ([#2755](https://github.com/Azure/azure-cli/issues/2755))

### AppService

* functionapp: add full functionapp supports, including create, show, list, delete, hostname, ssl, etc
* Adding Team Services (vsts) as a continuous delivery option to "appservice web source-control config"
* Create "az webapp" to replace "az appservice web" (for backward compat, "az appservice web" will stay for 2 releases)
* Expose arguments to configure deployment and "runtime stacks" on webapp create
* Expose "webapp list-runtimes"
* support configure connection strings ([#2647](https://github.com/Azure/azure-cli/issues/2647))
* support slot swap with preview
* Polish errors from appservice commands ([#2948](https://github.com/Azure/azure-cli/issues/2948))
* Use the app service plan's resource group for cert operations ([#2750](https://github.com/Azure/azure-cli/issues/2750))

### CosmosDB

* Rename documentdb module to cosmosdb
* Added support for documentdb data-plane APIs:
  database and collection management
* Added support for enabling automatic failover on database accounts
* Added support for new consistency policy ConsistentPrefix

### Data Lake Analytics

* Fix a bug where filtering on result and state for job lists would throw an error
* Add support for new catalog item type: package. accessed through: `az dla catalog package`
* Made it possible to list the following catalog items from within a database (no schema specification required):

  * Table
  * Table valued function
  * View
  * Table Statistics. This can also be listed with a schema, but without specifying a table name

### Data Lake Store

* Update the version of the underlying filesystem SDK, which gives better support for handling server side throttling scenarios
* Improve performance of package load and command execution ([#2819](https://github.com/Azure/azure-cli/issues/2819))
* missed help for access show. adding it. ([#2743](https://github.com/Azure/azure-cli/issues/2743))

### Find

* improve search results and allow for versioning of the search index

### KeyVault

* BC:`az keyvault certificate download` change -e from string or binary to PEM or DER to better represent the options
* BC: Remove --expires and --not-before from `keyvault certificate create` as these parameters are not supported by the service
* Adds the --validity parameter to `keyvault certificate create` to selectively override the value in --policy
* Fixes issue in `keyvault certificate get-default-policy` where 'expires' and 'not_before' were exposed but 'validity_in_months' was not
* keyvault fix for import of pem and pfx ([#2754](https://github.com/Azure/azure-cli/issues/2754))

### Lab

* Adding create, show, delete & list commands for environment in the lab
* Adding show & list commands to view ARM templates in the lab
* Adding --environment flag in `az lab vm list` to filter VMs by environment in the lab
* Add convenience command `az lab formula export-artifacts` to export artifact scaffold within a Lab's formula
* Add commands to manage secrets within a Lab

### Monitor

* Bug Fix: Modeling `--actions` of `az alert-rules create` to consume JSON string ([#3009](https://github.com/Azure/azure-cli/issues/3009))
* Bug fix - diagnostic settings create does not accept logs/metrics from show commands ([#2913](https://github.com/Azure/azure-cli/issues/2913))

### Network

* Add `network watcher test-connectivity` command
* Add support for `--filters` parameter for `network watcher packet-capture create`
* Add support for Application Gateway connection draining
* Add support for Application Gateway WAF rule set configuration
* Add support for ExpressRoute route filters and rules
* Add support for TrafficManager geographic routing
* Add support for VPN connection policy-based traffic selectors
* Add support for VPN connection IPSec policies
* Fix bug with `vpn-connection create` when using the `--no-wait` or `--validate` parameters
* Add support for active-active VNet gateways
* Remove nulls values from output of `network vpn-connection list/show` commands
* BC: Fix bug in the output of `vpn-connection create`
* Fix bug where '--key-length' argument of 'vpn-connection create' was not parsed correctly
* Fix bug in `dns zone import` where records were not imported correctly
* Fix bug where `traffic-manager endpoint update` did not work
* Add 'network watcher' preview commands

### Profile

* Support login when there are no subscriptions found ([#2560](https://github.com/Azure/azure-cli/issues/2560))
* Support short param name in az account set --subscription ([#2980](https://github.com/Azure/azure-cli/issues/2980))

### Redis

* Adding update command which also adds the ability to scale for redis cache
* Deprecates the 'update-settings' command

### Resource

* Add managedapp and managedapp definition commands ([#2985](https://github.com/Azure/azure-cli/issues/2985))
* Support 'provider operation' commands ([#2908](https://github.com/Azure/azure-cli/issues/2908))
* Support generic resource create ([#2606](https://github.com/Azure/azure-cli/issues/2606))
* Fix resource parsing and api version lookup. ([#2781](https://github.com/Azure/azure-cli/issues/2781))
* Add docs for az lock update. ([#2702](https://github.com/Azure/azure-cli/issues/2702))
* Error out if you try to list resources for a group that doesn't exist. ([#2769](https://github.com/Azure/azure-cli/issues/2769))
* [Compute] Fix issues with VMSS and VM availability set update. ([#2773](https://github.com/Azure/azure-cli/issues/2773))
* Fix lock create and delete if parent-resource-path is None ([#2742](https://github.com/Azure/azure-cli/issues/2742))

### Role

* create-for-rbac: ensure SP's end date will not exceed certificate's expiration date ([#2989](https://github.com/Azure/azure-cli/issues/2989))
* RBAC: add full support for 'ad group' ([#2016](https://github.com/Azure/azure-cli/issues/2016))
* role: fix issues on role definition update ([#2745](https://github.com/Azure/azure-cli/issues/2745))
* create-for-rbac: ensure user provided password is picked up

### SQL

* Added az sql server list-usages and az sql db list-usages commands
* SQL - ability to connect directly to resource provider ([#2832](https://github.com/Azure/azure-cli/issues/2832))

### Storage

* Default location to resource group location for `storage account create`
* Add support for incremental blob copy
* Add support for large block blob upload
* Change block size to 100MB when file to upload is larger than 200GB

### VM

* avail-set: make UD&FD domain counts optional

  note: VM commands in sovereign clouds
  Please avoid managed disk related features, including the following:
  1. az disk/snapshot/image
  2. az vm/vmss disk
  3. Inside "az vm/vmss create", use "—use-unmanaged-disk" to avoid managed disk
  Other commands should work
* vm/vmss: improve the warning text when generates ssh key pairs
* vm/vmss: support create from a market place image which requires plan info ([#1209](https://github.com/Azure/azure-cli/issues/1209))


## April 3, 2017

Version 2.0.2

We released the ACR, Batch, KeyVault, and SQL components in this release

```text
azure-cli (2.0.2)

acr (2.0.0)
acs (2.0.2)
appservice (0.1.2)
batch (2.0.0)
cloud (2.0.0)
component (2.0.0)
configure (2.0.2)
container (0.1.2)
core (2.0.2)
documentdb (0.1.2)
feedback (2.0.0)
find (0.0.1b1)
iot (0.1.2)
keyvault (2.0.0)
lab (0.0.1)
monitor (0.0.1)
network (2.0.2)
nspkg (2.0.0)
profile (2.0.2)
redis (0.1.1b3)
resource (2.0.2)
role (2.0.1)
sql (2.0.0)
storage (2.0.2)
vm (2.0.2)
```

### Core

* Add acr, lab, monitor, and find modules to default list
* Login: skip erroneous tenant ([#2634](https://github.com/Azure/azure-cli/pull/2634))
* login: set default subscription to one with the state of "Enabled" ([#2575](https://github.com/Azure/azure-cli/pull/2575))
* Add wait commands and --no-wait support to more commands ([#2524](https://github.com/Azure/azure-cli/pull/2524))
* core: support login using service principal with a cert ([#2457](https://github.com/Azure/azure-cli/pull/2457))
* Add prompting for missing template parameters. ([#2364](https://github.com/Azure/azure-cli/pull/2364))
* Support setting default values for common arguments like default resource group, default web, default vm
* Support login to specific tenant

### ACS

* [ACS] Adding support for configuring a default ACS cluster ([#2554](https://github.com/Azure/azure-cli/pull/2554))
* Add support for ssh key password prompting. ([#2044](https://github.com/Azure/azure-cli/pull/2044))
* Add support for windows clusters. ([#2211](https://github.com/Azure/azure-cli/pull/2211))
* Switch from Owner to Contributor role. ([#2321](https://github.com/Azure/azure-cli/pull/2321))

### AppService

* appservice: support to get external ip address used for DNS A records ([#2627](https://github.com/Azure/azure-cli/pull/2627))
* appservice: support binding wildcard certificates ([#2625](https://github.com/Azure/azure-cli/pull/2625))
* appservice: support list publishing profiles ([#2504](https://github.com/Azure/azure-cli/pull/2504))
* AppService - Trigger source control sync after config ([#2326](https://github.com/Azure/azure-cli/pull/2326))

### DataLake

* Initial release of Data Lake Analytics module
* Initial release of Data Lake Store module

### DocuemntDB

* DocumentDB: Adding support for listing connection strings ([#2580](https://github.com/Azure/azure-cli/pull/2580))

### VM

* [Compute] Add AppGateway support to virtual machine scale set create ([#2570](https://github.com/Azure/azure-cli/pull/2570))
* [VM/VMSS] Improved disk caching support ([#2522](https://github.com/Azure/azure-cli/pull/2522))
* VM/VMSS: incorporate credentials validation logic used by portal ([#2537](https://github.com/Azure/azure-cli/pull/2537))
* Add wait commands and --no-wait support ([#2524](https://github.com/Azure/azure-cli/pull/2524))
* Virtual machine scale set: support * to list instance view across vms ([#2467](https://github.com/Azure/azure-cli/pull/2467))
* Add --secrets for VM and virtual machine scale set ([#2212}(<https://github.com/Azure/azure-cli/pull/2212>))
* Allow VM creation with specialized VHD ([#2256](https://github.com/Azure/azure-cli/pull/2256))

## February 27, 2017

Version 2.0.0

This release of Azure CLI 2.0 is the first "Generally Available" release
General availability applies to these command modules:
- Container Service (acs)
- Compute (including Resource Manager, VM, virtual machine scale sets, Managed Disks)
- Networking
- Storage

These command modules can be used in production and are supported by standard Microsoft SLA
You can open issues directly with Microsoft support or on our [github issues list](https://github.com/azure/azure-cli/issues/)
You can ask questions on [StackOverflow using the azure-cli tag](http://stackoverflow.com/questions/tagged/azure-cli),
or contact the product team at [azfeedback@microsoft.com](mailto:azfeedback@microsoft.com)
You can provide feedback from the command line with the `az feedback` command

The commands in these modules are stable and the syntax is not expected to change in upcoming releases of this version of Azure CLI

To verify the version of the CLI, use `az --version`
The output lists the version of the CLI itself (2.0.0 in this release), the individual command modules,
and the versions of Python and GCC that you're using

```text
azure-cli (2.0.0)

acs (2.0.0)
appservice (0.1.1b5)
batch (0.1.1b4)
cloud (2.0.0)
component (2.0.0)
configure (2.0.0)
container (0.1.1b4)
core (2.0.0)
documentdb (0.1.1b2)
feedback (2.0.0)
iot (0.1.1b3)
keyvault (0.1.1b5)
network (2.0.0)
nspkg (2.0.0)
profile (2.0.0)
redis (0.1.1b3)
resource (2.0.0)
role (2.0.0)
sql (0.1.1b5)
storage (2.0.0)
vm (2.0.0)

Python (Darwin) 2.7.10 (default, Jul 30 2016, 19:40:32)
[GCC 4.2.1 Compatible Apple LLVM 8.0.0 (clang-800.0.34)]
```

> [!Note]
> Some of the command modules have a "b*n*" or "rc*n*" postfix
> These command modules are still in preview and will become generally available in the future

We also have nightly preview builds of the CLI
For information, see these instructions on [getting the nightly builds](https://github.com/Azure/azure-cli#nightly-builds),
and these instructions on [developer setup and contributing code](https://github.com/Azure/azure-cli#developer-setup)

You can report issues with nightly preview builds in the following ways:
- Report issues in our [github issues list](https://github.com/azure/azure-cli/issues/)
- Contact the product team at [azfeedback@microsoft.com](mailto:azfeedback@microsoft.com)
- Provide feedback from the command line with the `az feedback` command

