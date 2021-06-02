---
title: Azure CLI release notes
description: Learn about the latest updates to Azure CLI
author: dbradish-microsoft
ms.author: dbradish
manager: barbkess
ms.date: 06/02/2021
ms.topic: article
ms.service: azure-cli
ms.devlang: azurecli
ms.custom: devx-track-azurecli
---

# Azure CLI release notes

# [Current release notes](#tab/azure-cli)

## June 02, 2021

Version 2.24.2

### Container

* Hotfix: Fix #18276: `az container create` fails with `AttributeError: 'ResourcesOperations' object has no attribute 'create_or_update'`

## June 01, 2021

Version 2.24.1

### App Service

* Hotfix: Fix #18266 - webapp config appsettings set command causing all values to default to "false"

### ARM
* Hotfix: Fix deserialization issue in the What-If formatter of ARM template

### Compute
* Hotfix: Fix the bad request issue when creating VMSS in Azure Stack

### IoT
* Hotfix: Fix issue for removing last user-assigned identity from IoT Hub

## May 25, 2021

Version 2.24.0

### AKS

* `az aks check-acr`: Add the nodeslector linux to avoid the "canipull" pod to be scheduled on the windows node
* Sdk update
* az aks create and update azure-rbac
* Add run-command cli

### App Config

* Allow importing key-values with unicode characters from file

### App Service

* [BREAKING CHANGE] `az webapp list-runtimes`: Add Dotnet6 support and update runtimes
* `webapp log tail`: Fix #17987: logging.warning call with invalid 'end' argument
* Fix #16838- az cli update app setting command always making slotsetting to true
* `az appservice`: Add function to retrieve users github personal access token
* az staticwebapp appsettings set issue #17792
* Fix #18033: az staticwebapp appsettings set of missing positional param app_settings
* Fix issues with APIs signature that changed with Track2 update
* Fix get resource management client properly
* Add interactive way to get token for staticwebapp
* Fix an issue where assign and remove identities would fail with a call to NoneType

### ARM

* Migrate resource to track2 SDK
* `az ts`: Add UiFormDefinition file support to TemplateSpecs for GA (05/04)

### ARO

* Add cluster credential rotation

### Compute

* `az sshkey create`: Save private key to local file system

### Cosmos DB

* Create and manage Role Definitions and Role Assignments for enforcing data plane RBAC on Cosmos DB SQL accounts

### DevTestLabs

* `az labs create environment`: Fix error creating an environment from an ARM template

### HDInsight

* [BREAKING CHANGE] `az hdinsight create`: Use getting default sku api to set workernode and headnode size if customer does not provide.

### IoT

* `az iot hub create`: Support assigning identities and assigning roles to system-managed identity.
* `az iot hub update`: New parameter `--file-upload-storage-identity` to allow for managed-identity authenticated file upload.
* `az iot hub identity assign`: New command to assign user/system-assigned managed identities to an IoT Hub.
* `az iot hub identity show`: New command to show identity property of an IoT Hub.
* `az iot hub identity show`: New command to update identity type of an IoT Hub.
* `az iot hub identity remove`: New command to remove user/system-assigned managed identities from an IoT Hub.
* `az iot hub routing-endpoint create`: New `--identity` parameter allows choosing a user/system-assigned identity for routing endpoints.
* `az iot hub route create`: New routing source-type `DeviceConnectionStateEvents`

### Kusto

* Update command group long summary

### Network

* Bump api version from '2020-11-01' to '2021-02-01'
* New command group `az network lb address-pool tunnel-interface`
* `az network lb frontend-ip update`: New parameter `--gateway-lb`
* `az network nic ip-config update`: New parameter `--gateway-lb`
* `az network rule create/update`: New parameter `--backend-pools-name`
* `az network vnet-gateway create`: Add new paramter `--nat-rule`
* Add new cmd group `az network vnet-gateway nat-rule`
* `az network vpn-conncetion create`: Add new paramter `--ingress-nat-rule` and `--egress-nat-rule`
* `az network vnet create`: Add new parameter `--flowtimeout`

### Packaging

* Support Python 3.9

### RDBMS

* Change IOPS logic for MySQL
* Prevent private DNS zone track2 migration breaking rdbms module

### Service Fabric

* [BREAKING CHANGE] `az sf cluster certificate`: Remove all commands under this group. Please follow the instructions here to add/remove cluster certificates: https://docs.microsoft.com/en-us/azure/service-fabric/service-fabric-cluster-security-update-certs-azure#add-a-secondary-certificate-using-azure-resource-manager.
* [BREAKING CHANGE] `az sf managed-service update`: Remove deprecated parameter --drop-source-replica-on-move.
* [BREAKING CHANGE] `az sf managed-service create`: Remove deprecated parameters --service-dns-name, --drop-source-replica-on-move and -instance-close-delay-duration.
* [BREAKING CHANGE] `az sf cluster`: Rename parameter --vault-resource-group to --vault-rg.
* `az sf managed-cluster and sf managed-node-type`: Set groups as not preview
* Update azure-mgmt-servicefabricmanagedclusters package to the latest version 1.0.0 that uses 2021-05-01 GA api version.
* `az sf managed-cluster create`: Add parameters --upgrade-mode, --upgrade-cadence and --code-version.
* `az sf managed-node-type`: Add parameters --data-disk-type, --is-stateless and --multiple-placement-groups.

### SQL

* `az sql server create`: Add a space to split the concatenated words in the help message of the argument --assign-identity.
* `az sql server update`: Add a space to split the concatenated words in the help message of the argument --assign_identity.

### Storage

* [BREAKING CHANGE] `az storage share-rm delete`: Raise error when there are snapshots for target file share and add `--include` to specify deleting target file share and its snapshots
* `az storage blob generate-sas`: Add spaces to split the concatenated words in the help message of the arguments --cache-control, --content-disposition, --content-encoding, --content-language and --content-type.
* `az storage blob url`: Add a space to split the concatenated words in the help message of the argument --snapshot.
* `az storage container generate-sas`: Add spaces to split the concatenated words in the help message of the arguments --cache-control, --content-disposition, --content-encoding, --content-language and --content-type.
* Upgrade storage API version to 2021-04-01
* Support default share permission
* Support cross tenant object replication
* GA blob inventory
* `az storage share-rm list`: Support list with snapshots.

## May 06, 2021

Version 2.23.0

### ACR

* `az acr check-health`: Add support to verify dns routings to private endpoints
* Fix #17618: Update credential add/update handling for tasks created using --auth-mode

### AKS

* `az aks update`: Add `--windows-admin-password` to support updating Windows password
* `az aks update`: Support updating from SPN cluster to MSI cluster.
* `az aks create`: Add `--enable-encryption-at-host` parameter

### App Service

* [BREAKING CHANGE] Update websites SDK to the latest version (azure-mgmt-web==2.0.0) & Adopt track2 SDK
* [BREAKING CHANGE] Rename `az staticwebapp browse` to `az staticwebapp show`
* Add option of sku for `az staticwebapp create --sku`
* Add command `az staticwebapp update`
* `az webapp/functionapp config access-restriction add/remove`: Support for Service Tag, Http headers and multi-source rules.

### ARM

* `az bicep`: Replace datetime APIs that are not available in Python 3.6
* `az deployment group create`: Fix the compatibility issue of api-version for parameter `--template-specs`

### Backup

* `az backup vault create`: Add tags as an optional argument
* Make AFS configure backup flow idempotent

### CDN

* `az cdn endpoint rule add`: Fix delivery rule creation for non-Microsoft SKU

### Compute

* Extended location for Compute RP
* `az sig image-version create`: Support creating from a VHD
* `az vm create --count`: Support vnet and subnet configuration
* `az vmss extension upgrade`: Fix a bug
* Add error message for `vm identity assign`
* Zone-redundant storage (ZRS) managed disks
* `az disk create`: Trusted launch
* `az disk create`: Hibernation
* Fix a compatibility issue of old API version
* `az sig image version create`: Support data disk VHDs

### Feedback

* Do not minify feedback issue body

### FunctionApp

* Fix issue with zip deploy where local time was provided but UTC was expected
* Update stacks api json to add PowerShell on Linux in Functions

### HDInsight

* Add Incoming BREAKING CHANGE for removing default value of `--workernode-size` and  `--headnode-size`

### Key Vault

* [BREAKING CHANGE] Support soft-delete feature for managed-HSM. `keyvault delete --hsm-name` will perform soft delete on a MHSM.

### Marketplace Ordering

* New command group `az term` to accept/show terms

### Misc.

* Define theme for Cloud Shell

### Monitor

* New command `az monitor metrics list-namespaces`

### Network

* [BREAKING CHANGE] az network dns record-set a show: Property `arecords` in output will be changed to `aRecords`.
* New command `az network express-route list-route-tables-summary`.
* New command `az network express-route peering get-stats`.
* New command `az network express-route peering connection list`.
* `az network lb create`: Add new parameter `--edge-zone`
* `az network nic create`: Add new parameter `--edge-zone`
* `az network private-endpoint create`: Add new parameter `--edge-zone`
* `az network private-link-service create`: Add new parameter `--edge-zone`
* `az network public-ip create`: Add new parameter `--edge-zone`
* `az network public-ip prefix create`: Add new parameter `--edge-zone`
* `az network vnet create`: Add new parameter `--edge-zone`
* New Command `az network lb list-nic`
* `az network application-gateway show-backend-health`: support probe operation arguments.
* `az network vpn-connection list`: support parameter `--vnet-gateway`.
* New command `az network vnet-gateway disconnect-vpn-connections`.
* New command `az network vnet-gateway vpn-client show-health`.
* New command `az network vnet-gateway vpn-client ipsec-policy show`.
* New command `az network vnet-gateway vpn-client ipsec-policy set`.
* New command `az network vnet-gateway packet-capture start`.
* New command `az network vnet-gateway packet-capture stop`.
* New command `az network vnet-gateway show-supported-devices`.
* New command `az network vpn-connection list-ike-sas`.
* New command `az network vpn-connection packet-capture start`.
* New command `az network vpn-connection packet-capture stop`.
* New command `az network vpn-connection show-device-config-script`.
* `az network private-link-resource list`: support more providers for `--type`

### Packaging

* Bump python to `3.8.9` in docker image
* Bump bundled python to `3.8.9` in MSI.

### RDBMS
* [BREAKING CHANGE] `az mysql flexible-server create`: `--storage-size` default value is changed from 10 to 32.
* `az postgres flexible-server create`: Add `--private-dns-zone` parameter for creating server with private access.

### Role

* `az role assignment create/update`: Auto complete `assignee_principal_type`

### SQL

* `az sql db create`: Add --ha-replicas argument
* `az sql db replica create`: Add --ha-replicas argument
* Allow short mw policy names for mi

### SQL VM

* Make SqlServerLicenseType as optional

### Storage

* Fix #16272 & #16853: Refine error message
* `az storage account create`: Add edge zone support
* Support user assigned identity for storage account
* `az storage account create/update`: Support sas&key policy

### Synapse

* `az synapse notebook create`: Create a notebook

## April 19, 2021

Version 2.22.1

### ARM

* Hotfix: Fix the issue that bicep build broken in Python 3.6

### Key Vault

* Hotfix: GA for managed-HSM ralated commands and parameters

## April 13, 2021

Version 2.22.0

### ACR

* [BREAKING CHANGE] `az acr connected-registry install info`: Replace keys ACR_REGISTRY_NAME, ACR_SYNC_TOKEN_NAME, ACR_SYNC_TOKEN_PASSWORD, ACR_PARENT_GATEWAY_ENDPOINT, and ACR_PARENT_PROTOCOL with a new connected string key, ACR_REGISTRY_CONNECTION_STRING.
* [BREAKING CHANGE] `az acr connected-registry install renew-credentials`: Replace keys ACR_REGISTRY_NAME, ACR_SYNC_TOKEN_NAME, ACR_SYNC_TOKEN_PASSWORD, ACR_PARENT_GATEWAY_ENDPOINT, and ACR_PARENT_PROTOCOL with a new connected string key, ACR_REGISTRY_CONNECTION_STRING.
* `az acr connected-registry create`: Verify before the creation of the token and sync scope map that all ancestors are active.
* `az acr connected-registry create`: Add the repository and gateway permissions required for creation to all the ancestors of the new connected registry if needed prior to the connected registry creation.
* `az acr connected-registry delete`: Remove the gateway permissions of the deleted resources from all its ancestors' sync scope maps.
* `az acr connected-registry repo`: New command to add repository permissions to a connected registry and all its ancestors' sync scope maps, and remove repository permissions from the connected registry and all its descendants' sync scope maps

### AKS

* `az aks create`: Add support for `--private-dns-zone` and `--fqdn-subdomain` feature

### App Config

* Configure max line width for YAML parser to stop wrapping output
* Fix bug in print preview of restore command

### App Service

* Fix #17219: Fix ssl bind bug
* Remove preview flag for Python 3.9 in create function app command
* Bugfix: Handle if only single publish profile is returned
* Fix #16203: az webapp log tail supports webapps running on Linix.

### ARM

* [BREAKING CHANGE] `az bicep build`: Change the parameter `--files` to `--file`
* [BREAKING CHANGE] `az bicep decompile`: Change the parameter `--files` to `--file`
* Fix #17379: bicep auto install results in invalid json output from deployment
* `az bicep build`: Add a parameter `--outdir` for specifying the output directory
* `az bicep build`: Add a parameter `--outfile` for specifying the output file path
* Fix an issue where checking version upgrade for Bicep CLI throws exception if GitHub API rate limit is hit
* `az policy exemption`: Add new commands to support policy exemption

### Backup

* Fix #14776: Fix `--force` parameter functionality for `az backup vault delete` command
* Fix on demand backup
* `az backup protectable-item list`: Add optional parameter `--backup-management-type`
* Fix policy create with rgNamePrefix and rgNameSuffix
* `az backup protectable-item list`: Add `--server-name` as an optional argument

### Compute

* `az ssh vm`: Support VM SSH with Service Principal
* Add VMSS Rolling Upgrade opt
* New command: `vm install-patches`
* Disk encryption set: Add `--enable-auto-key-rotation`

### Container

* Fix #16499: `az container create`: Fix handling of return value from network_profiles.create_or_update

### Cosmos DB

* Support for managed service identity & default identity

### EventGrid

* `az eventgrid system-topic create/update`: Add MSI Support
* `az eventgrid [partner topic | system-topic] event-subscription`: Add support for StorageQueueMessageTTL, AdvancedFilters, EnableAdvancedFilteringOnArrays
* `az eventgrid [partner topic | system-topic] event-subscription`: Add support for delivery attribute
* `az eventgrid topic create`: Add support for creating topic for azure or azurearc

### Interactive

* Fix #16931: Fix `KeyError` in `az interactive --update`

### NetAppFiles

* `az netappfiles account ad add`: Optional parameter added named allow-local-ldap-users
* `az netappfiles volume create`: Optional parameter added named ldap-enabled
* `az netappfiles volume backup status show`: Operation added
* Update backup tests

### Network

* `az network vnet-gateway`: `--vpn-auth-type` allow multi value

### Packaging

* [BREAKING CHANGE] RPM installed az now uses `python3` instead of hard-coded `/usr/bin/python3`.

### RDBMS

* Allow DB server private access from different subscription
* Modify server create with private network, fix restore time bug

### Search

* `az search service create`: Add async (--no-wait) options.
* `az search service update`: Add async (--no-wait) options.
* `az search shared-private-link-resource create`: Add async (--no-wait) options.
* `az search shared-private-link-resource update`: Add async (--no-wait) options.

### Service Fabric

* Add managed application cli commands

### Storage

* `az storage fs directory upload/download`: Support adls gen2 file system directory upload&download
* `az storage fs file list`: Support --show-next-marker
* `az storage share-rm`: Support create/show/delete snapshots

### Synapse

* [BREAKING CHANGE] `az synapse role assignment create`: Role names at old version are not allowed, Sql Admin, Apache Spark Admin, Workspace Admin
* [BREAKING CHANGE] `az synapse role assignment create`: When --assignee argument can't  uniquely determine the principal object, the command will raise error instead of adding a role assignment for the uncertain principal object.
* `az synapse role scope list`:  List all scopes synapse supports.
* `az synapse role assignment create/list/delete`: Add --scope/--item-type/--item arguments to support manage role assignments based on scope.
* `az synapse role assignment create/list/delete`: Add --assignee-object-id argument, it will bypass Graph API and uniquely determine principal object instead of deducing principal object using --assignee argument.

## March 23, 2021

Version 2.21.0

### ACR

* Output a trace in `az acr login` for self-diagnosing potential docker command latency
* Fix #17172: When run check-health behind corporate proxy
* `acr update`: Support anonymous pull
* Fix #16700: Use "exists" api to check storage blob existence

### AKS

* `aks update`: Add `--no-uptime-sla`
* Fix cross-sub assigning identity error and attach acr error
* Add support for node public IP prefix ID

### APIM

* [BREAKING CHANGE] `apim backup`: `--storage-account-container` not support multi-value.
* [BREAKING CHANGE] `apim restore`: `--storage-account-container` not support multi-value.

### App Service

* [BREAKING CHANGE] Fix #16087: `az webapp config ssl create`: set `--name` parameter as required.
* Fix #17053: `az webapp show` return null values for SiteConfig properties
* Fix #17207: `az webapp log config`: 'level' always defaults to verbose

### ARM

* `az bicep build`: fix an issue where build warnings are not shown

### Backup

* Add `id_part` for sub-resource names to fix `--ids`
* Fix #17094: Created separate test suite for CRR tests
* `az backup protection check-vm`: Add `--vm` and `--resource-group` as optional params

### Cache

* GA `az cache`

### CDN

* `az afd rule create`: Fix `--help` message

### Compute

* Fix a Windows vm user update bug
* Fix #16585: `az vmss deallocate`: `--instance-ids` failed
* `az vm create`: New parameter `--platform-fault-domain` in FLEX VMSS mode
* `az vm create`: `--patch-mode` for Linux VM
* `az ssh vm`: Automatically launch browser when getting certificate fails
* `az vm create`: New parameter `--count`
* `az vm create`: Trusted Launch
* Fix #16037: az vm open-port accepts list of ports

### Extension

* Add actionable message when an extension is not compatible with the CLI core

### Key Vault

* `az keyvault role definition list`: Support `--custom-role-only` to list only custom role definitions
* Support keyvault custom role definition
* Add `--no-wait` for command `az keyvault security-domain download` and `--target-operation` for command `az keyvault security-domain wait`

### NetAppFiles

* `az netappfiles account backup show`: Operation added.
* `az netappfiles account backup delete`: Operation added.
* `az netappfiles account ad add`: Parameter `--ldap-over-tls` added.
* `az netappfiles account create`: Parameter `--encryption` added.
* `az netappfiles account update`: Parameter `--encryption` added.
* `az netappfiles volume create`: Parameter `--encryption-key-source` added.
* `az netappfiles volume create`: Default export policy removed for nfsv4.1 and optional parameters added for setting up an export policy for nfsv4.1: rule_index, unix_read_only, unix_read_write, cifs, allowed_clients

### Network

* `az network public-ip prefix create`: Support `--zone 1 2 3`
* `az network lb frontend-ip create`: Support `--zone 1 2 3`
* Bump version from '2020-08-01' to '2020-11-01'
* `az network lb address-pool`: Support subnet when creating or updating an IP-based backend pool of a load balancer.

### RDBMS

* Added tests for flexible server team pipeline
* Python SDK migration
* Added PostgreSQL database create, show, and delete feature
* Updating Python SDK to 8.1.0b2

### Role

* `az ad app permission list/grant`: Refine error message when no associated Service Principal exists for the App

### Search

* `az search`: GA

### Service Fabric

* `az sf certificate`: deprecate cluster cert commands.

### SQL

* Add Server Trust Group commands

### Storage

* Fix #16917: `az storage account generate-sas` fails if a connection string is provided
* Fix #16979: `az storage container create` fails when providing storage container metadata

### Upgrade

* Fix #16952: Fix ImportError after upgrade

### Misc.

* Allow configuring theme

## March 02, 2021

Version 2.20.0

### AKS

* Add support for SGX addon 'confcom'

### AMS

* Update module to use 2020 Azure Media Services api.
* `az ams account encryption`: New subgroup to show or set the encryption for the media service account
* `az ams account storage set-authentication`: New command to set the authentication for the storage account associated with the media service account
* `az ams account create (mi-system-assigned)`: New --mi-system-assigned parameter for account create to set the managed identity of the media account
* `az ams account mru set`: This command will no longer work for Media Services accounts that are created with the 2020-05-01 version of the API or later.
* `az ams live-event create (stretch-mode, key-frame-interval, transcrip-lang, use-static-hostname, custom hostname)`: Add new parameter options to live-event create command
* `az ams live-event standby`: New command to put the live event in standby mode
* `az ams transform create (videoanalysismode, audioanalysis mode)`: New parameter options for transform create

### App Service

* `az webapp config ssl bind`: handle if webapp and appservice plan in different rg. Also reference text updates
* Fix #8743: az webapp deploy
* Bugfix: Add generateRandomAppNames.json to setup
* `az functionapp create`: Add preview support for creating dotnet-isolated apps.
* Fix #12150: Support for subnet ID in vnet-integration add
* `az functionapp create`: Remove preview flag from Node.js 14.

### ARM

* `az deployment group/sub/mg/tenant validate/create/what-if`: Add support for Bicep files
* `az bicep install`: New command for installing Bicep CLI
* `az bicep upgrade`: New command for upgrading Bicep CLI
* `az bicep build`: New command for building Bicep files
* `az bicep version`: New command for showing the current installed version of Bicep CLI
* `az bicep list-versions`: New command for showing the available Bicep CLI versions
* `az managedapp definition update`: Add new command for updating managedapp definition

### Backup

* `az backup recoverypoint show-log-chain`: Add start/end time in show-log-chain table output
* BugFix: Enable Alternate Location Restore for SQL/SAPHANA protected items

### CDN

* Add cli support for AFD SKU

### Compute

* `az vm (extension) image list`: Make it more robust
* `az vmss create`: Fix a license type issue
* Upgrade API version to 2020-12-01
* `az vm create`: add `--enable-hotpatching`

### Cosmos DB

* Upgrade to version 3.0.0 and add support for NetworkAclBypass + Update Mongo ServerVersion + backup policy

### Extension

* Support config of extension index url

### IoT Central

* `az iot central app`: Address several S360 fixes
* `az iot central app update`: Remove the need of checking etag when updating the existing iotc app.
* Change the resourceType (IotApps) to be in camel case.

### Key Vault

* [BREAKING CHANGE] `az keyvault role assignment/definition list`: `roleDefinitionName` should be `roleName` in command output
* [BREAKING CHANGE] `id` changes to be `jobId`, `azureStorageBlobContainerUri` changes to be `folderUrl` in command output of `az keyvault backup/restore`, `az keyvault key restore`

### Network

* Bump version from '2020-07-01' to '2020-08-01'
* `az network public-ip create`: Support '--zone 1 2 3' after '2020-08-01'
* `az network routeserver peering`: Rename `--vrouter-name` by `--routeserver`
* `az network express-route peering create`: Support ipv6 address
* `az network public-ip create`: Expose a new argument `--tier`

### OpenShift

* Update of az openshift deprecation warning

### Search

* `az search`: Fix the `--identity-type` helper's guide.

### SQL

* Update az sql mi examples
* `az sql db/elastic-pool create/update`: Add maintenance-configuration argument
* `az sql db replica create`: Add --secondary-type argument

### Storage

* [BREAKING CHANGE] `az storage account file-service-properties`: Default to enable delete retention policy with retention days 7 in server side
* Fix #16872: az storage blob now (2.19) requires login even if connection-string is provided
* Fix #16959: az storage copy crashes: ValidationError: local variable 'service' referenced before assignment
* Fix #14054: 'NoneType' object has no attribute '__name__'
* Fix #16679: `az storage blob download` fails with "Permission denied" if the destination file is a directory
* Upgrade storage api version to 2021-01-01
* Support version in Lifecyle management policy
* Support storage account shared key access management
* `az storage account network-rule`: GA resource access rules
* Support double encryption for encryption scope
* `az storage account blob-service-properties update`: Support --change-feed-retention-days
* Support rewrite existing blob

## February 10, 2021

Version 2.19.1

### Key Vault

* Hotfix: Dependency package `azure-keyvault-administration` is pinned to 4.0.0b1

## February 09, 2021

Version 2.19.0

### ACR

* `az acr connected-registry install info`: Add new key `ACR_SYNC_TOKEN_NAME` with the same value as `ACR_SYNC_TOKEN_USERNAME`. A warning that the latter will be deprecated is displayed.
* `az acr connected-registry install renew-credentials`: Add new key `ACR_SYNC_TOKEN_NAME` with the same value as `ACR_SYNC_TOKEN_USERNAME`. A warning that the latter will be deprecated is displayed.

### AKS

* Add managed cluster stop/start bindings
* `az aks check-acr`: Fix Kubernetes version check

### APIM

* GA the command group

### App Config

* [BREAKING CHANGE] `az appconfig feature filter add`: Support adding JSON objects as feature filter parameter values

### App Service

* `az appservice ase/plan`: Support ASEv3
* Fix #16026 and #16118 for az appservice plan
* Fix #16509: Add support for os-preference
* Improve behavior of appservice ase create-inbound-services to allow skipping DNS services and support DNS for ASEv2
* `az webapp up/az webapp create`: Fix nonetype errors
* `az webapp up/create`: better error handling of app name with period
* Fix #16681: `az webapp config ssl import`: Fix bug that causes failures on national clouds

### ARM

* `az provider register`: Support registering management group

### Backup

* Add CRR functionality for IaaSVM and other CRR commands
* `az backup protectable-item list`: Add protectable-item-type as an optional argument

### BotService

* `az bot create/update`: Add Encryption features `--cmk-key-url` and `--encryption-off`
* `az bot update`: Rename Encryption-OFF arg to CMK-OFF and updating api version

### Compute

* [BREAKING CHANGE] vmss create: Rename orchestration mode values
* New command group sshkey. Allow referencing a SSH key resource when creating a VM
* `az disk create/update`: Add parameter `--enable-bursting` to support disk bursting

### Extension

* Support extension command prefix match for dynamic install

### HDInsight

* `az hdinsight create`: Add a new parameter `--enable-compute-isolation` to support create cluster with compute isolation feature.

### Key Vault

* `az keyvault key import`: Support `--curve` parameter for importing BYOK keys
* `az keyvault certificate download`: Fix deprecated/removed method call
* `az keyvault create/update`: Remove preview tag for `--enable-rbac-authorization`

### Monitor

* `az monitor metrics alert create`: Fix 'resource is not found' error

### NetAppFiles

* `az netappfiles account ad add`: Add parameter `--security-operators`.
* `az netappfiles volume create`: Add parameter `--smb-continuously-available`.
* `az netappfiles volume create`: Add parameter `--smb-encryption`.
* `az netappfiles`: No longer in preview mode.

### Network

* [BREAKING CHANGE] `az network vrouter`: Depracate this command group, please use `az network routeserver`.
* `az network routeserver`: Add new command group.
* `az network application-gateway create`: Add parameter `--ssl-profile-id`
* `az network application-gateway client-cert`: Manage trusted client certificate of application gateway
* `az network application-gateway ssl-profile`: Manage ssl profiles of application gateway
* Add support for private endpoint connections to DigitalTwins

### Profile

* `az login`: Launch browser in WSL 2

### RDBMS

* `az mysql flexible-server create --iops`: Allow user to choose IOPS for their SKU.
* Update Postgres restore command to support available zone

### Search

* Upgrade to use the latest (8.0.0) azure-mgmt-search python sdk
* `az search create`: Add support for search service creation with IP rules, public endpoint access and/or msi
* `az search update`: Add support for search service update with IP rules, public endpoint access and/or msi
* `az search private-endpoint-connection`: Manage private endpoint connection to a search service
* `az search shared-private-link-resource`: Manage shared private link resources in a search service
* `az search private-link-resource`: List available private link resources in a search service

### Security

* Add new commands for `az security`

### SQL

* Add managed hsm regex match to SQL
* Upgrade azure-mgmt-sql to 0.26.0
* `az sql mi create/update`: Add support for maintenance configuration in managed instance operations
* Support SQL server DevOps audit policy commands

### Storage

* Fix #16079: public blob gives error
* GA Storage routing reference
* Fix #9158: Cannot generate a working SAS key from a policy
* Fix #16489: Upgrade azcopy to 10.8.0
* `az storage account blob-service-properties`: Support default service version
* Fix #16519: azcopy is given more powerful SAS than needed (has write, only needs read)

### Synapse

* `az synapse workspace create `: Add parameter `--key-identifier` to support to create workspace using customer-managed key.
* `az synapse workspace key`: Add CRUD cmdlets to support to manage keys under specified synapse workspace.
* `az synapse workspace managed-identity`: Add cmdlets to support CRUD managed identity to sql access setting.
* `az synapse workspace`: Add data exfiltration protection support, add parameter `--allowed-tenant-ids`.

## January 19, 2021

Version 2.18.0

### ACR

* `az acr create / update`: Add `--allow-trusted-services`. This parameter determines whether trusted azure services are allowed to access network restricted registries. The default is to allow.

### AKS

* `az aks check-acr`: Add new check-acr command

### App Service

* Fix #13907: `az webapp config ssl import`: Change command to also import App Service Certificate
* Fix #16125: `az webapp ssh`: If using a windows client, open browser to scm link
* Fix #13291: `az webapp deployment slot swap`: The command should support preserve vnet.
* [BREAKING CHANGE] Fix regression where you can't use a runtime version with a space in the name

### ARM

* `az deployment` : Add support for `--query-string`
* `az ts`: Error handling improvement for `--template-file` without `--version` prohibited

### Backup

* `az backup protection backup-now`: Set default retention period to 30 days

### Compute

* Fix issue of none storage_profile
* Better error handling of external tokens
* Fix a vmss reimage issue
* `az vm/vmss extension set`: New parameter `--enable-auto-upgrade`

### Container

* `az container exec`: Remove eol check to avoid closing terminal before it even started on linux

### DMS

* `az dms project task create`: Added task type parameter to help distinguish if a scenario is an online migration or an offline migration.
* `az dms project task cutover`: Add new command which allows tasks with an online migration task type to cutover and end the migration.
* `az dms project create/az dms project task create`: Enable MySQL and PostgreSQL projects/tasks to be created.

### IoT

* Add --tags to IoT Hub create and update

### Monitor

* [BREAKING CHANGE] `az monitor log-analytics workspace data-export`: Remove deprecated `--export-all-tables` parameter and require `--tables` parameter

### RDBMS

* Remove the preview tag for server key and ad admin commands for Postgres and MySql

### Role

* Fix #11594: `az role assignment create`: Only show supported values for `--assignee-principal-type`

### Storage

* Fix #16072: Upload file with big size
* Fix #12291: `az storage blob generate-sas` does not properly encode `--full-uri`
* GA PITR and blob service properties in SRP

## January 04, 2021

Version 2.17.1

### RDBMS

* Hotfix: `az mysql create`: Revert incorrect parameter name 'serv_name' to 'service_name'

## December 29, 2020

Version 2.17.0

### ACR

* Support zone redundancy
* `az acr connected-registry`: New feature for on-prem Azure Container Registry
* `az acr scope-map update`: --add and --remove are deprecated, they are renamed to --add-repo --remove-repo
* `az acr scope-map create/update`: Add support to handle Gateway actions.
* `az acr token create`: support added for gateway actions

### AKS

* Fix: add arguments removed by a previous PR
* `az aks get-credentials`: Clarify documentation for get-credentials

### App Service

* Allow customer to create Python 3.9 function app
* Fix #14583: az webapp up should generate default name if name isn't provided
* Fix: Better error handling when trying to create duplicate ASP in diff location

### ARM

* `az ts`:  Add support for --tags
* `az ts`: Support deleting a single version
* `az provider register`: Add --accept-terms for registering RPaaS
* Fix parsing JSON files with multi-line strings

### ARO

* `az aro delete`: Add RBAC validation on cluster deletion
* `az aro update`: Add RBAC validation on cluster update
* Ensure worker_profile is not None before getting the subnets from

### Backup

* `az backup job list`: Solve -o table bug and added backup_management_type as command input

### Batch

* Upgrade data plane to [azure batch 10.0.0](https://pypi.org/project/azure-batch/10.0.0/)
* [BREAKING CHANGE] az batch job task-counts: Change the output from a JSON object returning task counts to a complex JSON object that includes task counts (`taskCounts`) as well as task slot counts (`taskSlotCounts`).

### Compute

* New license type RHEL_ELS_6
* Adopt track2 SDK, azure-mgmt-compute==18.0.0

### Container

* Fix misspelling in `az container create` CLI example text.

### DataBoxEdge

* New command module: support for data-box-edge devices and management

### IoT

* Update device key generation
* Update identity-enabled hub tests to fix endpoint RBAC issues

### Key Vault

* `az keyvault key import`: Support `--kty` for importing BYOK keys

### Monitor

* `az monitor metrics alert create`: Improve error message to give more actionable insight

### Network

* `az network private-endpoint create`: Add more declaration of '--subnet' and '--private-connection-resource-id'
* Change validator of application-gateway ssl-cert create
* Migrate network to track2 SDK
* Fix bug for "az network traffic-manager profile create" when using "--routing-method MultiValue"

### Profile

* Fix "missing secret or certificate in order to authenticate through a service principal"

### Role

* `az ad sp create-for-rbac`: Deprecate creating Contributor role assignment by default

### Security

* Add secure score commands
* Fix update alert command and support new value

### SQL

* `az sql dw update`: do not accept backup-storage-redundancy argument
* `az sql db update`: update backup storage redundancy as requested from command

### Storage

* Fix issue #15965: Clarify how to remove multiple legal hold tags with `az storage container legal-hold [clear|set]`
* `az storage account encryption-scope`: GA support
* Fix issue #9959: Trying to download a snapshot version of a file share fails with ResourceNotFound

### Synapse

* Add new cmdlets az synapse sql ad-admin show, create, update, delete
* Add new cmdlet az synapse workspace firewall-rule update
* Add new cmdlets az synapse sql audit-policy show, update
* Add integration runtime related cmdlets

## December 08, 2020

Version 2.16.0

### ACR

* Update description for KEK param

### AKS

* `az aks nodepool add/update/upgrade`: Take max surge parameter
* Add support for AGIC addon
* Change MSI cluster to default

### APIM

* `az apim restore`: New command to restore a backup of an API Management service

### App Service

* Fix #14857: Let users update webapp config even with access restriction
* `az functionapp create`: Accept `--runtime python` and  `--runtime-version 3.9` as Azure Functions v3 parameter
* Fix #16041: az webapp config ssl create results in unknown error

### ARM

* `az deployment-scripts`: Remove preview flag

### Backup

* Fix #14976: CLI error improvements for ValueError and AttributeError cases
* `az backup protection undelete`: Add support for AzureWorkload protection undelete using CLI
* Fix Bad Request Error for Correct Workload Type Input

### CDN

* Add preview multi-origin support.
* Add BYOC auto-rotation.

### Key Vault

* `az keyvault key/secret list`: Add a parameter `--include-managed` to list managed resources

### Monitor

* `az monitor metrics alert create`: Support dynamic thresholds for condition parameter
* `az monitor metrics alert update`: Support dynamic thresholds for condition parameter
* `az monitor metrics alert dimension create`: Build a metric alert rule dimension
* `az monitor metrics alert condition create`: Build a metric alert rule condition

### MySQL

* Add MySQL version upgrade CLI

### NetAppFiles

* `az netappfiles account ad add`: Two optional parameters added, aes_encryption and ldap_signing
* `az netappfiles account backup-policy update`: Three optional parameters added named tags, type and id
* `az netappfiles snapshot policy create`: An optional parameter added named provisioning_state

### Network

* `az network network watcher configure`: Fix NetworkWatcherCountLimitReached error caused by case sensitivity of location value
* `az network application-gateway http-listener`: Fix bug that cannot create and update with WAF policy name
* `az network route-table`: Deprecate route table V1
* `az network cross-region-lb`: Support cross-region load balancer
* `az network express-route port generate-loa`: New command to generate and download the PDF letter of authorization for a ExpressRoutePort

### Packaging

* Add Ubuntu Groovy package

### RDBMS

* Add single server show-connection-string and tests for local-context commands, server creation

### Role

* Add long-summary/warning for commands generating credentials

### Search

* Add SKU option

### Service Fabric

* Update SF app docs. only support for arm deployed resources

### Synapse

* Support synapse sql dw cmdlets and update az synapse workspace create cmdlet

## November 20, 2020

Version 2.15.1

### Profile

* Hotfix: Fix #15961: az login: UnboundLocalError: local variable 'token_entry' referenced before assignment

## November 17, 2020

Version 2.15.0

### ACS

* Add v3 deprecation warnings

### AKS

* Add ephemeral os functionality
* Engineering improvement: Replace addon strings with constants
* `az aks install-cli`: Support customize download url
* `az aks browse`: Point to Azure Portal Kubernetes resources view if k8s >=1.19 or kube-dashboard not enabled
* Support BYO control plane identity
* `az aks use-dev-spaces`: Indicate that dev-spaces commands are deprecated

### AMS

* Change "region" to "location" in output string: az ams account sp create

### App Config

* Fix key vault client initialization

### App Service

* Fix #13646: Unable to create App Service Plan in a different resource group to App Service Environment
* Fix #11698 #15198 #14862 #15409: az webapp/functionapp config access-restriction add
* `az functionapp create`: Add Node 14 preview support.
* `az functionapp create`: Remove preview flag from custom handlers.
* [BREAKING CHANGE] az functionapp update: Migrate a functionapp from Premium to Consumption plans now requires the '--force' flag.
* `az functionapp update`: Add error message if functionapp migration involves any plans on Linux.
* `az functionapp update`: Add more descriptive error message if functionapp migration fails.

### ARM

* Fix an issue where What-If shows two resource group scopes with different casing
* `az deployment`: Print out error details for deployment

### Backup

* Fix #14976: KeyError fixed and help text improved

### Batch

* Fix #15464: Update check for pfx file without password in batch create_certificate

### Billing

* [BREAKING CHANGE] az billing invoice: Remove properties BillingPeriodsNames and DownloadUrlExpiry from the response.
* `az billing invoice`: Support many other scopes like BillingAccount, BillingProfile and existing subscription.
* `az billing account`: New commands to support display and update existing billing accounts.
* `az billing balance`: New commands to support display balance of a billing profile.
* `az billing customer`: New commands to support display customer of billing account.
* `az billing policy`: New commands to support display and update policy of a customer or a billing profile.
* `az billing product`: New commands to manage products of a billing account.
* `az billing profile`: New commands to manage a billing profile.
* `az billing property`: New commands to display and update a billing account's properties.
* `az billing subscription`: New commands to manage the subscriptions for a billing account.
* `az billing transaction`: New commands to list transaction of an invoice.
* `az billing agreement`: New commands to manage billing agreement.
* `az billing permission`: New commands to manage billing permission.
* `az billing role-assignment`: New commands to manage role assignment.
* `az billing role-definition`: New commands to display role definition.
* `az billing instruction`: New commands to manage instructions of billing.

### Compute

* Fix update permission check issue
* Enhancement of vm list-skus table format
* vm host group create: Make --platform-fault-domain-count required and update help
* Support update vm/image version when they use cross tenant images

### DPS

* Allow tags in IoT DPS create command

### HDInsight

* az hdinsight create: Add two parameters `--resource-provider-connection` and `--enable-private-link` to support relay outbound and private link feature.

### Key Vault

* Refine error messages for HSM `list-deleted` and `purge`
* Support selective key restore for managed HSMs

### NetAppFiles

* [BREAKING CHANGE] az netappfiles pool update: Remove service-level from parameters.
* `az netappfiles pool update`: Add optional parameter qos-type.
* `az netappfiles pool create`: Add optional parameter qos-type.
* `az netappfiles volume replication suspend`: Add force-break-replication as optional parameter.
* Add az netappfiles volume replication re-initialize: New command is added to re-initialise replication.
* Add az netappfiles volume pool-change: New command to change the pool of a volume.
* Add az netappfiles snapshot policy: New command group with list, delete, update, show, create and volumes commands.
* Add az netappfiles account backup: New command group with show, list and delete commands
* Add az netappfiles volume backups: New command group with show, list, delete, update and create commands.
* Add az netappfiles account backup-policy: New command group with show, list, delete, update and delete commands.
* Add az netappfiles vault list: New command is added.
* `az netappfiles account ad add`: Add optional parameters kdc-ip, ad-name, server-root-ca-certificate and backup-operators
* `az netappfiles volumes create`: Add optional parameters snapshot-policy-id, backup-policy-id, backup-enabled, backup-id, policy-enforced, vault-id, kerberos-enabled, throughput-mibps, snapshot-directory-visible, security-style, kerberos5-read-only, kerberos5-read-write, kerberos5i-read-only, kerberos5i-read-write, kerberos5p-read-only, kerberos5p-read-write and has-root-access.
* `az netappfiles volume update`: Add optional parameters vault-id, backup-enabled, backup-policy-id, policy-enforced and throughput-mibps

### Network

* Fix bug that can't create a Standard_v2 application-gateway without a private static IP address
* `az network dns zone import`: Raise FileOperationError instead of FileNotFoundError if zone file doesn't exist
* Fix NoneType error crash while deleting nonexisting resources of ApplicationGateway, LoadBalancer, Nic

### Private DNS

* `az network private-dns zone import`: Raise FileOperationError instead of FileNotFoundError if zone file doesn't exist

### Profile

* `az login`: Add back the warning that a browser is opened

### Role

* `az role assignment create`: Make `--description`, `--condition`, `--condition-version` preview

### Security

* `az security pricing`: Update help to reflect current API version being called

### Storage

* Fix #15600: az storage fs exists: in case fs does not exist ResourceNotFoundError is returned
* Fix #15706: The examples for storage container create are incorrect
* `az storage blob delete-batch`: Correct typo in documentation.

## November 09, 2020

Version 2.14.2

### App Service

* Fix #15604, #15605: Add Dotnet5 support

## November 06, 2020

Version 2.14.1

### ARM

* Hotfix: Add TS multiline string support for template inputs

## October 27, 2020

Version 2.14.0

### AKS

* Add PPG support
* Update max standard load balancer timeout to 100 minutes

### APIM

* Fix issue with creating consumption tier instance

### App Config

* Fix querying key-values by comma separated labels

### App Service

* Bugfix: az webapp up fails when user doesn't have write permissions to project's parent directory
* Fix #13777: Fix to remove escape chars from XML
* Fix #15441: az webapp create-remote-connection fails with AttributeError: 'Thread' object has no attribute 'isAlive'
* [BREAKING CHANGE] az webapp up: add optional params (os & runtime) and updated runtimes

### ARM

* Make template deployment What-If commands GA
* [BREAKING CHANGE] Add user confirmation for az ts create
* Fix the returned data when tagging multiple resources

### Backup

* `az backup policy create`: Add support for IaaSVM backup policy creation from CLI
* Increasing VM protection limit from 100 to 1000

### Compute

* sig image-definition create: add --features
* New API version of gallery_images 2020-09-30
* `az vm update / az sig image-version update`: Support update vm/image-version even it uses a cross tenant image
* Remove validation of vm host SKUs

### Cosmos DB

* `az cosmosdb create/update`: Improve error message from incorrect --locations input
* `az cosmosdb sql container create/update`: Add --analytical-storage-ttl parameter

### HDInsight

* [BREAKING CHANGE] az hdinsight create: remove two parameters: --public-network-access-type and  --outbound-public-network-access-type

### IoT Central

* Remove preview warning since it is already GAed

### Key Vault

* Invalidate `--enable-soft-delete false` while creating or updating vaults
* Make `--bypass` and `--default-action` work together with network acl parameters while creating vaults

### Misc.

* Add bash-completion to Dockerfile

### RDBMS

* Add List-SKUS Command, Table Transformers, Local Context for Postgres, MySQL, Mariadb Single Server
* [BREAKING CHANGE] Parameter name updates. Improvements to Management Plane for MySQL and PostgreSQL
* `az postgres|mariadb|mysql server create` : Update create experience for Postgres, MySQL and MariaDB - new fields in the output , Introduce new values for `--public` parameter in create command (all,<IP>,<IPRange>,0.0.0.0)

### SignalR

* `az signalr create`: Add new option `--enable-messaging-logs` for controling service generate messaging logs or not
* `az signalr update`: Add new option `--enable-messaging-logs` for controling service generate messaging logs or not

### SQL

* [BREAKING CHANGE] Fix response for backup storage redundancy param name and value for MI
* `az sql db audit-policy show`: extend to show database's audit policy including LA and EH data
* `az sql db audit-policy update`: extend to allow LA and EH update along with database's audit policy
* `az sql db audit-policy wait`: place the CLI in a waiting state until a condition of the database's audit policy is met.
* `az sql server audit-policy show`: extend to show servers's audit policy including LA and EH data
* `az sql server audit-policy update`: extend to allow LA and EH update along with server's audit policy
* `az sql server audit-policy wait`: place the CLI in a waiting state until a condition of the server's audit policy is met.
* Add AAD-only Support for SQL Managed Instances and Servers
* `az sql db replica create`: Add --partner-database argument

### Storage

* Fix #15111: `az storage logging update` fails without optional argument
* Fix bug when using set-tier command with service principal login
* Upgrade version for file datalake to 2020-02-10
* `az storage queue list`: Track2 supported
* `az storage fs access`: Support managing ACLs recursively

### Synapse

* Add pipeline, linked service, trigger, notebook, data flow and dataset related cmdlets

## October 13, 2020

Version 2.13.0

### ACR

* `az acr helm`: Update deprecation url
* Add logtemplate and systemtask changes for ACR Tasks

### AKS

* Support virtual-node with aks create: `az aks create --enable-addons virtual-node`
* Add node image only option for CLI
* Expect kube-dashboard addon be disabled by default
* `az aks create/update`: Add LicenseType support for Windows
* Support add Spot node pool
* Honor addon names defined in Azure CLI

### AMS

* Fix #14687: Mixed resource group and account name in command "az ams streaming-endpoint show"

### App Config

* Fix test bug
* Support AAD auth for data operations

### App Service

* `az functionapp deployment source config-zip`: Fixed an issue where config-zip could throw an exception on success on linux consumption
* Bugfix: Better error messages for webapp commands
* `az appservice domain create, show-terms`: Add ability to create app service domain
* `az functionapp create`: Removed the preview flag from Java 11 when creating a new function app
* [BREAKING CHANGE] az webapp create, az webapp up - Update available webapp runtimes

### ARM

* `az ts`: Add new commands for template specs
* `az deployment` : Add support for --template-spec -s

### Compute

* Fix host group creation FD count limitation
* Add new command to support upgrading extensions for VMSS
* Fix the image reference is missing issue

### HDInsight

* `az hdinsight create`: add deprecate information for argument --public-networrk-access-type and --outbound-public-network-access-type
* `az hdinsight create`: add deprecate information for argument `--public-networrk-access-type` and `--outbound-public-network-access-type`
* `az hdinsight create`:  add parameter `--idbroker` to support customer to create ESP cluster with HDInsight Id Broker

### IoT Central

* Remove deprecated 'az iotcentral' command module

### Key Vault

* Support `--hsm-name` for `az keyvault key encrypt/decrypt`

### Lab

* Fix #14127: `__init__()` takes 1 positional argument but 2 were given

### Network

* `az network application-gateway ssl-cert show`: Add example to demonstrate certificate format and fetch information
* `az network application-gateway rule`: Support --priority option
* `az network application-gateway create`: Fix bug that cannot create without public IP sepcified
* `az network application-gateway waf-policy managed-rule rule-set add`: Expose server error to user to give more intuitive hint message.
* `az network application-gateway waf-policy managed-rule rule-set update`: Support to change rule set type version.

### RDBMS

* Bugfix: az postgres flexible-server create Remove hardcoded API version from network client.

### Role

* Fix #15278: `az role assignment list/delete`: Forbid empty string arguments

### SQL

* `az sql midb log-replay`: Support for log replay service on managed database
* Ignore character casing for backup storage redundancy param value for managed instance
* [BREAKING CHANGE] az sql db create: Add --backup-storage-redundancy parameter; add warning for unspecified bsr/bsr == Geo.

### SQL VM

* `az sql vm show`: Add configuration options to --expand flag

### Storage

* [BREAKING CHANGE] `az storage blob copy start`: Fix format issue for `--destination-if-modified-since` and `--destination-if-unmodified-since`
* [BREAKING CHANGE] `az storage blob incremental-copy start`: Fix format issue for `--destination-if-modified-since` and `--destination-if-unmodified-since`
* `az storage fs`: Fix connection string issue
* `az storage share-rm`: GA release access tier
* `az storage container-rm`: Add a new command group to use the Microsoft.Storage resource provider for container management operations.

## September 29, 2020

Version 2.12.1

### RDBMS

* Hotfix: `az postgres flexible-server create` : Update VnetName to exclude servername and update default region for MySQL

## September 22, 2020

Version 2.12.0

### ACR

* Fix #14811 Add support for dockerignore override

### AKS

* CLI should tolerate empty kubeconfig
* FIX #12871: az aks enable-addons: Autogenerated help example is wrong for vitual-node option
* Remove legacy aci connector actions
* Support azure policy addon in azure-cli
* Fix case sensitive issue for AKS dashboard addon
* Update mgmt-containerservice to 9.4.0 and enable 09-01 API

### APIM

* Support product / productapi / namedValue entity commands && bump sdk version

### App Config

* Support enabling/disabling PublicNetworkAccess for existing stores

### App Service

* Add support for Premium V3 pricing tier
* Fix #12653: az webapp log config --application-logging false doesn't turn it off
* Fix #14684: access-restriction remove by ip address does not work; #13837-az webapp create - Example for different RSgroups for Plan and WebApp
* functionapp: Add support for custom handlers. Deprecated Powershell 6.2.
* functionapp: Fix issue where app setting was being incorrectly set for linux custom images

### ARM

* `az deployment group/sub/mg/tenant what-if`: Show "Ignore" resource changes last

### Compute

* Add new license_type in vm create/update: RHEL_BYOS, SLES_BYOS
* Upgrade disk API version to 2020-06-30
* disk create: add --logical-sector-size, --tier
* disk update: Support --disk-iops-read-only, --disk-mbps-read-only, --max-shares
* New command disk-encryption-set list-associated-resources
* vm boot-diagnostics enable: --storage becomes optional
* New command: vm boot-diagnostics get-boot-log-uris
* vm boot-diagnostics get-boot-log: support managed storage

### Config

* Rename local-context to config param-persist

### Cosmos DB

* Support for Migration APIs for Throughput resource for Autoscale feature in CosmosDB

### Eventhub

Added Cluster commands and trusted_service_access_enabled parameter for Networkruleset

### Extension

* `az extension add`: Add `--upgrade` option to update the extension if already installed
* Turn on dynamic install by default

### IoT

* Enabled minimum TLS version on IoT Hub Create

### IoT Central

* App delete operation is now long running operation

### Iot Hub

* Deprecated 'show-connection-string' command

### Key Vault

* Managed HSM public preview
* Fix the issue that `--maxresults` does not take effect while listing resources or resource versions

### Kusto

* Add deprecating message

### Monitor

* `az monitor log-analytics workspace linked-storage`: expose detailed error message to customers

### Network

* `az network vnet subnet`: Support --disable-private-endpoint-network-policies and --disable-private-link-service-network-policies
* Fix bug while updateing flow-log when its subproperty network_watcher_flow_analytics_configuration is None
* API version bump to 2020-06-01
* Support --tcp-port-behavior while configuring a TCP configuration of a Connection Monitor V2
* Support more types and coverage level while creating Endpoint of Connection Monitor V2
* Support --host-subnet to create VirtualHub underneath as VirtualRouter

### RDBMS

* Management Plane updates for PostgreSQL and MySQL

### Role

* `az role assignment create/update`: Support `--description`, `--condition` and `--condition-version`
* `az ad app permission delete`: Support `--api-permissions` to delete specific `ResourceAccess`

### Service Fabric

* Add managed cluster and node type commands

### SQL

* Upgrade azure-mgmt-sql to 0.20.0
* Add backup storage redundancy optional parameter to MI create cmdlet

### Storage

* `az storage share-rm stats`: Get the usage bytes of the data stored on the share.
* GA release storage blob PITR
* `az storage blob query`: Support Azure Storage Query Acceleration
* Support Soft Delete for file share
* `az storage copy`: Add account credentials support and deprecate `--source-local-path`, `--destination-local-path`, `--destination-account-name`
* `az storage account blob-service-properties update`: Add container delete retention policy support

### Synapse

* Fixed typo in example of az synapse role assignment create and delete

## August 28, 2020

Version 2.11.1

### ACR

* Add Isolated Tier to Agent Pool
* Add OCI Artifact Source Context

### AKS

* Fix aks cluster create issue

### Cognitive Services

* [BREAKING CHANGE] Show additional legal term for certain APIs

### Network

* [BREAKING CHANGE] Allow to create both public and private IP while creating an Application Gateway
* `az network list-service-tags`: add details on location parameter use to the help message

### Storage

* `az storage blob list`: Support OR properties with new api version

## August 25, 2020

Version 2.11.0

### AKS

* Remove preview tag from Virtual Node add-on
* Add AKS CMK argument in cluster creation
* Set network profile when using basic load balancer.
* Remove max pods validation from CLI and let preflight handle it
* Fixing add-ons available in the help message in `az aks create`
* Bring in support for cluster autoscaler profile in core CLI

### AppService

* `az webapp`: Add list-instances command
* `az webapp ssh`: Add --instance parameter to connect to a specific instance
* `az webapp create-remote-connection`: Add --instance parameter to connect to a specific instance
* Fix #14758: az webapp create errors when creating windows app with --runtime dotnetcore
* Fix #14701: Implement functionapp create --assign-identity
* Fix #11244: `az webapp auth update`: Add optional parameter to update client-secret-certificate-thumbprint
* `az functionapp keys`: Added commands that allow users to manage their function app keys
* `az functionapp function`: Added commands that allow users to manage their individual functions
* `az functionapp function keys`: Added commands that allow users to manage their function keys
* Fix #14788: az webapp create not getting correct webapp when names are substrings
* `az functionapp create`: Removed ability to create 2.x Functions in regions that don't support it

### ARM

* `az resource list`: Extend the return data of `createdTime`, `changedTime` and `provisioningState`
* `az resource`: Add parameter `--latest-include-preview` to support using the latest api-version whether this version is preview

### ARO

* CLI enhancements, including route table checking permissions

### Cloud

* `az cloud register`: Fix registering clouds with a config file

### Compute

* Update VM SKUs that support accelerated networking
* `az vm create`: Automatic in-guest patching
* `az image builder create`: Add --vm-size, --os-disk-size, --vnet, --subnet
* New command az vm assess-patches

### Container

* Fix #6235: Update help text for ports parameter in container create

### Datalake Store

* Fix issue #14545 for data lake join operation

### EventHub

* `az eventhubs eventhub create/update`: Change documentation of destination_name

### Extension

* Add `az extension list-versions` command to list all available versions of an extension

### HDInsight

* Support creating cluster with autoscale configuration and Support managing autoscale configuration
* Support creating cluster with encryption at host

### IoTCentral

* CLI documentation improvements

### Monitor

* `az monitor metrics alert create`: support RG and Sub as the scope values

### NetAppFiles

* [BREAKING CHANGE] az netappfiles snapshot create: Removed file-system-id from parameters
* [BREAKING CHANGE] az netappfiles snapshot show: Snapshot no longer has parameter file-system-id
* `az netappfiles account`: Model ActiveDirectory has a new parameter backup_operators
* `az netappfiles volume show`: Model dataProtection has a new parameter snapshot
* `az netappfiles volume show`: Model Volume has a new parameter snapshot_directory_visible

### Network

* `az network dns export`: export FQDN for MX, PTR, NS and SRV type instead of relative path
* Support private link for managed disks
* `az network application-gateway auth-cert show`: Add example to demonstrate certificate format
* `az network private-endpoint-connection`: support app configuration

### RBAC

* `az ad group create`: support specify description when creating a group
* `az role definition create`: print human readable message instead of exception when assignableScope is an empty array
* [BREAKING CHANGE] `az ad sp create-for-rbac`: change default permission of created certificate

### SQL

* `az sql server audit-policy`: Add sql server auditing support

### Storage

* `az storage blob copy start-batch`: Fix #6018 for --source-sas
* `az storage account or-policy`: Support storage account object replication policy
* Fix issue #14083 to upgrade azure-multiapi-storage package version for package issue and new api version support
* `az storage blob generate-sas`: add examples for --ip  and refine error message
* `az storage blob list`: Fix next_marker issue

### Synapse

* Add workspace, sparkpool, sqlpool related cmdlets
* Add spark job releated commands based on track2 sdk
* Add accesscontrol feature related commands based on track2 sdk

### Upgrade

* Add `az upgrade` command to upgrade azure cli and extensions

## August 11, 2020

Version 2.10.1

### App Service

* Fix #9887 webapp and functionapp, support assigning/removing user managed identity
* Fix #1382, #14055: Update error messages for az webapp create and az webapp config container set
* `az webapp up`: Fix default ASP selection logic when --plan parameter is not provided

### AppConfig

* Support enabling/disabling PublicNetworkAccess during store creation

### Compute

* Support associating disk and snapshot with a disk-access resource

### Lab

* Fix for issue #7904 date validation bug in lab vm creation

### Storage

* `az storage blob upload-batch`: Fix issue #14660 with unpositional arguments

## August 04, 2020

Version 2.10.0

### AKS

* `az aks update`: Change --enable-aad argument to migrate a RBAC-enabled non-AAD cluster to a AKS-managed AAD cluster
* `az aks install-cli`: Add --kubelogin-version and --kubelogin-install-location arguments to install kubelogin
* Add az aks nodepool get-upgrades command

### AMS

* Fix #14021: az ams account sp is not idempotent

### APIM

* apim api import: support API import and enchance other api level cli commands

### App Service

* Fix #13035: Add validation for az webapp config access-restriction to avoid adding duplicates

### AppConfig

* Default to standard sku if not specified
* [BREAKING CHANGE] Support settings with JSON content type

### ARM

* `az resource tag`: Fix the bug of managedApp tagging and some related test issues
* `az deployment mg/tenant what-if`: Add support to management group and tenant level deployment What-If
* `az deployment mg/tenant create`: Add --confirm-with-what-if/-c parameter.
* `az deployment mg/tenant create`: Add --what-if-result-format/-r parameter.
* `az deployment mg/tenant create`: Add --what-if-exclude-change-types/-x parameter.
* `az tag`: az tag support for resource id parameter

### Backup

* Trigger AFS container/item discovery only when needed

### CDN

* Add private link fields to origin

### Compute

* `az vm/vmss create`: Select a valid username for user if the default username is invalid
* `az vm update`: support cross tenant image
* `az disk-access`: Add new command group to operate disk access resource
* Support dedicated host group automatic placement
* Support ppg and spg in VMSS orchestration mode

### Config

* `az config`: Add new `config` command module

### Extension

* Support automatically installing an extension if the extension of a command is not installed

### HDInsight

* Add 3 parameters to the command `az hdinsight create` to support private link and encryption in transit feature:

### Iot Hub

* Fix #7792: IoT Hub Create is not idempotent

### IoT Central

* Add paramater option list for iot central

### KeyVault

* `az keyvault key encrypt/decrypt`: add parameter `--data-type` for explicitly specifing the type of original data

### Monitor

* `az monitor log-analytics workspace data-export`: support event hub namespace as the destination.
* `az monitor autoscale`: support namespace and dimensions for --condition

### NetAppFiles

* `az volume revert`:  Add Volume Revert to revert a volume to one of its snapshots.
* [BREAKING CHANGE] Remove `az netappfiles mount-target`.
* `az volume show`: Add site to Active Directory Properties

### Network

* `az application-gateway private-link add`: support to specify an existing subnet by ID
* `az network application-gateway waf-policy create`: support version and type

### Storage

* Fix #10302: Support guess content-type when synchronizing files
* `az storage blob lease`: Apply new api version for blob lease operations
* `az storage fs access`: Support AAD credential in managing access control for ADLS Gen2 account
* `az storage share-rm create/update`: add --access-tier to support access tier

## July 16, 2020

Version 2.9.1

### AKS

* Remove explicit setting of VMSS in Windows example command since it is now default

### IoT

* [BREAKING CHANGE] `az iot pnp`: Remove IoT PNP preview commands from core CLI

### REST

* Fix #14152: `az rest`: Accept ARM URLs without subscription ID

### Storage

* Fix #14138: Make some permissions optional

## July 14, 2020

Version 2.9.0

### ACR

* Handle log artifact link from Registry to stream logs
* Deprecate helm2 commands

### AKS

* `az aks create`: add --enable-aad argument
* `az aks update`: add --enable-aad argument

### APIM

* Added general az apim api commands

### AppConfig

* Add example for using --fields in appconfig revision

### AppService

* `az functionapp create`: Added support for Java 11 and Powershell 7. Added Stacks API Support.
* Fix #14208 multi-container app creation fails
* Fix az webapp create - use hardcoded runtime stacks

### ARM

* `az resource tag`: Fix the problem of tagging resources with resource type `Microsoft.ContainerInstance/containerGroups`

### Compute

* Bump version disks 2020-05-01, compute 2020-06-01
* Double encryption of disk encryption set
* `az vmss update`: support specify cross tenant image.
* `az sig image-version create`: support specify cross tenant image.
* vm/vmss create: Encryption of cache & data-in-transit for OS/Data disks and temp disks for VM & VMSS
* Add simulate-eviction operation for VM and VMSS

### CosmosDB

* Recent features: Autoscale, IpRules, EnableFreeTier and EnableAnalyticalStorage

### EventGrid

* Add CLI support for 2020-04-01-preview and mark preview features with is_Preview=True

### Find

* Fix #14094 az find Fix Queries failing when not logged in and when telemetry is disabled

### HDInsight

* Add two commands to support hdinsight node reboot feature

### Monitor

* Remove preview flag for commands under Log Analytics workspace
* `az monitor diagnostic-settings subscription`: Support diagnositc settings for subscription
* `az monitor metrics`: support ',' and '|' in metric name
* `az monitor log-analytics workspace data-export`: support log analytics data export

### Network

* `az network application-gateway frontend-ip update`: Deprecating the --public-ip-address parameter
* Bump azure-mgmt-network to 11.0.0
* `az network express-route gateway connection`: support routing configuration
* `az network virtual-appliance`: Support Azure network virtual appliance.
* Application Gateway support private link feature

### PolicyInsights

* `az policy state`: add trigger-scan command to trigger policy compliance evaluations
* `az policy state list`: expose versions of policy entities in each compliance record

### Profile

* `az account get-access-token`: Show expiresOn for Managed Identity

### RDBMS

* Support Minimum TLS version
* Add Infrastructure Encryption for Azure Postgres and MySQL

### Security

* Add allowed_connections commands
* Add Adaptive network hardeningss commands
* Add adaptive_application_controls commands
* Addition of az security iot-solution/ iot-alerts/iot-recommendations/iot-analytics REST to Azure CLI
* Add regulatory compliance CLI

### SignalR

* Add features including managing private endpoint connections, network rules and upstream

### SQL

* `az sql mi create`, `az sql mi update`: Add `--tags` parameter to support resource tagging
* `az sql mi failover`: Support failover from primary or secondary point

### Storage

* `az storage account create/update`: Add --allow-blob-public-access to allow or disallow public access for blob and containers
* `az storage account create/update`: Add `--min-tls-version` to support setting the minimum TLS version to be permitted on requests to storage.
* Remove check in token credential
* Fix the storage account name in examples

### Webapp

* Bugfix: az webapp log deployment show - return deployment logs instead of log metadata
* Bugfix: az webapp vnet-integration add - fix error handling if bad vnet name, support vnet resource ID

## June 23, 2020

Version 2.8.0

### ACR

* Add support for region endpoint disable / routing disable
* [BREAKING CHANGE] `az acr login --expose-token` does not accept username and password

### ACS

* Remove private cluster and 2019-10-27-preview API

### AKS

* Support --yes for az aks upgrade
* Revert "change default vm sku to Standard_D2s_v3 (#13541)"
* Add "az aks update --uptime-sla"
* Fix typo in az aks update command
* Change to support 0 node agent pool and block manual scale for CAS enabled pool
* Fix typo on VirtualMachineScaleSets and update references to Kubernetes versions

### AMS

* CHANGE help text for "--expiry" parameter.

### AppService

* `az webapp log deployment show`: Show the latest deployment log, or the deployment logs of a specific deployment if deployment-id is specified
* `az webapp log deployment list`: List of deployment logs available
* Fix: Surface error when invalid webapp name provided
* Fix #13261 az webapp list-runtimes use static list until new Available Stacks API is available
* `az appservice ase create`: Fix create issue #13361
* `az appservice ase list-addresses`: Fix change of SDK #13140.
* Fix webapp/slot creation for Windows Containers
* `az webapp auth update`: Add optional parameter to update runtime-version
* Support list, delete, approve and reject private endpoint connection for webapp in CLI
* Fix #13888 : Add support for Static WebApps: get, list, create commands
* Improved error messages for SSH Tunnel Connection

### ARM

* `az tag`: Add examples for -h
* `az deployment group/sub what-if`: Add --exclude-change-types/-x parameter.
* `az deployment group/sub/mg/tenant create`: Add --what-if-exclude-change-types/-x parameter.
* `az deployment group/sub/mg/tenant validate`: Show error messages in a better format.
* `az group export`: Add new parameters `--skip-resource-name-params` and `--skip-all-params` to support skip parameterization
* Add az feature unregister api

### ARO

* Add Public, Private to params for help with ingress/apiserver visibility

### Batch

* `az batch account create`: Add new parameter `--public-network-access`
* `az batch account create`: Add new parameter `--identity-type`
* `az batch account set`: Add new parameter `--identity-type`
* [BREAKING CHANGE] az batch pool create: When creating a pool using a custom image, the --image property of can now only refer to a Shared Image Gallery image.
* [BREAKING CHANGE] az batch pool create: When creating a pool with --json-file option and specifying a networkConfiguration, the publicIPs property has moved in to a new property publicIPAddressConfiguration. This new property also supports a new ipAddressProvisioningType property which specifies how the pool should allocate IP's and a publicIPs property which allows for configuration of a list of PublicIP resources to use in the case ipAddressProvisioningType is set to UserManaged
* `az network private-link-resource`: Add support for the Microsoft.Batch batchAccount resource
* `az network private-endpoint-connection`: Add support for the Microsoft.Batch batchAccount resource

### CDN

* `az cdn custom-domain enable-https`: Add BYOC support.
* `az cdn custom-domain enable-https`: Fix enabling custom HTTPS with CDN managed certificates for Standard_Verizon and Standard_Microsoft SKUs.

### Cognitive Services

* [BREAKING CHANGE] `az cognitiveservices account` now have a unified structure for all commands.
* `az cognitiveservices account identity`: Add identity management for Cognitive Services.

### Compute

* `az image builder`: Upgrade API version to 2020-02-14
* `az image builder create`: Add `--identity` to support identity configuration
* `az image builder customizer add`: Support Windows update customizer
* New command `az image builder cancel`
* Show a warning when a user deploys a VMSS pinned to a specific image version rather than latest

### Cosmos DB

* `az cosmosdb`: Add exists command to database and container groups
* Allow creating fixed collections

### EventHub

* `az eventhubs namespace create` : Add managed identity parameters

### Extension

* Add --version to support to install from a specific version
* Enable CLI extensions to include packages in the 'azure' namespace

### Iot Hub

* [BREAKING CHANGE] az iot hub job: Remove deprecated job commands

### KeyVault

* `az keyvault key import`: Supports importing from strings via two new parameters.
* Support string/bytes encryption and decryption with stored keys

### Monitor

* Support no wait for cluster creation
* `az monitor log-analytics workspace saved-search`: Support new commands for saved search

### Network

* `az network application-gateway address-pool update`: Refine help message and add examples.
* `az network vnet create`: Support --nsg argument
* `az network lb address-pool`: Support create lb backend pool with backend address.
* `az network application-gateway address-pool`: Fix for --add argument

### RBAC

* `az ad sp create-for-rabc`: Support name with space, slash and back slash
* `az ad sp create-for-rbac`: Refine error message when user specify an invalid scope

### Security

* Add security assessment commands

### SQL

* `az sql db ltr-policy/ltr-backup`: update/show long term retention policy, show/delete long term retention backups, restore long term retention backup

### Storage

* Fix authentication issue to support get token for --subscription
* `az storage remove`: Fix issue #13459 to raise exception for operation failure
* Fix issues #13012, #13632 and #13657 to remove unused arguments for generate-sas related commands
* `az storage logging update`: Add check for logging version
* `az storage blob show`: Add more properties for blob with track 2 SDK
* Fix #13708: Refine warning message for credential
* `az storage share-rm create/update`: Add NFS protocol and root squash support
* `az storage account create`: Add support for double encryption
* [BREAKING CHANGE] `az storage blob/container/file/share/table/queue generate-sas`: make --expiry and --permissions required
* `az storage blob set-tier`: Migrate to Track 2 to support setting rehydrate priority

## June 02, 2020

Version 2.7.0

### ACR

* Fix a typo in an error message of token creation

### AKS

* Change default vm sku to Standard_D2s_v3
* Fix creating role assignment for MSI clsuter plus custom subnet

### AppService

* Fix #12739 az appservice list-locations returns some invalid locations

### ARM

* `az deployment`: Fix issue #13159 of incorrect message of JSON after removing comments and compressing
* `az resource tag`: Fix issue #13255 of tagging resources with resource type `Microsoft.ContainerRegistry/registries/webhooks`
* Improve the examples for the resource module

### ARO

* Change CLIError to correct flag for --worker-vm-disk-size-gb

### EventHub

* Fix for issue #12406 Argument --capture-interval does not update the "intervalInSeconds"

### HDInsight

* Change get_json_object to shell_safe_json_parse

### Monitor

* `az monitor metrics alert`: refine several help messages
* `az monitor diagnostic-settings create`: support --export-to-resource-specific argument
* Support LA workspace recover

### Network

* `az network dns zone`: support - character
* `az network vpn-connection ipsec-policy`: change the --sa-lifetime and --sa-max-size to larger values in example
* Bump network to 2020-04-01
* `az network private-endpoint-connection`: support event grid
* `az network express-route list-route-tables`: fix bug that cannot list routes as table

### Packaging

* Add Ubuntu Focal Package

### RBAC

* `az ad sp credential reset`: modify credential generation to avoid troublesome special characters

### Redis

* Fix #13529: Change documentation of parameter enable_non_ssl_port

### Storage

* `az storage copy`: Add parameter `--follow-symlinks` to support symlinks
* Enable local context for storage account
* `az storage logging`: Fix issue #11969 to refine error message

## May 19, 2020

Version 2.6.0

### ACR

* Add default timeout of 5 minutes for any requests to ACR
* Support disable public network access
* `az acr token create`: expose --days argument
* `az acr import`: accept --source argument values which contain login in server name through client end correction

### ACS

* Bug fix: remove fields cleanup for fields that no longer exist

### AKS

* Update uptime-sla command help context
* Remove range check for updating min count for autoscaler
* Fix that cli doe not fail when user only specifies Windows password

### AMS

* `az ams transform create`: Add ability to create a transform with a FaceDetector preset
* `az ams content-key-policy create` : Add ability to create a FairPlay content key policy with an offline rental configuration

### AppConfig

* Bug fix for list key values with fields

### AppService

* `az functionapp create`: AzureWebJobsDashboard will only be set if AppInsights is disabled
* Fix #10664- VNet Integration - Location Check Issue & fix #13257- az webapp up failing when RG needs to be created
* `az webapp|functionapp config ssl import`: Lookup key vault across resources groups in subscription and improve help and examples.
* Onboard local context for app service

### ARM

* `az deployment`: Fix the problem that the templateLink will not be returned when deploying or validating template-uri
* `az deployment`: Fix the problem that deployment/validate does not support specially encoded character
* `az deployment sub/group what-if`: Fix array alignment and error handling
* `az deployment operation`: Modify the deprecate information

### ARO

* Add examples to az aro create, list, list-credentials, show, delete
* Add generate_random_id function

### Backup

* Allow FriendlyName in enable protection for AzureFileShare command
* Fix in IaasVM restore-disks Command
* Add "MAB" BackupManagementType to item list command
* Add support for retrying policy update for failed items.
* Add Resume Protection functionality for Azure Virtual Machine
* Add support to specify ResourceGroup for storing instantRP during Create or Modify Policy

### CI

* Support flake8 3.8.0

### Compute

* New command az vm auto-shutdown
* `az vm list-skus`: Update --zone behavior, return all type skus now

### Core

* Update local context on/off status to global user level

### Extension

* `az extension add`: Add --system to enable installing extensions in a system path
* Support .egg-info to store wheel type extension metadata

### IoT

* `az iot`: Update the IoT command module first run extension awareness message to the accurate, non-deprecated modern Id `azure-iot`.

### IoT Hub

* Support for 2020-03-01 API and Network Isolation commands

### NetAppFiles

* `az volume create`: Adds snapshot-id as a parameter to create volume this will allow users to create a volume from existing snapshot.

### Network

* Fix ttl value changed unintended for dns add-record
* `az network public-ip create`: Inform customers of a coming breaking change
* Support generic commands for private link scenario
* `az network private-endpoint-connection`: Support mysql, postgres and mariadb types
* `az network private-endpoint-connection`: Support cosmosdb types
* `az network private-endpoint`: deprecate --group-ids and redirect to --group-id

### Output

* Show update instruction in find, feedback and --help

### Packaging

* Build MSI/Homebrew packages with dependecies resolved from requirements.txt

### RBAC

* `az ad sp credential reset`: fix weak credential generation

### Storage

* `az storage account file-service-properties update/show`: Add File Properties Support for Storage Account
* `az storage container create`: Fix #13373 by adding validator for public access
* Add ADLS Gen2 track2 support
* `az storage blob sync`: Support `--connection-string`
* `az storage blob sync`: Fix the incorrect error message when azcopy cannot find the installation location

## April 30, 2020

Version 2.5.1

### ACR

* `az acr check-health`: Fix "DOCKER_PULL_ERROR" on Windows

### Compute

* `az vm list-ip-addresses`: Error handling
* Fix a bug of vm create if endpoint_vm_image_alias_doc is not set in cloud profile
* `az vmss create`: Add --os-disk-size-gb

### Cosmos DB

* `az cosmosdb create/update`: add --enable-public-network support

### Extension

* Fix loading wrong metadata for wheel type extension

### Packaging

* Add az script for Git Bash/Cygwin on Windows

### SQL

* `az sql instance-pool`: Add instance pools command group

### Storage

* Upgrade package azure-multiapi-storage to 0.3.0
* Support GZRS for storage account creation and update
* `az storage account failover`: Add support for grs/gzrs storage account failover
* `az storage blob upload`: Add --encryption-scope parameter to support specifying encryption scope information

## April 28, 2020

Version 2.5.0

### ACS

* [BREAKING CHANGE] az openshift create: remove --vnet-peer parameter.
* `az openshift create`: add flags to support private cluster.
* `az openshift`: upgrade to `2019-10-27-preview` API version.
* `az openshift`: add `update` command.

### AKS

* `az aks create`: Add support for Windows

### AppService

* `az webapp deployment source config-zip`: remove sleep after request.get()

### ARM

* Add template deployment What-If commands

### ARO

* `az aro`: Fix table output

### CI

* Onboard pytest and deprecate nose for Automation Test

### Compute

* `az vmss disk detach`: fix data disk NoneType issue
* `az vm availability-set list`: Support showing VM list
* `az vm list-skus`: Fix display problem of table format

### KeyVault

* Add new parameter `--enable-rbac-authorization` during creating or updating

### Monitor

* Support LA cluster CMK features
* `az monitor log-analytics workspace linked-storage`: supports BYOS features

### Network

* `az network security-partner`: support security partner provider

### Privatedns

* Add feature in private DNS zone to import export zone file

## April 21, 2020

Version 2.4.0

### ACR

* `az acr run --cmd`: disable working directory override
* Support dedicated data endpoint

### AKS

* `az aks list -o table` should show privateFqdn as fqdn for private clusters
* Add --uptime-sla
* Update containerservice package
* Add node public IP support
* Fix typo in the help command

### AppConfig

* Resolve key vault reference for kv list and export commands
* Bug fix for list key values

### AppService

* `az functionapp create`: Changed the way linuxFxVersion was being set for dotnet linux function apps. This should fix a bug that was preventing dotnet linux consumption apps from being created
* [BREAKING CHANGE] `az webapp create`: fix to keep existing AppSettings with az webapp create
* [BREAKING CHANGE] `az webapp up`: fix to create RG for az webapp up command when using -g flag
* [BREAKING CHANGE] `az webapp config`: fix to show values for non-JSON output with az webapp config connection-string list

### ARM

* `az deployment create/validate`: Add parameter `--no-prompt` to support skipping the prompt of missing parameters for ARM template
* `az deployment group/mg/sub/tenant validate`: Support comments in deployment parameter file
* `az deployment`: Remove `is_preview` for parameter `--handle-extended-json-format`
* `az deployment group/mg/sub/tenant cancel`: Support cancel deployment for ARM template
* `az deployment group/mg/sub/tenant validate`: Improve the error message when deployment verification fails
* `az deployment-scripts`: Add new commands for DeploymentScripts
* `az resource tag`: Add parameter `--is-incremental` to support adding tags to resource incrementally

### ARO

* `az aro`:  Add Azure RedHat OpenShift V4 aro command module

### Batch

* Update Batch API

### Compute

* `az sig image-version create`: Add storage account type Premium_LRS
* `az vmss update`: Fix terminate notification update issue
* `az vm/vmss create`: Add support for specialized image version
* SIG API Version 2019-12-01
* `az sig image-version create`: Add --target-region-encryption
* Fix tests fail when running in serial due to keyvault name is duplicated in global in-momery cache

### CosmosDB

* Support `az cosmosdb private-link-resource/private-endpoint-connection`

### IoT Central

* Deprecate `az iotcentral`
* Add `az iot central` command module

### Monitor

* Support private link scenario for monitor
* Fix wrong mocking way in test_monitor_general_operations.py

### Network

* Deprecate sku for public ip update command
* `az network private-endpoint`: Support private dns zone group
* Enable local context feature for vnet/subnet parameter
* Fix wrong usage example in test_nw_flow_log_delete

### Packaging

* Drop support for Ubuntu/Disco package

### RBAC

* `az ad app create/update`: support --optional-claims as a parameter

### RDBMS

* Add Azure active directory administrator commands for PostgreSQL and MySQL

### Service Fabric

* Fix #12891: `az sf application update --application-parameters` removes old parameters that are not in the request
* Fix #12470 az sf create cluster, fix bugs in update durability and reliability and find vmss correctly through the code given a node type name

### SQL

* Add `az sql mi op list`, `az sql mi op get`, `az sql mi op cancel`
* `az sql midb`: update/show long term retention policy,  show/delete long term retention backups, restore long term retention backup

### Storage

* Upgrade azure-mgmt-storage to 9.0.0
* `az storage logging off`: Support turning off logging for a storage account
* `az storage account update`: Enable key auto-rotated for CMK
* `az storage account encryption-scope create/update/list/show`: Add support to customize encryption scope
* `az storage container create`: Add --default-encryption-scope and --deny-encryption-scope-override to set encryption scope for container level

### Survey

* Add switch to turn off survey link

## April 01, 2020

Version 2.3.1

### ACR

* Fix wrong version of azure-mgmt-containerregistry for Linux

### Profile

* az login: Fix login failure with cloud profiles other than `latest`

## March 31, 2020

Version 2.3.0

### ACR

* 'az acr task update': null pointer exception
* `az acr import`: Modify help and error message to clarify the usage of --source and --registry
* Add a validator for argument 'registry_name'
* `az acr login`:Remove the preview flag on '--expose-token'
* [BREAKING CHANGE] 'az acr task create/update' Branch parameter is removed
* 'az acr task update' Customer now can update context, git-token, and or triggers individually
* 'az acr agentpool': new feature

### AKS

* Fix apiServerAccessProfile when updating --api-server-authorized-ip-ranges
* aks update: Override outbound IPs with input values when update
* Do not create SPN for MSI clusters and support attach acr to MSI clusters

### AMS

* Fix #12469: adding Fairplay content-key-policy fails due to problems with 'ask' parameter

### AppConfig

* Add --skip-keyvault for kv export

### AppService

* Fix #12509: Remove the tag to az webapp up by default
* az functionapp create: Updated --runtime-version help menu and added warning when user specifies --runtime-version for dotnet
* az functionapp create: Updated the way javaVersion was being set for Windows function apps

### ARM

* az deployment create/validate: Use --handle-extended-json-format by default
* az lock create: Add examples of creating subresource in the help documentation
* az deployment {group/mg/sub/tenant} list: Support provisioningState filtering
* az deployment: Fix the parse bug for comment under the last argument

### Backup

* Added multiple files restore capabilities
* Added support for Backing up OS Disks only
* Added restore-as-unmanaged-disk parameter to specify unmanaged restore

### Compute

* az vm create: Add NONE option of --nsg-rule
* az vmss create/update: remove vmss automatic repairs preview tag
* az vm update: Support --workspace
* Fix a bug in VirtualMachineScaleSetExtension initialization code
* Upgrade VMAccessAgent version to 2.4
* az vmss set-orchestration-service-state: support vmss set orchestration service state
* Upgrade disk API version to 2019-11-01
* az disk create: add --disk-iops-read-only, --disk-mbps-read-only, --max-shares, --image-reference, --image-reference-lun, --gallery-image-reference, --gallery-image-reference-lun

### Cosmos DB

* Fix missing --type option for deprecation redirections

### Docker

* Update to Alpine 3.11 and Python 3.6.10

### Extension

* Allow to load extensions in the system path via packages

### HDInsight

* (az hdinsight create:) Support customers specify minimal supported tls version by using parameter `--minimal-tls-version`. The allowed value is 1.0,1.1,1.2

### IoT

* Add codeowner
* az iot hub create : Change default sku to S1 from F1
* iot hub: Support IotHub in the profile of 2019-03-01-hybrid

### IoTCentral

* Update error details, update default application template and prompt message

### KeyVault

* Support certificate backup/restore
* keyvault create/update: Support --retention-days
* No longer display managed keys/secrets while listing
* az keyvault create: support `--network-acls`, `--network-acls-ips` and `--network-acls-vnets` for specifying network rules while creating vault

### Lock

* az lock delete fix bug: az lock delete does not work on Microsoft.DocumentDB

### Monitor

* az monitor clone: support clone metric rules from one resource to another
* Fix IcM179210086: unable to create custom metric alert for their Application Insights metric

### NetAppFiles

* az volume create: Allow data protection volumes adding replication operations: approve, suspend, resume, status, remove

### Network

* az network application-gateway waf-policy managed-rule rule-set add: support Microsoft_BotManagerRuleSet
* network watcher flow-log show: fix wrong deprecating info
* support host names in application gateway listener
* az network nat gateway: support create empty resource without public ip or public ip prefix
* Support vpn gateway generation
* Support `--if-none-match` in `az network dns record-set {} add-record`

### Packaging

* Drop support for python 3.5

### Profile

* az login: Show warning for MFA error

### RDBMS

* Add server data encryption key management commands for PostgreSQL and MySQL

## March 10, 2020

Version 2.2.0

### ACR

* Fix: `az acr login` wrongly raise error
* Add new command `az acr helm install-cli`
* Add private link and CMK support
* add 'private-link-resource list' command

### AKS

* fix the aks browse in cloud shell
* az aks: Fix monitoring addon and agentpool NoneType errors
* Add --nodepool-tags to node pool when creating azure kubernetes cluster
* Add --tags when adding or updating a nodepool to cluster
* aks create: add `--enable-private-cluster`
* add --nodepool-labels when creating azure kubernetes cluster
* add --labels when adding a new nodepool to azure kubernetes cluster
* add missing / in the dashboard url
* Support create aks clusters enabling managed identity
* az aks: Validate network plugin to be either "azure" or "kubenet"
* az aks: Add aad session key support
* [BREAKING CHANGE] az aks: support msi changes for GF and BF for omsagent (Container monitoring)(#1)
* az aks use-dev-spaces: Adding endpoint type option to the use-dev-spaces command to customize the endpoint created on an Azure Dev Spaces controller

### AppConfig

* Unblock using "kv set" to add keyvault reference and feature …

### AppService

* az webapp create : Fix issue when running the command with --runtime
* az functionapp deployment source config-zip: Add an error message if resource group or function name are invalid/don't exist
* functionapp create: Fix the warning message that appears with `functionapp create` today which cites a `--functions_version` flag but erroneously uses a `_` instead of a `-` in the flag name
* az functionapp create: Updated the way linuxFxVersion and container image name were being set for linux function apps
* az functionapp deployment source config-zip: Fix an issue caused by app settings change racing condition during zip deploy, giving 5xx errors during deployment
* Fix #5720946: az webapp backup fails to set name

### ARM

* az resource: Improve the examples of the resource module
* az policy assignment list: Support listing policy assignments at Management Group scope
* Add `az deployment group` and `az deployment operation group` for template deployment at resource groups. This is a duplicate of `az group deployment` and `az group deployment operation`
* Add `az deployment sub` and `az deployment operation sub` for template deployment at subscription scope. This is a duplicate of `az deployment` and `az deployment operation`
* Add `az deployment mg` and `az deployment operation mg` for template deployment at management groups
* Add `az deployment tenant` and `az deployment operation tenant` for template deployment at tenant scope
* az policy assignment create: Add a description to the `--location` parameter
* az group deployment create: Add parameter `--aux-tenants` to support cross tenants

### CDN

* Add CDN WAF commands

### Compute

* az sig image-version: add --data-snapshot-luns
* az ppg show: add --colocation-status to enable fetching the colocation status of all the resources in the proximity placement group
* az vmss create/update: support automatic repairs
* [BREAKING CHANGE] az image template: rename template to builder
* az image builder create: add --image-template

### Cosmos DB

* Add Sql stored procedure, udf and trigger cmdlets
* az cosmosdb create: add --key-uri to support adding key vault encryption information

### KeyVault

* keyvault create: enable soft-delete by default

### Monitor

* az monitor metrics alert create: support `~` in `--condition`

### Network

* az network application-gateway rewrite-rule create: support url configuration
* az network dns zone import: --zone-name will be case insensitive in the future
* az network private-endpoint/private-link-service: remove preview label
* az network bastion: support bastion
* az network vnet list-available-ips: support list available ips in a vnet
* az network watcher flow-log create/list/delete/update: add new commands to manage watcher flow log and exposing --location to identify watcher explicitly
* az network watcher flow-log configure: deprecated
* az network watcher flow-log show: support --location and --name to get ARM-formatted result, deprecated old formatted output

### Policy

* az policy assignment create: Fix the bug that automatically generated name of policy assignment exceeds the limit

### RBAC

* az ad group show: fix --group value treated as regex problem

### RDBMS

* Bump the azure-mgmt-rdbms SDK version to 2.0.0
* az postgres private-endpoint-connection: manage postgres private endpoint connections
* az postgres private-link-resource: manage postgres private link resources
* az mysql private-endpoint-connection: manage mysql private endpoint connections
* az mysql private-link-resource: manage mysql private link resources
* az mariadb private-endpoint-connection: manage mariadb private endpoint connections
* az mariadb private-link-resource: manage mariadb private link resources
* Updating RDBMS Private Endpoint Tests

### SQL

* Sql midb Add: list-deleted, show-deleted, update-retention, show-retention
* (sql server create:) Add optional public-network-access 'Enable'/'Disable' flag to sql server create
* (sql server update:) make some customer-facing change
* Add minimal_tls_version property for MI and SQL DB

### Storage

* az storage blob delete-batch: Misbehaving `--dryrun` flag
* az storage account network-rule add (bug fix): add operation should be idempotent
* az storage account create/update: Add Routing Preference support
* Upgrade azure-mgmt-storage version to 8.0.0
* az storage container immutability create: add --allow-protected-append-write parameter
* az storage account private-link-resource list: Add support to list private link resources for storage account
* az storage account private-endpoint-connection approve/reject/show/delete: Support to manage private endpoint connections
* az storage account blob-service-properties update: add --enable-restore-policy and --restore-days
* az storage blob restore: Add support to restore blob ranges

## February 18, 2020

Version 2.1.0

### ACR

* Add a new argument `--expose-token` for `az acr login`
* Fix the incorrect output of `az acr task identity show -n Name -r Registry -o table`
* az acr login: Throw a CLIError if there are errors returned by docker command

### ACS

* aks create/update: add `--vnet-subnet-id` validation

### Aladdin

* Parse generated examples into commands' _help.py

### AMS

* az ams is GA now

### AppConfig

* Revise help message to exclude unsupported key/label filter
* Remove preview tag for most commands excluding managed identity and feature flags
* Add customer managed key when updating stores

### AppService

* az webapp list-runtimes: Fix the bug for list-runtimes
* Add az webapp|functionapp config ssl create
* Add support for v3 function apps and node 12

### ARM

* az policy assignment create: Fix the error message when the `--policy` parameter is invalid
* az group deployment create: Fix "stat: path too long for Windows" error when using large parameters.json file

### Backup

* Fix for item level recovery flow in OLR
* Add restore as files support for SQL and SAP Databases

### Compute

* vm/vmss/availability-set update: add --ppg to allowing updating ProximityPlacementGroup
* vmss create: add --data-disk-iops and --data-disk-mbps
* az vm host: remove preview tag for `vm host` and `vm host group`
* [BREAKING CHANGE] Fix #10728: `az vm create`: create subnet automatically if vnet is specified and subnet not exists
* Increase robustness of vm image list

### Eventhub

* Azure Stack support for 2019-03-01-hybrid profile

### KeyVault

* az keyvault key create: add a new value `import` for parameter `--ops`
* az keyvault key list-versions: support parameter `--id` for specifying keys
* Support private endpoint connections

### Network

* Bump to azure-mgmt-network 9.0.0
* az network private-link-service update/create: support --enable-proxy-protocol
* Add connection Monitor V2 feature

### Packaging

* [BREAKING CHANGE] Drop support for Python 2.7

### Profile

* Preview: Add new attributes `homeTenantId` and `managedByTenants` to subscription accounts. Please re-run `az login` for the changes to take effect
* az login: Show a warning when a subscription is listed from more than one tenants and default to the first one. To select a specific tenant when accessing this subscription, please include `--tenant` in `az login`

### Role

* az role assignment create: Fix the error that assigning a role to a service principal by display name yields a HTTP 400

### SQL

* Update SQL Managed Instance cmdlet `az sql mi update` with two new parameters: tier and family

### Storage

* [BREAKING CHANGE] `az storage account create`: Change default storage account kind to StorageV2

## February 04, 2020

Version 2.0.81

### ACS

* Add support to set outbound allocated ports and idle timeouts on standard load balancer
* Update to API Version 2019-11-01

### ACR

* [BREAKING CHANGE] `az acr delete` will prompt
* [BREAKING CHANGE] 'az acr task delete' will prompt
* Add a new command group 'az acr taskrun show/list/delete' for taskrun management

### AKS

* Each cluster gets a separate service principal to improve isolation

### AppConfig

* Support import/export of keyvault references from/to appservice
* Support import/export of all labels from appconfig to appconfig
* Validate key and feature names before setting and importing
* Expose sku modification for configuration store.
* Add command group for managed identity.

### AppService

* Azure Stack: surface commands under the profile of 2019-03-01-hybrid
* functionapp: Add ability to create Java function apps in Linux

### ARM

* Fix issue #10246: `az resource tag` crashes when the parameter `--ids` passed in is resource group ID
* Fix issue #11658: `az group export` command does not support `--query` and `--output` parameters
* Fix issue #10279: The exit code of `az group deployment validate` is 0 when the verification fails
* Fix issue #9916: Improve the error message of the conflict between tag and other filter conditions for `az resource list` command
* Add new parameter `--managed-by` to support adding managedBy information for command `az group create`

### Azure Red Hat OpenShift

* Add `monitor` subgroup to manage Log Analytics monitoring in Azure Red Hat OpensShift cluster

### BotService

* Fix issue #11697: `az bot create` is not idempotent
* Change name-correcting tests to run in Live-mode only

### CDN

* Add support for rulesEngine feature
* Add new commands group 'cdn endpoint rule' to manage rules
* Update azure-mgmt-cdn version to 4.0.0 to use api version 2019-04-15

### Deployment Manager

* Add list operation for all resources.
* Enhance step resource for new step type.
* Update azure-mgmt-deploymentmanager package to use version 0.2.0.

### IoT

* Deprecate 'IoT hub Job' commands.

### IoT Central

* Support app creation/update with the new sku name ST0, ST1, ST2.

### Key Vault

* Add a new command `az keyvault key download` for downloading keys.

### Misc

* Fix #6371: Support filename and environment variable completion in Bash

### Network

* Fix #2092: az network dns record-set add/remove: add warning when record-set is not found. In the future, an extra argument will be supported to confirm this auto creation.

### Policy

* Add new command `az policy metadata` to retrieve rich policy metadata resources
* `az policy remediation create`: Specify whether compliance should be re-evaluated prior to remediation with the `--resource-discovery-mode` parameter

### Profile

* `az account get-access-token`: Add `--tenant` parameter to acquire token for the tenant directly, needless to specify a subscription

### RBAC

* [BREAKING CHANGE] Fix #11883: `az role assignment create`: empty scope will prompt error

### Security

* Add new commands `az atp show` and `az atp update` to view and manage advanced threat protection settings for storage accounts.

### SQL

* `sql dw create`: deprecate `--zone-redundant` and `--read-replica-count` parameters. These parameters do not apply to DataWarehouse.
* [BREAKING CHANGE] `az sql db create`: Remove "WideWorldImportersStd" and "WideWorldImportersFull" as documented allowed values for "az sql db create --sample-name". These sample databases would always cause creation to fail.
* Add New commands `sql db classification show/list/update/delete` and `sql db classification recommendation list/enable/disable` to manage sensitivity classifications for SQL databases.
* `az sql db audit-policy`: Fix for empty audit actions and groups

### Storage

* Add a new command group `az storage share-rm` to use the Microsoft.Storage resource provider for Azure file share management operations.
* Fix issue #11415: permission error for `az storage blob update`
* Integrate Azcopy 10.3.3 and support Win32.
* `az storage copy`: Add `--include-path`, `--include-pattern`, `--exclude-path` and`--exclude-pattern` parameters
* `az storage remove`: Change `--inlcude` and `--exclude` parameters to `--include-path`, `--include-pattern`, `--exclude-path` and`--exclude-pattern` parameters
* `az storage sync`: Add `--include-pattern`, `--exclude-path` and`--exclude-pattern` parameters

### ServiceFabric

* Add new commands to manage appliaction and services.

## January 13, 2020

Version 2.0.80

### Compute

* disk update: Add --disk-encryption-set and --encryption-type
* snapshot create/update: Add --disk-encryption-set and --encryption-type

### Storage

* Upgrade azure-mgmt-storage version to 7.1.0
* `az storage account create`: Add `--encryption-key-type-for-table` and `--encryption-key-type-for-queue` to support Table and Queue Encryption Service

## January 07, 2020

Version 2.0.79

### ACR

* [BREAKING CHANGE] Remove '--os' parameter for 'acr build', 'acr task create/update', 'acr run', and 'acr pack'. Use '--platform' instead.

### AppConfig

* Add support for importing/exporting feature flags
* Add new command 'az appconfig kv set-keyvault' for creating keyvault reference
* Support various naming conventions when exporting feature flags to file

### AppService

* Fix issue #7154: Updating documentation for command <> to use back ticks instead of single quotes
* Fix issue #11287: webapp up: By default make the app created using up 'should be 'SSL enabled'
* Fix issue #11592: Add az webapp up flag for html static sites

### ARM

* Fix `az resource tag`: Recovery Services Vault tags cannot be updated

### Backup

* Added new command 'backup protection undelete' to enable soft-delete feature for IaasVM workload
* Added new parameter '--soft-delete-feature-state' to set backup-properties command
* Added disk exclusion support for IaasVM workload

### Compute

* Fix `vm create` failure in Azure Stack profile.
* vm monitor metrics tail/list-definitions: support query metric and list definitions for a vm.
* Add new reapply command action for az vm

### HDInsight

* Support for creating a Kafka cluster with Kafka Rest Proxy
* Upgrade azure-mgmt-hdinsight to 1.3.0

### Misc.

* Add preview command `az version show` to show the versions of Azure CLI modules and extensions in JSON format by default or format configured by --output

### Event Hubs

* [BREAKING CHANGE] Remove 'ReceiveDisabled' status option from command 'az eventhubs eventhub update' and 'az eventhubs eventhub create'. This option is not valid for Event Hub entities.

### Service Bus

* [BREAKING CHANGE] Remove 'ReceiveDisabled' status option from command 'az servicebus topic create', 'az servicebus topic update', 'az servicebus queue create', and 'az servicebus queue update'. This option is not valid for Service Bus topics and queues.

### RBAC

* Fix #11712: `az ad app/sp show` does not return exit code 3 when the application or service principal does not exist

### Storage

* `az storage account create`: Remove preview flag for --enable-hierarchical-namespace parameter
* Update azure-mgmt-storage version to 7.0.0 to use api version 2019-06-01
* Add new parameters `--enable-delete-retention` and `--delete-retention-days` to support managing delete retention policy for storage account blob-service-properties.

## December 17, 2019

2.0.78

### ACR

* Added support Local context in acr task run

### ACS

* [BREAKING CHANGE]az openshift create: rename `--workspace-resource-id` to `--workspace-id`.

### AMS

* Updated show commands to return 3 when resource not found

### AppConfig

* Fixed bug when appending api-version to request url. The existing solution doesn't work with pagination.
* Added support for showing languages besides English as our backend service support unicode for globalization.

### AppService

* Fixed issue #11217: webapp: az webapp config ssl upload should support slot parameter
* Fixed issue #10965: Error: Name cannot be empty. Allow remove by ip_address and subnet
* Added support for importing certificates from Key Vault `az webapp config ssl import`

### ARM

* Updated azure-mgmt-resource package to use 6.0.0
* Cross Tenant Support for `az group deployment create` command by adding new parameter `--aux-subs`
* Added new parameter `--metadata` to support adding metadata information for policy set definitions.

### Backup

* Added Backup support for SQL and SAP Hana workload.

### BotService

* [Breaking change] Remove '--version' flag from preview command 'az bot create'. Only v4 SDK bots are supported.
* Added name availability check for 'az bot create'.
* Added support for updating the icon URL for a bot via 'az bot update'.
* Added support for updating a Direct Line channel via 'az bot directline update'.
* Added '--enable-enhanced-auth' flag support to 'az bot directline create'.
* The following command groups are GA and not in preview: 'az bot authsetting'.
* The following commands in 'az bot' are GA and not in preview: 'create', 'prepare-deploy', 'show', 'delete', 'update'.
* Fixed 'az bot prepare-deploy' changing '--proj-file-path' value to lower case (e.g. "Test.csproj" to "test.csproj").

### Compute

* vmss create/update: Added --scale-in-policy, which decides which virtual machines are chosen for removal when a VMSS is scaled-in.
* vm/vmss update: Added --priority.
* vm/vmss update: Added --max-price.
* Added disk-encryption-set command group (create, show, update, delete, list).
* disk create: Added --encryption-type and --disk-encryption-set.
* vm/vmss create: Added --os-disk-encryption-set and --data-disk-encryption-sets.

### Core

* Removed support for Python 3.4
* Plug in HaTS survey in multiple commands

### DLS

* Updated ADLS sdk version (0.0.48).

### Install

* Install script support python 3.8

### IOT

* [BREAKING CHANGE] Removed --failover-region parameter from manual-failover. Now it will failover to assigned geo-paired secondary region.

### Key Vault

* Fixed #8095: `az keyvault storage remove`: improve the help message
* Fixed #8921: `az keyvault key/secret/certificate list/list-deleted/list-versions`: fix the validation bug on parameter `--maxresults`
* Fixed #10512: `az keyvault set-policy`: improve the error message when none of `--object-id`, `--spn` or `--upn` is specified
* Fixed #10846: `az keyvault secret show-deleted`: when `--id` is specified, `--name/-n` is not required
* Fixed #11084: `az keyvault secret download`: improve the help message of parameter `--encoding`

### Network

* az network application-gateway probe: Added support --port option to specify a port for probing backend servers when create and update
* az network application-gateway url-path-map create/update: bug fix for `--waf-policy`
* az network application-gateway: Added support `--rewrite-rule-set`
* az network list-service-aliases: Added support list service aliases which can be used for Service Endpoint Policies
* az network dns zone import: Added support .@ in record name

### Packaging

* Added back edge builds for pip install
* Added Ubuntu eoan package

### Policy

* Added support for Policy API version 2019-09-01.
* az policy set-definition: Added support grouping within policy set definitions with `--definition-groups` parameter

### Redis

* Added preview param `--replicas-per-master` to `az redis create` command
* Updated azure-mgmt-redis from 6.0.0 to 7.0.0rc1

### ServiceFabric

* Fixed in node-type add logic including #10963: Adding new node type with durability level Gold will always throw CLI error
* Updated ServiceFabricNodeVmExt version to 1.1 in creation template

### SQL

* Added "--read-scale" and "--read-replicas" parameters to sql db create and update commands, to support read scale management.

### Storage

* GA Release Large File Shares property for storage account create and update command
* GA Release User Delegation SAS token Support
* Added new commands `az storage account blob-service-properties show` and `az storage account blob-service-properties update --enable-change-feed` to manage blob service properties for storage account.
* [COMING BREAKING CHANGE] `az storage copy`: `*` character is no longer supported as a wildcard in URL, but new parameters --include-pattern and --exclude-pattern will be added with `*` wildcard support.
* Fixed issue #11043: Added support to remove whole container/share in `az storage remove` command

## November 26, 2019

Version 2.0.77

### ACR

* Deprecated parameter `--branch` from acr task create/update

### Azure Red Hat OpenShift

* Added `--workspace-resource-id` flag to allow creation of Azure Red Hat Openshift cluster with monitoring
* Added `monitor_profile` to create Azure Red Hat OpenShift cluster with monitoring

### AKS

* Added support cluster certificate rotation operation using "az aks rotate-certs".

### AppConfig

* Added support for using ":" for `as az appconfig kv import` separator
* Fixed issue for listing key values with multiple labels including null label. 
* Updated management plane sdk, azure-mgmt-appconfiguration, to version 0.3.0. 

### AppService

* Fixed issue #11100: AttributeError for az webapp up when create service plan
* az webapp up: Forcing the creation or deployment to a site for supported languages, no defaults used.
* Added support for App Service Environment: az appservice ase show | list | list-addresses | list-plans | create | update | delete

### Backup

* Fixed issue in az backup policy list-associated-items. Added optional BackupManagementType parameter.

### Compute

* Upgraded API version of compute, disks, snapshots to 2019-07-01
* vmss create: Improvement for --orchestration-mode
* sig image-definition create: Added --os-state to allow specifying whether the virtual machines created under this image are 'Generalized' or 'Specialized'
* sig image-definition create: Added --hyper-v-generation to allow specifying the hypervisor generation
* sig image-version create: Added support --os-snapshot and --data-snapshots
* image create: Added --data-disk-caching to allow specifying caching setting of data disks
* Upgraded Python Compute SDK to 10.0.0
* vm/vmss create: Added 'Spot' to 'Priority' enum property
* [Breaking change] Renamed '--max-billing' parameter to '--max-price', for both VM and VMSS, to be consistent with Swagger and Powershell cmdlets
* vm monitor log show: Added support for querying log over linked log analytics workspace.

### IOT

* Fix #2531: Added convenience arguments for hub update.
* Fix #8323: Added missing parameters to create storage custom endpoint.
* Fix regression bug: Reverted the changes which overrides the default storage endpoint.

### Key Vault

* Fixed #11121: When using `az keyvault certificate list`, passing `--include-pending` now doesn't require a value of `true` or `false`

### NetAppFiles

* Upgraded azure-mgmt-netapp to 0.7.0 which includes some additional volume properties associated with upcoming replication operations

### Network

* application-gateway waf-config: deprecated
* application-gateway waf-policy: Added subgroup managed-rules to manage managed rule sets and exclusion rules
* application-gateway waf-policy: Added subgroup policy-setting to manage global configuration of a waf-policy
* [BREAKING CHANGE] application-gateway waf-policy: Renamed subgroup rule to custom-rule
* application-gateway http-listener: Added --firewall-policy when create
* application-gateway url-path-map rule: Added --firewall-policy when create

### Packaging

* Rewrote the az wrapper in Python
* Added support for Python 3.8
* Changed to Python 3 for RPM package

### Profile

* Polished error when running `az login -u {} -p {}` with Microsoft account
* Polished `SSLError` when running `az login` behind a proxy with self-signed root certificate
* Fixed #10578: `az login` hangs when more than one instances are launched at the same time on Windows or WSL
* Fixed #11059: `az login --allow-no-subscriptions` fails if there are subscriptions in the tenant
* Fixed #11238: After renaming a subscription, logging in with MSI will result in the same subscription appearing twice

### RBAC

* Fixed #10996: Polish error for `--force-change-password-next-login` in `az ad user update` when `--password` is not specified

### Redis

* Fixed #2902: Avoid setting memory configs while updating Basic SKU cache

### Reservations

* Upgraded SDK Version to 0.6.0
* Added billingplan details info after calling Get-Gatalogs
* Added new command `az reservations reservation-order calculate` to calculate the price for a reservation
* Added new command `az reservations reservation-order purchase` to purchase a new reservation

### Rest
* Changed `az rest` to GA

### SQL

* Updated azure-mgmt-sql to version 0.15.0.

### Storage

* storage account create: Added --enable-hierarchical-namespace to support filesystem semantics in blob service.
* Removed unrelated exception from error message
* Fixed issues with incorrect error message "You do not have the required permissions needed to perform this operation." when blocked by network rules or AuthenticationFailed.

## November 4, 2019

Version 2.0.76

### ACR

* Added a preview parameter `--pack-image-tag` to command `az acr pack build`.
* Added support for enabling auditing on creating a registry
* Added support for Repository-scoped RBAC

### AKS

* Added `--enable-cluster-autoscaler`, `--min-count` and `--max-count` to the `az aks create` command, which enables cluster autoscaler for the node pool.
* Added the above flags as well as `--update-cluster-autoscaler` and `--disable-cluster-autoscaler` to the `az aks update` command, allowing updates to cluster autoscaler.

### AppConfig

* Added appconfig feature command group to manage feature flags stored in an App Configuration.
* Fixed minor bug for appconfig kv export to file command. Stop reading dest file contents during export.

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
* database: Added deprecation information
* collection: Added deprecation information

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
* `az network public-ip prefix create`: Added support to specify IP address version (IPv4, IPv6) when creation
* Bumped azure-mgmt-network to 7.0.0 and api-version to 2019-09-01
* `az network vrouter`: Added support for new service virtual router and virtual router peering
* `az network express-route gateway connection`: Added support for `--internet-security`

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
* [BREAKING CHANGE] Renamed parameter `--name -n` changed to `--registry -r ` for `acr config` command group

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
  * Added `MountConfigurations` for file system mounts (see [Request Body](/rest/api/batchservice/pool/add#request-body) for details)
  * Added optional property `publicIPs` on `NetworkConfiguration` for public IPs on pools
    (see [Request Body](/rest/api/batchservice/pool/add#request-body) for details)
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
  [Configure Azure Storage connection strings](/azure/storage/common/storage-configure-connection-string).

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
* Fixed `%s` not processed because of missing `% server_type` (#3393)
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

# [Beta release notes](#tab/azure-cli-beta)

## February 8, 2021

> [!NOTE]
>
>  BREAKING CHANGES are introduced in this release.  Carefully read all release notes prior to installation.
>
> The beta version does not guarantee product level quality so it should not be used in your production environment.

* Azure CLI beta internally replaces [ADAL](https://github.com/AzureAD/azure-activedirectory-library-for-python) with [Azure Identity](https://github.com/Azure/azure-sdk-for-python/tree/master/sdk/identity/azure-identity) and [MSAL](https://github.com/AzureAD/microsoft-authentication-library-for-python). Existing ADAL token cache (`~/.azure/accessToken.json`) will be migrated to MSAL encrypted token cache automatically when any command requiring a credential is executed.

* There are several changes to `az login`.  (Run `az login --help` for more details.)
  * [BREAKING CHANGE] `~/.azure/accessToken.json` will no longer be created after a successful login. To get an access token, use [`az account get-access-token`](https://docs.microsoft.com/cli/azure/account#az_account_get_access_token) instead.
  * [BREAKING CHANGE] `--use-cert-sn-issuer` argument is not supported.
  * After logging in with a managed identity, all `clientId`, `objectId` and `resourceId` will be shown.
  * Fix #13188: `az login` with managed identity indicating system assigned when the identity is user assigned.

* [BREAKING CHANGE] Skip SSL verification via environment `ADAL_PYTHON_SSL_NO_VERIFY` has been removed. See [work behind a proxy](https://docs.microsoft.com/cli/azure/use-cli-effectively#work-behind-a-proxy) for trusting a self-signed root certificate.

The beta version of the Azure CLI supports all commands and will stay in sync with the current released version.  

For installation instructions, see [Install Azure CLI beta version](install-azure-cli-beta.md). 

If you find issues in the beta release, the Azure CLI engineering team welcomes your comments on [GitHub](https://github.com/Azure/azure-cli/issues/new/choose).

---
