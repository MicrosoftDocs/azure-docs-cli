---
title: Azure CLI 2.0 release notes
description: Learn about the latest updates to Azure CLI 2.0
author: sptramer
ms.author: sttramer
manager: carmonm
ms.date: 07/03/2018
ms.topic: article
ms.prod: azure
ms.technology: azure-cli
ms.devlang: azure-cli
---

# Azure CLI 2.0 release notes

## July 17, 2018

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

### KeyVault

* Added commands for managing storage accounts and sas-definitions
* Added commands for `network-rules`
* Added id parameter to secret, key, and certificate operations

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
* Add --secrets for VM and virtual machine scale set ([#2212}(https://github.com/Azure/azure-cli/pull/2212))
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

