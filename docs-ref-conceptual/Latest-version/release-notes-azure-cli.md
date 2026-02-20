---
title: Release notes & updates – Azure CLI | Microsoft Docs
description: Learn about the latest Azure Command-Line Interface (CLI) release notes and updates for both the current and beta versions of the CLI
ms.date: 02/03/2026
ms.service: azure-cli
ms.custom: devx-track-azurecli
keywords: azure cli updates, azure cli notes, azure cli versions
---

# Azure CLI release notes

## February 03, 2026

Version 2.83.0

### ACR

* `az acr config content-trust update`: Add breaking changes announcement that `enabled` status will no longer be accepted
* `az acr check-health`: Add breaking change announcement that Notary client check will be removed

### AKS

* `az aks create`: Enable ACStor v2 without any storage options on a new cluster by `--enable-azure-container-storage` parameter
* `az aks update`: Enable the ephemeral disk storage option of ACStor v2 by `--enable-azure-container-storage ephemeralDisk` parameter
* `az aks update`: Disable the elastic SAN storage option of ACStor v2 by `--disable-azure-container-storage elasticSan` parameter
* `az aks update`: Disable ACStor v2 by `--disable-azure-container-storage` parameter

### App Config

* `az appconfig`: Add option `anonymous` for `--auth-mode` parameter

### App Service

* Fix #32290: `az functionapp config appsettings set`: Fix command failure when using `--slot-settings` parameter to update existing slot settings

### Cognitive Services

* `az cognitiveservices agent logs show`: Add console log streaming for hosted agents
* `az cognitiveservices agent create`: Add `--show-logs` flag for deployment troubleshooting
* `az cognitiveservices agent start`: Add `--show-logs` and `--timeout` flags

### Container app

* `az containerapp env create`: Update the error display for ConsumptionOnly environment creation

### Core

* Resolve CVE-2025-69277
* Resolve CVE-2026-21441
* Resolve CVE-2025-12084
* Resolve CVE-2026-21226
* Replace GitHub URLs with AME Storage for network isolated requirements

### MySQL

* `az mysql flexible-server restore`: Support restore server to different subscription
* `az mysql flexible-server geo-restore`: Support geo restore server to different subscription
* `az mysql flexible-server replica create`: Support create server replica to different subscription

### Network

* `az network vnet-gateway`: Add identity-related parameters and subgroup
* `az network vpn-connection`: Add `--auth-type` and `--cert-auth` parameters
* `az network virtual-network-appliance`: Support Virtual Network Appliance feature
* `az network ddos-custom-policy`: Support DDoS Policy Customization

### Packaging

* Optimize MSI upgrade performance by simplifying file replacement logic

### PostgreSQL

* `az postgres flexible-server create/georestore/replica`: Allow SSDV2 servers to perform create replica and geo restore

### Profile

* `az login`: For managed identity authentication, no longer retrieve the FQDN of the machine, bypassing hanging or error caused by misconfigured network setup

### Storage

* Fix #32503: `az storage file list`: Fix listing files when using Oauth without Reader access
* `az storage account file-service-properties update`: Add `--require-smb-encryption-in-transit` and `--require-nfs-encryption-in-transit`
* `az storage account create/update`: Add `--publish-ipv6-endpoint`
* `az storage account network-rule add/remove`: Add `--ipv6-address`
* `az storage account create/update`: Set `--min-tls-version` to `tls1_2` if the value provided is `tls1_0` and `tls1_1`

## January 13, 2026

Version 2.82.0

### ACR

* `az acr login`: Enforce using acr audience in aad token acquisition

### AKS

* Fix #15932: `az aks install-cli`: Add `--gh-token` parameter to allow authentication when downloading kubelogin
* `az aks nodepool update`: Add GPU driver install options `install` and `none` for `--gpu-driver` parameter
* `az aks nodepool add/update`: Add option `Ubuntu2404` to `--os-sku` parameter

### App Service

* `az appservice list-locations`: Add `--managed-instance-enabled` parameter for managed instances

### Cognitive Services

* `az cognitiveservices agent create`: Add ability to create and deploy hosted agent in AI Foundry

### Compute

* `az vmss list-instances`: Add new argument `--resiliency-view` to show resiliency status of each instance
* `az vmss get-resiliency-view`: Add new command to show resiliency status of each instance
* `az sig image-version create/update`: Add warning message for Azure Compute Gallery resources from api-version `2026-03-03`

### Container app

* `az containerapp env create`: Add parameter `--infrastructure-resource-group` to support specifying name for resource group that will contain infrastructure resources
* Fix #32594: `az containerapp compose create`: Fix `TypeError` when docker-compose file include `env_file` without `environment`

### Core

* Resolve CVE-2025-66418
* Resolve CVE-2025-66471

### Cosmos DB

* `az cosmosdb fleet`: Add new fleet feature
* `az cosmosdb create/update`: Add support for `--disable-local-auth`
* `az cosmosdb restore`: Fix for cross region restore for cosmosdb

### Identity

* `az identity create`: Add new `--isolation-scope` parameter to support identity isolation scope
* `az identity update`: Add new command to support updating an identity

### Key Vault

* `az keyvault key create/import`: Add `--default-data-disk-policy` to support new default SKR policy

### Monitor

* `az monitor dashboard`: Support dashboard with Grafana

### MySQL

* `az mysql flexible-server backup delete`: Support deletion of on-demand backup

### Network

* `az network application-gateway settings`: Support `enableL4ClientIpPreservation` property via `--enable-l4-client-ip`
* `az network application-gateway probe`: Support `enableProbeProxyProtocolHeader` property via `--enable-proxy-header`
* `az network application-gateway waf-policy managed-rule rule-set`: Support disabled rules by default
* `az network virtual-appliance`: Add `--nva-interface-configurations` parameter
* `az network watcher flow-log`: Add `--record-types` parameter
* `az network private-endpoint-connection`: Add provider `Microsoft.Maps/accounts`

### Packaging

* Pin pywin32 to version 310 to resolve the MSI upgrade issue

### RDBMS

* `az postgres flexible-server update/fabric-mirroring`: Allow high availability enabled servers to start fabric mirroring if PG version 17+
* `az postgres flexible-server create/update`: Show high availability feature with zonal resiliency argument
* `az postgres flexible-server create/update`: Enable support for High Availability on servers with PremiumV2_LRS storage type
* `az postgres flexible-server index-tuning`: Deprecate and redirect to `az postgres flexible-server autonomous-tuning` command group
* `az postgres flexible-server autonomous-tuning list-index-recommendations/list-table-recommendations`: Support listing index recommendations and table recommendations
* `az postgres flexible-server update`: Fix bug for using argument `--standby-zone` when enabling high availability
* `az postgres flexible-server upgrade`: Allow major version upgrade to PostgreSQL Version 18
* `az postgres flexible-server create`: Add database name field for create with cluster
* `az postgres flexible-server backup/db/firewall-rule/identity/long-term-retention/microsoft-entra-admin/migration/parameter/replica list`: Allow `--ids` use for list commands
* `az postgres flexible-server create`: Change database name field to default to None
* `az postgres flexible-server replica create`: Add `--name` argument to specify read replica name

### SQL

* `az sql mi create/update`: Add memory size in gb parameter

### Storage

* `az storage blob/container/fs generate-sas`: Add `--user-delegation-oid`
* `az storage fs file generate-sas`: Add command and support `--user-delegation-oid`
* `az storage fs directory generate-sas`: Add `--user-delegation-oid`
* `az storage share/file/queue generate-sas`: Add `--as-user` and `--user-delegation-oid`

## December 02, 2025

Version 2.81.0

### AKS

* `az aks safeguards`: Add `--pss-level` parameter to support Pod Security Standards
* `az aks safeguards create`: Add validation to prevent duplicate resource creation

### ARM

* Fix #32098: `az bicep install`: Fix a bug where the installation was skipped when `--version` was specified unless `bicep.use_binary_from_path` was explicitly set to `false`

### Compute

* `az vm/vmss application set`: Add new parameter `--enable-automatic-upgrade` to support enabling application automatic upgrade

### NetAppFiles

* `az netappfiles volume-group create`: Add `--network-features` parameter for volume groups
* `az netappfiles volume replication list`: Add `--exclude` parameter to exclude deleted replications

## November 18, 2025

Version 2.80.0

### AKS

* [BREAKING CHANGE] `az aks create`: Make `--no-ssh-key` default behaviour
* `az aks namespace add/update/show/list/delete/get-credentials`: Add namespace command to support managed namespace feature
* `az aks create`: Add `KataVmIsolation` option for `--workload-runtime` parameter
* `az aks nodepool add`: Add `KataVmIsolation` option for `--workload-runtime` parameter
* `az aks mesh enable-egress-gateway/disable-egress-gateway`: Add commands to manage Azure Service Mesh egress gateway
* `az aks nodepool add/update`: Add parameter `--localdns-config` to config local dns profile for the nodepool
* `az aks upgrade`: Update user confirmation prompt of `--control-plane-only` parameter

### App Service

* `az appservice plan`: Add features for managed instance app service plans
* `az functionapp plan create`: Add elastic premium as supported SKU for zone redundency

### Batch

* [BREAKING CHANGE] `az batch pool create`: Remove deprecated argument `--target-communication` and `--resource-tags`
* [BREAKING CHANGE] `az batch pool reset/set`: Remove deprecated argument `--target-communication`

### Cognitive Services

* `az cognitiveservices account connection`: Add AI Foundry account connection management
* `az cognitiveservices account project`: Add AI Foundry account project management
* `az cognitiveservices account project connection`: Add AI Foundry account project connection management
* `az cognitiveservice agent`: Add command group

### Compute

* `az vm/vmss create/update`: Support `--add-proxy-agent-extension` parameter to specify whether to implicitly install the ProxyAgent Extension

### Container app

* `az containerapp env`: Remove `--min-replicas/max-replicas` from premium ingress

### DMS

* `az dms project create`: Change location parameter to be optional

### NetAppFiles

* [BREAKING CHANGE] `az netappfiles volume create/update`: Remove deprecated argument `--endpoint-type`, this property is readOnly

### Network

* `az network application-gateway http-settings`: Support dedicated backend connection and certificate validation
* `az network application-gateway waf-policy managed-rule`: Support `Microsoft_HTTPDDoSRuleSet` rule set
* `az network application-gateway waf-policy`: Remove option `None` for WAF rule sensitivity
* `az network private-endpoint-connection`: Add provider `Microsoft.Security/privateLinks`

### Packaging

* Drop Python 3.9 support

### RDBMS

* [BREAKING CHANGE] `az postgres server/db/server-logs`: Remove single server commands
* [BREAKING CHANGE] `az postgres flexible-server create`: Remove default value to `--version` and remove arguments `--create-default-database` and `--database-name`

### Service Fabric

* [BREAKING CHANGE] `az sf managed-application update`: Remove argument options `--service-type-policy`, `--upgrade-replica-set-check-timeout`, `--max-porcent-unhealthy-partitions`, `--max-porcent-unhealthy-replicas`, `--max-porcent-unhealthy-services`, `--max-porcent-unhealthy-apps` to fix `--help` formatting
* [BREAKING CHANGE] `az sf application update`: Remove argument options `--service-type-policy`, `--upgrade-replica-set-check-timeout`, `--instance-close-duration`, `--consider-warning-as-error`, `--max-percent-unhealthy-partitions`. `--max-percent-unhealthy-replicas`, `--max-percent-unhealthy-replicas`, `--max-percent-unhealthy-deployed-applications` to fix `--help` formatting

### Storage

* `az storage account failover`: Add `Unplanned` to `--failover-type` for Planned failover GA
* Fix #32399: `az storage file list`: Fix not showing additional info when listing files without set protocol

## November 04, 2025

Version 2.79.0

### ACR

* `az acr create/update`: Remove preview flag for `--role-assignment-mode`
* `az acr check-health`: Remove preview flag for `--repository`
* `az acr task create/update`: Remove preview flag for `--source-acr-auth-id`
* `az acr build/run`: Remove preview flag for `--source-acr-auth-id`
* `az acr config content-trust`: Add deprecation notice
* `az acr config content-trust show/update`: Add deprecation notice

### AKS

* `az aks update`: Add support to remove existing certificates by setting the value of `--custom-ca-trust-certificates` to an empty file
* `az aks create/update`: Add `--acns-advanced-networkpolicies` parameter to support enabling advanced networking policies (`None`, `L7` or `FQDN`)

### ARM

* `az resource list`: Include `provisioningState` property in table output

### Backup

* `az backup vault deleted-vault`: Implementing List and Undelete for Deleted Backup Vaults

### Compute

* `az vm availability-set update`: Add new parameter `--enable-all-instance-down` to support setting scheduled events profile
* `az vm availability-set update`: Add new parameter `--scheduled-events-api-version` to support setting scheduled events profile

### Container app

* `az containerapp`: Update Api-version to 2025-07-01
* `az containerapp env http-route-config`: Add command group to manage environment level http routing
* `az containerapp env premium-ingress`: Add command group to configure premium ingress settings for the environment
* Fix #32107: `az containerapp registry show`: Fix NoneType error when container app doesn't have any registry server

### Core

* Resolve CVE-2025-9230
* Resolve CVE-2025-9232

### HDInsight

* `az hdinsight create`: Support creating Entra-enabled clusters and creating clusters with WASB + MSI
* `az hdinsight credentials update`: Update cluster credentials
* `az hdinsight credentials show`: Show current cluster credentials

### Network

* `az network application-gateway create/update`: Add parameter `--enable-fips`

### SQL

* `az sql db update`: Prevent overwrite of SLO when updating from serverless to provisioned
* `az db ltr-backup/ltr-policy`: Remove preview tag for time-based immutability

### Storage

* `az storage account network-security-perimeter-configuration list/show/reconcile`: Add support for network-security-perimeter
* `az storage file list`: Fix file list for nfs shares, as `--include` is not supported
* `az storage account create/update`: Add `--enable-blob-geo-priority-replication` to support Geo SLA
* `az storage account or-policy create/update`: Add `--priority-replication` to support OR SLA

## October 14, 2025

Version 2.78.0

### ACS

* `az aks create`: Pre-announce `--no-ssh-key` default behaviour breaking change

### AKS

* `az aks nodepool add/update`: Add option `AzureLinux3` to `--os-sku` parameter
* `az aks create/update`: Fix handling for `--container-storage-version` parameter
* `az aks create`: Fix the issue where enabling v1 container storage does not fail if the VM SKU field is left empty
* `az aks get-credentials`: Convert device code mode kubeconfig to Azure CLI token format to bypass conditional access login blocks

### App Config

* `az appconfig kv export`: Escape keys only when exporting to properties file
* `az appconfig kv set/import`: Add support for JSON comments

### App Service

* Fix #32044: `az functionapp deployment source config-zip`: Fix uploaded blob not containing content
* `az functionapp create`: Remove preview from Flex Consumption parameters
* `az functionapp create`: Add the `--domain-name-scope` support
* `az webapp config appsettings set`: Fix SyntaxWarning invalid decimal literal
* `az appservice plan create/update`: Add async scaling parameter `--async-scaling-enabled`
* `az webapp deploy`: Encode target path parameter
* `az webapp deploy`: Change the token retrieval function to use the App Service Audience
* `az webapp create`: Include regional site name availability check for DNL site creations

### ARM

* `az deployment`: Fix bicep template size inflation with differential template handling
* Fix #31581: `az deployment group create`: Fix error message being hidden when template validation fails

### Backup

* `az backup protection reconfigure`: Add new command to support reconfiguring backup to an alternate vault

### Batch

* Fix #32086, #32090: `az batch application package create`: Fix blob not being uploaded

### Cognitive Services

* `az cognitiveservices account create`: Add `--allow-project-management` argument
* `az cognitiveservices account update`: Add `--kind` argument for OpenAI<->AIServices account

### Compute

* Fix #31198: `az sig image-version`: Fix `--no-wait` not working
* Fix #31929: `az vm/vmss update`: Fix `--wire-server-profile-id` and `--imds-profile-id` update
* `az vm disk attach`: Add new parameter `--new-names-of-source-snapshots-or-disks` to support setting the name of create new disk from a snapshot or another disk
* `az vm disk attach`: Add new parameter `--new-names-of-source-disk-restore-point` to support setting the name of create new disk from a disk restore point
* `az vm availability-set`: Add new command to support validating migration from availability sets to VMSS
* `az vm availability-set`: Add new command to support starting migration from availability sets to VMSS
* `az vm availability-set`: Add new command to support canceling migration from availability sets to VMSS
* `az vm availability-set`: Add new command to support converting availability sets to VMSS
* `az vm`: Add new command `migrate-to-vmss` to support migratiing VM to VMSS
* `az disk create/update`: Add new parameter `--supported-security-option` to support setting supported security option
* `az disk create/update`: Add new parameter `--action-on-disk-delay` to support setting disk availability policy

### Key Vault

* `az keyvault create`: Support `--network-acls-ips` while creating Managed HSM
* `az keyvault network-rule add/remove/list/wait`: Support ip rule configuration for Managed HSM

### MySQL

* `az mysql flexible-server create/update`: Support Accelerated Logs for GeneralPurpose

### NetAppFiles

* `az netappfiles volume splitclonefromparent`: Add new command to split clone volume from parent volume
* `az netappfiles volume create`: Add parameter `--grow-pool-clone-split`
* `az netappfiles pool create`: Add new Enum value `Flexible` for `ServiceLevel`
* `az netappfiles volume create`: Add new Enum value `Flexible` for `ServiceLevel`
* `az netappfiles pool create`: Add parameter `--custom-throughput-mibps`

### Network

* `az network nat gateway create`: Support `--sku` to accept `standardv2`
* `az network public-ip create`: Support `--sku` to accept `standardv2`
* `az network vnet-gateway create`: Remove public IP requirement in gateway creation

### SQL

* `az sql server create`: Add `--tags` parameter to supply tags
* `az sql db ltr-backup`: Add new commands for LTR immutability support

### Storage

* `az storage account or-policy create/update`: Add `--enable-metrics` to support object replication metrics
* Fix #32048: `az storage blob sync`: Fix using azcopy with account-key without login into azcli
* `az storage account create/update`: Support `--enable-smb-oauth` to allow managed identities to access SMB shares using OAuth
* `az storage sku list`: Support listing storage skus
* `az storage file symoblic-link create/show`: Support NFS fileshare symbolic link
* `az storage account create/update`: Add `--zones` and `--zone-placement-policy` to support setting zones and availability zone pinning policy

## September 02, 2025

Version 2.77.0

### ACR

* `az acr task create`: Fix error message when `--context` is not provided

### AKS

* `az aks create`: Change description for `--os-sku` parameter
* `az aks create/update`: Support installing latest version of acstor on the cx cluster by `--enable-azure-container-storage` parameter
* `az aks create/update`: Support specifying installation version of acstor by `--container-storage-version` when setting `--enable-azure-container-storage`
* `az aks update`: Support uninstalling acstor from the cx cluster by `--disable-azure-container-storage` regardless of the installed version
* `az aks create/update`: Add `--sku` parameter to support automatic feature
* `az aks update`: Fix typo on validation error for disabling Azure Container Storage

### App Config

* `az appconfig kv import`: Support importing key-values from AKS ConfigMap

### App Service

* `az webapp deploy`: Add `--enable-kudu-warmup` parameter to support warm-up Kudu before making deployment
* `az functionapp flex-migration`: Add commands to support migrating CV1 apps to Flex

### ARM

* `az ts`: Capture subscription id from template resource id

### Backup

* `az backup restore restore-azurefileshare`: Fix a bug where the source storage account is deleted and the required sourceResourceId property is missing from the restore request payload

### Compute

* Fix #31885: `az vm encryption`: Fix request body serialization
* `az disk create/grant-access`: Support Confidential VM OS Disks
* `az snapshot create`: Add new parameter `--instant-access-duration-minutes` to support creating instant access snapshot for premium SSD v2 and ultra disk

### Container app

* Fix #31762: `az containerapp job list`: Fix bug only 20 items are returned
* `az containerapp job update`: Fix `--min-executions` and `--max-executions` not accepting 0 values

### Core

* Resolve CVE-2025-4517
* Add global policy arguments `--acquire-policy-token` and `--change-reference` to support Change Safety feature

### IoT

* `az iot hub devicestream`: Mirgate this command group to `azure-iot` extension

### MySQL

* `az mysql flexible-server upgrade`: Add new option `8.4` for `--version`

### Network

* `az network nat gateway`: Support Standard V2 SKU and Public IP (Prefixes) V6
* `az network public-ip`: Support Standard V2 SKU
* `az network public-ip prefix`: Support Standard V2 SKU
* `az network vnet show/list`: Support `defaultPublicNatGateway` output for StandardV2 NAT Gateway
* Fix #31954: `az network application-gateway waf-policy custom-rule`: Deserialization errors within `computedDisabledRules`
* `az network vnet-gateway`: Support VNET Gateway insights
* `az network vnet-gateway`: Support VNET Gateway failover

### Packaging

* Support Python 3.13
* Bump embedded Python to 3.13.7

### Profile

* `az account get-access-token`: Specifying `--tenant` with the current tenant is now allowed for Cloud Shell and managed identity account
* `az login`: Support `--claims-challenge` in device code flow

### RDBMS

* `az postgres flexible-server create/update/restore`: Premium SSD V2 is no longer supported with Burstable compute tier
* `az postgres flexible-server update`: Bypass fabric mirroring validation to allow updating high availability status for PG11 and PG12 servers

### Service Fabric

* `az sf managed-application update`: Add breaking change pre-announcement warnings for argument option removal
* `az sf managed-application-type version update`: Add breaking change pre-announcement warnings for required argument `--package-url`
* Fix #5338: `az sf cluster create`: Fix the bug where key-vault not placed in location specifed by `--location`
* Fix #5180: `az sf cluster create`: Change behavior to read cluster_name from parameters file if provided

## August 05, 2025

Version 2.76.0

### ACR

* Fix #31572: `az acr check-health`: Fix crashes when the registry is not found
* `az acr create`: Fix domain name label suffix validation

### AKS

* `az aks machine show/list`: Add zones to table output
* `az aks`: Support Virtual Machines node pools in AKS commands
* `az aks update`: Support VMAS to VMS agent pool migration in AKS commands
* `az aks create/update`: Add new parameter `--enable-ai-toolchain-operator` to enable Kaito addon
* `az aks create/update`: Add `--node-provisioning-mode` and `--node-provisioning-default-pools` parameters
* `az aks safeguards`: Add command group to manage deployment safeguards
* `az aks create`: Support the Azure Monitor metrics and logs addon functionality
* `az aks create`: Add new parameter `--disable-run-command` to disable run command feature for the cluster
* `az aks update`: Add new parameters `--disable-run-command` and `--enable-run-command` to toggle the run command feature on or off
* `az aks update`: Support updating load balancer sku from basic to standard

### App Config

* `az appconfig create/update`: Add support for setting key value revision retention period
* `az appconfig feature list/delete/set`: Support filtering by tags

### App Service

* `az webapp create`: Add `--domain-name-scope` parameter to support DNL scopes during site creation
* `az webapp sitecontainers convert`: Add a command to switch between sitecontainers and classic

### ARM

* `az group export`: Add `--export-format` to specify the format of the exported template
* Fix #31709: `az deployment`: Fix `the content for this response was already consumed` error when create resource
* `az deployment create/validate/what-if`: Expose `--validation-level` parameter at all scopes

### Backup

* `az backup restore restore-disks`: Add new parameter `--cvm-os-des-id` to specify the Disk Encryption Set ID to use for OS disk encryption

### Cloud

* Change `active_directory_graph_resource_id` endpoint of `AZURE_US_GOV_CLOUD` to `https://graph.microsoftazure.us/`

### Compute

* `az sig in-vm-access-control-profile`: Add command group to manage in VM access control profile
* `az sig in-vm-access-control-profile-version`: Add command group to manage in VM access control profile version
* `az vm disk attach`: Add new parameters `--source-snapshots-or-disks` `--source-disk-restore-point` to support implicit disk creation from snapshot and disk restore points
* `az vmss create`: Add new parameter `--enable-automatic-repairs` to support setting automatic repairs policy
* Fix #31685: `az vm/vmss update`: Fix error with `NoneType` object has no attribute `mode` when update wireserver profile
* `az vm disk attach`: Add support for setting disk size and sku of implicit disk creation from snapshot and disk restore points
* `az compute-recommender spot-placement-score`: Add new command to replace original command `az compute-recommender spot-placement-recommender`

### Container

* `az container create`: Remove default values for container group to support standby pool reuse scenario

### Core

* Resolve CVE-2024-47081
* Provide actionable error recommendation when a command fails because of Multi-Factor Authentication (MFA) policy violation

### Cosmos DB

* `az cosmosdb restore`: Remove restore validations which would cause timeouts for large restore and incorrect error messages

### DMS

* `az dms project create`: Add breaking change warning

### Eventhub

* `az eventhubs namespace`: Add `nsp-configuration show` and `nsp-configuration list`

### MySQL

* `az mysql flexible-server create/update`: Update `--storage-redundancy` parameter and add `--backup-interval`

### Network

* `az network application-gateway waf-policy`: Support `computedDisabledRules` read-only property
* `az network application-gateway waf-policy custom-rule create`: Support `GeoLocationXffHeader`, `ClientAddrXffHeader` for `groupByVariables`
* Fix #31727: `az network private-link-service create`: Support multiple IP configurations

### Packaging

* Support RHEL 10 and CentOS Stream 10

### Profile

* `az login`: Add `--claims-challenge` argument to support interactive authentication with claims challenge

### RDBMS

* `az postgres flexible-server replica create/promote`: Enable replica operations for elastic cluster operations
* `az postgresql flexible-server create`: Handle failed IP address check

### Service Fabric

* `az sf managed-cluster network-security-rule`: Add new parameter `--source-addr-prefix` to specify the CIDR or source IP range
* `az sf managed-cluster network-security-rule`: Add new parameter `--dest-addr-prefix` to specify the destination port or range
* `az sf managed-cluster network-security-rule`: Add new parameter `--source-port-range` to specify the CIDR or source IP range
* `az sf managed-cluster network-security-rule`: Add new parameter `--dest-port-range` to specify the destination address prefix
* `az sf cluster create`: Add more options for parameter `--vm-os`
* `az sf managed-node-type update`: Add parameters `--vm-size` and `--tags`

### SQL

* `az sql ltr-policy set`: Remove ltr backup policy unused parameter `--access-tier`
* `az sql failover-group create`: Add support for multiple partner failover groups

## July 01, 2025

Version 2.75.0

### ACR

* `az acr connected-registry create`: Fix for enabling dedicated endpoint on container registry resource when user confirms during creation
* `az acr login`: Fix login status code when command fails

### AKS

* `az aks create`: Simplify logic and enable correct recording rule groups for managed prom
* `az aks`: Allow `LongRunningOperation` to show poller status
* `az aks update`: Add option `--assignee-principal-type` to specify the principal type when using `--attach-acr`
* `az aks create`: Add `--enable-static-egress-gateway` parameter to support static egress gateway feature
* `az aks update`: Add `--enable-static-egress-gateway` parameter to support static egress gateway feature
* `az aks nodepool add`: Add option `Gateway` to `--mode` parameter and `--gateway-prefix-size` parameter to support static egress gateway feature
* `az aks create`: Add `--pod-ip-allocation-mode` parameter to support Azure CNI Static Block Allocation
* `az aks nodepool add`: Add `--pod-ip-allocation-mode` parameter to support Azure CNI Static Block Allocation

### App Config

* `az appconfig kv export/import/list/delete`: Support filtering by tags
* `az appconfig restore`: Support filtering by tags
* `az appconfig revision list`: Support filtering by tags
* `az appconfig kv import/export/restore`: Add new parameter `--dry-run` to support dry-run feature

### ARM

* `az deployment what-if`: Show potential changes in pretty-printed what-if result
* `az deployment what-if`: Display warnings and diagnostic messages in pretty-printed what-if result

### ARO

* `az aro update`: Fix credential refresh to handle clusters with invalid machinesets

### Cloud

* `az cloud register/update`: Add `--endpoint-microsoft-graph-resource-id` to support configuring Microsoft Graph endpoint
* `az cloud register/update`: Add `--skip-endpoint-discovery` to allow skipping cloud endpoints' auto discovery

### Compute

* [BREAKING CHANGE] `az vmss create/update`: Remove too long argument option `--scheduled-event-additional-publishing-target-event-grid-and-resource-graph` to fix help message issue

### Consumption

* `az consumption usage list`: Fix usage list returns data with replace `None` string to null value

### Container app

* `az containerapp update`: Modify `--yaml` template handling to fix `runningStatus` error
* Fix #31480: `az containerapp revision copy`: Only return `containerapp does not exist` when got 404

### Core

* Resolve CVE-2025-50181
* Resolve CVE-2025-50182

### Identity

* Fix #31598: Fix regression in `az identity federated-credential create` by defaulting audience

### Key Vault

* `az keyvault secret download`: Add `--overwrite` flag

### Network

* `az network nat gateway`: Support Standard V2 SKU
* `az network public-ip`: Support Standard V2 SKU
* `az network public-ip prefix`: Support Standard V2 SKU
* `az network application-gateway waf-policy managed-rule exception`: Support exception feature in application gateway
* `az network vnet subnet create/update`: Support IPAM pool allocation

### Packaging

* Drop Azure Linux (Mariner) 2.0 support

### RDBMS

* `az postgres flexible-server create`: Extend EOL to PG 11 and 12

### Service Fabric

* Fix #18358: `az sf client-certificate add`: Fix the bug that command fails with `remove` not defined

### SQL

* `az sql db replica create`: Add partner subscription id for cross-subscription GeoDr

### Storage

* `az storage account create/update`: Add `--sas-expiration-action` to sas policy
* `az storage file upload-batch/download-batch`: Add OAuth login support

## June 03, 2025

Version 2.74.0

### ACR

* `az acr login`: Add `refreshToken` and `username` fields to the output after using `--expose-token` parameter
* `az acr create`: Fix logs for domain name label
* `az acr connected-registry`: Remove private preview message

### AKS

* `az aks nodepool add/update/upgrade`: Add new parameter `--undrainable-node-behavior` to specify whether nodes can be cordoned during upgrade
* `az aks create/enable-addons`: Remove preview flag for `--enable-high-log-scale-mode` parameter
* `az aks nodepool add/update/upgrade`: Add `--max-unavailable` to specify he maximum number or percentage of nodes that can be simultaneously unavailable during upgrade

### App Config

* Fix #30619: `az appconfig feature set`: Fix invalid value for `--requirement-type`
* Fix #30619: `az appconfig kv import`: Fix invalid value for `--requirement-type`

### App Service

* `az appservice plan create`: Update the description of `--zone-redundant` parameter
* `az webapp config set`: Remove number of workers validation

### ARM

* `az policy`: Add breaking change pre-announcement

### Backup

* `az backup container/item/policy/protection`: Add support for ASE backup operations
* `az backup`: Add support for HANA Snapshot

### Compute

* `az vm/vmss create`: Add warning log for changing the default value of VM size

### Core

* Resolve CVE-2024-13176
* Resolve CVE-2024-9143

### Cosmos DB

* `az cosmosdb sql container`: Add Full Text Policy support

### Identity

* `az identity federated-credential create/update`: Add support for claims matching expressions

### Monitor

* `az monitor action-group`: Support `--incident-receivers`,  `--mi-user-assigned` and `--mi-system-assigned`(#31205)

### MySQL

* `az mysql flexible-server create`: Change default storage redundancy for BC SKU to local redundancy

### NetAppFiles

* `az netappfiles volume-group create`: Add support for Oracle in ANF Volume Groups

### Network

* `az network vnet-gateway create`: Add `--enable-high-bandwith-vpn-gateway` parameter
* `az network vpn-connection show`: Support new properties output with virtual network gateway
* `az network vnet-gateway migration`: Support vpn gateway migration feature
* `az network private-endpoint-connection`: Add provider `Microsoft.FluidRelay/fluidRelayServers`
* `az network network-watcher packet-capture`: Support for packet capture includes a ring buffer
* `az network private-endpoint-connection`: Add provider `Microsoft.VideoIndexer/accounts`

### RDBMS

* `az postgres flexible-server create/db`: Fix for `--database-name` validation

## May 20, 2025

Version 2.73.0

### ACR

* `az acr connected-registry create/update`: Add new parameter `--gc-enabled` which enables or disables garbage collection on a connected registry
* `az acr connected-registry create/update`: Add new parameter `--gc-schedule` which uses cron expression to set a collection interval
* `az acr create/update`: Add a new optional parameter `--role-assignment-mode` to specify the role assignment mode for new or existing registries. This parameter allows customers to enable or disable Attribute-Based Access Control (ABAC)
* `az acr check-health`: Add a new optional parameter `--repository` to check read, write, and delete permissions for a specific repository
* `az acr task create/update`: Add a new optional parameter `--source-acr-auth-id` to specify the managed identity used for authentication with the source registry
* `az acr build`: Add a new optional parameter `--source-acr-auth-id` to specify the identity used for authentication with the source registry
* `az acr run`: Add a new optional parameter `--source-acr-auth-id` to specify the identity used for authentication with the source registry
* `az acr create`: Remove preview flag from `--allow-trusted-services`

### AKS

* [BREAKING CHANGE] `az aks create`: Change default value of option `--node-vm-size` to ""
* [BREAKING CHANGE] `az aks nodepool add`: Change default value of option `--node-vm-size` to ""
* `az aks create/update`: Add support for apiserver vnet integration feature
* `az aks create/approuting`: Add default NIC config for app routing
* Fix #31265: `az aks enable-addons`: Fix UnboundLocalError when setting specific dataCollectionSettings

### App Service

* [BREAKING CHANGE] `az appservcie ase create/update/delete`: Remove support for ASEv2
* `az webapp list-runtimes`: Update API response filter logic
* `az functionapp plan update`: Add zone redundant update support for Flex

### Backup

* [BREAKING CHANGE] `az backup protection enable-for-vm`: Support for protecting TVM with standard policy

### Cloud

* [BREAKING CHANGE] `az cloud register/update`: No `gallery` endpoint returned if use endpoint discovery with `--endpoint-resource-manager`
* `az cloud register/update`: Support data plane endpoints auto discovery with `--endpoint-resource-manager`

### Compute

* [BREAKING CHANGE] `az sig image-definition list-community/list-shared`: Replace pagination parameters with new parameters `--max-items` and `--next-token`
* [BREAKING CHANGE] `az sig image-version list-community/list-shared`: Replace pagination parameters with new parameters `--max-items` and `--next-token`
* `az vm/vmss create`: Fix missing auxiliary tokens
* `az vmss create/update`: Add new parameter `--enable-automatic-zone-balancing` to support setting automatic zone rebalancing policy
* `az vmss create/update`: Add new parameter `--automatic-zone-balancing-strategy` to support setting automatic zone rebalancing policy
* `az vmss create/update`: Add new parameter `--automatic-zone-balancing-behavior` to support setting automatic zone rebalancing policy
* `az vmss create/update`: Add new parameter `--skuprofile-rank` to specify a list of ranks to use with VMSS instance mix SKU profile VM sizes

### Core

* [BREAKING CHANGE] Remove Azure Stack profiles `2020-09-01-hybrid`, `2019-03-01-hybrid`, `2018-03-01-hybrid` and `2017-03-09-profile`
* Use MSAL for managed identity authentication

### DMS

* `az dms project task create`: Add ability to use a lockless option for ensuring data consistency

### Key Vault

* `az keyvault key get-attestation`: Support getting a MHSM key's attestation

### Monitor

* `az monitor log-analytics workspace failover/failback`: Add new commands for supporting activating and deactivating workspace failover

### NetAppFiles

* `az volume-group create`: Parameter `--proximity-placement-group` is no longer required
* `az netappfiles account create`: Add new parameter `--federated-client-id` for Cross Tennant CMK
* `az netappfiles account create`: Add new parameter `--nfs-v4-id-domain`. Domain for NFSv4 user ID mapping
* `az netappfiles account update`: Add new parameter `--federated-client-id` for Cross Tennant CMK
* `az netappfiles account update`: Add new parameter `--nfs-v4-id-domain`. Domain for NFSv4 user ID mapping
* `az netappfiles usage list`: Add new command to list current subscription usages
* `az netappfiles usage show`: Add new command to show current subscription usages

### Network

* Fix #31294: `az network vnet update`: Refine processing logic of `--address-prefixes`

### Packaging

* Bump Python to 3.12 on RHEL and CentOS Stream
* [BREAKING CHANGE] Drop Ubuntu 20.04 support

### Profile

* [BREAKING CHANGE] `az login`: `--username` no longer accepts user-assigned managed identity ID. Explicitly specify `--client-id`, `--object-id` or `--resource-id` instead

### RDBMS

* [BREAKING CHANGE] `az postgres flexible-server create`: Set the default value of parameter `--create-default-database` to Disabled
* [BREAKING CHANGE] `az postgres flexible-server create`: Set default PG version to 17 on create
* [BREAKING CHANGE] `az postgres flexible-server stop-replication`: Remove deprecated command, use `az postgres flexible-server replica promote` instead
* [BREAKING CHANGE] `az postgres flexible-server create/upgrade`: Remove support of PG12 which has officially ended
* [BREAKING CHANGE] `az postgres flexible-server create/update/ad-admin`: Rename deprecated references to Microsoft Entra
* [BREAKING CHANGE] `az postgres flexible-server create`: Set the default value of parameter `--create-default-database` to Disabled
* [BREAKING CHANGE] `az postgres flexible-server create`: Set default PG version to 17 on creation
* [BREAKING CHANGE] `az postgres flexible-server update`: Add user confirmation on certain update operations
* `az postgres flexible-server create`: BUG FIX, Set public access network to disabled if None argument is passed in
* `az postgres flexible-server create/db create`: Add validation for database name
* `az postgres flexible-server create`: Set default sku to be coming from location capability API

### Role

* `az role assignment list`: Drop `--include-classic-administrators` argument

### Service Connector

* `az webapp connection create mongodb-atlas`: Add `mongodb-atlas` target service support

### Storage

* [BREAKING CHANGE] `az storage account migration start`: Add confirmation for storage account migration between redundancy options

## May 06, 2025

Version 2.72.0

### ACR

* Fix #31130: `az acr task show`: Fix extra version line in encodedTask created by file
* `az acr create/check-name`: Add parameter `--dnl-scope` for domain name label hash

### AKS

* `az aks update`: Make specified version to match current version when turning off autoupgrade
* `az aks nodepool add/update`: Add option `Ubuntu2204` to `--os-sku` parameter
* `az aks create`: Add `--custom-ca-trust-certificates` parameter to support custom CA trust feature
* `az aks nodepool add`: Add `--custom-ca-trust-certificates` parameter to support custom CA trust feature
* `az aks nodepool add`: Add GPU driver install options `--gpu-driver install` and `--gpu-driver none`

### App Config

* `az appconfig create/update`: Add developer sku support
* `az appconfig feature set`: Update feature name documentation

### App Service

* Fix #20983: `az webapp config ssl import`: Make web app a non-required parameter
* `az appservice plan create`: Add Pv4/Pmv4 ASP support
* Fix #20209: `az webapp create-remote-connection`: Add ssh command to output

### ARM

* `az deployment`: Fix issue where Bicep is not found in CI environments
* Fix #31188: `az lock delete`: Fix the case sensitivity of `--namespace` parameter validation

### ARO

* `az aro update`: Ensure that refreshing cluster service principal credentials is successful when the cluster has an invalid or missing subnet in its resource definition

### Compute

* [BREAKING CHANGE] `az sig image-version`: Change the `--os-vhd-storage-account` parameter mapping to the `properties.storageProfile.osDiskImage.source.storageAccountId` property
* [BREAKING CHANGE] `az sig image-version`: Change the `--data-vhds-storage-accounts` parameter mapping to the `properties.storageProfile.dataDiskImages.source.storageAccountId` property
* `az vm create`: Add new parameter `--zone-placement-policy` to support setting vm placement to create a zonal VM
* `az vm create`: Add new parameter `--include-zones` to support setting vm placement to create a zonal VM
* `az vm create`: Add new parameter `--exclude-zones` to support setting vm placement to create a zonal VM
* `az vm create/update`: Add new parameter `--align-regional-disks-to-vm-zone` to support setting regional disks attached to the VM to be converted to zonal
* `az sig image-version create/update`: Rename shorter alias for `--block-deletion-before-end-of-life` parameter
* `az vm create/update`: Add new parameters `--wire-server-mode` and `--wire-server-access-control-profile-reference-id` to support setting wireserver endpoint settings
* `az vmss create/update`: Add new parameters `--wire-server-mode` and `--wire-server-access-control-profile-reference-id` to support setting wireserver endpoint settings
* `az vm create/update`: Add new parameters `--imds-mode` and `--imds-access-control-profile-reference-id` to support setting IMDS endpoint settings
* `az vmss create/update`: Add new parameters `--imds-mode` and `--imds-access-control-profile-reference-id` to support setting IMDS endpoint settings
* `az vm create/update`: Add new parameter `--key-incarnation-id` to support setting key incarnation id
* `az vmss create/update`: Add new parameter `--key-incarnation-id` to support setting key incarnation id
* `az vm/vmss create/update`: Set `--security-type` to `Standard` only if explicitly set by end user

### Consumption

* `az consumption usage list`: Enhance handling of `usageStart` and `usageEnd` when missing

### Microsoft Entra ID

* `az ad sp create-for-rbac`: Add `--service-management-reference` argument
* `az ad sp create-for-rbac`: Add `--create-password` argument. Use `--create-password false` to disable creating password credential

### MySQL

* `az mysql flexible-server create`: Add `--backup-interval` parameter to enable setting backup interval
* `az mysql flexible-server restore`: Add `--faster-restore` parameter to open auto-iops-scaling when restore
* `az mysql flexible-server replica create`: Add `--faster-provisioning` parameter to open auto-iops-scaling when create replica

### Network

* Fix #31129: `az network vnet-gateway create/update`: Refine the logic of `--root-cert-data`
* `az network application-gateway waf-policy managed-rule rule-set`: Support rule set type Microsoft_DefaultRuleSet

### Profile

* Fix #29030: `az login`: During interactive login, fall back to `tenantId` if `tenantDisplayName` is missing

### RDBMS

* `az postgres flexible-server upgrade`: Add server capability API check to the `--version` parameter and allow user to upgrade to PG17 when it is available

### Role

* `az role assignment list`: Add `--fill-principal-name` argument. Use `--fill-principal-name false` to omit `principalName` property and bypass Microsoft Graph query
* `az role assignment list`: Add `--fill-role-definition-name` argument. Use `--fill-role-definition-name false` to omit `roleDefinitionName` property and bypass the role definitions query
* `az role assignment list/delete`: Add `--assignee-object-id` argument. Use this argument instead of `--assignee` to bypass Microsoft Graph query

### Service Connector

* `az webapp connection create`: Clarify that system identity is a flag

## April 01, 2025

Version 2.71.0

### ACR

* `az acr create`: Fix a bug where creating cache rule without credential set would fail

### AKS

* `az aks`: Fix error message when outbound type validation failed
* `az aks create/update`: Update recording rule group create logic for managed prometheus addon
* `az aks create/update`: Add `--bootstrap-artifact-source` parameter to configure artifact source when bootstraping the cluster
* `az aks create/update`: Add `--bootstrap-container-registry-resource-id` parameter to configure container registry resource ID
* `az aks create/update`: Add new option `none` for `--outbound-type` parameter

### App Config

* `az appconfig`: Fix managed identity auth for `--auth-mode login` parameter

### App Service

* `az webapp deploy`: Add `--enable-kudu-warmup` parameter to support warm-up Kudu before making deployment
* Fix #27724: `az webapp config appsettings set`: Remove redaction warning message from output
* Fix #26920: `az webapp deployment slot create`: Make the created new slot has same VNet integration settings of source slot as Portal behavior
* Fix #30908: `az webapp snapshot restore`: Fix the error "no resource group found" when trying to restore a snapshot backup to a paired region
* Fix #29512: `az webapp config backup update`: Fix `str` object has no attribute `name`
* Fix #21721: `az webapp config storage-account add`: Add validation for non-existent FileShare
* `az functionapp list-flexconsumption-locations`: Add `--details` and `--runtime` parameters to provide more details

### ARM

* Fix #29809: `az deployment/stack/bicep`: Fix an issue where the commands mistakenly check for the latest Bicep version, even when `use_binary_from_path` is `true` and `check_version` is `false`
* Fix #29435: `az bicep install/upgrade`: Fix an issue where the command downloads the x64 binary instead of the ARM binary on aarch64 machines

### ARO

* `az aro create`: Update VM SKU to align with best practices

### Backup

* `az backup protection enable-for-vm`: Update in warning message while protecting Trusted Launch virtual machines

### Cloud

* `az cloud register/update`: Add upcoming breaking change announcement

### Compute

* `az sig image-definition list-shared`: Mark `--marker` and `--show-next-marker` as deprecated and will be removed in the upcoming breaking change window
* `az sig image-version list-shared`: Mark `--marker` and `--show-next-marker` as deprecated and will be removed in the upcoming breaking change window
* `az sig image-definition list-community`: Mark `--marker` and `--show-next-marker` as deprecated and will be removed in the upcoming breaking change window
* `az sig image-version list-community`: Mark `--marker` and `--show-next-marker` as deprecated and will be removed in the upcoming breaking change window
* `az disk config update`: Add new command to support updating disk size gb by PATCH method
* `az vm/vmss create/update`: Add support for setting security type to `Standard`
* Fix #30976: `az sig image-version create`: Fix missing auxiliary tokens
* `az sig image-version create/update`: Add new parameter `--block-deletion-before-end-of-life` to support blocking deletion if the end of life has not expired
* `az vm list-sizes`: Mark the command as deprecated

### Container app

* Fix #30828: `az containerapp job stop`: Fix `TypeError` when `--job-execution-name` is not specified

### Core

* PREVIEW: Support managed identity authentication with MSAL. Run `az config set core.use_msal_managed_identity=true` or set environment variable `AZURE_CORE_USE_MSAL_MANAGED_IDENTITY=true` to enable it

### Key Vault

* `az keyvault create`: Support C SKU family for MHSM creation

### MySQL

* [BREAKING CHANGE] `az mysql flexible-server create`: Change default values for `--auto-scale-iops`, `--version` for MySQL

### Network

* `az network virtual-appliance`: Add command `get-boot-diagnostic-log` to support getting boot diagnostic logs
* Fix #31003: `az network vpn-connection create`: Pass auxiliary authorization header for referenced resource IDs
* `az network vnet-gateway create`: Add `--enable-high-bandwith-vpn-gateway` parameter
* `az network vpn-connection show`: Support new properties with virtual network gateway

### Profile

* `az login`: Add upcoming breaking change announcement for `--username`

### RDBMS

* `az postgres flexible-server update`: Fix bug for not updating geo backup data encryption properties
* `az postgres flexible-server fabric-mirroring`: Fix for space separated list of databases during `start` and `update-databases`
* `az postgres flexible-server create`: Support adding admin during creation if `--active-directory-auth` is Enabled and no longer generate password when `--password-auth` is Disabled

### Role

* `az role assignment list`: Add upcoming breaking change announcement for `--include-classic-administrators`
* `az role assignment list`: Include role assignments inherited from management groups

### Service Connector

* `az * connection create neon-postgres`: Add command for Neon Postgres Serverless

### Storage

* `az storage share/directory/file`: Support NFS FileShares
* `az storage file hard-link create`: Support creating hard-links for NFS files
* `az storage share create`: Support `--enable-snapshot-virtual-directory-access`

## March 04, 2025

Version 2.70.0

### AKS

* `az aks create/az aks nodepool add`: Emit error message when using `--asg-ids` alone without `--allowed-host-ports`
* `az aks nodepool upgrade`: Fix `--node-soak-duration` cannot be set to 0
* `az aks machine list`: Add command to fetch list of machines in an agentpool
* `az aks machine show`: Add command to fetch information about a specific machine in an agentpool
* `az aks nodepool delete`: Add `--ignore-pod-disruption-budget` option for ignoring PodDisruptionBudget
* `az aks create`: Add `--message-of-the-day` parameter to support message of the day
* `az aks nodepool add`: Add `--message-of-the-day` parameter to support message of the day

### App Config

* `az appconfig kv import/export`: Fix bug when importing feature flag with percentile allocation property
* `az appconfig`: Add support for custom token audience to `--auth-mode login` parameter

### App Service

* `az functionapp create`: Check if storage account is network restricted
* `az functionapp create`: Refactor EOL message
* Fix #28104: `az webapp config storage-account`: Remove windows limitation notes
* Fix #28374: `az webapp create`: Improve error message for globally unique name for new app create
* `az webapp sitecontainers`: Add new commands for linux web app sitecontainers
* `az webapp up`: Add `--enable-kudu-warmup` parameter to support warm-up Kudu before making deployment
* `az webapp deploy`: Add `--enable-kudu-warmup` parameter to support warm-up Kudu before making deployment
* `az webapp deployment source config-zip`: Add `--enable-kudu-warmup` parameter to support warm-up Kudu before making deployment
* Fix #29493: `az webapp create`: Update basic-auth parameter description

### ARM

* `az bicep`: Fix installation check for concurrent usages

### Backup

* `az backup restore restore-disks`: Support NoZone as a valid target zone for `--target-zone` parameter

### Compute

* `az vm available-set create/update`: Add `--additional-scheduled-events` parameter to support setting scheduled event policy
* `az vm available-set create/update`: Add `--enable-user-reboot-scheduled-events` parameter to support setting scheduled event policy
* `az vm available-set create/update`: Add `--enable-user-redeploy-scheduled-events` parameter to support setting scheduled event policy

### Container app

* `az containerapp create`: Fix to make `--registry-username` value to be `DNS1123` compliant

### Core

* Resolve CVE-2024-12797
* Drop Track 1 SDK authentication
* `aaz`: Add cross tenants control for `AAZResourceIdArgFormat`
* `aaz`: Support `Any` type with full value shorthand syntax allowed

### Cosmos DB

* `az cosmosdb offline-region`: Add new command to support offline region for cosmosdb account

### IoT

* `az iot hub update`: Add `--min-tls-version` parameter to allow updating min tls version in a cleaner way

### NetAppFiles

* `az netappfiles account`: Add new command `change-key-vault` to change KeyVault/Managed HSM that is used for encryption of volumes under NetApp account
* `az netappfiles account`: Add new command `get-key-vault-status` to get KeyVault information. Response from this command can be used for transitiontocmk
* `az netappfiles account`: Add new command `transitiontocmk` to transition all volumes in a VNet to a different encryption key source (Microsoft-managed key or Azure Key Vault). Operation fails if targeted volumes share encryption sibling set with volumes from another account
* `az netappfiles volume create/update`: Add parameter `--cool-access-tiering-policy`

### Network

* `az network nic ip-config create/update`: Add `--private-ip-address-prefix-length` to support setting private ip address prefix length

### RDBMS

* `az postgres flexible-server index-tuning`: Support tuning options operations

### Service Connector

* `az containerapp connection create redis`: Add `--system-identity` paramter
* `az webapp connection create fabric-sql`: Fix interactive mode & allow new parameters `--fabric-workspace-uuid` and `fabric-sql-db-uuid`

### Storage

* `az storage account create`: Add new `--sku StandardV2_LRS/StandardV2_ZRS/StandardV2_ZRS/StandardV2_ZRS/PremiumV2_LRS/PremiumV2_ZRS` for provisioned v2 support
* `az storage account file-service-usage`: Support getting file-service usage for storage account
* `az storage share-rm create/update`: Add `--paid-bursting-enabled`, `--paid-bursting-max-bandwidth-mibps`, `--paid-bursting-max-iops` for provisioned v1, add `--provisioned-bandwidth-mibps`, `--provisioned-iops` for provisioned v2 accounts

## February 11, 2025

Version 2.69.0

### ACR

* `az acr manifest list-metadata`: Update help messages for untagged manifests

### AKS

* `az aks create/update/delete`: Add parameters `--if-match` and `--if-none-match` to support etag functionality for concurrency

### App Config

* `az appconfig kv import/export`: Support microsoft feature management schema
* `az appconfig kv export`: Introduce a new environment variable called `AZURE_APPCONFIG_FM_COMPATIBILE` when exporting to a file for backward compatibility for users
* `az appconfig feature show/list`: Support microsoft feature management schema
* `az appconfig kv restore/show/list`: Update datetime validation to accept timezone offset
* `az appconfig revision list`: Update datetime validation to accept timezone offset
* `az appconfig export`: Update export help message for environment variable

### App Service

* `az functionapp create`: Refactor EOL implementation and sort based on runtime EOL date
* `az functionapp list-flexconsumption-locations`: Check if flex region is enabled for subscription
* `az functionapp deployment slot create`: Add `--https-only` parameter for slot creation command
* `az webapp list-runtimes`: Remove the JBoss `_byol` entries from the output for webapps with Linux OS

### Backup

* `az backup`: Add support for new AFS Vault Standard Policies

### Batch

* [BREAKING CHANGE] `az batch certificate create/list/show/delete`: Remove deprecated commands
* [BREAKING CHANGE] `az batch node reimage/remote-desktop`: Remove deprecated commands
* [BREAKING CHANGE] `az batch pool create`: Remove `--application-licenses`, `--certificate-references` , `--os-family` and `--os-version` deprecated parameters
* [BREAKING CHANGE] `az batch pool set/reset `: Remove `--certificate-references` deprecated parameter
* `az batch job create`: Add parameters `--job-manager-task-application-package-references` and `--on-all-tasks-complete`
* `az batch job disable`: Add parameter `--json-file`
* `az batch job-schedule create`: Add parameters `--job-manager-task-application-package-references`, `--job-metadata`, and `--job-manager-task-environment-settings`
* `az batch job-schedule set/reset`: Add parameters `--job-max-task-retry-count` and `--job-max-wall-clock-time`
* `az batch node reboot`: Add parameter `--json-file`
* `az batch node scheduling disable`: Add parameter `--json-file`
* `az batch pool autoscale evaluate`: Add parameter `--json-file`
* `az batch pool create`: Add parameters `--start-task-environment-settings` and `--start-task-max-task-retry-count`
* `az batch pool reset`: Add parameters `--start-task-resource-files` and `--target-node-communication-mode`

### Compute

* [BREAKING CHANGE] `az sig gallery-application create/update`: Output field `supportedOsType` changed to `supportedOSType`
* `az vm list-sizes`: Remove unused parameter `--ids`
* `az vmss create/update`: Add new paramter `--zone-balance` to support setting zone balance
* `az vm/vmss create`: Install guest attestation extension when security type set to `ConfidentialVM`
* `az vmss scale`: Add new logic to support scaling VMSS in edge zone
* `az vmss create`: Add `--encryption-identity` parameter to use managed identity for Azure disk encryption
* `az vmss encryption enable`: Add `--encryption-identity` parameter to update or set encryption identity for Azure disk encryption

### Container app

* Fix #28047: `az containerapp compose create`: Upgrade pycomposefile version to split environment variables on the first equal sign instead of every equal sign

### DevTest Labs

* `az lab vm`: Add `hibernate` command group

### Key Vault

* `az keyvault update/update-hsm`: Fix `--bypass` overriding by default when specifying `--default-action Deny`

### Network

* `az network lb create`: Refine `--frontend-ip-zone` to support multiple zones
* `az network private-endpoint-connnection`: Add `Microsoft.HealthDataAiservices/deidservices` for private endpoint connections
* `az network routeserver create/update`: Add `--auto-scale-config`
* `az network virtual-appliance reimage`: Allow reimage of virtual machines associated with a network virtual appliance

### Profile

* `az login`: Passing the managed identity ID with `--username` is deprecated and will be removed in a future release. Please use `--client-id`, `--object-id` or `--resource-id` instead

### RDBMS

* `az postgres flexible-server geo-restore`: Add `--restore-time` parameter
* `az postgres flexible-server fabric-mirroring start/stop/update-databases`: Disable fabric mirroring on HA server
* `az postgres flexible-server update`: Fix for scaling up node count on an elastic cluster

### Redis

* `az redis create/update`: Add `--zonal-allocation-policy` to support the way of selecting zones for cache instance

### Role

* `az role definition show`: New command to support showing specific role definition

### Service Connector

* `az webapp connection create redis`: Add parameter `--system-identity`

## January 14, 2025

Version 2.68.0

### ACR

* `az acr agentpool`: Fix delete polling
* `az acr create`: Add validation for registry name to support domain name label

### AKS

* `az aks command invoke`: Add progress spinner
* `az aks create/update`: Add `--enable-acns` parameter to support enabling advanced networking functionalities on a cluster
* `az aks create/update`: Add `--disable-acns-observability` parameter to disable advanced networking observability features when enabling advanced networking features with `--enable-acns`
* `az aks create/update`: Add `--disable-acns-security` parameter to disable advanced networking security features when enabling advanced networking features with `--enable-acns`
* `az aks update`: Add `--disable-acns` parameter to support disabling advanced networking functionalities on a cluster
* `az aks update`: Add `--ip-families` to support updating cluster network
* `az aks create/update`: Add `--nrg-lockdown-restriction-level` parameter to support specifying restriction level on the managed node resource group

### App Config

* `az appconfig kv import`: Fix import mode `all` bug

### Compute

* [BREAKING CHANGE] `az disk`: Refine output fields to align with backend service
* [BREAKING CHANGE] `az snapshot`: Refine output fields to align with backend service
* Fix #30009: `az vm install-patches`: Fix errors due to typos in `install_vm_patches` function
* `az vm/vmss create`: Fix help message for `--public-ip-address` parameter
* Fix #30565: `az vm create`: Fix creating VM with `--patch-mode` parameter
* Fix #30564: `az vm create`: Fix creating VM with `--enable-auto-update` parameter
* `az vm create`: Add `--encryption-identity` parameter to use that managed identity for Azure disk encryption
* `az vm encryption enable`: Add `--encryption-identity` parameter to update or set encryption identity for Azure disk encryption
* `az vmss create/update`: Add new parameter `--security-posture-reference-is-overridable` to support setting security posture reference overridable
* `az vmss create/update`: Change existing parameter `--security-posture-reference-exclude-extensions` to receive string list
* `az vm create/update`: Add new parameter `--additional-scheduled-events` to support setting scheduled event policy
* `az vm create/update`: Add new parameter `--enable-user-reboot-scheduled-events` to support setting scheduled event policy
* `az vm create/update`: Add new parameter `--enable-user-redeploy-scheduled-events` to support setting scheduled event policy

### Container

* `az container exec`: Fix exception when stdin is not a tty

### Container app

* `az containerapp exec`: Fix `ResourceNotFound` error
* `az containerapp ingress enable`: Fix issue about labels being deleted
* Fix #29238: `az containerapp secret set`: Add description about `identityref` for parameter `--secrets`

### Cosmos DB

* `az cosmosdb create/update`: Add `--enable-prpp-autoscale` to enable/disable burst capacity feature

### Key Vault

* `az keyvault key sign/verify`: Fix `--digest` to accept base64 encoded string

### Microsoft Entra ID

* `az ad app create/update`: Add `--requested-access-token-version` argument

### MySQL

* `az mysql flexible-server create/restore/replica create/geo restore`: Add `--storage-redundancy` parameter to support HA storage with zone redundancy

### Network

* `az network vnet-gateway create/update`: Add parameter `--resiliency-model`
* `az network vnet create/update`: Add parameter `--ipam-pool-prefix-allocations`
* Fix #30535: `az network lb address-pool address add`: Address level may not have virtual network property

### Profile

* Drop support for old-style managed identity account created by Azure CLI <= 2.0.50. If you upgrade from one of these versions, please run `az login --identity` again.

### RDBMS

* `az postgres flexible-server create`: Create elastic cluster by setting `--cluster-option` to ElasticCluster
* `az postgres flexible-server list`: Add `--show-cluster` argument to list elastic clusters
* `az postgres flexible-server fabric-mirroring/identity`: Support system assigned managed identity and fabric mirroring of databases
* `az postgres flexible-server update`: Add `--node-count` argument to scale up elastic clusters

### Role

* [BREAKING CHANGE] `az role assignment delete`: Stop deleting all role assignments by default

### SQL

* `az sql db ltr-policy`: Remove preview tag

### Storage

* `az storage account migration`: Add warning for long wait, will require confirmation in the future
* Fix #28554: `az storage blob service-properties update`: Support cases where `--static-website false` and index and 404 documents were already set
* Fix #29929: `az storage copy`: Fix when wildcard `*` is in `--source-file-path`

## November 19, 2024

Version 2.67.0

### AKS

* [BREAKING CHANGE] `az aks create/update`: Remove `--uptime-sla` and `--no-uptime-sla` parameters
* [BREAKING CHANGE] `az aks create`: Remove `--aad-client-app-id`, `--aad-server-app-id` and `--aad-server-app-secret` parameters
* [BREAKING CHANGE] `az aks trustedaccess rolebinding create`: Remove deprecated '-r' options
* `az aks create/update`: Fix storage pool name validation for Azure Container Storage
* `az aks enable-addon`: Update AGIC addon to use Network Contributor instead of Contributor

### App Config

* `az appconfig create/update`: Add new parameters `--arm-auth-mode` and `--enable-arm-private-network-access` to support data plane proxy settings

### Compute

* `az vm disk attach/detach`: Add new parameter `--disk-ids` to support setting multiple disks by disk ids

### Compute Fleet

* `az compute-fleet`: Add `create/update/show/delete/list/list-vmss` commands for manage Azure Compute Fleet

### Container

* `az container container-group-profile`: Add new command group to manage Azure Container Instance Container Group Profile

### Core

* PREVIEW: Support managed identity on Azure Arc-enabled Windows server

### DataLake

* [BREAKING CHANGE] `az dla`: Remove dla module since it has been deprecated

### DLS

* [BREAKING CHANGE] `az dls account network-rule`: Remove this command group as no server support anymore

### Eventhub

* `az eventhubs eventhub`: Add new parameters `--timestamp-type` and `--min-compaction-lag-in-mins`
* `az eventhubs namespace replica`: Add new commands to support adding/removing replicas

### Extension

* [BREAKING CHANGE] `az extension add/update`: Set default `--allow-preview` value from `True` to be `False` for extensions installation and remain `True` for extensions without stable releases

### Kusto

* [BREAKING CHANGE] `az kusto`: Remove kusto from CLI as it has been moved to CLI extensions

### Network

* [BREAKING CHANGE] `az network public-ip ddos-protection-statu`: Remove misspelled command group

### Packaging

* Drop Python 3.8 support

### Profile

* [BREAKING CHANGE] `az login`: `--password` no longer accepts a service principal certificate. Use `--certificate` to pass a service principal certificate

### RDBMS

* `az postgres flexible-server long-term-retention start/pre-check/list/show`: New commands to support long-term-retention backups on PostgreSql Flex Server
* `az postgres flexible-server create`: Support provisioning postgres flexible servers with version 17

### Service Connector

* `az connection create mysql-flexible`: Add `--private-endpoint` parameter

### SQL

* [BREAKING CHANGE] `az sql mi link create`: Rename input from `--source-endpoint` to `--partner-endpoint`, `--primary-availability-group-name` to `--partner-availability-group-name`, `--secondary-availability-group-name` to `--instance-availability-group-name`, `--target-database` to `--databases`
* [BREAKING CHANGE] `az sql mi link create/show/list/update`: Rename output from `targetDatabase`, `primaryAvailabilityGroupName`, `secondaryAvailabilityGroupNamesourceEndpoint`, `sourceReplicaId`, `targetReplicaId`, `linkState`, `lastHardenedLsn` to `databases`, `partnerAvailabilityGroupName`, `instanceAvailabilityGroupName`, `partnerEndpoint`, `distributedAvailabilityGroupName`, `instanceLinkRole`, `partnerLinkRole`, `failoverMode`, `seedingMode`
* [BREAKING CHANGE] `az sql failover-group create`: Change default failover policy to manual
* `az sql mi link failover`: Support performing requested failover type in this Managed Instance link

### Upgrade

* [BREAKING CHANGE] `az upgrade`: Set default `--allow-preview` value from `True` to be `False` for extensions installation and remain `True` for extensions without stable releases

## November 05, 2024

Version 2.66.0

### AKS

* `az aks create`: Add Trusted Launch options `--enable-vtpm` and `--enable-secure-boot`
* `az aks nodepool add/update`: Add Trusted Launch options `--enable-vtpm` and `--enable-secure-boot`
* `az aks create/update`: Update the VM SKU details from backend for validations during Azure Container Storage operations

### App Service

* `az functionapp create`: Add `--zone-redundant` parameter to support zone redundant for Functions Flex SKU
* `az functionapp plan update`: Do not show warning message with `--set` in command

### ARM

* `az bicep publish`: Remove preview flag from `--with-source` parameter
* `az data-boundary show`: Add command to support getting the data boundary at a specified scope
* `az data-boundary show-tenant`: Add command to support getting the data boundary at a tenant level
* `az data-boundary create`: Add command to support creating tenant to data boundary
* `az bicep generate-params`: Fix the help message for `--include-params` parameter
* `az bicep/deployment/stack`: Conditionally enable invariant globalization for Bicep running inside the Azure CLI docker image

### Backup

* `az backup restore restore-disks`: Add support for enabling Disk access settings for managed VM restores

### Compute

* `az vmss create/update`: Add new parameter `--skuprofile-vmsizes` to specify a list of VM sizes to use with VMSS Instance Mix
* `az vmss create/update`: Add new parameter `--skuprofile-allocation-strategy` to update the allocation strategy for VMSS Instance Mix

### Container app

* Fix #30053: `az containerapp update`: Fix polling
* `az containerapp env create`: Hide `--dapr-instrumentation-key` parameter
* `az containerapp env update`: Support to update `--dapr-connection-string`

### Core

* `aaz`: Support managed identity
* Resolve CVE-2024-6119
* Resolve CVE-2024-5535
* Resolve CVE-2024-4741
* Resolve CVE-2024-4603
* Resolve CVE-2024-2511
* Use MSAL for Cloud Shell authentication

### Extension

* `az extension add/update`: Pre-announcement default value change from `true` to `false` for `--allow-preview`

### MySQL

* `az mysql flexible-server create/update`: Add `--maintenance-policy-patch-strategy`
* `az mysql flexible-server create/restore`: Add `--database-port`
* `az mysql flexible-server replica create`: Add `--database-port`

### NetAppFiles

* [BREAKING CHANGE] `az netappfiles volume create`: Parameters `backup-id` and `snapshot-id` now accept only full Azure ResourceIds and no longer support GUIDs
* [BREAKING CHANGE] `az netappfiles account create`: Parameter `--kdc-ip` now only accepts a single ip address not a list
* [BREAKING CHANGE] `az netappfiles account update`: Parameter `--kdc-ip` now only accepts a single ip address not a list
* [BREAKING CHANGE] `az netappfiles account ad add`: Parameter `--kdc-ip` now only accepts a single ip address not a list
* [BREAKING CHANGE] `az netappfiles account ad update`: Parameter `--kdc-ip` now only accepts a single ip address not a list
* `az netappfiles volume create`: Fix a bug where parameter `--allowed-clients` was not passed along in the request
* `az netappfiles check-file-path-availability`: Add new parameter `--availability-zone`
* `az netappfiles volume replication`: Add new commands `peer-external-cluster`, `authorize-external-replication`, `perform-replication-transfer`, `finalize-external-replication`
* `az netappfiles volume create`: Add new parameters `--external-host-name` ,`--external-server-name`, `--external-volume-name`
* `az netappfiles volume update`: Add new parameters `--external-host-name` ,`--external-server-name`, `--external-volume-name`
* `az netappfiles volume update`: Parameters `--backup-id` and `--snapshot-id` now accept only full Azure ResourceIds and no longer support GUIDs

### Network

* `az network vnet`: Add `--private-endpoint-vnet-policies` parameter
* `az network private-link-service`: Add `--destination-ip-address` parameter
* `az network application-gateway waf-policy managed-rule rule-set add/update`: Support sensitivity for `--rule` parameter
* `az network private-dns link vnet`: Support resolution policy for virtual network link
* `az network application-gateway waf-policy managed-rule rule-set add/update`: Add allowed value `1.1` for `--version`
* Fix #29911: `az network public-ip update`: IP tags crash with AttributeError

### Profile

* `az login`: Passing the service principal certificate with `--password` is deprecated and will be removed in version 2.67.0. Please use `--certificate` instead.

### RDBMS

* `az postgres flexible-server replica create`: Add support for `--tags` parameter
* `az postgres flexible-server replica create`: Allow read replica create from storage auto-grow enabled primary server flexible server
* `az postgres flexible-server backup create/delete`: New commands to support creating and deleting backups on PostgreSql Flex Server

### Service Bus

* `az servicebus namespace replica`: Add new command group to manage servicebus namespace replicas

### Service Connector

* `az aks connection create appconfig`: Add `--use-appconfig-extension`
* `az webapp connection create fabric-sql`: Add fabric sql target support

### SignalR

* `az signalr start/stop`: Add signalr command start or stop an existing SignalR service
* `az signalr replica start/stop/restart`: Add signalr command start, stop or start an existing SignalR service
* `az signalr network-rule ip-rule add/remove`: Add signalr command add or remove ip-rule of an SignalR service
* `az signalr update client-cert-enabled/disable-local-auth/region-endpoint-enabled`: Toggle clientCertificate, disableLocalAuth, enableRegionEndpoint
* `az signalr replica update region-endpoint-enabled/unit-count`: Toggle enableRegionEndpoint and change unitCount

### SQL

* `az sql geo-backup`: Remove preview tag
* `az sql failover-group create/update`: Add parameter `--secondary-type` to support geo/standby replica on partner server

### Storage

* `az storage blob copy start/start-batch`: Fix `--auth-mode login`

### Upgrade

* `az upgrade`: Pre-announcement default value change from `true` to `false` for `--allow-preview`

## October 01, 2024

Version 2.65.0

### ACR

* Fix #21900: `az acr task identity remove`: Fix incorrect operation_group setting
* `az acr credential-set`: Improve help message

### AD

* `az ad app create/update`: Add `--service-management-reference` argument

### AKS

* `az aks nodepool delete-machines`: Add support to delete specific machines in an agent pool

### App Config

* `az appconfig`: Add premium SKU support

### App Service

* `az functionapp config set`: Map parameters explicitly for the internal update_site_configs function call

### Compute

* `az vm/vmss create`: Add `--ssh-key-type` parameter to support generating Ed25519 SSH keys
* `az vm image list`: Expose ImageDeprecationStatus property in output

### Container app

* Fix #29849: `az containerapp job stop`: Fix stop execution response
* Fix #29166: `az containerapp compose create`: Support image with tag and support get ACR from image

### Cosmos DB

* `az cosmosdb restore`: Add `--disable-ttl` to support for Restore with Time-To-Live Disabled

### DataLake

* `az dla`: Deprecate datalake analytics

### HDInsight

* `az hdinsight update`: Add parameter `--assign-identity-type` to allow to update to `SystemAssigned` identity.

### Monitor

* `az monitor action-group create`: Adjust formatting of `--actions` help message
* `az monitor action-group update`: Adjust formatting of `--add-actions` help message
* `az monitor action-group notification create`: Adjust formatting of `--add-actions` help message

### MySQL

* `az mysql flexible-server create/update`: Add `--accelerated-logs` to support configuring accelerated logs for Business Critical tier

### NetAppFiles

* `az netappfiles volume create`: Fix subnet id as resource id

### Network

* `az network vnet peering`: Refine command interface of subnet peering

### Packaging

* Release Docker image based on Azure Linux 3.0
* Include `jq` in Azure Linux docker image
* Drop Debian 10 support
* Use Azure Linux 3.0 (`mcr.microsoft.com/azurelinux/base/core:3.0`) as the base image for docker image tag `latest` and `2.65.0`

### Profile

* `az login`: Fall back to device code flow in GitHub Codespaces

### RDBMS

* `az postgres flexible-server update`: Support case-insensitive input for `--tier`, `--performance-tier`, `--sku`, and `--maintenance-window`
* `az postgres flexible-server migration create`: Add AWS_AURORA as a migration source type for PostgreSql

### SQL

* `az sql elastic-pool create`: Set `min_capacity` to `None` for non-serverless SKUs
* `az sql mi create/update`: Add gpv2 parameter and iops parameter

## September 03, 2024

Version 2.64.0

### ACR

* `az acr helm`: Improve deprecation message

### AKS

* `az aks nodepool update`: Add `--enable/disable-fips-image` flags for GA mutable fips
* `az aks create/update`: Support UserAssigned Managed Identity for grafana linking in managed prometheus
* `az aks create/update`: Update the VM SKU regex validation to include larger set of VMs for Azure Container Storage

### App Service

* `az staticwebapp create/update`: Add `Dedicated` as supported SKU
* `az webapp config set`: Add MinTlsCipherSuite support
* `az webapp config access-restriction add/remove`: Allow skipping service tag validation

### ARM

* `az ts create`: Fix incorrect handling of whitespace in string values

### ARO

* `az aro create`: Add feature for adding Multiple Public IPs on cluster load balancer
* `az aro update`: Add feature for adding/removing Multiple Public IPs on cluster load balancer

### Compute

* `az vm update`: Add support of Gen1 VM to trusted launch upgrade
* `az capacity reservation`: GA command group

### Container app

* Fix #28998: `az containerapp env workload-profile add/update`: Fix `NoneType` object is not iterable error when environment doesn't enable workload profile
* `az containerapp create/up`: Make `--target-port` optional
* `az containerapp env create`: Deprecate unused argument `--docker-bridge-cidr`
* `az containerapp job stop`: Deprecate option to stop list of given job executions
* Fix #29711: `az containerapp logs show`: Fix JSON escaping by default or with `--format json`

### HDInsight

* `az hdinsight create`: Support setting IP tags when creating HDInsight cluster
* `az hdinsight update`: Support updating the managed identity of the cluster
* `az hdinsight azure-monitor-agent show`: Support getting the managed identity of the cluster
* `az hdinsight azure-monitor-agent enable`: Enable the Azure Monitor Agent logs integration on an HDInsight cluster
* `az hdinsight azure-monitor-agent disable`: Disable the Azure Monitor Agent logs integration on an HDInsight cluster

### MySQL

* `az mysql flexible-server maintenance`: New command group for managing maintenance of MySQL flexible server
* `az mysql flexible-server update`: Remove storage passing for server update

### NetAppFiles

* `az netappfiles volume create/update`: Update max for `--usage-threshold`

### Network

* Fix #29565: `az network nat gateway create`: Add `--tags` parameter

### Packaging

* Support Python 3.12
* Release Azure Linux 3 RPM package
* [BREAKING CHANGE] Use CBL-Mariner 2.0 (`mcr.microsoft.com/cbl-mariner/base/core:2.0`) as the base image for docker image tag `latest` and `2.64.0`

### Redis

* `az redis create/update`: Add `--disable-access-keys` to support disabling auth through access keys

### SQL

* `az sql mi create/update`: Add `--authentication-metadata` to support auth metadata configuration

### Storage

* `az storage account create/update`: Support account cold-tier
* `az storage copy/remove`: Add `--auth-mode login` support
* `az storage share delete`: Add `include-leased` for `--delete-snapshots`

## August 06, 2024

Version 2.63.0

### ACR

* `az acr login`: Support optional resource group argument to skip subscription resource scan

### AKS

* `az aks create`: Not set the `--network-plugin` based on the default from the Python SDK
* `az aks create/update`: Support in place param updates for managed Prometheus
* `az aks create/update`: Add validations for PremiumV2 disk
* `az aks upgrade`: Support tier switch with AKS upgrade
* `az aks create/update`: Add `--network-policy none` option to command
* `az aks create`: Remove unsupported scenario command in help message

### App Config

* `az appconfig import/export/restore`: Add correlation request id to bulk operations

### App Service

* `az webapp list-runtimes`: Add parameter `--show-runtime-details` to show detailed runtime stacks and update the format of java related stacks listed
* `az webapp create`: Add parameter `--acr-identity` to allow users to choose user assigned identity for ACR image pull
* `az webapp config set`: Add parameter `--acr-use-identity` and `--acr-identity` to allow users update ACR image pull related configs

### ARM

* `az stack group/sub/mg create`: Minor improvements to the confirmation message when updating an existing stack

### CDN

* Fix #28717: `az afd secret`: Change the way to access parameter
* `az cdn portal-migration`: Add command group for classic CDN profile migration

### Compute

* `az sig create/update`: Hide `--soft-delete` parameter in help messages
* Fix #29006: `az ssh`: Fix the `Permissions 0644 for '...' are too open` error
* `az vmss update`: Add new parameter `--enable-auto-os-upgrade` to support updating automatic OS upgrade policy argument
* `az vmss update`: Add new parameter `--upgrade-policy-mode` to support updating upgrade policy mode

### Container app

* Fix #26688: `az containerapp up`: Fix logic about updating an existing containerapp
* `az containerapp job stop`: Return custom message for stop job execution
* Fix #29330: `az containerapp auth update`: Fix split logic for `--set`

### Core

* Resolve CVE-2024-39689
* Resolve CVE-2024-6345
* Support `az config set extension.dynamic_install_allow_preview` for extension dynamic installation configuration
* `az logout`: Remove service principal access tokens from token cache

### Cosmos DB

* `az cosmosdb delete`: Support `--no-wait`

### MySQL

* `az mysql flexible-server import stop-replication`: Stop replication between source single server and target flexible server

### NetAppFiles

* `az netappfiles account create`: Change `--key-vault-resource-id` to be optional

### Network

* `az network custom-ip prefix create`: Add parameter `--is-parent`
* `az network network-watcher connection-monitor`: Support to create connection monitor v2
* `az network vnet peering`: Support virtual network subnet peering

### Packaging

* Drop Alpine Docker image

### RDBMS

* [BREAKING CHANGE] `az postgres flexible-server create`: Update default value of PG version to be 16
* Fix #27422: `az postgres flexible-server create`: Bug fix for using existing subnet while creating pg flex server
* `az postgres flexible-server restore`: Bug fix when using resource id as value for source-server argument

### Role

* `az role assignment list`: Add warning for classic administrators retirement

### Service Connector

* `az containerapp connection create containerapp`: Support ACA2ACA connection

### SQL

* `az sql midb move/copy`: Add destination subscription Id for managed database move/copy
* `az sql mi create`: Add `--dns-zone-partner` optional parameter

### Storage

* `az storage fs directory upload/download`: Add back `--auth-mode login` as AzCopy supports Oauth now
* `az storage blob sync`: Add back `--auth-mode login` as AzCopy supports Oauth now

### Synapse

* `az synapse spark job submit`: Add optional `--python-files` argument to support job submission

## July 09, 2024

Version 2.62.0

### ACR

* `az acr build/task`: Highlight the difference between arguments in the description

### AKS

* `az aks create/update`: Update AMW resource.location to only accept alphanumeric characters
* `az aks create/update`: Add Azure Managed Grafana support for managed prometheus addon in usnat
* `az aks create/update`: Ephemeral disk additional support for Azure Container Storage
* `az aks create/update`: Add and fix existing validations for ephemeral disk support for Azure Container Storage

### App Config

* `az appconfig`: Update help message for App Configuration store
* `az appconfig kv import`: Update the help message for ignore-match

### App Service

* `az webapp deploy`: Disable deploymentstatus API for deployments to app slots
* `az webapp deployment source config-zip`: Disable deploymentstatus API for deployments to app slots
* Fix #29041: `az webapp config access-restriction add`: Fix edge case validating service tags
* `az functionapp create`: Avoid throwing exception when endOfLifeDate not passed from stacks API

### ARM

* `az stack mg create`: Validate MG stacks automatically before creation
* `az bicep restore`: Fix typos in help messages

### Backup

* `az backup restore restore-disks/restore-azurewl/restore-azurefiles/restore-azurefileshare`: Add `--tenant-id` for cross-tenant MUA protection, otherwise allows restore when protected by a resource guard
* `az backup vault encryption update`: Add support for MUA for CMK operations

### CDN

* Fix #28721: `az afd origin-group create`: Add parameter to support session affinity state
* Fix #28824: `az cdn profile`: Add default location
* Fix #28733: `az cdn endpoint update`: Add support to update an existing endpoint

### Compute

* `az vmss update`: Add new parameter `--zones` to support setting vmss zonal expansion
* `az vm install-patches`: Add new parameter `--max-patch-publish-date` to support setting max patch publish date
* `az vmss reimage`: Add new parameter `--force-update-os-disk-for-ephemeral` to support updating the base OS disk
* `az vmss create/update`: Add new parameter `--scheduled-event-additional-publishing-target-event-grid-and-resource-graph` to support setting scheduled event policy
* `az vmss create/update`: Add new parameter `--enable-user-reboot-scheduled-events` to support setting policy for rebooting scheduled event
* `az vmss create/update`: Add new parameter `--enable-user-redeploy-scheduled-events` to support setting policy for redeploying scheduled event
* `az vmss update`: Add an option `Standard` to `--security-type` parameter
* `az vmss create`: Support set upgrade policy mode to automatic during flexible VMSS creation
* `az sig image-definition create`: Fix default value of security type

### Container app

* `az containerapp env create/update`: Support peer-to-peer traffic encryption with `--enable-peer-to-peer-encryption`
* `az containerapp job update`: Fix poll logic and `--no-wait`
* `az containerapp show-custom-domain-verification-id`: Show verification id used for binding custom domain
* `az containerapp env update`: Fix logs configuration about removing destination with `--logs-destination none`
* `az containerapp list-usages`: Support list-usages in subscription
* Fix #28983: `az containerapp job registry`: Support commands for modifying the job's registries
* `az containerapp auth`: Support Token Store with `--token-store`, `--sas-url-secret`, `--sas-url-secret-name`, `--yes`
* Fix #29128: `az containerapp env certificate`: Support managed certificate
* Fix #29172: `az containerapp secret set`: Remove the limit of length for secret name

### Core

* Fix #28997: Fix error "User cancelled the Accounts Control Operation" when logging in with WAM as Administrator
* Resolve CVE-2024-37891
* Resolve CVE-2024-35195
* `aaz`: Add argument completer support

### Cosmos DB

* `az service create`: Add `--gateway-type` to support multiple dedicated gateway types

### MySQL

* `az mysql flexible-server update`: Support replica resource group different with primary server
* `az mysql flexible-server detach-vnet`: New command to support converting a vnet azure mysql server to a non-vnet server
* `az mysql flexible-server deploy/update`: Add warning message for HA enabled and input validator

### Network

* `az network application-gateway waf-policy custom-rule update`: Add parameter `--js-cookie-exp-time`
* `az network cross-region-lb address-pool`: Add parameter `-- admin-state`
* `az network application-gateway rewrite-rule`: Add `--request-header-configurations` and `--response-header-configurations`
* `az network virtual-appliance restart`: Allow restart of virtual machines associated with a network virtual appliance
* `az network virtual-appliance inbound-security-rule`: Support of GET operation for NVA Inbound Security Rule
* `az network vnet subnet`: Add parameter `--endpoints`

### RDBMS

* `az postgres flexible-server restore`: Add capability to restore to new server using Premium SSD v2 Disks by setting Storage Type to "PremiumV2_LRS"
* `az postgres flexible-server migration create`: Fix bugs while passing in MigrationRuntimeResourceId to Migration Parameters, now need to be provided within properties json file
* `az postgres flexible-server firewall-rule create`: Correct firewall rule name and ip range validators
* `az postgres flexible-server update`: Add argument to enable or disable public-access
* `az postgres flexible-server create`: Add argument `--create-default-database` to support disabling default database creation
* `az postgres flexible-server upgrade`: Unblock MVU for Burstable from CLI
* `az postgres flexible-server update`: Correct setting `--maintenance-window` to be disabled

### SignalR

* `az signalr upstream update`: Remove the empty location string when updating resource

### SQL

* `az sql db update`: Add `--manual-cutover` and `--perform-cutover` arguments

### Storage

* `az storage container policy`: Fix cases where permission and expiry are both null
* `az storage account create/update`: Support TLS 1.3, update recommended `--min-tls-version` to be 1.2

## May 21, 2024

Version 2.61.0

### AKS

* [BREAKING CHANGE] `az aks create`: Specifying `--enable-managed-identity` and `--service-principal`/`--client-secret` at the same time will cause a `MutuallyExclusiveArgumentError`
* [BREAKING CHANGE] `az aks create`: Change the default value of option `--enable-managed-identity` from `True` to `False`
* `az aks mesh upgrade rollback/complete`: Add `--yes` parameter to support not prompting the users to confirm the operation
* `az aks create/update`: Add `SecurityPatch` option to `--node-os-upgrade-channel` parameter
* `az aks create/update`: Add new parameter `--enable-cost-analysis` to enable exporting Kubernetes namespace and deployment details to the Cost Analysis views
* `az aks create`: Backfill the value of `--enable-managed-identity` to `True`  when options `--service-principal` and `--client-secret` are not specified at the same time
* `az aks nodepool update`: Add option `--os-sku` to support updating os sku in place
* `az aks create`: Add `--ampls-resource-id` and `--enable-high-log-scale-mode` optional parameters for Monitoring Addon
* `az aks enable-addons`: Add `--ampls-resource-id` and `--enable-high-log-scale-mode` optional parameters

### App Service

* [BREAKING CHANGE] `az webapp deploy`: Use deployment status API for deployment output for Linux Web Apps
* [BREAKING CHANGE] `az webapp up`: Use deployment status API for deployment output for Linux Web Apps
* [BREAKING CHANGE] `az webapp deployment source config-zip`: Use deployment status API for deployment output for Linux Web Apps
* `az functionapp scale config always-ready`: Set alwaysReady property to empty array if it is null
* `az functionapp`: Update messaging for flex function apps
* `az functionapp deployment source config-zip`: Allow users with no Microsoft.Web/serverFarm read privileges to deploy function apps
* `az webapp list`: Fix the bug `--show-details` fails while resource group name is not specified
* `az webapp list-runtimes/create/up`: Add Java 21 support
* `az functionapp create`: Use stacks API netFrameworkVersion value instead of the default value from the Python SDK
* `az functionapp create`: The linuxFxVersion for dotnet-isolated linux consumption apps will no longer be left empty
* `az functionapp`: Not block execution of command when runtime cannot be detected, and omit showing warning for runtime when not applicable (e.g. centauri apps, apps running a docker image)
* `az appservice plan create/update`: Add IsolatedV2 memory intensive SKU support
* `az functionapp create`: If customers do not provide an image when creating a Centauri function app, we use the updated default Centauri image

### ARM

* [BREAKING CHANGE] `az stack group/sub/mg create/delete`: Remove the deprecated `--delete-all`, `--delete-resources`, and `--delete-resource-groups` flags. Use the `--action-on-unmanage`/`--aou` parameter instead
* `az group delete`: Add new option `Microsoft.Databricks/workspaces` for `--force-deletion-types` parameter
* `az deployment`: Support inline parameters with `.bicepparam` in single `--parameters` argument
* `az stack group/sub/mg validate`: Add new `validate` command to preform preflight validation on a stack deployment
* `az stack group/sub create`: Validation of a stack will now occur before a stack is created or updated
* `az stack group/sub/mg create/delete`: Action on unmanage behavior for stack managed management groups can now be configured
* `az stack group/sub/mg create`: The correlation ID of the create operation is now returned as a property of the stack
* `az stack group/sub/mg create/delete`: Add new flag `--bypass-stack-out-of-sync-error`/`--bse` that will bypass errors related to the resource list of a stack being out of sync

### Compute

* [BREAKING CHANGE] `az sig image-definition create`: Set the default values for Hyper-V generation and Security Type
* `az vmss create/update`: Add new parameters `--enable-resilient-creation` and `--enable-resilient-deletion` to support Resiliency Policy on VMSS
* `az vm create/update`: Add new option `NvmeDisk` for `--ephemeral-os-disk-placement` parameter
* `az vmss create/update`: Add new option `NvmeDisk` for `--ephemeral-os-disk-placement` parameter
* `az vm create`: Add new parameters `--source-snapshots-or-disks` and `--source-snapshots-or-disks-size-gb` to support implicit disk creation from snapshot and disk
* `az vm create`: Add new parameters `--source-disk-restore-point` and `--source-disk-restore-point-size-gb` to support implicit disk creation from disk restore point
* `az vmss update`: Add new parameter `--ephemeral-os-disk` to support in-place mutual migration of VMSS from ephemeral to non-ephemeral OS disk
* `az vmss update`: Add new parameter `--ephemeral-option` to support setting ephemeral disk setting

### Compute Diagnostic

* `az compute-recommender spot-placement-recommender`: Add new command to support generating placement scores for Spot VM SKU

### Container app

* `az containerapp create/update`: Fix `--scale-rule-tcp-concurrency` for TCP scale rule
* `az containerapp compose create`: Fix issue where the environment's location is not resolved from `--location`
* Fix #28864: `az containerapp ingress update`: Fix updating transport from http to tcp with `--transport tcp`
* `az containerapp compose create`: Fix variable mixing issue when `--compose-file-path` contains multiple services
* Fix #28380: `az containerapp ingress access-restriction set`: Fix `KeyError` when `name` not exists

### Core

* Resolve CVE-2024-34064
* [BREAKING CHANGE] `az login`: Use WAM as the default authentication method on Windows. For more details, see https://go.microsoft.com/fwlink/?linkid=2271136
* `aaz`: Support extended values in `AAZArgEnum`
* Add `tenantDefaultDomain` and `tenantDisplayName` properties to login contexts (shown by `az account list`)
* Prompt for interactive authentication for all silent authentication failures

### Key Vault

* [BREAKING CHANGE] `az keyvault create`: Default `--enable-rbac-authorization` to true
* `az keyvault key create`: Update the release policy used for `--default-cvm-policy`

### NetAppFiles

* [BREAKING CHANGE] `az account backup`: Replace backup commands with backup-vault commands
* [BREAKING CHANGE] `az volume backup status`: Remove `volume backup status` command, replace with `az netappfiles volume latest-backup-status show`
* `az netappfiles account backup-vault`: Add backup vault command group
* `az netappfiles volume latest-backup-status show`: Add command to get latest backup status
* `az netappfiles volume latest-restore-status show`: Add command to get latest backup status
* `az netappfiles resource region-info list`: Add command to list region specific information
* `az netappfiles resource region-info default show`: Add command to get storage to network proximity and logical zone mapping information

### Network

* [BREAKING CHANGE] `az network dns zone`: Deprecate `--zone-type`, `registration-vnets` and `resolution-vnets`
* `az network vnet subnet`: Add parameter `--sharing-scope`
* `az network private-endpoint-connnection`: Add `Microsoft.App/managedEnvironment` for private endpoint connections
* Fix #28615: `az network application-gateway address-pool update`: Race condition in concurrent scenario
* Fix #28705: `az network lb rule`: Authentication token not being generated

### Packaging

* Add Ubuntu 24.04 Noble Numbat support
* [BREAKING CHANGE] Drop Ubuntu 18.04 support

### Profile

* `az login`: Introduce login experience v2. For more details, see https://go.microsoft.com/fwlink/?linkid=2271236

### RDBMS

* `az postgres flexible-server migration create`: Add private endpoint support for migrations by providing migration runtime resource ID as command line argument

### Security

* [BREAKING CHANGE] `az security contact create`: Deprecate `--alerts-admins` and `--email`
* [BREAKING CHANGE] `az security setting update`: Deprecate `--enabled`

### Service Connector

* `az aks connection list/show`: Add kubernetes resource name
* `az source connection create cognitiveservices`: Support OpenAI/AIServices/CognitiveServices as target
* `az webapp connection list`: Fix interactive input

### Storage

* [BREAKING CHANGE] `az storage account update`: Prompt user for possible charge increases when changing `--access-tier`, add `--upgrade-to-storagev2`
* [BREAKING CHANGE] `az storage container set-permission/get-permission` and `az storage container policy`: Remove `--auth-mode login` and `--sas-token` for container access policy commands as only shared key authorization is supported on server side

## April 30, 2024

Version 2.60.0

### ACR

* [BREAKING CHANGE] `az acr connected-registry create`: Mode default value change from ReadWrite to ReadOnly
* `az acr connected-registry create`: If data-endpoint disabled ask for confirmation to enable it instead of throwing an error

### AKS

* `az aks create/update`: Prompt warning during disablement about CR deletion
* `az aks create/update`: Udpate RP registration code to work on azure monitor subscription
* `az aks create/update`: Update to add default region for workspace creation in air gapped cloud
* `az aks nodepool add`: Add parameter `--disable-windows-outbound-nat` to add a Windows agent pool which the Windows OutboundNAT is disabled

### App Service

* `az webapp config container set`: Remove docker prefix and rename container related parameters
* `az webapp create` and `az webapp deployment slot create`: Rename `--docker-registry-server-user` and `--docker-registry-server-password` to `--container-registry-user` and `--container-registry-password`
* `az webapp create` and `az webapp deployment slot create`: Add parameters `--container-image-name` and `container-registry-url` to deprecate `--deployment-container-image-name`
* `az webapp create` and `az logicapp create`: Update help message
* `az webapp config set`: Add new parameter `--runtime` to allow users to update their stack by using single parameter
* `az functionapp create`: Remove unnecessary app settings for flex function apps
* Fix #28588: `az webapp config access-restriction add`: Check for null before getting values
* `az webapp config access-restriction set`: Add new parameter `--default-action` to configure default action for main site
* `az webapp config access-restriction set`: Add new parameter `--scm-default-action` to configure default action for scm site
* `az webapp list`: Add parameter `--show-details` to include detailed site configuration of listed webapps in output
* `az functionapp create`: Will validate that the provided runtime is supported by flex when creating a flex function app
* `az functionapp list-flexconsumption-runtimes`: Add support for this new command so that it provides the list of supported flex runtimes when provided the `--location` and `--runtime`

### ARM

* `az bicep install`: Support additional process architectures with Bicep CLI
* `az deployment`: Return better message on incorrect bicepparam file path
* `az bicep format`: Replace `--newline` with `--newline-kind`
* `az bicep publish`: Replace `--documentationUri` with `--documentation-uri`

### Backup

* `az backup vault update`: Take `--tenant-id` as input for resolving cross-tenant resource guard scenarios. Vault Immutability feature also has resource guard protection now, and support for the same has been added.
* `az backup protection disable`: Take `--tenant-id` as input for resolving cross-tenant resource guard scenarios. Stop protection feature also has resource guard protection now, and support for the same has been added.

### Batch

* `az batch pool create`: Add `--upgrade-policy-mode` argument to support automatic OS upgrade
* `az batch pool create`: Add `--enable-auto-os-upgrade` argument to enable automatic OS upgrade
* `az batch pool create`: Add `--disable-auto-rollback` argument to disable OS image rollback feature
* `az batch pool create`: Add `--defer-os-rolling-upgrade` argument to defer OS upgrades on the TVMs if they are running tasks
* `az batch pool create`: Add `--use-rolling-upgrade-policy` argument to support OS rolling upgrade policy
* `az batch pool create`: Add `--enable-cross-zone-upgrade` argument to support cross zone OS upgrade
* `az batch pool create`: Add `--max-batch-instance-percent` argument to set the maximum percent of total VMs that will be upgraded in one batch
* `az batch pool create`: Add `--max-unhealthy-instance-percent` argument to set the maximum percentage of the total VMs can be simultaneously unhealthy
* `az batch pool create`: Add `--max-unhealthy-upgraded-instance-percent` argument to set the maximum percentage of upgraded VMs that can be found to be in an unhealthy state
* `az batch pool create`: Add `--pause-time-between-batches` argument to set the wait time between batches in rolling OS upgrade
* `az batch pool create`: Add `--prioritize-unhealthy-instances` argument to support upgrade all unhealthy VMs first
* `az batch pool create`: Add `--rollback-failed-instances-on-policy-breach` argument to enable rollback failed instances to previous model if the Rolling Upgrade policy is violated

### Compute

* `az vmss create`: Add support of configure the rolling mode upgrade policy during VMSS creation
* `az vmss update`: Add new parameter `--max-surge` to support updating rolling upgrade policy max surge
* `az capacity reservation group list`: Add new parameter `--resource-ids-only` to support retrieving the capacity reservation group resource ids
* `az capacity reservation group create`: Change `--sharing profile` to support unsharing subscriptions by passing nothing

### Containerapp

* `az containerapp env create`: Support `--dapr-connection-string` to set application insights connection string used by Dapr to export service to service communication telemetry
* Fix #28553: `az containerapp exec`: Fix the error of `inappropriate ioctl for device`

### Core

* Fix #28737: Fix token cache for service principal authentication
* Resolve CVE-2023-3651

### Monitor

* `az monitor log-analytics workspace update`: Add parameter `--sku-name`

### NetAppFiles

* `az netappfiles volume-group create`: Add `--zones` argument to set Availability Zone for volume group volumes
* `az netappfiles volume create/update`: Update maximum value for `--usage-threshold` to support large volumes

### Network

* `az network virtual-appliance inbound-security-rule`: Support for Permanent Inbound Security Rule

### RDBMS

* `az postgres flexible-server upgrade`: Add capability to perform major version upgrade to PG16

### Service Connector

* `az aks connection`: AKS support for Service Connector
* `az webapp/containerapp/spring connection create/update`: Store configurations in App Config
* `az source connection create`: Support auth opt out

### Service Fabric

* `az sf managed-cluster network-security-rule`: Add new network security rule commands

### SQL

* `az sql server create/update`: Add 1.3 to minTLSEnum and make TLS 1.2 as default

## April 02, 2024

Version 2.59.0

### ACR

* Fix #14768: `az acr login`: Add environment variable for docker command

### ACS

* `az aks create`: Add flag `--enable-app-routing` to enable app routing
* `az aks approuting`: Add command group to handle enable/disable/update of the app routing addon
* `az aks approuting zone`: Add command group to handle add/delete/update/list actions of DNS zone resources associated to the approuting addon
* `az aks create/update`: Introduce changes for Azure container storage in ACS CLI

### AD

* `az ad`: Rename Azure Active Directory to Microsoft Entra ID

### AKS

* `az aks create`: Add optional parameter `--revision` to set revision for the Azure Service Mesh addon while creating AKS cluster
* `az aks mesh get-upgrades`: Fix command failure with a traceback if ASM addon is disabled
* `az aks create/update`: Enable mooncake support for managed prometheus addon
* `az aks create/update`: Block Azure Managed Grafana for managed prometheus addon in air gapped cloud
* `az aks create`: Correct use of "comma-separated" in help

### App Config

* `az appconfig feature filter update`: GA command
* `az appconfig kv export`: GA parameter `--export-as-reference`

### App Service

* `az functionapp create`: Add support for Node 20 for Flex function apps
* `az functionapp create`: Make Node 20 the default for node flex function apps and Python 3.11 the default for python flex function apps
* `az functionapp create`: Add support for SystemAssignedIdentity and UserAssignedIdentity as the deployment storage authentication type
* `az webapp update`: Add new parameter `--elastic-web-app-scale-limit` and scaling parameter options
* `az appservice plan update`: Add new parameter `--elastic-web-app-scale-limit` and scaling parameter options
* `az webapp deployment source config-zip`: Mark this command as deprecated, recommend using the `az webapp deploy` command instead of it

### ARM

* `az stack group create`: Deprecate the `--delete-resources`, `--delete-resource-groups` and `--delete-all` options and redirect to the new `--action-on-unmanage` argument
* `az stack group delete`: Deprecate the `--delete-resources`, `--delete-resource-groups` and `--delete-all` options and redirect to the new `--action-on-unmanage` argument
* `az stack sub create`: Deprecate the `--delete-resources`, `--delete-resource-groups` and `--delete-all` options and redirect to the new `--action-on-unmanage` argument
* `az stack sub delete`: Deprecate the `--delete-resources`, `--delete-resource-groups` and `--delete-all` options and redirect to the new `--action-on-unmanage` argument
* `az stack mg create`: Deprecate the `--delete-resources`, `--delete-resource-groups` and `--delete-all` options and redirect to the new `--action-on-unmanage` argument
* `az stack mg delete`: Deprecate the `--delete-resources`, `--delete-resource-groups` and `--delete-all` options and redirect to the new `--action-on-unmanage` argument
* `az deployment`: Treat nullable parameters as non-required for Bicep deployment

### ARO

* `az aro create/validate`: Fix bug in permissions validation that was preventing cluster creation in cases where the invoking user had the necessary permissions

### CDN

* `az afd profile`: Add parameter `--identity`

### Compute

* `az snapshot grant-access`: Add parameter `--file-format` to support specifying file format when making request for SAS on a VHDX file format snapshot
* `az vmss create`: Add `--enable-auto-os-upgrade` parameter to support automatic OS Upgrade while creating VMSS
* `az sig image-definition create`: Add warning message for Hyper-V generation and Security Type
* `az vmss create/update`: Add parameters to specify the security posture to be used for all virtual machines in the scale set
* `az capacity reservation group create/update`: Add new parameter `--sharing-profile` to support sharing capacity reservation group across subscriptions
* `az snapshot create`: Add parameter `--bandwidth-copy-speed` to allow a snapshot to be copied at a quicker speed

### DataBoxEdge

* `az databoxedge device`: Add command group `share` to support managing device share
* `az databoxedge device`: Add command group `user` to support managing device user
* `az databoxedge device`: Add command group `storage-account` to support managing device storage account
* `az databoxedge device`: Add command group `storage-account-credential` to support managing device storage account credential
* `az databoxedge device`: Add command `get-extended-information` to support getting extended information

### MySQL

* `az mysql flexible-server advanced-threat-protection-setting show`: Show server's advanced threat protection setting
* `az mysql flexible-server advanced-threat-protection-setting update`: Update server's advanced threat protection setting using `--state` as Enabled/Disabled
* `az mysql flexible-server import create`: Add support for online migration for single to flex

### NetAppFiles

* `az netappfiles check-file-path-availability`: Add new command to check if a file path is available
* `az netappfiles check-name-availability`: Add new command to check if a resource name is available
* `az netappfiles check-quota-availability`: Add new command to check if a quota is available
* `az netappfiles query-network-sibling-set`: Add new command to describe a network sibling set
* `az netappfiles update-network-sibling-set`: Add new command to update the network features of a network sibling set
* `az netappfiles quota-limit`: Add new command group to manage quota limits
* `az netappfiles volume populate-availability-zone`: Add new command to populate availability zone information for a volume
* `az netappfiles volume replication re-initialize`: Add new command to re-establish a previously deleted replication between 2 volumes that have a common ad-hoc or policy-based snapshots

### Network

* `az network virtual-appliance connection`: Add update command for NVA connection
* `az network dns record-set`: Add `--traffic-management-profile` for TMLink recordset feature
* `az network application-gateway waf-policy`: Change default rule set from CRS3.0 to DRS2.1
* `az network virtual-appliance`: Add `--internet-ingress-ips` and `--network-profile`

## March 05, 2024

Version 2.58.0

### ACR

* `az acr`: Update registry and webhook example names to be lowercase
* `az acr create/update`: Add new argument `--allow-metadata-search` to enable the metadata-search feature for the registry

### AKS

* Add monitoring addon to support default workspace in AGC
* `az aks get-versions`: Show extra column on supportPlan
* `az aks create/update`: Update region map for default region creation with new Azure Monitor Workspace regions
* `az aks update`: Zero can be set to outbound-ports,outbound-ip-count in loadbalancer profile and outbound-ip-count in natgateway profile in AKS

### API Management

* `az apim api export`: Add command to export an API Management API

### App Service

* `az webapp up/create/update`: Add new parameter `--basic-auth` to allow users to enable and disable basic auth

### ARM

* Fix #27855: `az bicep generate-params`: Bicep install messages sent to stdout

### Backup

* [BREAKING CHANGE] `az backup item set-policy`: Add warning prompt for migration from Standard to Enhanced Policy

### Batch

* `az batch pool create`: Add new parameter `--resource-tags` to support specifying resource tags for the pool. Any resource created for the pool will then also be tagged by the same resource tags
* `az batch pool create`: Add new parameters `--security-type`, `--encryption-at-host`, `--secure-boot-enabled`, and `--v-tpm-enabled` to support Trusted Launch Security Type for VMs/VMSS deployments
* `az batch pool create`: Add new parameters `--caching`, `--disk-size-gb`, `--write-accelerator-enabled`, and `--storage-account-type` to support Batch Node Agent temp disk-less SKUs

### CDN

* Fix #28240: `az afd rule create`: Cannot create without condition
* Fix #28223: `az afd route create`: Cannot create without `--content-types-to-compress`
* Fix #27744: `az afd origin-group`: Add parameter `--enable-health-probe`

### Compute

* `az vmss nic`: Update help messages to guild users to specific commands for Flexible VMSS
* `az vm host redeploy`: Add command to redeploy the dedicated host
* Fix #28397: `az vm create`: Fix creating VM with `--security-type Standard`
* `az vmss application set`: Fix updates to the purchase plan are not supported when updating VMSS
* `az vmss update-domain-walk`: Add new command to support updating vm in a service fabric vmss

### Containerapp

* `az containerapp revision copy`: Fix `--from-revision` bug for inheriting a specific revision contains scale rules
* `az containerapp update`: Fix TypeError: Argument of type 'NoneType' is not iterable
* Fix #28226: `az containerapp job update`: Update existing scale rules if `--scale-rule-name` is passed

### Core

* [BREAKING CHANGE] `az login`: Replace `allow_broker` with `enable_broker_on_windows` (#27726)

### Cosmos DB

* `az cosmosdb sql database/container restore`: Fix support for restore of deleted database resource in the same SQL account
* `az cosmosdb mongodb database/collection restore`: Fix support for restore of deleted database resource in the same MongoDB account
* `az cosmosdb gremlin database/graph restore`: Fix support for restore of deleted database resource in the same gremlin account
* `az cosmosdb table restore`: Fix support for restore of deleted table resource in the same account

### MySQL

* `az mysql flexible-server import create`: Change the default progress message from starting to running

### Network

* `az network virtual-appliance connection`: Add show and list commands for NVA connection
* `az network vnet-gateway`: Add parameters `--allow-remote-vnet-traffic` and `--allow-vwan-traffic`
* `az network express-route gateway`: Add parameter `--allow-non-vwan-traffic`

### RDBMS

* Fix #27713: `az postgres flexible-server list-skus -o table`: Fix table output from list-skus command

### Security

* `az security api-collection`: Manage Azure API Management API connections to Microsoft Defender for APIs
* `az security security-connector`: Manage cloud security posture management (CSPM) and cloud workload protection (CWP) across multicloud resources

### SQL VM

* Fix #27300: `az sql vm group create`: `--cluster-subnet-type` should only be passed into `WsfcDomainProfile`

### Storage

* Fix #28356: `az storage account or-policy update`: Fix `-p @policy.json` to allow passing in json files
* `az storage blob upload-batch`: Support `--tags`, make `--overwrite` non-preview

## February 06, 2024

Version 2.57.0

### AKS

* `az aks upgrade`: Add forceupgrade settings to aks stable cli
* `az aks mesh`: Add `az aks mesh` commands to manage Azure Service Mesh in given cluster
* `az aks nodepool add/update/upgrade`: Add new parameter `--node-soak-duration` to wait after draining a node and before reimaging it and moving on to next node

### App Service

* `az functionapp create`: Use app insights connection string instead of instrumentation key
* `az webapp create`: Add new parameter `--acr-use-identity` to configure pull image from ACR using MSI when creating a container web app
* `az webapp up`: Add `--track-status` arg to use deploymentstatus API
* `az webapp deployment source config-zip`: Add `--track-status` arg to use deploymentstatus API
* `az functionapp create`: Only allow apps with functions version 4

### Backup

* `az backup restore restore-disks`: Add support for disk restore in edge-zone backups
* `az backup restore restore-disks`: Support for Taiwan North and Taiwan North-West Cross region restore

### Billing

* `az billing account`: Add new command `list-invoice-section` to support listing invoice section
* `az billing account`: Add new command group `invoice-section` to support managing account invoice section
* `az billing`: Add new command `enrollment-account` to support managing enrollment account
* `az billing invoice section`: Add new command `initiate-transfer` to support intiating transfer
* `az billing profile`: Add new command `reservation list ` to support managing reservation
* `az billing`: Add new command group `transfer` to support managing transfer

### Compute

* `az image builder error-handler`: Add group to manage error handling options upon a build failure
* `az sshkey create`: Add parameter `--encryption-type` to specify the encryption type of SSH keys to be generated
* `az vm monitor log show`: Deprecate `azure-loganalytics` and apply `azure-monitor-query`
* `az vm/vmss create`: Support Trusted Launch as default deployment option

### Consumption

* Fix #20995 #23825: Update `az consumption` API version

### Containerapp

* `az containerapp update`: Fix issue for minReplicas in `--yaml` or `--min-replicas` is not set when the value is 0
* `az containerapp up`: Fix issue when registry creds are provided for ACRs using `containerapp up` command

### Key Vault

* `az keyvault create`: Add warning for upcoming breaking change that `--enable-rbac-authorization` will default to `true`
* `az keyvault secret set-attributes`: Fix 'Datetime with no tzinfo will be considered UTC' warning

### Monitor

* `az monitor metrics`: Add `list-sub` and `list-sub-definition`
* `az monitor metrics list`: Fix `--top` help message

### MySQL

* `az mysql flexible-server import create`: Add support for operation progress estimated completion time for import from physical backup from azure blob to flexible server

### Network

* `az network vnet-gateway create/update`: Add parameter `--enable-private-ip`
* Fix #28131: `az network vnet-gateway list`: Conflict key when apply client flatten
* `az network express-route port authorization`: Support to manage authorization with express route port
* `az network private-link-service list-auto-approved`: Support to list all auto-approved private link services
* `az network public-ip ddos-protection-statu show`: Support to get the DDoS protection status of public IP address
* `az network vnet-gateway`: Support ExpressRoute SKU
* `az network lb create`: Support cross-subscription resource ID

### Packaging

* Support Windows ZIP package (Preview)

### RDBMS

* `az postgres flexible-server private-endpoint-connection`: Add support for private endpoint connection commands like list, show, approve, reject, delete for PostgreSQL flexible server
* `az postgres flexible-server private-link-resource`: Add support for private link resource commands like list, show for PostgreSQL flexible server
* `az postgres flexible-server replica stop-replication`: Stop replication to a read replica and make it a read/write server. This command is deprecated. Use `az postgres flexible-server replica promote` instead.

### Redis

* `az redis flush`: Add support for flush operation
* `az redis create`: Add support for Microsoft Entra Authentication
* `az redis access-policy/access-policy-assignment`: New command groups to manage access policy

### Service Connector

* `az webapp/containerapp/spring connection create/update app-insights`: Support App Insights as target service
* `az webapp connection create sql`: Support auto install for serviceconnector-passwordless extension
* `az webapp/functionapp/containerapp/springapp connection`: Support Microsoft Entra ID auth types for table storage
* `az webapp/containerapp/spring connection create/update`: Support opt out action for configurationInfo and publicNetwork

### SQL

* `az sql db ltr-policy/ltr-backup`: Add support for backup storage access tier
* `az sql db ltr-policy set`: Add the make-backups-immutable parameter to ltr policy
* `az mi create/update`: Add optional parameter `--database-format` and `--pricing-model` for SQL Managed Server resource
* `az sql mi refresh-external-governance-status`: Add a new command for Azure SQL Managed Instance refresh external governance status

### Storage

* `az storage file copy start`: Fix when copying between two storage accounts and source file has no parent directory
* Fix #28202: `az storage container policy create`: Fix creating an access policy would delete public access permission
* `az storage container set-permission`: Fix failing when updating public access permission with an existing access policy
* Fix #21876: `az storage blob upload-batch/download-batch/delete-batch`: Add double quotes to `--pattern` value for unix shell

## January 09, 2024

Version 2.56.0

### AKS

* `az aks create/update`: Add new parameter `--load-balancer-backend-pool-type` to define the Load Balancer backend pool type of managed inbound backend pool
* `az aks create`: Add parameter `--node-public-ip-tags` to specify the ipTags of the node public IPs
* `az aks nodepool`: Add parameter `--node-public-ip-tags` to specify the ipTags of the node public IPs
* `az aks create` and `az aks nodepool add`: Add crg-id option to create nodepool with Capacity Reservation Group
* `az aks stop`: Add warning when private link cluster is stopped
* `az aks trustedaccess role`: Add new command group to manage trusted access roles
* `az aks trustedaccess rolebinding`: Add new command group to manage trusted access role bindings
* `az aks trustedaccess rolebinding list`: Add new command to list all the trusted access role bindings
* `az aks trustedaccess rolebinding show`: Add new command to get the specific trusted access role binding according to binding name
* `az aks trustedaccess rolebinding create`: Add new command to create a new trusted access role binding
* `az aks trustedaccess rolebinding update`: Add new command to update an existing trusted access role binding
* `az aks trustedaccess rolebinding delete`: Add new command to delete a trusted access role binding according to name
* `az aks update`: Add parameter `--network-plugin` to update the network plugin of the AKS cluster

### App Config

* `az appconfig feature set`: Add requirement type to feature command

### App Service

* `az functionapp create`: Add DAPR support for Centauri apps
* `az functionapp create`: Remove workarounds for Centauri
* `az webapp deploy`: Add `--track-status` arg to use deploymentstatus API
* `az functionapp create`: Add workload profile support for Centauri apps

### ARM

* `az bicep publish`: Add optional parameter `--with-source` to publish source code with the module (experimental)
* `az lock delete`: Fix the case sensitive comparison issue for resource group name

### Compute

* `az vmss create`: Change `--orchestration-mode` to support only `uniform` for old profile
* `az vm/vmss create/update`: Add new parameters `--enable-proxy-agent` and `--proxy-agent-mode` to support azure metadata security protocol
* `az vm/vmss create`: Add new option `NonPersistedTPM` for parameter `--os-disk-security-encryption-type` to support creating Intel TDX based Confidential VM

### Containerapp

* `az containerapp job update`: Fix bug for minExecutions in `--yaml` is not set when the value is `0`
* `az containerapp hostname bind`: Fix an issue about parsing the environment's resource group when the `--environment` is a resource id

### Cosmos DB

* `az cosmosdb sql database restore`: Add support for restore of deleted database resource in the same SQL account
* `az cosmosdb sql container restore`: Add support for restore of deleted container resource in the same SQL account
* `az cosmosdb mongodb database restore`: Add support for restore of deleted database resource in the same MongoDB account
* `az cosmosdb mongodb collection restore`: Add support for restore of deleted collection resource in the same MongoDB account
* `az cosmosdb gremlin database restore`: Add support for restore of deleted database resource in the same gremlin account
* `az cosmosdb gremlin graph restore`: Add support for restore of deleted graph resource in the same gremlin account
* `az cosmosdb table restore`: Add support for restore of deleted table resource in the same account

### Eventhub

* `az eventhubs georecovery-alias create`: Name parameter is required

### Extension

* `az extension`: Enable extension semantic versioning and join `experimental` into `preview`
* `az extension add/update`: Add `--allow-preview` to distinguish stable-only installation with preview-included installation

### Key Vault

* `az keyvault create/update-hsm`: GA `--mi-user-assigned`
* `az keyvault backup/restore start`: GA `--use-managed-identity`

### Monitor

* `az monitor log-analytics workspace`: Add `list-link-target` and `list-available-service-tier`

### Network

* `az network application-gateway waf-config list-dynamic-rule-sets`: Support to get the WAF dynamic manifest
* `az network nsg rule list`: Fix ranges and prefixes disappeared with `-o table` option
* `az network vnet subnet`: Add `--private-endpoint-network-policies` and `--private-link-service-network-policies`

### RDBMS

* `az postgres flexible-server virtual-endpoint`: Add support for virtual endpoints for PostgreSQL flexible server
* `az postgres flexible-server replica promote`: Add capability to stop replication and promote to primary or standalone server with the selection of planned/force data syncs.
* `az postgres flexible-server server-logs list`: List server log files for PostgreSQL flexible server
* `az postgres flexible-server server-logs download`: Download server log files for PostgreSQL flexible server
* `az postgres flexible-server create`: Add capability to set storage type to PremiumV2_LRS and provide values for IOPS and Throughput during creation
* `az postgres flexible-server update`: Add capability to update the values of IOPS and Throughput during update
* `az postgres flexible-server migration create`: Add migration option like Migrate, Validate and ValidateAndMigrate using parameter `--migration-option` and json file for Migration configuration to support additional properties like sourceType and sslMode

### Redis

* `az redis import/export`: Add `--storage-subscription-id` support while importing/exporting data

### Service Bus

* `az servicebus georecovery-alias create`: Name parameter is required

### Storage

* [BREAKING CHANGE] `az storage account create`: Server change default value for `--allow-blob-public-access` and `--allow-cross-tenant-replication` to `False` for security concerns

### Upgrade

* `az upgrade`: Add `--allow-preview` to distinguish stable-only extension installation with preview-included extension installation

## December 05, 2023

Version 2.55.0

### ACR

* `az acr login`: Allow registry names with hyphen
* Fix #27487: `az acr check-health`: Fix DOCKER_PULL_ERROR when acr check-health for Mac OS

### AKS

* `az aks update`: Update outbound ip description and remove limitation
* `az aks create`: Add arguments `--asg-ids` and `--allowed-host-ports`
* `az aks nodepool add/update`: Add arguments `--asg-ids` and `--allowed-host-ports`

### App Service

* Fix #27189: `az webapp log tail`: Catch exception when scm connection is lost

### Billing

* `az billing period list`: Fix `--top` does not work as expected
* `az billing invoice download`: Fix command does not work
* `az billing invoice list`: Fix `--period-end-date` and `--period-start-date` help message error

### Compute

* `az disk create`: Add new parameter `--optimized-for-frequent-attach` to improve reliability and performance of data disks that are frequently attached
* `az disk/snapshot create`: Add new parameter `--elastic-san-resource-id` to support creating through the ARM id of elastic san volume snapshot

### Containerapp

* `az containerapp ingress cors enable`: Only update arguments `--allow-headers`, `--allow-credentials`, `--allow-methods`, `--expose-methods`, `--max-age` when the value is not `None`
* `az containerapp`: Change the container-app name and container-app job name in the example to legal names

### Key Vault

* `az keyvault backup start`: Add `status` in output

### Monitor

* `az monitor activity-log alert`: Upgrade api-version to `2020-10-01` to include `any-of` query condition
* `az monitor activity-log alert`: Expose parameter `all-of` to enable user modifying query condition specifically

### Network

* `az network private-endpoint-connection`: Add provider `Microsoft.DBforPostgreSQL/flexibleServers`
* `az network public-ip prefix`: Add parameter `--tier`

### RDBMS

* `az postgres flexible-server replica create`: Add support for parameters like `--tier`, `--sku-name`, `--storage-size` during replica creation
* `az postgres flexible-server update`: Add support for custom IOPS update for flexible server using `--performance-tier`
* `az postgres flexible-server advanced-threat-protection-setting show`: Show advanced threat protection setting
* `az postgres flexible-server advanced-threat-protection-setting update`: Update advanced threat protection setting using `--state` as Enabled/Disabled

### Service Connector

* `az containerapp connection create`: Enable Key Vault Reference in Container Apps

### SQL

* `az instance-pool create/update`: Add optional parameter `--maintenance-configuration-id` for SQL Instance Pool resource
* `az mi create/update`: Add optional parameter `--instance-pool-name` for SQL Managed Server resource

### Storage

* `az storage blob upload`: Increase `max_block_size` for append/block blobs of size >= 8mb to 8mb instead of 4mb
* `az storage blob upload`: Change default `max_connections` for append blob to 1
* `az storage file upload/upload-batch`: Fix `--allow-trailing-dot` breaking `--connection-string` usage
* Fix #27899: `az storage account create`: Run `check_name_availability()` first and throw a warning when an existing account with the name is found

## November 14, 2023

Version 2.54.0

### ACR

* `az acr artifact-streaming`: Add new group to include a subgroup operation and the commands create/show/update
* `az acr artifact-streaming operation`: Add new group to help the user manage the artifact streaming creation with the commands cancel/show
* `az acr login`: Add additional parameter validation to check registry name is valid
* `az acr cache`: Add optional `--resource-group` parameter
* `az acr credential-set`: Add optional `--resource-group` parameter

### AKS

* [BREAKING CHANGE] `az aks create`: Make container log V2 as default and remove region dependency
* `az aks create/update`: Support custom ips/ipprefixes and managed ips being assigned to aks cluster outbound resources together
* `az aks nodepool add/update/upgrade`: Add new parameter `--drain-timout` to slow down the upgrade
* `az aks update`: Fix bug where supportPlan can be reset to None
* `az aks nodepool add`: Fix incorrectly specified property name for option `--drain-timeout`
* `az aks create/update`: Enable Grafana support in US Government clouds
* `az aks create/update`: Update region map for default region creation with new Azure Monitor Workspace regions
* `az aks create/update`: Add cluster scope to recording rule groups created during Managed Prometheus onboarding
* `az aks update`: Add `--network-policy` to support updating the mode of a network policy

### APIM

* `az apim api create`: Make `--authorization-scope` parameter optional for setting auth server

### App Config

* [BREAKING CHANGE] `az appconfig kv export`: Add validations to snapshot kv export to App Service
* [BREAKING CHANGE] `az appconfig kv import/export`: Add skip-features and skip-keyvault restriction for snapshots
* `az appconfig snapshot`: GA snapshot related features

### App Service

* [BREAKING CHANGE] `az functionapp`: Redact key value output on keys set
* [BREAKING CHANGE] Redact output on deployment source config
* [BREAKING CHANGE] `az webapp config`: Redact webapp config connection-string and storage-account values
* [BREAKING CHANGE] `az functionapp/webapp deployment source update-token`: Redact tokens output on deployment source update-token
* [BREAKING CHANGE] `az appservice ase create`: Update the default App Service Environment to V3
* `az appservice list-locations`: Add `--hyperv-workers-enabled` parameter to get regions which support hosting web apps on windows container workers
* `az functionapp deployment source config-zip`: Add the deployer information to improve telemetry
* `az webapp up`: Fix `--logs` arg fails with an exception
* `az functionapp create`: Add new parameter `--workspace` to support creating workspace-based app insights components

### ARM

* [BREAKING CHANGE] `az stack mg create`: Not supplying `--deployment-scope` will no longer default the underlying deployment to the current subscription scope, but to the mg scope of the deployment stack.
* `az stack sub create`: Add no wait support
* `az stack mg create`: Add no wait support
* `az stack group create`: Add no wait support
* `az bicep lint`: Add new command to lint a bicep file
* `az deployment group create`: Support supplemental parameters when used with `.bicepparam` parameter file
* `az deployment`: Add support for determining type of parameters whose definition uses a $ref

### ARO

* `az aro create`: Add new `--enable-preconfigured-nsg` parameter, allowing users to enable or disable preconfigured NSGs
* `az aro create`: Add network contributor to the NSG resource for the cluster SP and FP SP
* `az aro update`: Add network contributor to the NSG resource for the cluster SP and FP SP, if not already when preconfigured NSG is enabled

### Backup

* `az backup vault create`: Allow updates to immutability for vaults with Managed Identity set
* `az backup vault update`: Add new command to support updating vault properties without the `--location` parameter

### Batch

* `az batch keys renew`: Update help with security warning
* `az batch keys list`: Update help with security warning
* `az batch account identity show`: Update help with security warning

### Compute

* [BREAKING CHANGE] Remove unversioned image aliases
* [BREAKING CHANGE] `az vm/vmss identity assign`: Remove the default value `Contributor` of parameter `--role`
* [BREAKING CHANGE] `az disk create`: Support creating disk with Gen2 and TLVM as default
* [BREAKING CHANGE] `az vm/vmss create`: Disable integrity monitoring by default
* [BREAKING CHANGE] `az disk/snapshot create`: Change the default value of `--hyper-v-generation` from `V1` to `None`
* [BREAKING CHANGE] `az vm create`: Change default value to `Standard` for LB options
* [BREAKING CHANGE] `az vmss create`: Change default value to `Standard` for LB options
* [BREAKING CHANGE] `az vmss create`: Change the default value of `--orchestration-mode` from `uniform` to `flexible`
* [BREAKING CHANGE] `az vm/vmss create`: Support Trusted Launch as default deployment option when creating vm/vmss with marketplace image
* [BREAKING CHANGE] `az vm/vmss create`: Support Trusted Launch as default deployment option when creating vm/vmss from existing disk or image
* [BREAKING CHANGE] `az vm/vmss create`: Support Trusted Launch as default deployment option when creating vm/vmss with minimal inputs
* Fix #27446: `az vm encryption enable`: Fix using incorrect client when `--key-encryption-key` is specified
* Fix #27451: `az vmss list-instances`: Fix API profile to resolve no registered resource provider found error
* `az vm create`: Format the notification message of recommendation region
* `az restore-point create`: Add new parameters `--source-os-resource`, `--os-restore-point-encryption-set` and `--os-restore-point-encryption-type` to support encryption OS disk
* `az restore-point create`: Add new parameters `--source-data-disk-resource`, `--data-disk-restore-point-encryption-set` and `--data-disk-restore-point-encryption-type` to support encryption data disk
* `az disk create`: Add new parameter `--optimized-for-frequent-attach` to improve reliability and performance of data disks that are frequently attached
* `az disk/snapshot create`: Add new parameter `--elastic-san-resource-id` to support creating through the ARM id of elastic san volume snapshot
* `az disk create`: Revert new parameter `--optimized-for-frequent-attach`
* `az disk/snapshot create`: Revert new parameter `--elastic-san-resource-id`

### Containerapp

* [BREAKING CHANGE] `az containerapp env workload-profile update`: Remove `--workload-profile-type` as it does not work in server side
* [BREAKING CHANGE] `az containerapp env create`: Update the default value of `--enable-workload-profiles` to `True`
* `az containerapp job create`: Fix AttributeError when `--trigger-type` is None
* `az containerapp compose create`: Fix bug where environment's resource group is not resolved from `--environment` when the input value is a resource id
* `az containerapp env workload-profile delete`: Fix issue when deleting wp for env with custom domain
* `az containerapp update`: Fix appending to NoneType object bug for `--secret-volume-mount`
* `az containerapp create/update`: Hide environment variables, scale rules metadata
* `az containerapp job create/update`: Hide environment variables, scale rules metadata
* `az containerapp compose create`: Fix containerapp invalid memory resource
* `az containerapp job create`: Fix problem of parsing parameters `minExecutions` and `maxExecutions` from `--yaml`

### Cosmos DB

* `az cosmosdb create/update`: Add support for minimum allowed TLS version and burst capacity configuration

### Eventhub

* [BREAKING CHANGE] `az eventhubs georecovery-alias update`: This command is removed.

### Key Vault

* [BREAKING CHANGE] `az keyvault storage`: Remove this command group since service doesn't maintain anymore
* `az keyvault create/update-hsm`: Add `--mi-user-assigned` to support MHSM managed identity
* `az keyvault backup/restore start`: Add `--use-managed-identity` to exempt SAS token
* `az keyvault key`: Add hsm platform info in response

### Monitor

* [BREAKING CHANGE] `az monitor activity-log alert create`: Change default value from resourceGroupId to subscriptionId for parameter `--scope`
* [BREAKING CHANGE] `az monitor metrics alert`: Change datetime output to be consistent with native response
* [BREAKING CHANGE] `az monitor log-analytics workspace table search-job create`: Remove `schema` wrapper for `searchResults` in api response
* `az monitor log-analytics workspace create`: Add `--identity-type` and `--user-assigned` arguments
* `az monitor log-analytics workspace update`: Add `--identity-type` and `--user-assigned` arguments
* `az monitor log-analytics workspace table`: Enable `--retention-time` to be workspace retention when setting as `-1`
* `az monitor log-analytics workspace table`: Enable `--total-retention-time` to be workspace retention when setting as `-1`
* `az monitor log-analytics workspace table search-job`: Add new command `cancel`
* `az monitor autoscale update`: Fix update failure with empty notification

### MySQL

* `az mysql flexible-server gtid reset`: Remove geo-backup check

### Network

* [BREAKING CHANGE] `az network public-ip create`: Change default value of `--sku` to standard
* [BREAKING CHANGE] `az network lb create`: Change default value of `--sku` to standard
* `az network private-dns record-set a add-record`: Fix record cannot be added when record set is empty
* `az network lb address-pool`: Add parameter `--sync-mode`
* `az network application-gateway listener`: Add parameter `--host-names`
* `az network private-endpoint-connection`: Add provider `Microsoft.DocumentDB/mongoClusters`
* Fix #27508: `az network private-dns zone import`: Import fails when zone already exists
* `az network virtual-appliance`: Add parameter `--identity`
* Fix #27735: `az network vnet-gateway show`: Conflict key when apply client flatten

### Packaging

* [BREAKING CHANGE] Remove unnecessary packages in docker image
* Support Python 3.11
* Bump embedded Python version to 3.11.5
* Add Azure Linux docker image
* Fix #22741: `az upgrade`: This command becomes non-blocking on Windows

### Profile

* `az account get-access-token`: Return `expires_on` as POSIX timestamp

### RDBMS

* `az postgres flexible-server geo-restore`: Add cross subscription geo-restore support for PostgreSQL flexible server
* `az postgres flexible-server restore`: Add cross subscription restore support for PostgreSQL flexible server
* `az postgres flexible-server upgrade`: Add MVU support for PG version 15

### Role

* [BREAKING CHANGE] `az role assignment create`: `--scope` is now a required argument.
* [BREAKING CHANGE] `az role assignment create`: Remove `--resource-group` argument.

### Search

* `az search service create`: Add `--semantic-search` argument.

### Security

* `az security pricing create`: Support subplan and extensions parameters
* `az security pricing get`: Support extensions in the return result

### Service Bus

* [BREAKING CHANGE] `az servicebus georecovery-alias update` : This command is removed.
* [BREAKING CHANGE] `az servicebus migration update`: This command is removed.

### Service Connector

* [BREAKING CHANGE] `az spring connection`: Remove default value of `--deployment` to support spring app connection

### SignalR

* `az signalr replica create/list/show/delete`: Add replica command group for `az signalr`

### SQL

* `az sql db create/update`: Add `--use-free-limit` and `--free-limit-exhaustion-behavior` to support free limit database

### Storage

* `az storage file/directory`: Add `--disallow-trailing-dot`
* `az storage share list-handle/close-handle`: Add `--disallow-trailing-dot`
* `az storage file copy start/start-batch`: Add `--disallow-source-trailing-dot`
* Fix #27590: `az storage fs directory download`: Check user system PATH for azcopy and use CLI config directory for new install
* `az storage account blob-inventory-policy create`: Add support for new filter `creationTime.lastNDays` in json
* `az storage account migration start/show`: Support customer initiated migration between replication options
* [BREAKING CHANGE] `az storage container-rm update`: Remove `--default-encryption-scope` and `--deny-encryption-scope-override` as they should only be specified during create

## October 24, 2023

Version 2.53.1

### AKS

* Hotfix: `az aks update`: Fix bug where supportPlan can be reset to None

### App Service

* [BREAKING CHANGE] Redact appsettings output on set/delete commands

## September 26, 2023

Version 2.53.0

### ACR

* `az acr token create`: Fix random order of repo valid actions and gateway valid actions in the help message

### AKS

* `az aks update`: Add new parameter `--private-dns-zone` to support private DNS zone for AKS private cluster
* `az aks update`: Add new parameter `--disable-windows-gmsa` to support disabling Windows gMSA in an AKS cluster
* `az aks update`: Add forceupgrade settings to aks stable cli

### App Config

* `az appconfig kv import/export`: Remove `skip-features` and `skip-keyvault` restriction for snapshots

### App Service

* `az functionapp create`: Enable distributed tracing for non consumption apps

### ARM

* `az deployment group create`: Make `--template-file` parameter optional when used with `.bicepparam` parameter file
* `az account list-locations`: Add new parameter `--include-extended-locations` to support listing extended locations

### Backup

* `az backup backup-properties`: Add option for setting `--soft-delete-feature-state` to "AlwaysOn", and `--soft-delete-duration` with values between 14 to 180 (inclusive)
* `az backup vault list-soft-deleted-containers`: List all soft-deleted containers in a backup vault

### Compute

* `az vm/vmss extension set`: Enable auto upgrade by default for CodeIntegrityAgent extension
* `az vm create`: Add warning message for Basic option removal
* `az vmss create`: Add warning message for Basic option removal

### Containerapp

* `az containerapp`: Move `containerapp` from CLI extension to core CLI
* `az containerapp env create`: Add `--enable-workload-profiles` to specify if the environment is enabled to have workload profiles
* `az containerapp env dapr-component create`: Fix the sample link for `--yaml` parameter

### Cosmos DB

* `az cosmosdb postgres`: GA Cosmos DB for PostgreSQL

### MySQL

* `az mysql flexible-server replica create`: Add new parameters to support replica creation

### NetAppFiles

* `az netappfiles volume`: Add new command `get-groupid-list-for-ldapuser` to Get Group Id List for LDAP User
* `az netappfiles account update`: Add parameter `--identity-type`
* `az netappfiles volume update`: Add parameter `--snapshot-dir-visible`. If enabled (true) the volume will contain a read-only snapshot directory which provides access to each of the volume's snapshots (defaults to true)

### Network

* `az network virtual-appliance`: Add parameter `--additional-nics`
* `az network vnet subnet`: Add parameter `--default-outbound-access`
* `az network public-ip create`: Add warning message for Basic option removal
* `az network lb create`: Add warning message for Basic option removal

### RDBMS

* `az postgres flexible-server create/update`: Add capability to enable/disable storage auto-grow during creation and update

### Service Connector

* `az spring connection`: Add deprecated message for `--deployment` breaking change
* `az webapp connection`: Add new parameter `--slot` to support webapp slot connection

### SQL

* `az sql failover-group set-primary`: Add parameter `--try-planned-before-forced-failover` to support hybrid geo-failover

### Storage

* Fix #26732: `az storage blob copy start-batch`: Add `--rehydrate-priority` to batch copy
* Fix #27052: `az storage blob delete-batch`: Use utc as default timezone to remove "Datetime with no tzinfo will be considered UTC." warning

## September 05, 2023

Version 2.52.0

### AKS

* `az aks create/update`: Add new parameter `--enable-vpa` to support enabling vertical pod autoscaler for cluster
* `az aks update`: Add new parameter `--network-dataplane` to specify the network dataplane used in the Kubernetes cluster
* `az aks create/update`: Add new parameter `--node-os-upgrade-channel` to specify which OS on your nodes is updated
* `az aks update`: Retain value in network profile in mc object only when decorator is in update mode
* `az aks update`: Outbound ip/outbound ipprefix and managed outbound ip should be mutually exclusive

### App Config

* `az apponfig kv import`: Add new parameter `--import-mode` to specify whether to overwrite already existing key-values or ignore matching keys
* `az appconfig kv export`: Add new parameter `--snapshot` to support exporting all key values from a snapshot of the source configuration
* `az appconfig kv import`: Add new parameter `--src-snapshot` to support importing all key values from a snapshot of the source configuration

### App Service

* Fix #26736: `az logicapp create`: Add `--runtime-version` and `--functions-version` optional parameters
* `az webapp config connection-string set`: Allow users to use json file to set the connection string

### ARM

* Fix #26112: `az deployment group create`: Fix the warning log `mode is not a known attribute of class TemplateLink`
* `az bicep build-params`: Support generating `parameters.json` file from the given `bicepparam` file with the `--file` argument
* `az bicep decompile-params`: Support generating `parameters.bicepparam` file from the given `parameters.json` file with the `--file` argument
* `az bicep generate-params`: Support generating `main.parameters.json` with the parameters that doesn't have default values in the given `.bicep` file
* `az bicep generate-params`: Add new parameter `--output-format` to support generating parameter file in `bicepparam` and `json` formats
* `az bicep generate-params`: Add new parameter `--include-params` to support generating parameter file with all the parameters in the given `bicep` file, or with only parameters that doesn't have default values in the given `bicep` file

### ARO

* `az aro create`: Add new `--outbound-type` parameter, allowing users to select "Loadbalancer" (default) or "UserDefinedRouting"
* `az aro create`: Perform pre-flight validation of prerequisite permissions before creation
* `az aro validate`: New command to perform explicit validation of prerequisite permissions

### Backup

* `az backup restore restore-azurefileshare`: Add `--target-rg-name` parameter to specify the resource group of the destination storage account

### Batch

* `az batch`: Fix batch cloud console authentication issue

### Cognitive Services

* `az cognitiveservices account deployment create`: Add `--model-source` parameter

### Compute

* `az vmss create/update`: Add `--enable-hibernation` parameter to enable hibernation capability on VMSS
* `az vmss update`: Add `--security-type` parameter to enable Trusted Launch on existing VMSS
* `az vmss deallocate`: Add `--hibernate` parameter to support hibernating a VM while deallocating
* `az ppg update`: Add new parameter `--type` to support setting proximity placement group type

### Cosmos DB

* `az cosmosdb restore`: Support enabling/disabling public network access

### Key Vault

* Fix #27220: `az keyvault certificate import`: Fix invalid policy issue when no `content_type` provided
* `az keyvault storage`: Announce deprecation since keyvault service doesn't maintain this since long ago

### MySQL

* `az mysql flexible-server parameter set-batch`: Add new command to support updating multiple parameters
* `az mysql flexible-server export create`: Add Export Backup CLI implementation

### Network

* `az network private-endpoint-connection`: Add provider `Microsoft.EventGrid/namespaces` and `Microsoft.EventGrid/partnerNamespaces`
* Fix #27066: `az network vnet list`: Fix -o table cannot be used
* `az network express-route port delete`: Add confirmation while deleting
* `az network application-gateway waf-policy custom-rule`: Add an example of using `--group-by-user-session`
* `az network express-route update`: Fix `properties.SeriveProviderProperties` unexpected null
* Fix #26730: `az network public-ip update`: `--ip-tags` cannot be correctly parsed
* `az network application-gateway waf-policy managed-rule rule-set`: Support Microsoft_BotManagerRuleSet version 1.0
* `az network vnet peering create`: Mark `--remote-vnet` as required

### Redis

* `az redis update`: Fix public network access default value issue

### Storage

* `az storage file upload-batch`: Allow uploading files in parallel to improve performance
* Fix #27202: `az storage entity insert`: Fix case when using sas token with only `add` permission

### Upgrade

* `az upgrade`: Support upgrading with 64-bit MSI

## August 01, 2023

Version 2.51.0

### AKS

* `az aks nodepool snapshot update`: Add aks nodepool snapshot update command
* `az aks create`: Add new parameter `--k8s-support-plan` to support LTS onboarding, also add new tier enum `premium`
* `az aks update`: Support enabling/disabling LTS via new parameter `--k8s-support-plan`
* `az aks create`: Add node taint support when create cluster use `az aks` command
* `az aks update`: Add update node taint support on cluster level use `az aks` command
* `az aks enable-addons`: Fix the default value of option `--enable-msi-auth-for-monitoring` being overwritten to `False` when specified
* `az aks update`: Add new parameter `--outbound-type` to support cluster outbound type.
* `az aks maintenanceconfiguration list`: Add new command to list all maintenance windows in a cluster
* `az aks maintenanceconfiguration show`: Add new command to display a specific maintenance window of a cluster
* `az aks maintenanceconfiguration add`: Add new command to add a new maintenance window configuration for a cluster
* `az aks maintenanceconfiguration update`: Add new command to update an existing maintenance window configuration of a cluster
* `az aks maintenanceconfiguration delete`: Add new command to delete an existing maintenance window configuration of a cluster
* `az aks update`: Fix aks network profile update error

### App Config

* `az appconfig kv delete/set/set-keyvault`: Add key validations for null or empty space keys
* `az appconfig kv export/import/restore`: Update key-value diffing and preview
* `az appconfig snapshot`: Remove status code property from snapshot object
* `az appconfig snapshot list`: Use enums for status parameter

### App Service

* Fix #26214: `az webapp show`: Fix the bug caused by missing leading slash causes web app and plan commands to fail for s-clouds
* Fix #26214: `az appservice plan show`: Fix the bug caused by missing leading slash causes web app and plan commands to fail for s-clouds
* Fix #26601: `az functionapp create`: Throw error for consumption function app created with vnet
* Fix #21133: `az webapp/functionapp config ssl bind/unbind`: Search for matching certificates in the subscription by App Service Plan Id

### ARM

* `az stack`: Fix the bug that the required `--deny-settings-mode` parameter should not return None (should be a string)
* `az stack`: Fix the bug that the `--deny-settings-excluded-principals` parameter was accidentally reset

### Batch

* `az batch job/pool all-statistics`: Remove no longer worked commands
* `az batch pool create`: Add new parameter `--enable-accelerated-networking` to determine whether this pool should enable accelerated networking

### Cognitive Services

* `az cognitiveservices account deployment create`: Add `--sku-name` and `--sku-capacity` parameters
* `az cognitiveservices usage`: Add new command `list`
* `az cognitiveservices model`: Add new command `list`

### Compute

* `az vm/vmss create`: Enable auto upgrading of guest attestation extension by default for Trusted Launch enabled VMs and VMSS
* `az vm/vmss create`: Add new parameter `--disable-integrity-monitoring-autoupgrade` to support disabling auto upgrading of guest attestation extension for Trusted Launch enabled VMs and VMSS
* `az sig image-version undelete`: Add new command to support softdeleted image recovery
* `az vm/vmss/disk create`: Add new option `Standard` for `--security-type` for backward compatibility
* `az sig image-definition create`: Add new option `Standard` for `--security-type` for backward compatibility

### Cosmos DB

* `az cosmosdb restore`: Add `--assign-identity` and `--default-identity` to allow PITR restoring with identity
* `az cosmosdb postgres`: Add new command groups to support Cosmos DB for PostgreSQL

### Key Vault

* `az keyvault restore start`: Add `--key-name` to support selective key restoring
* `az keyvault key sign/verify`: Add new commands to support signing with keyvault key and verify the signature

### MySQL

* `az mysql flexible-server ad-admin set`: Enable AAD for replica

### Network

* `az network nic create/update`: Add parameters `--auxiliary-mode` and `--auxiliary-sku` to support setting auxiliary mode and sku
* `az network public-ip`: Add parameter `--dns-name-scope` to specify different options
* `az network private-endpoint-connection`: Add provider `Microsoft.ElasticSan/elasticSans`

### Packaging

* Drop Python 3.7 support
* Support x86 and x64 MSI builds

### Resource

* `az resource invoke-action`: Add new parameter `--no-wait` to support not waiting the long-running operation to finish

### Role

* `az ad sp create-for-rbac`: Add alias `--json-auth` for `--sdk-auth`

### Service Connector

* `az functionapp connection`: Add new command group to support service connector on Function App
* `az spring connection`: Enable new auth types for Spring Boot and Cosmos SQL connection

### SQL

* `az sql mi start/stop/start-stop-schedule`: Add SQL MI manual and scheduled start stop

### Storage

* `az storage container-rm update`: `--default-encryption-scope` and `--deny-encryption-scope-override` should not be specified during updating
* Fix #22704: `az storage account create`: `--encryption-key-type-for-queue` and `--encryption-key-type-for-table` no longer remove other settings
* Fix #26587: `az storage file upload`: Add `--file-url` to support supplying the url instead of share/file name

## July 04, 2023

Version 2.50.0

### AKS

* `az aks get-versions`: Both json payload and table format changed
* `az aks create`: Add condition to disable `--enable-msi-auth-for-monitoring` for service principle

### APIM

* `az apim graphqlapi resolver create`: Add new command to create gql api resolver
* `az apim graphqlapi resolver show`: Add new command to show gql api resolver
* `az apim graphqlapi resolver list`: Add new command to show gql api resolver list
* `az apim graphqlapi resolver delete`: Add new command to delete gql api resolver
* `az apim graphqlapi resolver policy create`: Add new command to create resolver policy
* `az apim graphqlapi resolver policy show`: Add new command to show resolver policy
* `az apim graphqlapi resolver policy list`: Add new command to list resolver policies
* `az apim graphqlapi resolver policy delete`: Add new command to delete a policy

### App Config

* `az appconfig feature`: Improve error handling for invalid feature flags
* `az appconfig snapshot create`: Add new command to support creating a snapshot
* `az appconfig snapshot show`: Add new command to support showing the properties of an app configuration snapshot
* `az appconfig snapshot list`: Add new command to support listing snapshots of a given app configuration
* `az appconfig snapshot archive`: Add new command to support archiving a snapshot
* `az appconfig snapshot recover`: Add new command to support recovering an archived snapshot

### App Service

* Fix #21168: `az webapp deploy`: Call OneDeploy through ARM proxy if `--src-url` is provided
* Fix #26647: `az webapp show`: Remove duplicate IPs from outbound addresses
* Fix #25497: `az webapp deploy`: Fix extension parsing if `src-path` has multiple '.'s

### ARM

* `az managedapp definition create/update`: Add new parameter `--deployment-mode` to support setting deployment policy
* `az resource move`: Add help example for moving multiple resources
* `az stack`: Add new command group to support deployment stacks
* `az stack mg`: Add new command group to manage deployment stack at management group scope
* `az stack sub`: Add new command group to manage deployment stack at subscription scope
* `az stack group`: Add new command group to manage deployment stack at resource group scope

### ARO

* `az aro get-admin-kubeconfig`: Add new command to download an admin kubeconfig for a created ARO cluster

### Backup

* `az backup vault create`: Add parameter `--cross-subscription-restore-state` to set the CSR state of the vault at the time of creation as well as updating
* `az backup recoveryconfig show`: Add parameter `--target-subscription-id` to provide the target subscription as the input while triggering cross subscription restore for SQL or HANA workloads
* `az backup protection backup-now`: Allow `--enable-compression` to be set to `true` for SAPHANA Workloads
* `az backup recoveryconfig show`: Add new parameter `--target-instance-name` to specify the target instance name for the restore operation

### Compute

* `az vmss update`: Add new parameter `--custom-data` to support updating custom data
* `az image builder optimizer`: Add subgroup to manage image template optimizer
* `az image builder create`: Add parameter `--validator` to specify the type of validation to be used on the Image
* `az vm update`: Add parameter `--security-type` to support VM Gen2 to Trusted Launch conversion
* `az sig image-definition create`: Add examples for TrustedLaunchSupported and TrustedLaunchAndConfidentialVmSupported
* `az capacity`: Fix short summaries for groups
* Fix #26516: `az vm create`: Fix warning log for public IP even when no public IP is being created

### Eventhub

* `az eventhubs eventhub`: Enum value for `cleanup_policy` change to `compact` from `compaction`
* `az eventhubs namespace list`: Support list command without mandatory `resource_group` parameter
* `az eventhubs eventhub create/update`: Event Hubs Capture MSI feature added to eventhub entity

### IoT

* `az iot hub route`: Hide the deprecated command, please use `az iot hub message-route` instead of it.
* `az iot hub routing-endpoint`: Hide the deprecated command, please use `az iot hub message-endpoint` instead of it.

### Key Vault

* Fix #26527: `az keyvault certificate show`: Show policy.x509CertificateProperties.subjectAlternativeNames correctly

### Monitor

* `az monitor metrics alert create`: Add `()` into `--condition` grammar

### MySQL

* `az mysql flexible-server import create`: Add new command to facilitate migrations from mysql single to flexible servers
* `az mysql flexible-server restore/geo-restore/replica cerate`: Support `--tags`

### NetAppFiles

* `az netappfiles volume replication resume`: Add warning on action to re-sync replication volumes that if destination volume has quota rules they will be overwritten by the source volumes quota rules.

### Network

* `az network dns zone import`: Fix alias records cannot be imported
* Fix #26438: `az network vnet peering sync`: Doesn't work in cross-tenant scenario
* `az network application-gateway waf-policy policy-setting update`: Add support for log scrubbing
* `az network application-gateway waf-policy policy-setting update`: Add support for inspection limit
* `az network application-gateway waf-policy custom-rule`: Support rate limit in WAF policy
* Fix #24695: `az network traffic-manager`: Add command context
* Fix #26638: `az network traffic-manager endpoint`: Declare `--min-child-endpoints`, `--min-child-ipv4` and `--min-child-ipv6` as integer type
* `az network dns`: Support DNSSEC configuration and DS/TLSA record set

### Packaging

* Add Debian Bookworm support

### RDBMS

* `az postgres flexible-server migration update`: Remove unsupported update parameters `--db-names` and `--overwrite-dbs`
* `az postgres flexible-server migration create`: Add support for tags and location using `--tags` and `--location`
* `az postgres flexible-server revive-dropped`: Add support to revive a dropped PostgreSQL flexible server
* `az postgres flexible-server create`: Add support to create PostgreSQL flexible server with data encryption enabled for geo-backup enabled server by pasing parameters `--geo-redundant-backup`, `--backup-key` and `--backup-identity`
* `az postgres flexible-server show-connection-string`: Add support to pass `--pg-bouncer` in connection strings for cmd and programming languages with PgBouncer enabled for PostgreSQL flexible server. Updated connection strings to show port as well as database
* `az postgres flexible-server update`: Add support for parameter `--private-dns-zone` during update operation, to update private DNS zone for a VNET enabled PostgreSQL flexible server

### Service Bus

* `az servicebus namespace list`: Support list command without mandatory `resource_group` parameter

### Service Fabric

* `az sf managed-cluster network-security-rule add`: Add network security rule to managed cluster

### SQL

* `az sql midb move/copy`: Add new commands for Managed Database Move/Copy feature

### SQL VM

* Fix #2442969: `az sql vm enable-azure-ad-auth/validate-azure-ad-auth`: Workaround Graph API bug by using client side filtering upon failure
* `az sql vm update`: Add configuration options for new SQL Assessment pre-requisites MMA->AMA migration

### Storage

* `az storage blob upload(-batch)/set-tier/copy start(-batch)`: Cold Tier GA, add new tier type `--tier cold`
* `az storage blob download-batch`: When matching pattern, list blobs with prefix to reduce the number of list calls
* Fix #26673: `az storage account or-policy create`: Now throw server error that was previous silently ignored.

### Synapse

* `az synapse workspace create/update`: Support workspace encryption and user-assignment management identity

## May 23, 2023

Version 2.49.0

### ACR

* `az acr create`: Remove `Classic` from `sku` option

### AKS

* [BREAKING CHANGE] `az aks create`: Specify `--pod-cidr` with Azure CNI will return an error instead of logging a warning when not use `overlay` mode
* [BREAKING CHANGE] `az aks create`: Change the default value of `--enable-msi-auth-for-monitoring` to true and add check for airgap clouds
* `az aks update`: Support updating user assigned control plane identity for parameter `--assign-identity`
* `az aks install-cli`: Add validation for installation path and update help message for parameters `--install-location` and `--kubelogin-install-location`
* Fix #26353: `az aks install-cli`: Fix incorrect architecture detection on Darwin/arm64
* `az aks create/update`: Add parameter `--enable-azure-monitor-metrics` to enable managed prometheus (Azure Monitor Metrics Addon)
* `az aks create/update`: Add parameter `--azure-monitor-workspace-resource-id` to store metrics for the managed prometheus addon
* `az aks create/update`: Add parameter `--grafana-resource-id` to link the Azure Monitor Workspace with a Grafana instance for viewing metrics and dashboards
* `az aks create/update`: Add parameter `--enable-windows-recording-rules` to enable windows recording rule groups on the Azure Monitor Workspace (by default they get created but are disabled)
* `az aks create/update`: Add parameter `--ksm-metric-labels-allow-list` to support the additional Kubernetes label keys that will be used in the resource's labels metric
* `az aks create/update`: Add parameter `--ksm-metric-annotations-allow-list` to support the Kubernetes annotations keys that will be used in the resource's labels metric
* `az aks update`: Add parameter `--disable-azure-monitor-metrics` to disable the Azure Monitor Metrics addon
* `az aks create` and `az aks nodepool add`: Add warning message when specifying `--os-sku` to `Mariner` or `CBLMariner`

### App Config

* [BREAKING CHANGE] `az appconfig feature`: Update feature name validation to disallow the colon character
* [BREAKING CHANGE] `az appconfig kv import`: Update feature name validation. Invalid feature flags will be skipped during import
* [BREAKING CHANGE] `az appconfig`: Update default connection string resolution logic

### App Service

* `az functionapp create`: Add new parameter `--min-replicas` and `--max-replicas` to support minimum and maximum replicas
* `az functionapp create`: Add new parameter `--registry-server` to support Centauri function app
* `az functionapp create`: Update the default image to `mcr.microsoft.com` for Centauri
* Fix #26445: `az webapp deploy`: Fix deployment failing with HTTP 400

### ARM

* Fix #26216: `az bicep format`: Fix the TypeError `expected str, bytes or os.PathLike object, not bool`
* Fix #26256: `az bicep publish/restore/generate-params`: Fix version checks without bicep installed
* `az bicep publish`: Add new parameter `--force` to allow overwriting existing module
* Fix #26352: `az ts create`: Fix for the TypeError `string indices must be integers`

### Backup

* `az backup`: Add support for HANA HSR workload

### Compute

* `az vm create`: Support new license type `UBUNTU_PRO` and `UBUNTU`
* `az vm extension set`: Enable auto-upgrade by default for GuestAttestation extension
* `az image builder trigger`: Add subgroup to manage image builder template trigger
* `az image builder output versioning`: Add subgroup to manage image builder template output versioning
* `az image builder output add`: Add parameter `--versioning` to support describing how to generate new x.y.z version number for distribution
* `az image builder output add`: Add parameter `--vhd-uri` to support specifying storage uri for the distributed VHD blob

### Container

* `az container create`: Add new parameters for container security context for confidential ContainerGroupSku

### Cosmos DB

* [BREAKING CHANGE] `az cosmosdb create/update`: Rename `--enable-public-network true/false` to `--public-network-access ENABLED/DISABLED/SECUREDBYPERIMETER`
* `az cosmosdb create/update`: Add `--continuous-tier` to support continuous backup tier
* `az cosmosdb create/update`: Enable Partition Merge feature for CosmosDB

### Eventhub

* [BREAKING CHANGE] `az eventhubs namespace network-rule`: This command group is removed and replaced by `az eventhubs namespace network-rule-set`
* [BREAKING CHANGE] `az eventhubs namespace network-rule add`: This command is removed and replaced by `az eventhubs namespace network-rule-set ip-rule/virtual-network-rule add`
* [BREAKING CHANGE] `az eventhubs namespace network-rule remove`: This command is removed and replaced by `az eventhubs namespace network-rule-set ip-rule/virtual-network-rule remove`
* [BREAKING CHANGE] `az eventhubs eventhub create/update`: Remove `--message-retention` parameter, it is replaced by `--retention-time-in-hours`
* [BREAKING CHANGE] `az eventhubs namespace application-group policy remove`: Rename `--throttling-policy-config` to `--policy` and remove `metric-id` and `rate-limit-threshold` properties in it
* `az eventhubs eventhub create/update`: Add `--cleanup-policy`, `--retention-time-in-hours` and `--tombstone-retention-time-in-hours` to support `Retention-Description` feature

### IoT

* `az iot hub create/update/delete`: Fix poller issues

### Key Vault

* [BREAKING CHANGE] `az keyvault create`: `--retention-days` becomes required for MHSM creation
* [BREAKING CHANGE] `az keyvault backup start`: The output will only contain `folderUrl`
* [BREAKING CHANGE] `az keyvault restore start`: Nothing will return for successful run
* [BREAKING CHANGE] `az keyvault role assignment delete`: Nothing will return for successful run
* [BREAKING CHANGE] `az keyvault certificate show/set-attributes/import`: No longer return `x509CertificateProperties.basicConstraints`, `pending`
* [BREAKING CHANGE] `az keyvault certificate contact delete`: Return an empty list instead of the deleted contact for consistency if the operation would remove the last contact
* [BREAKING CHANGE] `az keyvault certificate issuer create`: `organizationDetails.zip` is no longer returned by serivce, use 0 as the default
* `az keyvault security-domain upload`: Fix sd warpping keys with passwords
* `az keyvault setting`: New command group to manage MHSM settings

### Monitor

* `az monitor`: Add new subgroup `account` to support managing monitor workspace
* `az monitor log-analytics workspace table create/update`: Max `--total-retention-time` changed from 2555 to 2556

### NetAppFiles

* [BREAKING CHANGE] `az netappfiles volume create`: Remove optional parameter `--vault-id` as this is not longer needed
* [BREAKING CHANGE] `az netappfiles vault list`: Remove command `vault list` as this is not longer needed
* `az netappfiles account create`: Add optional parameter `--identity-type`
* `az netappfiles account ad add`: Add optional parameter `--preferred-servers-for-ldap-client`
* `az netappfiles volume create`: Add optional parameter `--is-large-volume`
* `az netappfiles volume account create`: Add optional parameter `--identity-type`
* `az netappfiles volume quota-rule update`: Add optional parameter `--tags`
* `az netappfiles volume`: Add new command `break-file-locks` to break all the file locks on a volume

### Network

* [BREAKING CHANGE] `az network cross-region-lb rule`: Remove parameters `--enable-tcp-reset` and `--idle-timeout`
* [BREAKING CHANGE] `az network application-gateway http-settings update`: Use `null` instead of `""` to detach
* [BREAKING CHANGE] `az network application-gateway settings update`: Use `null` instead of `""` to detach
* [BREAKING CHANGE] `az network application-gateway url-path-map update`: Use `null` instead of `""` to detach
* [BREAKING CHANGE] `az network nic update`: Use `null` instead of `""` to detach
* [BREAKING CHANGE] `az network nic ip-config update`: Use `null` instead of `""` to detach
* [BREAKING CHANGE] `az network nsg rule update`: Use `null` instead of `""` to detach
* [BREAKING CHANGE] `az network vnet update`: Use `null` instead of `""` to detach
* [BREAKING CHANGE] `az network vnet subnet update`: Use `null` instead of `""` to detach
* [BREAKING CHANGE] `az network application-gateway client-cert remove`: Deprecate the output of command
* [BREAKING CHANGE] `az network application-gateway ssl-profile remove`: Deprecate the output of command
* [BREAKING CHANGE] `az network private-endpoint dns-zone-group remove`: Deprecate the output of command
* [BREAKING CHANGE] `az network private-endpoint ip-config remove`: Deprecate the output of command
* [BREAKING CHANGE] `az network private-endpoint asg remove`: Deprecate the output of command
* [BREAKING CHANGE] `az network nic ip-config address-pool remove`: Deprecate the output of command
* [BREAKING CHANGE] `az network nic ip-config inbound-nat-rule remove`: Deprecate the output of command
* [BREAKING CHANGE] `az network lb address-pool tunnel-interface remove`: Deprecate the output of command
* [BREAKING CHANGE] `az network cross-region-lb address-pool address remove`: Deprecate the output of command
* `az network private-endpoint-connection`: Add provider `Microsoft.HardwareSecurityModules/cloudHsmClusters`
* Fix #26248: `az network dns record-set cname set-record`: Declare TTL as integer type
* Fix #26326: `az network vnet subnet update`: `--nat-gateway` cannot be set to null
* Fix #26318: `az network vnet subnet create`: `--nsg` and `--route-table` cannot be used as name from Azure Stack

### RDBMS

* [BREAKING CHANGE] `az mysql/postgres flexible-server create/update`: Deprecate `Enabled` for `--high-availability` argument
* `az mysql flexible-server restore/georestore/replica create`: Add `--public-access` parameter for restore, replication and georestore

### Service Bus

* [BREAKING CHANGE] `az servicebus georecovery-alias fail-over`: Remove `--parameters` argument
* [BREAKING CHANGE] `az servicebus namespace network-rule`: This command group is removed and replaced by `az servicebus namespace network-rule-set`
* [BREAKING CHANGE] `az servicebus namespace network-rule add`: This command is removed and replaced by `az servicebus namespace network-rule-set ip-rule/virtual-network-rule add`
* [BREAKING CHANGE] `az servicebus namespace network-rule remove`: This is removed and replaced by `az servicebus namespace network-rule-set ip-rule/virtual-network-rule remove`
* [BREAKING CHANGE] `az servicebus queue update`: Remove deprecated parameters `--enable-partitioning`, `--enable-session` and `--duplicate-detection`

### Service Connector

* `az spring connection create`: Enable user-assigned managed identity for spring apps and deprecate Postgresql single server

### SQL

* [BREAKING CHANGE] `az sql mi link create`: Remove `--replication-mode` argument
* `az sql elastic-pool`: Add `--preferred-enclave-type` argument
* `az sql mi link update`: Fix update command to use PATCH api

### Storage

* `az storage account blob-service-properties cors-rule`: Add new command group to manage blob cors rules

## April 25, 2023 - 2

Version 2.48.1

### App Service

* Hotfix: Use basic auth with SCM sites if supported, else use AAD auth

## April 25, 2023

Version 2.48.0

### App Service

* Fix #25642: `az functionapp deployment user show`: Fix the AttributeError `'function' object has no attribute 'metadata'`
* `az staticwebapp appsettings`: Add `--environment-name` parameter to allow app setting operation on preview environments
* `az functionapp create`: Update 'kind' attribute for Centauri function apps

### Compute

* Fix #26118: `az vm list-ip-addresses`: Fix the KeyError when attributes missing in public IP address
* Fix #26164: `az vmss update`: Fix unexpected error while running the update instance protection command on VMSS flex instances
* Fix #26185: `az sig update`: Fix issues that `is_soft_delete_enabled` may not exist
* `az vm host resize`: Add new command to support resizing dedicated host
* `az vm host list-resize-options`: Add new command to support getting possible resize options

### DMS

* `az dms project tack create`: Add support for database schema migration

### Eventhub

* `az eventhubs namespace application-group policy remove`: Add upcoming breaking change notification

### Network

* `az network nic update`: Add `--ip-configurations` to support shorthand syntax
* `az network public-ip prefix create`: Add parameter `--ip-tags`
* `az network cross-region-lb rule create`: Set default value for `--enable-tcp-reset` and `--idle-timeout`

### RDBMS

* `az mysql flexible-server create/update/gtid reset`: Add GTID reset and fix public-access

### SQL

* `az sql midb ledger-digest-uploads`: Support SQL Ledger
* `az sql mi server-configuration-option`: New command group to manage server configuration options

### SQL VM

* `az sql vm enable-azure-ad-auth/validate-azure-ad-auth`: Single mode improvement

### Storage

* `az storage file/directory`: Add `--auth-mode login` and `--backup-intent` to support OAuth
* `az storage blob sync`: Add positional argument `extra_options` to pass through options to `azcopy`

## April 04, 2023

Version 2.47.0

### AKS

* `az aks create/update`: Add `--tier` argument will specify the sku tier that customer wants
* `az aks nodepool operation-abort`: Add new command to support aborting last running operation on nodepool
* `az aks operation-abort`: Add new command to support aborting last running operation on managed cluster
* `az aks create`: Raise a ClientRequestError when creating the same cluster again
* `az aks create/update`: Add new parameter `--enable-image-cleaner` to enable Image Cleaner service
* `az aks create/update`: Add new parameter `--image-cleaner-interval-hours` to set Image Cleaner scanning interval
* `az aks create`: Add new parameter `--network-plugin-mode` to support creating Azure CNI Overlay clusters
* `az aks create/update`: Add new parameter `--enable-workload-identity` to support enabling workload identity addon
* `az aks create`: Add new parameter `--network-dataplane` to support creating Cilium clusters
* `az aks update`: Add prameter `--network-plugin-mode` to update the mode of a network plugin
* `az aks update`: Add prameter `--pod-cidr` to update the pod CIDR for a cluster

### App Config

* `az appconfig import/export`: Add warning log info to output even when `--yes` flag is set
* `az appconfig kv import`: Ensure the case of imported boolean values does not change for string conversion from file

### App Service

* Fix #25375: `az functionapp deployment source config-zip`: Fix the `Could not find a 'AzureWebJobsStorage' application setting` error
* Fix #25876: `az webapp config ssl import`: Fix the UnboundLocalError `local variable 'cert_name' referenced before assignment`
* `az functionapp create`: Support container app deployments
* `az functionapp delete`: Add a validation to check whether Azure Functions is not in the Azure Container app environments

### ARM

* `az deployment group create`: Support deployment with bicepparam files
* `az resource patch`: Add new command to support updating resource by PATCH request
* Fix #25706: `az bicep format`: Fix the TypeError `ensure_bicep_installation() missing 1 required positional argument 'cli_ctx'`
* Fix #25715: `az bicep install/upgrade`: Fix the `configparser.NoSectionError: No section: 'bicep'`

### Compute

* `az vm reimage`: Add new command to support reimaging a virtual machine
* `az vm/vmss create`: Deprecate image alias `UbuntuLTS` and `Win2008R2SP1`. Please use the image alias including the version of the distribution you want to use. For example: Please use `Ubuntu2204` instead of `UbuntuLTS`

### Cosmos DB

* `az cosmosdb identity assign`: Allow refreshing user assigned identities if they're reassigned to an account

### Extension

* `az extension add`: Add actionable message for extension not found error

### Key Vault

* `az keyvault region`: GA MHSM region commands

### Monitor

* `az monitor activity-log alert`: Adjust help message

### NetAppFiles

* `az netappfiles volume update`: Patch assign snapshotpolicyID

### Network

* [BREAKING CHANGE] `az network`: Clean up irrelevant commands in azure-stack profiles.
* [BREAKING CHANGE] `az network application-gateway waf-policy custom-rule`: Rename output property `applicationGatewayIpConfigurations` to `applicationGatewayIPConfigurations` to keep consistent with the name in API
* `az network routeserver create/update`: Add parameter `--hub-routing-preference`
* Drop `azure-mgmt-network` SDK
* Fix #25784: `az network private-link-service update`: `--lb-frontend-ip-configs` cannot be used

### RDBMS

* [BREAKING CHANGE] `az postgres flexible-server replica create`: Fix the behavior of AZ selection in case zone is not passed as parameter
* Fix #368903181: Fix zone selection during creation of replica
* `az mysql flexible-server restore/geo-restore`: Add parameters to enhance PITR
* `az mysql flexible-server replica create`: Add parameters to support cross region paired vnet

### Service Bus

* `az servicebus namespace/topic/queue authorization-rule keys renew/list`: Add `-n` option for `--authorization-rule-name` to create auth rule

### SQL

* `az sql server refresh-external-governance-status`: New command for refreshing external governance status
* `az sql db geo/ltr-backup restore`: Add more parameters to geo restore and ltr restore

### Storage

* `az storage blob copy start`: Fix auth issue when providing source uri containing sas token
* `az storage container/blob list`: Fix MemoryError when service returns less num than requested
* `az storage account create`: GA partition DNS account support

### Synapse

* `az synapse spark pool create/update`: Update `--node-size-family` and `--node-size` allowed values

## March 07, 2023

Version 2.46.0

### ACR

* `az acr token\scope-map`: Tokens and Scope-Maps are Generally Available
* `az acr manifest`: Support oci image index
* `az acr cache`: Add new command group to manage cache rules
* `az acr credential-set`: Add new command group to manage credential sets
* Fix #24886: `az acr`: Improve the 429 error handling for CONNECTIVITY_REFRESH_TOKEN_ERROR

### AKS

* `az aks check-acr`: Fix mariner node missing cert
* Fix #25521: `az aks nodepool upgrade`: Fix the crashes when the version passed in through the parameter `--kubernetes-version` is the same as the cluster version
* Fix #25530: `az aks nodepool upgrade`: Fix agent pool property name used for fetching current k8s version
* `az aks create`: Add new parameter `--pod-cidrs` for setting the IP ranges used to allocate IPs to pods
* `az aks create`: Add new parameter `--service-cidrs` for setting the K8s service IPs
* `az aks create`: Add new parameter `--ip-families` for setting the IP types that should be used in a cluster (IPv4 or IPv6)
* `az aks create`: Add new parameter `--load-balanacer-managed-outbound-ipv6-count` for setting the number of IPv6 outbound IPs that AKS should managed for a cluster with IPv6 enabled
* `az aks update`: Support changing the load balancer managed outbound IPv6 count property
* Fix #22321: `az aks get-credentials`: Fix path separator for Windows when finding `kubeconfig_path`

### APIM

* Fix #25168: `az apim update`: Fix the bug that `--public-network-access` doesn't work to disable public network access

### App Service

* `az webapp deleted restore`: Add new parameter `--target-app-svc-plan` to support setting app service plan for new azure web app
* Fix #14729: `az webapp config ssl upload`: Refine error handling for `OpenSSL.crypto.Error` when obtaining the certificate's thrumbprint failed
* `az functionapp create`: Add new parameter `--environment` to support setting the name of container app environment
* `az webapp config ssl bind/unbind`: Allow user to specify hostname to (un)bind with `--hostname`
* `az webapp config ssl create/upload/import`: Allow user to specify certificate name with `--certificate-name`
* `az functionapp create`: Add new parameter `--environment` to support setting the name of container app environment

### ARM

* `az bicep publish`: Update command to support new optional parameter `--documentationUri`
* Fix #25510: `az bicep`: Set bicep.use_binary_from_path to false when installed using Azure CLI
* `az bicep format`: Add new command to support formatting a Bicep file

### ARO

* `az aro create`: Rename the create `install-version` parameter to `version`

### Compute

* `az vmss reimage`: Fix the bug that all instances will be reimaged after using `--instance-id` and add new parameter `--instance-ids` to replace `--instance-id`
* `az vm create`: Support recommending more suitable regions through warning log when creating VM
* `az vm/vmss identity assign`: Add warning and modify help message for `--role`: Please note that the default value of `--role` will be removed in the breaking change release of the fall of 2023, so please specify `--role` and `--scope` at the same time when assigning a role to the managed identity.

### Container

* `az container create`: Add new parameters `--priority`, `--sku` and `--cce-policy` for container group

### Cosmos DB

* `az cosmosdb container create`: GA Client Side Encryption feature
* `az cosmosdb container update`: Fix updates failure for containers with client encryption policy
* `az cosmosdb restore`: Add `--gremlin-databases-to-restore`, `--tables-to-restore` parameters to support restore of gremlin and table accounts
* `az cosmosdb gremlin restorable-resource list`: New command that list restorable gremlin resources
* `az cosmosdb gremlin restorable-database list`: New command that list restorable gremlin databases
* `az cosmosdb gremlin restorable-graph list`: New command that list restorable graphs under a gremlin database
* `az cosmosdb gremlin retrieve-latest-backup-time`: New command that retrieve latest backup time for a graph under a database
* `az cosmosdb table restorable-resource list`: New command that list restorable table resources
* `az cosmosdb table restorable-table list`: New command that list restorable tables
* `az cosmosdb table retrieve-latest-backup-time`: New command that retrieve latest backup time for a table

### Deployment Manager

* [BREAKING CHANGE] `az deploymentmanager`: Remove command module since it is no longer maintained by service

### Key Vault

* `az keyvault create/update-hsm`: Add `--public-network-access` for MHSM creating or updating

### Network

* [BREAKING CHANGE] `az network lb address-pool create/update`: Replace preview argument `--backend-addresses-config-file` and `--config-file` by `--backend-addresses` which supports Json, files and shorthand syntax formats
* [BREAKING CHANGE] `az network lb address-pool`: Output properties `privateIpAddress`, `privateIpAddressVersion`, `privateIpAllocationMethod`, `publicIpAddress` and `publicIpPrefix` are renamed by `privateIPAddress`, `privateIPAddressVersion`, `privateIPAllocationMethod`, `publicIPAddress` and `publicIPPrefix` to keep consistent with the name in API
* [BREAKING CHANGE] `az network cross-region-lb probe`: Deprecate command group as probes are not supported for global load balancer
* [BREAKING CHANGE] `az network nic create/update`: Rename output property `enableIpForwarding` to `enableIPForwarding` to keep consistent with the name in API
* [BREAKING CHANGE] `az network nic create/update`: Rename output property `privateIpAllocationMethod` to `privateIPAllocationMethod` to keep consistent with the name in API
* [BREAKING CHANGE] `az network nic create/update`: Rename output property `publicIpAddress` to `publicIPAddress` to keep consistent with the name in API
* [BREAKING CHANGE] `az network lb`: Update output property names in `2017-03-09-profile`, `2018-03-01-hybrid`, `2019-03-01-hybrid` and `2019-03-01-hybrid` profiles to keep consist with the `latest` profile.
* [BREAKING CHANGE] `az network cross-region-lb`: Remove in `2017-03-09-profile`, `2018-03-01-hybrid`, `2019-03-01-hybrid` and `2019-03-01-hybrid` profiles.
* [BREAKING CHANGE] `az network nic ip-config`: Rename output property `privateIpAddress` to `privateIPAddress` to keep consistent with the name in API
* [BREAKING CHANGE] `az network nic ip-config`: Rename output property `privateIpAllocationMethod` to `privateIPAllocationMethod` to keep consistent with the name in API
* [BREAKING CHANGE] `az network local-gateway`: Update output property names in `2017-03-09-profile`, `2018-03-01-hybrid`, `2019-03-01-hybrid` and `2019-03-01-hybrid` profiles to keep consist with the `latest` profile.
* [BREAKING CHANGE] `az network vpn-connection`: Update output property names in `2017-03-09-profile`, `2018-03-01-hybrid`, `2019-03-01-hybrid` and `2019-03-01-hybrid` profiles to keep consist with the `latest` profile.
* [BREAKING CHANGE] `az network vnet-gateway`: Update output property names in `2017-03-09-profile`, `2018-03-01-hybrid`, `2019-03-01-hybrid` and `2019-03-01-hybrid` profiles to keep consist with the `latest` profile.
* [BREAKING CHANGE] `az network nic`: Update output property names in `2017-03-09-profile`, `2018-03-01-hybrid`, `2019-03-01-hybrid` and `2019-03-01-hybrid` profiles to keep consist with the `latest` profile
* [BREAKING CHANGE] `az network watcher flow-log`: Remove the deprecated command `configure`
* [BREAKING CHANGE] `az network vrouter`: Deprecate `vrouter` and use `routeserver` instead
* [BREAKING CHANGE] `az network watcher connection-monitor endpoint add`: Remove deprecated parameters `filter-item` and `filter-type`
* `az network nsg rule list`: Fix `-o table` cannot be used
* `az network private-endpoint-connection`: Add provider `Microsoft.Monitor/Accounts`
* `az network express-route gateway connection create/update`: Add parameters `--inbound-route-map` and `--outbound-route-map` to support route map
* Fix #25408: `az network application-gateway rule create`: Creation fails with `--redirect-config` when there are multiple pools
* `az network private-endpoint-connection`: Add provider `Microsoft.DBforMySQL/flexibleServers`

### Packaging

* Remove openssl1.1-compat and use openssl-dev in docker image
* Support ARM64 on Linux

### PolicyInsights

* Fix #25538: `az policy remediation create`: Fix the `Required property 'policyAssignmentId' not found in JSON` error

### RDBMS

* `az postgres flexible-server migration`: Use Cloud supplied URL's rather than hardcoded management URL's
* `az mysql flexible-server replica create`: Add `--location` to support specifying replica location
* `az mysql flexible-server update`: Fix `--storage-auto-grow` parameter unable to be set

### Role

* `az role assignment create`: Show warning if `--scope` argument is not specified: `--scope` argument will become required for creating a role assignment in the breaking change release of the fall of 2023. Please explicitly specify `--scope`.
* Migrate `azure-mgmt-authorization` SDK to Track 2 and bump API version to 2022-04-01

### Service Bus

* `az servicebus namespace`: Add `--premium-messaging-partitions` to support ServiceBus Namespace ScaleSet

### Service Connector

* `az connection create`: Add new param `--customized-keys`

### SQL

* `az sql instance-failover-group`: Add `--secondary-type` parameter to create and update commands
* `az sql midb restore`: Add tags parameter
* `az sql mi create/update`: Add `--zone-redundant` to support zone redundancy
* `az sql db tde-key revalidate/revert`: New commands to revert and revalidate the TDE protector key for the database and SQL server
* `az sql db create/update/show`: Add `--keys`, `--encryption-protector`, `--assign-identity`, `--user-assigned-identity-id` parameters to support Per DB CMK

### SQL VM

* `az sql vm create/update`: Deprecate `--sql-mgmt-type` argument
* `az sql vm update`: Update no longer requires the mode to be sent as full
* `az sql vm enable-azure-ad-auth/validate-azure-ad-auth`: New commands for Sqlvm Azure AD authentication

### Storage

* `az storage blob copy start-batch`: Add `--destination-blob-type` and `--tier`
* Fix #25402: `az storage account network-rule`: Support adding and removing multiple IPs

## February 07, 2023

Version 2.45.0

### ACR

* [BREAKING CHANGE] `acr manifest list-referrers`: Support OCI reference types and remove ORAS artifact reference types
* `az acr check-name`: Make command work with different profile

### AKS

* Make ContainerInsights DataCollectionRuleName consistent with Portal and other onboarding clients
* `az aks upgrade`: Show warning if the Kubernetes version isn't supplied
* `az aks create`: Deprecate parameters `--aad-client-app-id`, `--aad-server-app-id` and `--aad-server-app-secret`
* `az aks update-credentials`: Deprecate parameters `--reset-aad`, `--aad-client-app-id`, `--aad-server-app-id` and `--aad-server-app-secret`

### App Service

* `az webapp create-remote-connection`: Update the host address of SSH tunnel from 0.0.0.0 to 127.0.0.1
* Add support to create ASPs with Memory Optimized Workers
* Fix #17720: `az functionapp function`: Add new command to list functions in a function app
* Fix #24285: `az webapp config access-restriction add`: Fix the bug that it does not support more than one Front Door ID in X-Azure-FDID
* Fix #23603: `az functionapp config set`: Add new parameter to set PowerShell version
* `az webapp config appsettings`: Register settings as deployment slot setting anytime when using `--slot-settings`
* `az webapp config backup delete`: Add new command to delete a backup of the webapp

### ARM

* `az bicep`: Add configuration `bicep.use_binary_from_path`. Possible values include `if_running_in_ci` (default) and Booleans
* `az bicep`: Add configuration `bicep.check_version` that accepts Boolean values. If set to `False`, version checks for Bicep CLI will be disabled
* `az deployment what-if`: Fix an issue where formatting nested array changes throws an exception
* Fix #25022: `az resource tag`: Fix the issue of `the serializedData field is missing or null` when updating tag for Microsoft.insights/workbooks

### ARO

* `az aro create/update`: Add NetworkContributor role to NAT Gateways in Cluster Resource Group when creating or updating clusters
* `az aro create`: Change `--pull-secret` parameter to no longer require `@` prefix on filenames

### Backup

* `az backup vault`: Add new parameter `--public-network-access` to support enabling public network access for the backup vault
* `az backup vault create`: Add new parameter `--immutability-state` to support configuring immutability settings for the backup vault

### Batch

* Fix #24007: `az batch pool create`: Fix bug that caused 'MissingRequiredProperty' error when parameter `--encryption-key-identifier` is used

### Compute

* `az image builder identity assign`: Add this command to add managed identity to an existing image builder template
* `az image builder identity remove`: Add this command to remove managed identity from an existing image builder template
* `az image builder identity show`: Add this command to display managed identity of an existing image builder template
* `az vmss reimage`: Let `--instance-id` support multiple ids
* Fix #25308: `az disk create`: Fix help message for creating a standard disk for uploading blobs
* `az vmss create/update`: Add new parameter `--enable-osimage-notification` to support enabling OS image scheduled event
* `az vmss create`: Add new parameter `--max-surge` to support enabling rolling upgrade policy max surge

### Cosmos DB

* `az managed-cassandra datacenter update`: Add support to update `--sku`

### DMS

* `az dms project task create`: Update DMS MySQL API to support new migration types

### Feedback reference

* Stop including error messages in the feedback body

### IoT

* `az iot hub wait`: Add wait commands
* `az iot hub delete`: Fix functionality issue for parameter `--no-wait`

### Key Vault

* `az keyvault security-domain restore-blob`: Support restoring blob offline
* `az keyvault security-domain upload`: Add `--restore-blob` to prevent exposing keys in online environment

### NetAppFiles

* `az netappfiles volume update`: Fix volume patch dataprotection props

### Network

* [BREAKING CHANGE] `az network application-gateway ssl-profile`: Rename output property `verifyClientCertIssuerDn` to `verifyClientCertIssuerDN` to keep consistent with the name in API
* [BREAKING CHANGE] `az network cross-region-lb frontended-ip`: Rename output properties with `publicIp` prefix to `publicIP` prefix to keep consistent with the names in API response
* [BREAKING CHANGE] `az network lb frontended-ip`: Rename output properties with `publicIp` prefix to `publicIP` prefix to keep consistent with the names in API response
* [BREAKING CHANGE] `az network lb frontended-ip`: Rename output properties with `privateIp` prefix to `privateIP` prefix to keep consistent with the names in API response
* [BREAKING CHANGE] `az network lb inbound-nat-pool`: Rename output property `enableFloatingIp` to `enableFloatingIP` to keep consistent with the name in API
* [BREAKING CHANGE] `az network lb inbound-nat-pool`: Rename output property `frontendIpConfiguration` to `frontendIPConfiguration` to keep consistent with the name in API
* [BREAKING CHANGE] `az network lb inbound-nat-rule`: Rename output property `enableFloatingIp` to `enableFloatingIP` to keep consistent with the name in API
* [BREAKING CHANGE] `az network lb inbound-nat-rule`: Rename output property `frontendIpConfiguration` to `frontendIPConfiguration` to keep consistent with the name in API
* [BREAKING CHANGE] `az network lb rule`: Rename output property `enableFloatingIp` to `enableFloatingIP` to keep consistent with the name in API
* [BREAKING CHANGE] `az network lb rule`: Rename output property `frontendIpConfiguration` to `frontendIPConfiguration` to keep consistent with the name in API
* [BREAKING CHANGE] `az network cross-region-lb rule`: Rename output property `enableFloatingIp` to `enableFloatingIP` to keep consistent with the name in API
* [BREAKING CHANGE] `az network cross-region-lb rule`: Rename output property `frontendIpConfiguration` to `frontendIPConfiguration` to keep consistent with the name in API
* [BREAKING CHANGE] `az network lb outbound-rule`: Rename output property `frontendIpConfigurations` to `frontendIPConfigurations` to keep consistent with the name in API
* [BREAKING CHANGE] `az network cross-region-lb address-pool`: Rename output property `loadBalancerFrontendIpConfiguration` to `loadBalancerFrontendIPConfiguration` to keep consistent with the name in API
* [BREAKING CHANGE] `az network cross-region-lb address-pool create`: Replace preview argument `--backend-addresses-config-file --config-file` by `--backend-addresses` which supports Json, files and shorthand syntax formats
* [BREAKING CHANGE] `az network bastion`: Move Azure Bastion to Azure CLI Extension `bastion`
* Fix #25130: `az network list-usages`: `-o table` cannot be used
* Fix #25124: `az network vnet-gateway create`: Active-Active gateway fails with insufficient IP configurations
* `az network dns zone export`: Fix the export to emit all ALIAS records for a particular record set name
* `az network public-ip create`: Add parameter `--ddos-protection-plan` to link a DDoS protection plan to public IP
* Fix #25181: `az network nsg rule create`: Use `*` as default value for protocol
* `az network cross-region-lb address-pool update`: Add new command to update an address-pool

### PolicyInsights

* `az policy attestation`: Add new command groups to manage resource policy attestation

### RDBMS

* `az mysql flexible-server create/update`: Add `--auto-scale-iops` to enable or disable autoscale of iops
* `az mysql flexible-server start/stop`: Add no-wait support
* `az postgres flexible-server start/stop`: Add no-wait support
* `az postgres flexible-server migration`: Change behavior of cancel/cutover and added Offline Flag for FMS based migrations

### Service Bus

* `az servicebus topic subscription rule create/update`: Add `--correlation-filter` to support custom filters

### SQL

* `az sql midb recover`: Add support for managed database recover creation option
* `az sql recoverable-midb show`: Add support for getting geo replicated backup
* `az sql recoverable-midb list`: Add support for listing geo replicated backups
* `az sql db geo-backup restore/show/list`: New commands to manage geo redundant backups
* `az sql db threat-policy`: Change expiration version for cmd group to 2.49.0
* `az sql mi dtc`: Add managed instance DTC commands
* `az sql midb restore`: Add support for cross-subscription restore
* `az sql db geo/ltr-backup restore`: Add service objective parameter to ltr restore and geo restore

### Storage

* `az storage account create`: Ongoing breaking change warning for disallowing blob public access by default
* `az storage container immutability-policy create`: Allow user to not specify `--resource-group`

## January 11, 2023

Version 2.44.1

### Network

* Hotfix: Fix #25086: `az network lb probe`: Expose parameter `--probes`

## January 10, 2023

Version 2.44.0

### ACR

* `az acr manifest`: Support oci artifact manifest

### AKS

* `az aks create`: Add new parameter `--data-collection-settings` to support for AKS Monitoring Addon in MSI auth mode
* `az aks install-cli`: Automatically add the installation directories to system path on windows
* `az aks create/update`: Add support for KEDA workload auto-scaler

### APIM

* `az apim api create`: Parse URL to detect Protocol and API type

### App Service

* Fix #23488: `az appservice plan create`: Fix zone redundant ASP creation fails for ASEv3
* Fix #24858: Support for new isolated v2 (I4v2, I5v2, I6v2) SKUs
* `az appservice ase upgrade/send-test-notification`: Add new commands for ASE to support ASE upgrade and sending test notifications
* `az appservice ase update`: Add `--allow-incoming-ftp-connections` to allow incoming FTP connections
* `az appservice ase update`: Add `--allow-remote-debugging` to allow remote debugging
* Fix #19893: `az appservice plan create`: Fix the bug that cannot create app plan in a different subscription for ASEv3
* Fix #16478: `az functionapp cors credentials`: Add enable/disable CORS creds commands
* Fix #22934: `az functionapp delete`: Add new parameter `--keep-empty-plan` to support keeping empty app service plan
* Fix #19469: `az functionapp vnet-integration add`: Add consumption plan validation
* `az staticwebapp functions link`: Add new parameter `--environment-name` to support setting the environment name of static site

### ARM

* Fix #24810: Support ARM64 architecture for Bicep installation

### Batch

* `az batch pool create/set`: Add new parameter `--target-communication` to support setting the desired node communication mode for the pool

### Compute

* Fix #24896: `az vm create`: Fix the bug that the VM cannot be created from ACG image to other resource group
* `az disk create`: Add new parameter `--performance-plus` to support boosting the performance target
* `az vm list`: Add new paramter `--vmss` to support querying VM instances in a specific VMSS
* `az sig image-version create/update`: Add parameters `--target-edge-zone-encryption` and `--target-edge-zones` to support edge zones

### Container

* `az container export`: Fix export when identity is set

### Key Vault

* `az keyvault key create`: Support OKP key and Ed25519 curve

### Monitor

* [BREAKING CHANGE] `az monitor action-group test-notifications create`: Remove notification in resource group and subscription level
* `az monitor diagnostic-settings create`: Create with resource id and export without workspace

### NetAppFiles

* `az volumes qouta-rule create`: Add volume quota rule create command
* `az volumes qouta-rule show`: Add volume quota rule show command
* `az volumes qouta-rule list`: Add volume quota rule list command
* `az volumes qouta-rule update`: Add volume quota rule update command
* `az volumes qouta-rule delete`: Add volume quota rule delete command

### Network

* `az network vnet-gateway create`: Add parameter `--edge-zone-vnet-id` for local gateway
* Fix #24853: `az network nsg rule create`: `--destination-asgs` and `--source-asgs` cannot be used
* Fix #24883: `az network application-gateway stop/start`: Add missed parameter `--ids`
* `az network watcher packet-capture create`: Resolve local path issue for Linux VM
* `az network lb update`: Expose parameter `--tags`

### Redis

* `az redis import/export`: Add new optional parameter `--preferred-data-archive-method`
* `az redis server-link`: Linked server has two new properties: `geoReplicatedPrimaryHostName` and `primaryHostName`

### Security

* `az security alert update`: `--status` now support `resolve` and `inprogress`

### Service Connector

* `az connection`: Support local connection which allows local environment to connect Azure resource
* Fix #24806: `az webapp connection create mysql-flexible`: Fix mysql connection command with `--system-identity`

### SQL

* `az sql server/db/mi/midb advanced-threat-protection-setting show/update`: Support `advanced-threat-protection-setting` commands
* `az sql db threat-policy`: Declare deprecation of this command group in version 2.45.0
* `az sql db`: Add `--preferred-enclave-type` argument

### Storage

* `az storage blob copy start`: Fix `--tier` to support setting blob tier when copying

## December 06, 2022

Version 2.43.0

### Core
* `aaz`: Fix `has_value` function for list, dict and object arg types (#24625)
* `aaz`: Support argument preview and experimental (#24637)
* `aaz`: Add registered property for `AAZBaseArg` (#24640)
* `aaz`: Add aazlist and aazdict args transform help functions (#24690)
* `aaz`: Support camel case key in `AAZObjectType` (#24771)
* Disable removing and updating system extension in Cloud Shell (#24361)

### AKS

* `az aks enable-addons`: Add `--enable-syslog` parameter to monitoring addon
* `az aks nodepool`: Unify the option names used to specify the nodepool name and cluster name. For nodepool name, option names are `--nodepool-name`, `--name` and `-n`. For cluster name, option name is `--cluster-name`
* `az aks nodepool add`: Support the new SKU Mariner for parameter `--os-sku`

### App Config

* `az appconfig`: Update raised errors in app config command module

### App Service

* `az staticwebapp backends link`: Link an backend to a static webapp. Also known as "Bring your own Backend."
* `az staticwebapp backends unlink`: Unlink backend from a static webapp
* `az staticwebapp backends show`: Show details on the backend linked to a static webapp
* `az staticwebapp backends validate`: Validate an backend for a static webapp
* `az webapp config snapshot restore`: Fix the AttributeError `str object has no attribute get`
* `az appservice plan create/update`: Add new environment SKU for parameter `--sku`
* `az staticwebapp create`: Add new parameter `--login-with-ado` to create azure dev ops token automatically
* Fix #24506: `az functionapp keys set/delete`: Update the wrong accepted parameter value `systemKey` to `systemKeys` for `--key-type`
* `az webapp create`: Add `--public-network-access` parameter to support enabling public access
* `az staticwebapp hostname show`: Fix dns-txt-token validation command to show command
* Fix #24620: `az webapp create`: Improve the error message to show that the `az webapp list-runtimes` command depends on the specified runtime

### ARM

* `az deployment mg create`: Add new parameter `--mode` to support setting the mode for deploying resources
* `az group lock list`: Mark the `--resource-group` as required in help message
* `az bicep install`: Address issue installing bicep on non-musl default systems with musl

### Backup

* `az backup restore restore-disks`: Allow `--disk-encryption-set-id` for cross region restore

### Compute

* Fix #24624: `az sig image-version create`: Fix the error that the `--os-vhd-storage-account` must be a managed disk or snapshot

### IoT

* Fix #22257: `az iot dps linked-hub create`: Improve error handling for linked hubs
* `az iot hub create/delete`: Add `--no-wait` parameter to support no wait operation

### Key Vault

* `az keyvault`: Add check-name command, support Security Domain Properties

### Monitor

* `az monitor diagnostic-settings`: Add `--marketplace-partner-id` parameter

### Network

* `az network bastion rdp`: Allow rdp session customization
* `az network private-endpoint-connection`: Enable private link support for provider `Microsoft.DesktopVirtualization/hostpools` and `Microsoft.DesktopVirtualization/workspaces`
* `az network application-gateway`: Support OCSP revocation check on client certificate
* `az network traffic-manager endpoint`: Add `--always-serve` to manage the health check on endpoints
* `az network public-ip create`: Fix `--ip-tags` cannot be used
* `az network private-endpoint-connection`: Add Provider `Microsoft.MachineLearningServices/registries`

### RDBMS

* `az postgres flexible-server geo-restore/replica`: Introduce read replicas and geo-restore
* `az postgres flexible-server upgrade`: Add major version upgrade for PostgreSQL flexible server
* `az postgres flexible-server create/update/restore/replica`: Postgres flex byok
* `az postgres flexible-server identity`: Add user managed identity operations for PostgreSQL flexible server
* `az postgres flexible-server create/update/ad-admin`: Add Azure Active Directory Administrator operations for PostgreSQL flexible server

### Service Connector

* `az webapp/spring/containerapp connection create mysql`: Deprecate mysql single server connection command

### SQL

* `az sql server ipv6-firewall-rule`: Add new command group for AZ SQL server IPv6 firewall rule

### SQL VM

* `az sql vm update`: Deprecate the `--yes` prompt to upgrade SqlIaaSAgent extension to full mode
* `az sql vm create/update`: Add `--least-privilege-mode` to take minimal permissions on their SQL Server
* `az sql vm group create/update`: Add `--cluster-subnet-type` to support High Availability configuration

### Storage

* Fix #23893, #24528: `az storage account show-connection-string/keys renew`: Fix resource group auto completion
* Fix #23216: `az storage file upload-batch`: Fix `--dryrun` to show correct file paths
* `az storage blob copy start`: Add `--destination-blob-type` to allow switching between blob types when copying
* `az storage account encryption-scope list`: Add `--filter`, `--include`, `--maxpagesize` to support advanced list
* `az storage account failover`: Add `--failover-type` to support planned failover

## November 01, 2022

Version 2.42.0

### ACR

* `az acr task update`: Fix logic issue for updating encoded task

### AKS

* Fix #24188: `az aks list`: Fix pagination handling error `ContainerServiceClientConfiguration object has no attribute api_version` when there are many list results
* Fix #24188: `az aks nodepool list`: Fix pagination handling error `ContainerServiceClientConfiguration object has no attribute api_version` when there are many list results
* `az aks create/update`: Add new parameters `--enable-blob-driver` and `--disable-blob-driver` to enable/disable Blob CSI Driver
* `az aks create/update`: Add new parameter `--enable-oidc-issuer` to support enabling oidc issuer feature
* `az aks oidc-issuer rotate-signing-keys`: Add new command to support rotating oidc issuer service account signing keys

### APIM

* `az apim create/update`: Add `--public-network-access` to support specifying whether or not public endpoint access is allowed for this API management service
* `az apim create/update`: Add `--disable-gateway` to support disabling gateway in the master region

### App Config

* `az appconfig`: Update raised errors in app config command module

### App Service

* Fix #23050: `az functionapp deployment source config-zip`: Fix the bug that zip deployment will fail if app settings contain any values of null

### Backup

* `az backup restore restore-disks`: Update Cross Zonal Restore behaviour for ZRS vaults and primary region CRR scenarios
* `az backup job show`: Change subtask start/end time from minimum value to null for ongoing or yet-to-start operation

### Compute

* `az vm run-command create/update`: Change help messages and add examples for `--output-blob-uri` parameter to illustrate that `--output-blob-uri` must be SAS URI
* Fix #24187: `az vm list`: Fix the AttributeError 'ComputeManagementClientConfiguration' object has no attribute 'api_version'
* `az vm extension list`: Add new parameter `--ids` to support listing extensions by VM id
* `az sig image-version create/update`: Add `--allow-replicated-location-deletion` to support removing gallery image version from replicated regions
* Fix #24263: `az snapshot create`: Fix the KeyError 'IMPORT_ENUM' when creating snapshot from source blob uri
* `az sig image-version update`: Support `excludeFromLatest` for `--add` parameter to exclude this image version when using the latest version of image definition
* `az sig image-version update`: Support `safetyProfile.allowDeletionOfReplicatedLocations` for `--set` parameter to allow users to remove the gallery image version from replicated regions

### HDInsight

* [BREAKING CHANGE] `az hdinsight create`: Remove the enum value 1.0 and 1.1 from the `--minimal-tls-version`, HDInsight doesn't support TLS version which is less than 1.2 now.

### IoT

* `az iot hub create`: Enforce data residency property on hubs created in `qatarcentral`

### NetAppFiles

* `az netappfiles account renew-credentials`: Add `renew-credentials` command to renew identity credentials that are used to authenticate to key vault, for customer-managed key encryption

### Network

* `az network public-ip`: Add alias `--ddos-protection-mode` to `--protection-mode`
* `az network custom-ip prefix`: Add parameters `--asn`, `--geo`, `--no-internet-advertise` and so on
* Fix #21551: `az network nic ip-config update`: ASGs update with multiple IP configurations
* Fix #24169: `az network application-gateway waf-policy managed-rule exclusion rule-set remove`: Remove exclusion with different matchers
* Fix #24377: `az network public-ip create`: Derive Public IPs in different resource group from Public IP Prefix
* `az network lb probe`: Support probe threshold via `--probe-threshold`

### RDBMS

* [BREAKING CHANGE] `az postgres flexible-server migration show`: Remove `--level` parameter
* [BREAKING CHANGE] `az postgres flexible-server migration delete`: Remove this command. Deleting a migration is not supported for now.
* [BREAKING CHANGE] Change `az postgres flexible-server migration update --cutover` to `az postgres flexible-server migration update --cutover db1 db2 db3`
* `az postgres flexible-server migration create`: Add `--migration-mode` to support offline and online(with CDC) migrations. Default mode when `--migration-mode` not passed will be offline.
* Add `az postgres flexible-server migration update --cancel db1 db2 db3` to cancel a migration.

### Resource

* `az resource delete`: Add new parameter `--no-wait` to support not waiting the long-running operation to finish

### Role

* `az role assignment create`: Support bring-your-own role assignment name
* `az role assignment delete`: If `--ids` is provided, ignore other arguments, instead of raising error

### SQL

* `az sql midb log-replay start`: Add `--storage-identity` parameter

### Storage

* `az storage account show-connection-string/keys renew`: Update options for `--key` parameter
* `az storage account create/update`: GA `--key-vault-federated-client-id`

### Synapse

* `az synapse workspace create`: Add parameter `--managed-resource-group-name`
* `az synapse spark pool`: Add parameter `--enable-dynamic-executor-allocation`

## October 11, 2022

Version 2.41.0

### Core

* Support Continuous Access Evaluation
* PREVIEW: Support Web Account Manager (WAM) login on Windows. To opt in, run `az config set core.allow_broker=true`
* Revert #23514: Rename entry script `az.ps1` to `azps.ps1`
* `aaz`: Support `yaml` file as value for compound arguments
* `aaz`: Fix recursion depth exceeded for to_serialized_data of AAZObject
* `aaz`: Support customized life cycle callback functions for `AAZCommand`
* `aaz`: Fix two AAZObjects or AAZDicts comparison

### ACS

* [BREAKING CHANGE] `az acs`: Remove the deprecated command group

### AD

* Support special characters in user principal name

### AKS

* Fix #23779: `az aks install-cli`: Support determining the arch of binaries based on system information

### APIM

* Fix #20863: `az apim api import`: Fix the issue to import GraphQL API's using graphqllink

### App Config

* [BREAKING CHANGE] `az appconfig kv import`: Add validation to JSON file import to ensure that only valid JSON objects are imports
* [BREAKING CHANGE] `az appconfig kv export`: Update the array conversion logic to prevent dropping keys during export
* `az appconfig kv export`: Fix MemoryError while exporting large stores
* `az appconfig replica`: New command group to support geo-replication
* `az appconfig kv export`: Support exporting app configuration settings as references to App Service
* `az appconfig kv import`: Ensure app configuration references are not imported from App Service
* `az appconfig feature filter update`: Add new command to support updating functionality for feature filters

### App Service

* `az functionapp deployment github-actions`: Add support for linux powershell runtimes
* `az functionapp deployment github-actions`: Fix issue where publish profile would not be populated before the github action was run
* `az webapp up`: No longer show status during linux deployments
* `az webapp deployment source config-zip`: No longer show status during linux deployments

### ARM

* `az deployment group what-if`: Fix an issue where `complete` deployment mode does not work

### Backup

* `az backup policy`: Add support for Smart Tiering policy

### Compute

* [BREAKING CHANGE] `az vmss create`: Update NAT pool to NAT rule V2 for Standard LB SKU when creating VMSS
* `az vm/vmss create`: `--enable-secure-boot` is set to True by default when the `--security-type` used by the VM/VMSS creation is `TrustedLaunch`
* `az restore-point create`: Add new parameter `--consistency-mode` to support setting consistency mode
* `az vmss create/update`: Add new parameters `--priority-count` and `--priority-percentage` to support setting priority mix policy
* `az vm/vmss create/update`: Add new parameter `--disk-controller-type` to support setting disk controller type
* `az disk create`: Add warning log in three scenarios to later support creating disk with Gen2 and TLVM as default
* `az vmss create`: Add new parameter `--nat-rule-name` to specify the name of NAT rule V2 when creating a new load balancer (NAT rule V2 is used to replace NAT pool)

### Cosmos DB

* `az cosmosdb mongodb role/user definition`: New command groups for enforcing RBAC on Cosmos DB Mongo accounts
* `az cosmosdb create/update`: GA mongo server version

### Event Hubs

* [BREAKING CHANGE] `az eventhubs namespace update`: Remove `--key-source`, `--key-name`, `--key-vault-uri` and `--key-version`. Please use `az eventhubs namespace encryption` to manage keys
* [BREAKING CHANGE] `az eventhubs namespace create/update`: Remove `--identity`. Please use `--mi-user-assigned` and `--mi-system-assigned` parameters and `az eventhubs namespace identity` commands
* [BREAKING CHANGE] `az eventhubs namespace create/update`: Remove `--default-action` and `--enable-trusted-service-access`. Please use `az eventhubs namespace network-rule update` command instead

### Key Vault

* [BREAKING CHANGE] `az keyvault create/update`: Finally remove `--enable-soft-delete` parameter
* Fix #23527: `az keyvault secret set`: Add alias `--content-type` for `--description`

### Monitor

* [BREAKING CHANGE] `az monitor diagnostic-settings list`: Drop `value` property in output, return a list instead of a dict
* `az monitor autoscale`: Upgrade monitor autoscale api version
* `az monitor autoscale`: Add predictive metric show cmd

### NetAppFiles

* `az netappfiles account create`: Add optional parameters `--key-name`, `--key-source`, `--keyvault-resource-id`, `--user-assigned-identity`
* `az netappfiles account update`: Add optional parameters `--key-name`, `--key-source`, `--keyvault-resource-id`, `--user-assigned-identity`
* `az netappfiles volume create`: Add optional parameters `--smb-access-based-enumeration`, `--smb-non-browsable`, `--delete-base-snapshot`
* `az netappfiles resource`: Add new command `query-region-info`

### Network

* [BREAKING CHANGE] `az network watcher connection-monitor create`: Deprecate classic connection monitor creation
* [BREAKING CHANGE] `az network application-gateway waf-policy managed-rule rule-set`: Change parameter `--rules` to `--rule` and support multi-properties
* [BREAKING CHANGE] `az network vnet`: Deprecate parameter `--defer`
* [BREAKING CHANGE] `az network public-ip`: Change `publicIpAllocationMethod` to `publicIPAllocationMethod`
* [BREAKING CHANGE] `az network public-ip`: Change `publicIp.publicIpPrefix` to `publicIp.publicIPPrefix`
* [BREAKING CHANGE] `az network public-ip`: Change `publicIpAddressVersion` to `publicIPAddressVersion`
* Fix #23884: `az network application-gateway rule create`: Compatible with v1 SKU
* `az network private-endpoint-connection`: Add Provider `Microsoft.AgFoodPlatform/farmBeats`
* `az network application-gateway waf-policy managed-rule rule-set`: Support per rule actions in web application firewall
* `az network public-ip`: Support ddos protection mode via `--protection-mode`

### Packaging

* Drop Mariner 1.0 RPM package

### RDBMS

* `az mysql flexible-server update`: Expose `--geo-redundant-backup` argument
* `az mysql/postgres flexible-server create/update`: Deprecate `Enabled` for `--high-availability` argument
* `az mysql flexible-server stop`: Change stopped time logging message
* `az mysql flexible-server ad-admin delete`: Disable `aad_auth_only` when dropping AAD admin
* `az mysql flexible-server identity remove`: Allow removing all identities in a MySQL server

### Reservations

* Move commands from azure-cli to `reservation` extension

### Service Bus

* [BREAKING CHANGE] `az servicebus namespace create/update`: Remove `--default-action`. Please use `az servicebus namespace network-rule update` command instead
* `az servicebus queue/topic create/update`: Support setting max message size
* `az servicebus topic subscription create`: Support client affine

### Service Connector

* `az spring-cloud connection create postgres`: Add `--system-identity` for springcloud-postgres connection

### SQL

* `az sql server audit-policy show`: Add `isManagedIdentityInUse` info in output

### Storage

* `az storage blob/container`: Support `--account-name` for non-standard account URL
* `az storage account update`: Fix ADProperties wipe out issue when updating `--default-share-permission`
* Fix #19311: `az storage remove`: Add support for connection-string

## September 06, 2022

Version 2.40.0

### ACR

* `az acr config authentication-as-arm show`: Add new command to support showing the configured 'Azure AD authenticate as ARM' policy
* `az acr config authentication-as-arm update`: Add new command to support updating 'Azure AD authenticate as ARM' policy
* `az acr config soft-delete show`: Add new command to show soft-delete policy
* `az acr config soft-delete update`: Add new command to update soft-delete policy
* `az acr repository list-deleted`: Add new command to list deleted repositories
* `az acr manifest list-deleted`: Add new command to list deleted manifests
* `az acr manifest list-deleted-tags`: Add new command to list deleted tags
* `az acr manifest restore`: Add new command to restore deleted manifests and tags
* `az acr network-rule`: Deprecate params `--subnet` and `--vnet-name`
* `acr config`: Fix bug in some commands that would in certain circumstances attempt to pull a nonexistent model from SDK

### AKS

* Fix #23468: `az aks nodepool wait` crashes with error "'Namespace' object has no attribute 'nodepool_name'"
* `az aks check-acr`: Append acr suffix to option `--acr` acording to cloud env
* `az aks`: Add `--gpu-instance-profile` for Nvidia multi-instan…
* `az aks update`: Update without args prompts to reconcile
* `az aks create/update`: Add new parameters `--enable-disk-driver` and `--disable-disk-driver` to enable/disable AzureDisk CSI Driver. When creating new cluster, AzureDisk CSI Driver is enabled by default.
* `az aks create/update`: Add new parameters `--enable-file-driver` and `--disable-file-driver` to enable/disable AzureFile CSI Driver. When creating new cluster, AzureFile CSI Driver is enabled by default.
* `az aks create/update`: Add new parameters `--enable-snapshot-controller` and `--disable-snapshot-controller` to enable/disable CSI Snapshot Controller. When creating new cluster, CSI Snapshot Controller is enabled by default.
* `az aks nodepool add`: Add option `Windows2019`, `Windows2022` to `--os-sku` parameter
* Fix #23653: `az aks create`: Fix the CrashLoopBackOff issue when set `--network-policy` to 'Calico'

### App Service

* Fix #23417: `az functionapp github-actions add`: Fix the functionapp github actions on java
* `az functionapp list-runtimes`: Add linuxFxVersion to output
* `az webapp up`: Show status during deployment for linux apps
* `az webapp deployment source config-zip`: Show status during deployment for linux apps
* `az logicapp deployment`: Add a new command group to support managing logic app deployments
* `az logicapp scale`: Add a new command to support scaling a logic app
* `az logicapp config`: Add a new command group to support configuring a logic app
* `az logicapp update`: Add a new command to support updating a logic app

### ARM

* `az bicep`: Use `AZURE_CLI_DISABLE_CONNECTION_VERIFICATION` when checking Bicep CLI versions

### Backup

* `az backup vault create/backup-properties set`: Add support for Alert Settings
* Fix #23655: `az backup restore restore-disks`: Support storage account being in a different resource group

### Batch

* Fix #23445: `az batch pool supported-images list`: Fix the `NoneType object has no attribute startswith` bug for getting supported images list

### Compute

* `az vm run-command invoke`: Add new parameters `--no-wait` to support not waiting for the long running operation to finish
* Fix #23194: `sig image-version create`: Fix the `Parameter tags must be of type dict` error when `--tags` parameter is passed as `key=value` pairs
* Fix #23540: `az ppg create`: Fix the `Parameter tags must be of type dict` error when `--tags` parameter is passed as `key=value` pairs
* `az sig update`: Add parameters to support updating gallery from private to community
* `az sig share reset`: Update gallery from community to private
* `az vm/vmss create`: `--enable-vtpm` is set to `True` by default when the `--security-type` used by the VM/VMSS creation is `TrustedLaunch`
* Fix #23341: `az vm list-skus`: Fix filtering out VM sizes that are available regionally when they are restricted in all zones
* `az vm run-command show/list`: Add validation and refine help message for parameter combination
* `az identity federated-credential`: Add subgroup to support managing federated identity credentials of existing user assigned identities

### Cosmos DB

* `az cosmos db service`: Add service support for cosmosDB
* `az cosmosdb gremlin graph`: Add analyticalStorageTTL property to sql containers

### Feedback reference

* `az survey`: New command for CLI survey

### Monitor

* `az monitor action-group test-notifications create`: Add new command
* `az monitor metric alert`: Support metric namespace with dash
* `az monitor action-group create`: Add optional parameter `--location`

### NetAppFiles

* `az netappfiles volume create`: Add optional parameter `--kv-private-endpoint-id`
* `az netappfiles volume-group create`: Add optional parameter `--kv-private-endpoint-id`
* `az netappfiles volume update`: Add optional parameter `--cool-access`
* `az netappfiles volume update`: Add optional parameter `--coolness-period`
* `az netappfiles pool update`: Add optional parameter `--cool-access`

### Network

* `az network application-gateway create`: Support rule priority field provided as part of configuration
* `az network private-endpoint-connection`: Add `Microsoft.OpenEnergyPlatform/energyServices` provider
* Fix #22594: `az network bastion create`: Add no wait support for bastion create
* Fix #23525: `az network bastion create/update`: Add missing arguments and update command
* `az network watcher packet-capture create`: Add VMSS support in packet capture

### Packaging

* Build RPM for RHEL 9 and CentOS Stream 9

### RDBMS

* `az mysql flexible-server upgrade`: Add major version upgrade for MySQL flexible server
* `az mysql/postgres flexible-server backup`: Add backup commands for flexible servers
* `az postgres flexible-server create/update`: Add `SameZone` for HA in PostgreSQL flexible server
* `az mysql flexible-server create/update/restore/geo-restore/replica`: Add BYOK for MySQL Flexible Server
* `az mysql flexible-server identity/ad-admin`: User Identity and AAD Admin for MySQL flexible server

### Security

* `az security security-solutions-reference-data`: Add new command group
* `az security security-solutions`: Add new command group

### Service Bus

* `az servicebus namespace create/update`: Support specifying `--min-tls`
* `az servicebus namespace network-rule update`: Support updating network rules for given namespace

### Service Connector

* `az spring connection`: Update description after spring app renames

### SignalR

* `az signalr custom-domain`: Support custom domain
* `az signalr custom-certificate`: Support custom certificate

### SQL

* `az sql mi endpoint-cert`: New command group to manage endpoint certificates
* `az sql mi partner-cert`: New command group to manage partner certificates
* `az sql mi link`: New command group to manage instance link

### Storage

* `az storage fs file set-expiry`: New command to support setting expiry for files in ADLS Gen2 file system
* `az storage account create/update`: Add `--enable-files-aadkerb` to support AAD Kerberos authentication for Azure Files
* `az storage account local-user`: New command group to manage identities when using SFTP
* `az storage account create/update`: Add `--enable-sftp` and `--enable-local-user` to support SSH File Transfer Protocol
* `az storage fs create`: Support encryption scope
* `az storage fs directory/fs generate-sas`: Support generating SAS token with specified encryption scope

## August 02, 2022

Version 2.39.0

### ACR

* [BREAKING CHANGE] Update manifest list-referrers to comply with RC1 ORAS spec
* `az acr update`: Update networkRuleSet.defaultAction to deny when `--public-network-enabled` is disabled
* Fix #23340: `az acr task credential add`: Fix crashes when given a password but no username

### AD

* `az ad app federated-credential`: Federated identity credential GA

### Advisor

* Fix #11070: `az advisor recommendation disable`: Fix NoneType error

### AKS

* Fix snapshot not resolved according to the subscriptions field in the `--snapshot-id` option
* `az aks check-acr`: Bump canipull to v0.1.0 to add 5s wait to avoid attach race condition
* `az aks update`: Fix the issue of `NoneType` error when updating the config of keyvault secret provider
* Remove warning message when using "BYO vnet + system MSI"
* Fix the bug related to AKS Monitoring MSI auth when the location value with spaces
* Fix #2457: Clarify subnet id description to resource id
* `az aks create`: Add new parameter `--host-group-id` to support Azure dedicated host
* `az aks nodepool add`: Add new parameter `--host-group-id` to support Azure dedicated host
* `az aks create/update`: Add new parameters `--enable-azure-keyvault-kms`, `--azure-keyvault-kms-key-id`, `--azure-keyvault-kms-key-vault-network-access`, `--azure-keyvault-kms-key-vault-resource-id` and `--disable-azure-keyvault-kms` to support Key Management Service feature with Azure Key Vault
* `az aks create`: Add `--network-plugin=none` support for BYO CNI
* `az aks create/update`: Add parameter `--http-proxy-config` to support setting HTTP Proxy configuration

### App Service

* Fix #23135: `az functionapp plan create`: Add validation for the valid value of `--number-of-workers` option
* `az functionapp/logicapp create`: Add new `--https-only` parameter
* `az functionapp/webapp create`: Allow vnet integration for basic and elastic premium SKUs
* `az webapp list-runtimes`: Add Java 17 Support
* `az webapp create`: Add Java 17 Support
* `az webapp up`: Add Java 17 Support
* `az functionapp deployment github-actions add`: Add command to create GitHub actions to deploy to a Function App
* `az functionapp deployment github-actions remove`: Add command to remove Function App GitHub actions
* `az webapp deployment github-actions`: Add validation to ensure app is Web App

### ARM

* Fix #23246: Fix interchanged policy samples

### Backup

* `az backup protection backup-now`: Fix bug for SQL/HANA backup retention

### Batch

* `az batch account network-profile show`: Add show network profile command for batch account
* `az batch account network-profile set`: Add set network profile command for batch account
* `az batch account network-profile network-rule list`: Add rule list command for batch account network
* `az batch account network-profile network-rule add`: Add rule add command for batch account network
* `az batch account network-profile network-rule delete`: Add rule delete command for batch account network
* `az batch account create`: Add managed identity support with `--mi-user-assigned` parameter
* `az batch account identity assign`: Add command to add identity to existing batch accounts
* `az batch account identity remove`: Add remove identity for existing batch accounts
* `az batch account identity show`: Add show identity for batch accounts
* `az batch pool create`: Update help text for `--json-file` to point to json schema

### Compute

* `az ppg create/update`: Add parameter `--intentvmsizes` to specify possible sizes of VM that can be created in the proximity placement group
* `az ppg create`: Add parameter `--zone` to support specifying availability zone where the ppg should be created
* Fix #22995: `az image-version create`: Unbind the usage of `--target-region-encryption` and `--target-region-cvm-encryption`
* Fix #22654: `az vm run-command create/update`: Parameter `--protected-parameters` does not achieve the desired effect
* `az vmss run-command create/update`: Parameter `--protected-parameters` does not achieve the desired effect
* `az vmss create`: Add new parameter `--os-disk-delete-option` to support configuring whether the VM OS disks of Flex VMSS will be deleted or detached upon VM deletion
* `az vmss create`: Add new parameter `--data-disk-delete-option` to support configuring whether the VM data disks of Flex VMSS will be deleted or detached upon VM deletion
* `az image builder create`: Add parameter `--staging-resource-group` to support custom resource group naming
* `az image builder validator`: Add subgroup to manage validate information of template
* `az vm disk detach`: Add parameter `--force-detach` to support force-detaching managed data disks from a VM

### Container

* `az container create`: Add environment variable interpolation in container group yaml

### Event Grid

* Add commands for partner and event-subscription customer facing features

### Eventhub

* `az eventhubs namespace`: Add `--minimum-tls-version`
* `az eventhubs cluster`: Add `--supports-scaling`

### IoT

* Change certificate loading to encode to b64 strings by default

### Key Vault

* `az keyvault security-domain upload`: Fix `password must be bytes-like` for `--passwords`

### Monitor

* `az monitor autoscale rule create`: Suppress warning from antlr
* `az monitor metrics alert create/update`: Suppress warning from antlr

### Network

* `az network vnet subnet list-available-ips`: Get list of available IPs for subnet
* `az network private-endpoint-connection`: Enable private link support for provider `Microsoft.KubernetesConfiguration/privateLinkScopes`
* `az network private-endpoint-connection`: Enable private link support for provider `Microsoft.Dashboard/grafana`
* `az network dns zone export`: Add support for ALIAS record
* `az network dns zone import`: Add support for ALIAS record
* `az network application-gateway waf-policy custom-rule match-condition add`: Add validation for WAF custom rule condition
* `az network watcher flow-log`: Add support for `--vnet`, `--subnet`, `--nic` as target ID
* `az network private-endpoint create`: Add an example for creating with ASGs

### Packaging

* Drop CentOS 7 RPM package
* Drop Python 3.6 support
* Build RPM for Fedora
* Drop Ubuntu 21.10 Impish Indri DEB package

### Profile

* `az account list`: Add `TenantId` column to table output

### RDBMS

* `az mysql flexible-server server-logs`: Add server logs for MySQL Flexible Server

### Service Connector

* `az spring connection create eventhubs`: Add new parameter `--client-type kafka-springBoot`
* `az webapp connection create`: Add `--config-connstr` to support webapp connection strings
* `az webapp connection create`: Use webapp name and resource group from config

### SQL

* `az sql log-replay stop`: Drop DB only if it was created with LRS

### Storage

* `az storage fs undelete-path`: Encode `--deleted-path-name` automatically
* Fix #23179: `az storage file upload/upload-batch`: Fix `--content-md5` for upload, ignore `--content-md5` for upload-batch
* `az storage file show`: Fix JSON error when content-md5 is not None
* `az storage blob/file update`: Fix `--content-md5` TypeError
* `az storage container policy create`: No longer use default value for start and expiry time
* `az storage blob upload`: Add back `--socket-timeout` which has been renamed by SDK
* Fix #23262: `az storage blob metadata`: Add `--lease-id` back
* `az storage blob download/download-batch`: Add `--overwrite`

### Synapse

* `az synapse workspace`: Add `--last-commit-id` for git repo config
* `az synapse ad-only-auth`: New command group for supporting synapse azure ad only authentication

## June 21, 2024

Version 2.38.2

This version is only released for CentOS 7 and RHEL 7. CVE-2023-36052 is fixed in this version.

### App Service

* [BREAKING CHANGE] Redact appsettings output on set/delete commands
* [BREAKING CHANGE] `az webapp config`: Redact webapp config connection-string and storage-account values
* [BREAKING CHANGE] `az functionapp`: Redact key value output on keys set
* [BREAKING CHANGE] `az functionapp/webapp deployment source update-token`: Redact tokens output on deployment source update-token
* [BREAKING CHANGE] Redact output on deployment source config

## September 01, 2023

Version 2.38.1

This version is only available on CentOS 7 and RHEL 7.

### App Service

* `az webapp ssh`: Backport #25141 to 2.38

## July 05, 2022

Version 2.38.0

### ACR

* `az acr`: Show replication region endpoint status in table output
* `az acr task run`: Add Dockerfile to source upload if context is local directory

### AD

* `az ad app/sp update`: Support generic update `--set` on root level
* Support special characters in object names
* `az ad app federated-credential`: Support federated identity credentials

### AKS

* `az aks get-credentials`: Fix permission prompt when saving config file to symlink
* `az aks command invoke`: Add support for `--no-wait`
* `az aks get-credentials`: Fix the command error when KUBECONFIG is empty
* `az aks nodepool stop/start`: Add nodepool stop/start bindings

### APIM

* `az apim`: Update experimental flag to get out of experimental state
* `az apim deletedservice`: Add command group to support managing soft-deleted azure API Management services

### App Config

* `az appconfig`: GA features - soft-delete, feature-filter, strict-import and disable-local-auth

### App Service

* [BREAKING CHANGE] `az webapp up`: Remove premium container SKUs (PC2, PC3, PC4)
* [BREAKING CHANGE] `az appservice plan create/update`: Remove premium container SKUs (PC2, PC3, PC4)
* [BREAKING CHANGE] `az functionapp plan create`: Remove premium container SKUs (PC2, PC3, PC4)
* Fix #22722: `az webapp config ssl import` fixes to support new GraphAPI for SP queries
* `az webapp up`: Fix bug where runtime is detected even when `--runtime` is provided
* `az staticwebapp enterprise-edge`: Move command group from extension to official CLI
* `az appservice plan create`: Allow creating Hyper-V App Service Plans hosted on App Service Environments
* `az webapp/functionapp deployment slot create`: Allow using `--configuration-source` for apps with storage accounts added
* `az webapp up`: Fix bug when deploying to an App Service Environment (ASE) where the ASE is incorrectly categorized as an internal load balancing (ILB) ASE and fails validation
* Fix #20901: `az functionapp update`: Update `--slot` logic to work correctly

### ARM

* Fix #22621: `az bicep build`: `--stdout` does not work
* Fix #22930: `az bicep generate-params`: Add support for bicep generate-params command
* `az deployment`: Fix the error message of ARM deployment to the correct JSON format

### Backup

* `az backup restore restore-disks`: Add Cross Subscription Restore for IaasVM ALR
* `az backup protection enable-for-vm`: Add a linux specific example
* `az backup protectable-item list`: SQLAG container fetch failure bug fix

### Bot Service

* [BREAKING CHANGE] `az bot create`: Remove `--kind`, `--password`, `--lang` arguments. Add `--app-type`, `--tenant-id`, `--msi-resource-id` arguments

### Cognitive Services

* `az cognitiveservices account deployment create`: Support standard scale type

### Compute

* `az disk create`: Fix the issue that specifying encryption type as `EncryptionAtRestWithPlatformKey` does not take effect when creating a disk
* `az disk update`: Fix the `(InvalidParameter) Resource xxx encrypted with platform key has disk encryption set id specified` error when updating the encryption type to platform managed keys
* `az sig image-version create`: Add new parameters `--virtual-machine` and `--image-version` to support creating image version from different source
* `az vm`: Support a new disk storage SKU Premiumv2_LRS
* `az sig show-community`: Add new command to support listing image versions in community gallery
* `az sig image-definition show-community`: Add new command to support getting an image in a gallery community
* `az sig image-definition list-community`: Add new command to support listing VM Image definitions in a gallery community
* `az sig image-version show-community`: Add new command to support getting an image version in a gallery community
* `az sig image-version list-community`: Add new command to support listing VM image versions in a gallery community
* `az sig share enable-community`: Add new command to support sharing gallery to community
* `az sig gallery-application version`: Add new parameter `--package-file-name` to specify the downloaded package file on the VM
* `az sig gallery-application version`: Add new parameter `--config-file-name` to specify the downloaded config file on the VM
* `az disk create`: Add support for `--gallery-image-reference` to allow creating disk from shared gallery image version or community gallery image version
* `az disk create`: Add support for `--source` to allow creating a disk from disk restore point
* `az vm/vmss application set`: Add new parameter `--treat-deployment-as-failure` to treat any failure in the gallery application version as deployment failure
* `az vm image list`: Add parameter `--architecture` to filter image with its architecture
* `az disk-encryption-set create`: The `--encryption-type` parameter supports new value `ConfidentialVmEncryptedWithCustomerKey` for confidential VM
* `az disk create`: The `--security-type` parameter supports new value `ConfidentialVM_DiskEncryptedWithCustomerKey` for confidential VM
* `az disk create`: Add new parameter `--secure-vm-disk-encryption-set` to provide ID or name of disk encryption set created with `ConfidentialVmEncryptedWithCustomerKey` encryption type
* `az disk-encryption-set create/update`: Add new parameter `--federated-client-id` to access key vault in a different tenant
* `az disk-encryption-set create`: Add new parameters `--mi-system-assigned` and `--mi-user-assigned` to support assigning system and user assigned identities during disk encryption set creation
* `az disk-encryption-set identity`: Add new command groups with parameters `--system-assigned` and `--user-assigned` to support managing system and user assigned identities on existing disk encryption set
* `sig list-community`: Add new command to support listing community gallery
* `sig list-community`: GA shared/community image gallery related feature
* `az vm/vmss create`: The `--security-type` parameter supports new value `ConfidentialVM` for Confidential VM
* `az vm/vmss create`: Add new parameter `--os-disk-security-encryption-type` to support setting the encryption type of the OS managed disk for Confidential VM
* `az vm/vmss create`: Add new parameter `--os-disk-secure-vm-disk-encryption-set` to allows users to provide ID or name for disk encryption set created with `ConfidentialVmEncryptedWithCustomerKey` encryption type
* `az disk create`: Add new parameter `--security-data-uri` to specify the blob URI of VHD to be imported into VM guest state
* `az disk create`: Add new parameter `--upload-type` to extend and replace `--for-upload` which supports standard disk only upload and OS Disk upload along with VM guest state
* `az disk grant-access`: Add new parameter `--secure-vm-guest-state-sas` to support getting security data access SAS on managed disk with VM guest state

### Cosmos DB

* `az cosmosdb sql container create`: Add support to create containers with client encryption policy

### Event Hubs

* `az eventhubs namespace application-group`: New command group to support management operations on EventHubs application groups
* `az eventhubs namespace network-rule update`: New command to update Network Rule Sets

### IoT

* `az iot hub/dps certificate list`: Add table transform to certificate list commands

### Key Vault

* `az keyvault role assignment`: Fix `'dict' object has no attribute 'object_id'` error
* Fix #16390: `az keyvault set-policy`: Allow clearing permissions

### Monitor

* `az monitor log-analytics query-pack`: Add query pack commands.
* `az monitor log-analytics update`: Support empty string for `--key-version`

### NetAppFiles

* `az netappfiles account create`: Change `--location` to an optional parameter
* `az netappfiles pool create`: Change `--location` to an optional parameter
* `az netappfiles volume create`: Change `--location` to an optional parameter
* `az netappfiles snapshot create`: Change `--location` to an optional parameter
* `az netappfiles snapshot policy create`: Change `--location` to an optional parameter
* `az netappfiles snapshot policy update`: Change `--location` to an optional parameter
* `az netappfiles backup create`: Change `--location` to an optional parameter
* `az netappfiles backup-policy create`: Change `--location` to an optional parameter
* `az netappfiles volume-group create --help`: Fix typo in option global-placement-rules
* `az netappfiles volume create`: Add optional parameter `--zones`
* `az netappfiles volume replication list`: Add operation to list volume replications
* `az netappfiles volume reset-cifs-pw`: Add operation to reset CIFS password
* `az netappfiles volume relocate`: Add operation to relocate volume to a new stamp
* `az netappfiles volume finalize-relocation`: Add operation to finalize volume relocation
* `az netappfiles volume revert-relocation`: Add operation to revert volume relocation

### Network

* [BREAKING CHANGE] `az network vnet subnet create`: Disable `PrivateEndpointNetworkPolicies` by default
* `az network application-gateway ssl-policy`: Support new SSL policy `CustomV2`
* `az network private-endpoint-connection`: Enable Private link support for provider Microsoft.Authorization/resourceManagementPrivateLinks
* Fix #22097: `az network dns zone import`: Fix importing zone files starting with space
* `az network public-ip prefix create`: Support cross-subscription association for Custom IP Prefix
* `az network public-ip create`: Reuse prefix info when creating Public IP

### Packaging

* Use Python 3.9 in RHEL 8's RPM

### RDBMS

* Fix #22926: `az mysql server create/update`: Update default value for mysql storage size

### REST

* `az rest`: Support Unicode characters in JSON request body

### Search

* `az search service create`: Add `--hosting-mode` argument to support S3HD SKU

### Security

* `az security atp cosmosdb`: Add CLI support for ATP settings (Defender) on Cosmos DB

### Service Connector

* `az webapp connection create`: Add `--private-endpoint` to support private endpoint connection
* `az spring connection create`: Remove client-type limitation

### Service Fabric

* `az sf managed-cluster create`: Fix tag parsing for cluster command

### SQL

* `az sql elastic-pool create`: Add support for HighAvailabilityReplica count for HS Elastic pools
* `az sql midb update`: Add update command

### SQL VM

* `az sql vm update`: Add configuration options for SQL Assessment pre-requisites

### Storage

* [BREAKING CHANGE] `az storage share close-handle`: Remove `--marker` which is not supported by sdk
* [BREAKING CHANGE] `az storage share snapshot`: Now only returns version, etag and last_modified info instead of all share properties
* `az storage account generate-sas`: Fix output sas random ordering for `srt` segment
* Fix #22563: `az storage blob upload`: Fix storage blob upload to a through pipe encode error
* Fix #20452: `az storage container policy create\update\list\show\delete`: Add new permissions, currently support `racwdxyltmei`
* Fix #22679: `az storage account file-service-properties update`: Fix `AttributeError: 'NoneType' object has no attribute 'smb'`
* Fix #22845: `az storage account genarete-sas`: Fix the flag `--auth-mode login` cause AttributeError

### Synapse

* `az synapse sql pool create`: Add parameter `--collation`
* `az synapse link-connection`: New command group to support synapse link connections

## May 24, 2022

Version 2.37.0

### ACR

* Fix some `az acr manifest` commands do not correctly handle `-u/-p` credentials resulting in auth failure when not logged in to `az cli`
* Fix some `az acr` commands do not handle certain next-link tokens correctly resulting in exceptions when paging
* Fix some `az acr manifest` commands do not correctly parse some FQDNs resulting in exceptions

### AKS

* [BREAKING CHANGE] `az openshift`: Remove the deprecated command group
* `az aks create`: Add new option `--node-resource-group` to specify the name of the resource group where user resources are stored
* `az aks get-credentials`: Raise exception when existing config file is invalid
* `az aks check-acr`: Add new option `--node-name` to specify the name of a specific node to perform acr pull test checks
* Fix #22032: `az aks nodepool add/update`: Fix autoscaler parameters for user node pools
* `az aks create/update`: Add Microsoft Defender security profile support
* GA Kubernetes version alias
* `az aks update`: Add support for updating kubelet identity with `--assign-kubelet-identity`

### API Management

* Fix apim's `apply-network-updates` command

### App Service

* Fix #18151: `az webapp config backup restore`: Fix the bug that 'WebAppsOperations' object has no attribute 'restore_slot'

### ARM

* `az resourcemanagement private-link create`: Create Resource management private link
* `az resourcemanagement private-link delete`: Delete Resource management private link
* `az resourcemanagement private-link show`: Get Resource management private link
* `az resourcemanagement private-link list`: List Resource management private link
* `az private-link association create`: Create private link association
* `az private-link association delete`: Delete private link association
* `az private-link association show`: Get private link association
* `az private-link association list`: List private link association
* `az group delete`: Add new parameter `--force-deletion-types` to support force deletion
* `az bicep restore`: Add new command to restore external modules
* `az bicep build`: Add new parameter `--no-restore` to allow compilation without restoring external modules
* `az bicep decompile`: Add new parameter `--force` to allow overwriting existing Bicep files
* `az resource wait`: Fix `--created` keeps waiting even when `az resource show` returns "provisioningState": "Succeeded"

### ARO

* `az aro create`: Add support for FIPS modules, host encryption, and disk encryption for master and worker nodes

### Backup

* `az backup vault resource-guard-mapping`: Add support for updating, showing, and deleting ResourceGuardProxy
* Add multiple user authentication (MUA) support for critical operations: `az backup vault backup-properties set`/`az backup item set-policy`/`az backup policy set`/`az backup protection disable`
* Add `--tenant-id` parameter in critical commands: `az backup vault backup-properties set`/`az backup item set-policy`/`az backup policy set`/`az backup protection disable`/`az backup vault resource-guard-mapping` for cross-tenant scenario

### Compute

* `az vm image list`: Add new server version aliases `Win2022AzureEditionCore` for offline list
* `az vm update`: Add additional license type SLES for `--license-type`
* `az vmss create`: Support enabling single placement group for Flexible VMSS
* `az disk create/update`: Add new parameter `--data-access-auth-mode` to support data access authentication mode
* `az sig show`: Add new parameter `--sharing-groups` to support query shared gallery group
* `az vm host group create`: Add new parameter `--ultra-ssd-enabled` to support Ultra SSD

### Cosmos DB

* `az cosmosdb sql container update`: Fix bug to accept analyticalStorageTTL arg

### Event Hubs

* `az eventhubs namespace schema-registry`: Add cmdlets for schema registry

### Identity

* `az identity list-resources`: Add new command to support list the associated resources for identity

### IoT

* `az iot dps policy` and `az iot dps linked-hub`: Fix DPS state updating
* `az iot central app private-link-resource list`: Add a new command to support listing private link resources
* `az iot central app private-endpoint-connection show`: Add a new command to support showing details of a private endpoint connection of the IoT Central app
* `az iot central app private-endpoint-connection approve`: Add a new command to support approving a private endpoint connection for the IoT Central app
* `az iot central app private-endpoint-connection reject`: Add a new command to support rejecting a private endpoint connection for the IoT Central app
* `az iot central app private-endpoint-connection delete`: Add a new command to support deleting a private endpoint connection for the IoT Central app

### Key Vault

* Fix #22457: `az keyvault key decrypt/encrypt`: Fix returning bytes for `--output tsv`

### Monitor

* [BREAKING CHANGE] `az monitor alert`: Deprecate whole command group, please use `monitor metrics alert`
* [BREAKING CHANGE] `az monitor autoscale-settings`: Deprecate whole command group, please use `az monitor autoscale`
* [BREAKING CHANGE] `az monitor activity-log list`: Deprecate parameter `--filters`.
* [BREAKING CHANGE] `az monitor activity-log list`: Deprecate parameter flag `--resource-provider`, please use `--namespace`

### NetAppFiles

* `az netappfiles volumes export-policy add`: Fix `rule-index` validation and parameter made non required
* `az netappfiles ad add`: Add new optional parameter `site`
* `az netappfiles ad update`: Add new optional parameter `site`

### Network

* `az network watcher connection monitor create`: Change for using user-provided workspace-ids even if output-type is missing
* `az network dns zone export`: Support traffic manager resources
* Private link add `Microsoft.Kusto/clusters` provider
* `az network lb create`: Add warnings for default SKU
* `az network lb address-pool`: Support connection draining on load balancer
* `az network application-gateway`: Add `settings`, `listener` and `routing-rule` command groups
* `az network application-gateway create`: Add parameter `--priority`
* `az network application-gateway probe`: Add parameter `--host-name-from-settings`
* [BREAKING CHANGE] `az network vnet peering`: Deprecate parameter flag `--remote-vnet-id`

### Packaging

* Bump embedded Python to 3.10 for deb packages
* Use Mariner 2.0 GA image to build RPM

### RDBMS

* `az mariadb server create/update`: Support `--minimal-tls-version`
* Change MySQL MemoryOptimized tier name to BusinessCritical

### Reservations

* Update Reservation command with latest SDK

### Role

* [BREAKING CHANGE] `az az/role`: Migrate the underlying API of `az ad` and `az role` from AD Graph API to Microsoft Graph API. For more details, see [Microsoft Graph migration](./microsoft-graph-migration.md)

### Security

* `az security alerts-suppression-rule`: Add alerts suppression rules to security module

### Service Bus

* `az servicebus queue update`: Fix message time to live
* `az servicebus queue`: Add ReceiveDisabled to `--status`
* `az servicebus namespace create/update`: Add `--disable-local-auth` to enable or disable SAS authentication
* `az servicebus namespace private-endpoint-connection/private-link-resource`: New command groups

### Service Connector

* [BREAKING CHANGE] `az containerapp connection create`: Default client_type changed to `none`
* `az containerapp connection`: Add new command group to support container app connection
* `az containerapp connection create`: Add `--container` parameter in interactive mode
* `az spring connection`: Add support for `az sping-cloud` renaming
Add new parameter key value pair to support password from KeyVault

### Service Fabric

* `az sf cluster node-type add`: Fix the unexpected error that 'StorageAccountsOperations' object has no attribute 'create'

### SQL

* Fix #22316: `az sql server ad-admin create`: Fix Display Name and Object ID to be required

### SQL VM

* `az sql vm update`: Add configuration options for SQL Best Practices Assessment

### Storage

* [BREAKING CHANGE] `az storage share show`: Remove contentLength, hasImmutabilityPolicy and hasLegalHold from the output result
* [BREAKING CHANGE] `az storage blob snapshot`: Now only returns version info instead of all blob properties
* Fix #21819: `az storage fs directory`: Add new command `generate-sas`
* `az storage account show-connection-string`: Append endpoints by default
* Fix #22236: `az storage entity insert`: Fix `--if-exists fail` not working
* `az storage copy`: Fix `--exclude-path` TypeError
* `az storage blob download`: Allow downloading to stdout for pipe support
* Fix #22209: `az storage entity insert`: Fix `Edm.Boolean` not working
* `az storage directory/file list`: Add `--exclude-extended-info` to exclude some properties info from response, default to `False`
* Fix #21781: `az storage blob upload/download`: Progress fix
* `az stroage entity query`: Fix UUID type is not JSON serializable
* `az storage blob delete-batch`: No longer exits after individual delete failure

## April 26, 2022

Version 2.36.0

### ACR

* `acr task run`: Add `--no-format` option
* `acr task logs`: Add `--no-format` option
* `acr taskrun logs`: Add `--no-format` option

### AKS

* `az aks create`: Add `--nat-gateway-managed-outbound-ip-count` and `--nat-gateway-idle-timeout` to support nat gateway integration
* `az aks create`: Add `managedNATGateway` and `userAssignedNATGateway` to supported outbound type
* `az aks check-acr`: Bump canipull to 0.0.4-alpha to skip location check if cname returns only privatelink

### AMS

* `az ams asset-track create`: Add command to create an asset track
* `az ams asset-track show`: Add command to show an asset track
* `az ams asset-track list`: Add command to list all tracks under an asset
* `az ams asset-track update`: Add command to update the parameters of a track
* `az ams asset-track update-data`: Add update-data command to refresh the server in case track file was updated
* `az ams asset-track delete`: Add command to delete track
* `az ams streaming-endpoint get-skus`: Add command to get skus under a streaming endpoint

### App Config

* Fix feature flag import for missing description when using 'appconfig/kvset' profile

### App Service

* `az staticwebapp create`: Allow creating Static Web Apps not connected to a github repo
* Fix #21943: `az webapp config backup create`: Fix AttributeError 'str' object has no attribute 'get'

### Backup

* `az backup policy create/set`: Add support for creating/updating IaaSVM MBPD policy

### Bot Service

* `az bot directline/email/facebook/kik/msteams/skype/slack/sms/telegram create`: Add `--location` argument as specified by user to channel creation for regionality/EUDB

### CDN

* `az afd rule create`: Fix rule creation failure with action type RouteConfigurationOverride
* `az afd route create`: Fix route creation issue with disabled `--link-to-default-domain option`
* Fix #22066: `az cdn name-exists` missing type argument

### Compute

* `az vm create`: Fix the bug of "NoneType object has no attribute lower" when creating Flex VMSS without `--vm-sku` parameter
* `az restore-point create`: Add a new parameter `--source-restore-point` to support cross region copy
* `az restore-point show`: Add a new parameter `--instance-view` to show the instance view of a restore point and replace the deprecated `--expand`
* `az restore-point collection show`: Add a new parameter `--restore-points` to show all contained restore points in the restore point collection and replace the deprecated `--expand`
* `az sig image-version create`: Add new parameter `--target-region-cvm-encryption` to support Confidential VM encrypting the OS disk
* `az vm/vmss create`: Install guest attestation extension and enable system managed identity by default when Trusted Launch configuration is met
* `az vm/vmss create`: Add new parameter `--disable-integrity-monitoring` to disable the default behavior (installing guest attestation extension and turning on MSI) when creating VM/VMSS compliant with Trusted Launch

### IoT

* [BREAKING CHANGE] `iot dps access-policy`: Deprecate access-policy in favor of policy

### Key Vault

* `az keyvault key`: GA SKR and keyvault key rotation
* Fix #20520: `az keyvault network-rule`: Support removing multiple IP

### NetAppFiles

* `az netappfiles volume-group`: Add command group to manage volume group resources

### Network

* Fix #21845: `az network routeserver create` required `--public-ip-address` argument
* Fix #21829: `az network traffic-manager endpoint update` required `--type` argument
* Private link add `Microsoft.Network/privateLinkServices` provider
* Fix #22085: `az network nsg rule create` has no attribute "is_default"

### Packaging

* Release DEB package for Ubuntu 22.04 Jammy Jellyfish
* Release RPM package for RHEL 8, CentOS Stream 8
* Release RPM package for Mariner 1.0, 2.0 preview

### RDBMS

* `az postgres server create`: Fix error message for invalid server names

### Security

* Add `az security automation` CLI commands

### Service Bus

* `az servicebus namespace create`: Add zone redundant parameter
* `az servicebus namespace authorization-rule keys renew`: Add `--key-value` parameter

### Service Connector

* `az webapp connection`: Add command `create sql/webpubsub` to support more target resources

### SQL

* `az sql mi create`, `az sql mi update`: Add `--service-principal-type` parameter to support Win Auth (Kerberos)

### Storage

* Fix #21914: `az storage blob upload`: Make block size larger (100MB) for large files (>200GB)
* `az storage account/container/blob generate-sas`: Add `--encryption-scope`
* Fix #21920: `az storage copy`&`az storage remove`: Hide credentials in warning message
* Add `--blob-endpoint/--file-endpoint/--table-endpoint/--queue-endpoint` for data service commands to support customized service endpoint
* GA storage file datalake soft delete
* `az storage cors add`: Allow `PATCH` for `--methods`
* `az storage entity`: Support specifying `EdmType` for `--entity`
* Fix #21966: `az storage blob download-batch`: Fix failure when `--pattern` is blob name
* Fix #21414: `az storage blob sync`: Fix the flag `--delete-destination` default to false
* `az storage account blob-inventory-policy create`: Add missing fields, add excludePrefix in filter

## April 05, 2022

Version 2.35.0

### ACR

* [BREAKING CHANGE] `az acr create`: Reject request with a name using uppercase letters
* [BREAKING CHANGE] `az acr connected-registry create`: Reject request with a name using uppercase letters
* `az acr update`: Disable public network now displays a warning message
* Deprecate `az acr manifest metadata` command group
* `az acr manifest`: Add `show-metadata`, `list-metadata` and `update-metadata` commands

### AKS

* `az aks create/update`: Add new parameters `--enable-gmsa`, `--gmsa-dns-server`, `--gmsa-root-domain-name` to support Windows gMSA v2
* `aks enable-addons`: Add new parameter `--enable-msi-auth-for-monitoring` to support enabling managed identity auth
* `az aks snapshot create`: Move to `az aks nodepool snapshot create`
* `az aks snapshot delete`: Move to `az aks nodepool snapshot delete`
* `az aks snapshot list`: Move to `az aks nodepool snapshot list`
* `az aks snapshot show`: Move to `az aks nodepool snapshot show`
* `az aks create`: Add `--pod-subnet-id` to support dynamically assigne pod ip
* `az aks nodepool add`: Add `--pod-subnet-id` to support dynamically assigne pod ip
* `az aks create`: Add `--kubelet-config` and `--linux-os-config` to support custom node configuration
* `az aks nodepool add`: Add `--kubelet-config` and `--linux-os-config` to support custom node configuration

### AMS

* `az ams account identity assign`: Add ability to assign managed identity to media services account
* `az ams account identity remove`: Add ability to assign managed identity to media services account
* `az ams transform create`: Add new parameter `blur-type` for FaceDetector presets
* `az ams account encryption set`: Add new parameters `system-assigned` and `user-assigned` to allow users to set managed identities to their account encryption
* `az ams account storage set-authentication`: Add new parameters `system-assigned` and `user-assigned` to allow users to set managed identities for their storage account attached to Media Services

### APIM

* `apim api schema create`: Add new command to support creating a schema for graphql API
* `apim api schema delete`: Add new command to support deleting the schema of an API
* `apim api schema list`: Add new command to support showing the list of schema's of an API
* `apim api schema show`: Add new command to support getting the schema of an API
* `apim api schema entity`: Add new command to support getting the schema entity tag
* Onboard to private endpoint for API Management

### App Config

* `az appconfig kv export`: Stop throwing error if no key-values are exported to App Service
* `az appconfig create`: Add new options `retention-days` and `enable-purge-protection`
* `az appconfig list-deleted`: Add new command to list all deleted but not yet purged App Configurations
* `az appconfig show-deleted`: Add new command to show properties of a deleted but not yet purged App Configuration
* `az appconfig recover`: Add new command to recover a deleted but not yet purged App Configuration
* `az appconfig purge`: Add new command to purge a deleted store

### App Service

* Fix #21439: `az webapp deploy`: Fix `--async` argument value in help message
* Fix #21574: `az webapp vnet-integration add`: Fix the AttributeError that 'NoneType' object has no attribute 'server_farm_id'
* `az staticwebapp create` : Change default output location and API location to `None`. Change default app location to "/". Remove unnecessary properties from output
* `az staticwebapp show` : Remove unnecessary properties from output
* `az staticwebapp list` : Remove unnecessary properties from output
* `az staticwebapp update` : Remove unnecessary properties from output
* `az webapp deployment slot create`: Allow overriding container settings
* Fix #21080: `az webapp up`: Fix object has no attribute 'response'
* Fix #19747: `az webapp up`: Fix TypeError: 'NoneType' object is not iterable
* `az webapp up`: Validate that ASE exists, is an ASE v3, and not an ILB ASE; Validate that preexisting plan is on the ASE; Default to I1V2 SKU if using an ASE
* Fix #20240: `az functionapp deployment source config-zip`: Fix the bug that the parameter `--slot` doesn't work
* Fix #12090: `az webapp create`: Allow plan in different resource group from web app
* `az staticwebapp identity assign`, `az staticwebapp hostname set`, `az staticwebapp create`: Fix #21186: Show detailed error message instead of "bad request"
* `az staticwebapp update`: Fix #21465: Allow specifying static web app resource group
* Fix #21728: `az webapp deployment github-actions add`: Allow passing in runtime with colon delimiter
* `az webapp config`: Fix for Web App Persistent Storage gets disabled after each deployment
* `az appservice ase create-inbound-services`: Add support for Azure private DNS zone creation in ASEv3

### ARM

* Fix #20842: `az bicep`: Fix to use requests environment variables for CA bundle
* `az policy assignment create`: Support `--subscription` parameter

### Backup

* List commands multi-page response bug fix
* `az backup restore restore-disks`: Add support for Original Location Restore and Alternate Location Restore
* `az backup policy create/set/list`: Add support for creating and selectively listing Enhanced policies
* `az backup protection enable-for-vm`: Add support for Trusted VM configure protection with Enhanced policies
* `az backup vault backup-properties`: Add new parameter `--hybrid-backup-security-features` to support setting the security features for hybrid backups

### CDN

* Upgrade azure-mgmt-cdn to 12.0.0 for Azure Front Door Standard/Premium GA

### Cognitive Services

* Upgrade to use API 2022-03-01
* Add new command `az cognitiveservices account list-models`

### Compute

* [BREAKING CHANGE] `az vm/vmss create`: Remove the default value `Contributor` of parameter `--role`
* `az vm host`: Add new command `restart` to support dedicated host reboot
* `az vm extension show`: Add new parameters `--instance-view` to support track the vm extension progress
* Change help info of `--enable-bursting` to flag it is for on-demand only
* Fix #20174: `az vm create`: Determine plan information when using image alias
* `az disk/snapshot/sig definitiion create/update`: Add new parameters `--architecture` to support ARM64
* `az vm disk attach`: Add new parameter `--disks` to support attaching multiple disks in one API call
* `az vm/vmss create`: Support creating VM/VMSS from community gallery image
* `az vm/vmss create`: Add community gallery legal agreement acceptance
* `az vm/vmss create`: Add the verification of whether `--os-type` is correct when creating VM from community gallery image or shared gallery image

### Cosmos DB

* `az cosmosdb update`: Support updating key vault key uri
* `az managed-cassandra cluster update`: Allow `--external-seed-nodes`, `--external-gossip-certificate` and `--client-certificate` to take empty list
* `az managed-cassandra cluster`: Fix `--repair-enabled` as of type three_state_flag

### Event Grid

* Fix #21521: System topic subscription update attribute error
* Support user identity and mixed mode

### Event Hubs

* `az eventhub namespace update`: Fix disable eventhub capture and autoinflate

### Key Vault

* Fix #18319 & #21555: `az keyvault list-deleted`: List all deleted resources if no specified resource type
* `az keyvault key create`: Support `--default-cvm-policy`
* Fix #21330: `az keyvault network-rule remove`: Fix ip address remove issue

### NetAppFiles

* `az netappfiles snapshot restore-files`: New command to restore specified files from the specified snapshot to the active filesystem
* `az netappfiles volume create`: Add optional parameters `--enable-subvolumes`
* `az netappfiles volume delete`: Add optional parameter `--force-delete` or `--force`
* `az netappfiles volume update`: Add optional parameter `--unix-permissions`
* `az netappfiles subvolume`: New command group to manage subvolume resources
* `az netappfiles subvolume create`: New command to create subvolume
* `az netappfiles subvolume show`: New command to get specified subvolume
* `az netappfiles subvolume update`: New command to update specified subvolume
* `az netappfiles subvolume list`: New command to get all subvolume in a specified volume
* `az netappfiles subvolume delete`: New command to delete specified subvolume
* `az netappfiles subvolume metadata`: New command group to manage subvolume metadata resources
* `az netappfiles subvolume metadata show`: New command to get details about a specified subvolume
* `az netappfiles account ad add`: New optional parameters to support ldap search scope `--user-dn`, `--group-dn` and `--group-filter`
* `az netappfiles account ad update`: New optional parameters to support ldap search scope `--user-dn`, `--group-dn` and `--group-filter`

### Network

* `az network nat gateway`: Validate attaching public IPs
* `az network lb`: Support inbound NAT rule port mapping query
* Fix #21716: `az network private-dns zone import`: Allow hyphenated SRV records
* `az network application-gateway waf-policy managed-rule exclusion rule-set`: Support pre-rule exclusion creation without exclusion

### Packaging

* Use Red Hat Universal Base Image 8 to build `el8` RPM package
* Bump Python image to `3.10.3-alpine3.15`
* Bump MSI embedded Python to 3.10.3

### RDBMS

* Fix operations.py file installing dependencies in CloudShell

### Role

* [BREAKING CHANGE] `az ad sp create-for-rbac`: Stop defaulting `--scopes` to subscription
* [BREAKING CHANGE] `az ad sp create-for-rbac`: When creating a self-signed certificate in keyvault, `validity_months` is changed from `years * 12 + 1` to `years * 12`

### Service Bus

* `az servicebus topic subscription rule create`: Add filter type parameter

### Service Connector

* `az webapp/spring-cloud connection create/update`: Provide `--service-endpoint` parameter to support vnet scenario
* `az webapp/spring-cloud connection`: Add command `create redis/redis-enterprise` to support more target resources

### SQL

* [BREAKING CHANGE] `az sql db tde list-activity`: Command no longer exists
* [BREAKING CHANGE] `az sql mi show/create/update/list`: Instead of `backupStorageRedundancy`, `currentBackupsStorageRedundancy` and `requestedBackupStorageRedundancy` properties are returned
* `az command sql db str-policy set`: Make `diffbackup_hours` parameter optional

### Storage

* [BREAKING CHANGE] Fix #21494: `az storage blob upload/upload-batch`: Fix `--content-md5` for upload, ignore `--content-md5` for upload-batch
* [BREAKING CHANGE] `az storage table/entity`: `--timeout` is removed for all sub commands
* [BREAKING CHANGE] `az storage entity query/show`: `--accept` is removed
* `az storage table/entity`: Add `--auth-mode login` to support RBAC
* `az storage blob upload/upload-batch`: Make precondition work
* `az storage blob upload-batch`: No longer exits on the first failure
* Fix #21591: `az storage blob upload`: Fix storage blob upload not auto guessing file type
* Fix `az storage entity merge`: Stop automatically casting DisplayVersion to float
* `az storage blob download`: Support downloading managed disk with both SASUri and OAuth by specifying `--blob-url` with `--auth-mode login`
* Fix #21699: `az storage blob upload-batch`: Fix upload-batch result url truncation issue
* `az storage account\container\blob generate-sas`: Allow new permissions

### Synapse

* `az synapse role assignment list`: Fix showing only 100 results
* `az synapse notebook import`: Fix `--folder-path` parameter problem

## March 03, 2022

Version 2.34.1

### App Service

* Hotfix: Fix #20489: `az webapp log tail`: Fix the AttributeError that 'NoneType' object has no attribute 'host_name_ssl_states'
* Hotfix: Fix #20747: `az webapp create-remote-connection`: Fix the EOFError that ran out of input
* Hotfix: Fix #20544: `az webapp config snapshot restore`: Fix the AttributeError that 'WebAppsOperations' object has no attribute 'restore_snapshot'
* Hotfix: Fix #20011: `az webapp config ssl bind`: Fix the AttributeError that 'str' object has no attribute 'value'
* Hotfix: Fix #19492: `az webapp config backup restore`: Fix the AttributeError that 'WebAppsOperations' object has no attribute 'restore'

### Storage

* [BREAKING CHANGE] `az storage blob upload/upload-batch`: Fix `--overwrite` that it no longer overwrite by default

## March 01, 2022

Version 2.34.0

### ACR

* `az acr manifest`: Add new command group to support managing artifact manifests in Azure Container Registries
* Deprecate `az acr repository show-manifests` command and replace with `acr manifest metadata list` command

### AKS

* `az aks nodepool update`: Add `--node-taints` to allow modify node taints
* `az aks get-credentials`: Add new parameter `--format` to support specifying the format of returned credential
* `az aks nodepool`: Allow specifying `--scale-down-mode` in nodepool create and update

### APIM

* `az apim api import`: Update api-id description #18306
* Fix #21187: `az apim api create/update/import`: Fix header and query param names being swapped

### App Config

* `az appconfig kv import`: Add new parameter `--strict` to support strict import

### App Service

* [BREAKING CHANGE] `az webapp up`: Change supported runtimes
* [BREAKING CHANGE] `az webapp create`: Change supported runtimes
* [BREAKING CHANGE] `az webapp list-runtimes`: Add `--os`/`--os-type` argument, change runtimes, change default behavior to return both linux and windows stacks, and deprecate `--linux` argument
* [BREAKING CHANGE] `az functionapp create`: Take runtime names and versions from API instead of hardcoded list
* `az functionapp plan`: Update the max value of `--max-burst` to 100
* `az functionapp list-runtimes`: Add new command to show function app runtimes, versions, and compatible functions versions
* `az webapp create`: Provide support `--https-only` flag
* `az webapp deployment github-actions remove`: Fix the bug that path cannot start with a slash

### ARM

* `az account management-group entities`: Add a new command group to support entities (Management Groups and Subscriptions) operations for the authenticated user
* `az account management-group hierarchy-settings`: Add a new command group to support operations on hierarchy settings defined at the management group level
* `az account management-group tenant-backfill`: Add a new command group to support backfilling subscriptions for the tenant
* `az account management-group subscription show`: Get the details of a given subscription under a given management group
* `az account management-group subscription show-sub-under-mg`: Show what subscription is under a given management group
* `az account management-group check-name-availability`: Check if a management group name is valid and available
* `az deployment`: Fix the bug of 'bytes object has no attribute get' for error handling in retry cases

### Backup

* Add private endpoints support for Microsoft.RecoveryServices/vaults

### Compute

* `az vm create`: Fix the issue that VMCustomization is not enabled
* `az vm disk attach`: Modify help description to guide how to use the `--ids` parameter correctly
* `az restore-point`: Add new command group to support managing restore point
* `az vmss create/update`: Add new parameters `--security-type`, `--enable-secure-boot` and `--enable-vtpm` to support Trusted Launch
* `az vmss create/update`: Add new parameters `--automatic-repairs-action` to support repair action
* `az vmss create/update`: Add new parameters `--v-cpus-available` and `--v-cpus-per-core` to support VMSize customization

### Cosmos DB

* `az managed-cassandra cluster update`: Fix to allow `--external-seed-nodes` and `--external-gossip-certificates` to be updated by the user

### Eventhub

* `az eventhubs namespace create`: Add `--user-assigned`, `--system-assigned`, `--encryption-config`
* `az eventhubs namespace identity`: Cmdlets for event hubs identity
* `az eventhubs namespace encryption`: Cmdlets for event hubs encryption
* `az servicebus namespace create`: Add `--user-assigned`, `--system-assigned`, `--encryption-config`
* `az servicebus namespace identity`: Cmdlets for event hubs identity
* `az servicebus namespace encryption`: Cmdlets for event hubs encryption

### IoT

* `az iot hub create`: Add the `--enforce-data-residency` parameter to support creating resources with data residency enforced (and cross-region disaster recovery disabled)
* `az iot dps create`: Add the `--enforce-data-residency` parameter to support creating resources with data residency enforced (and cross-region disaster recovery disabled)

### Key Vault

* Fix #21341: `az keyvault update`: Support updating tags
* `az keyvault key create/import/set-attributes`: Support `--immutable` to mark release policy immutable
* `az keyvault key import`: Support `--kty oct` to import AES key

### Monitor

* `az monitor log-analytics workspace table`: Add new command `create`, `delete` and `search-job create` to support Microsoft/Custom log/Search Results table operations
* `az monitor log-analytics workspace update`: Add a new parameter `--data-collection-rule` to support update defaultDataCollectionRuleResourceId
* `az monitor log-analytics workspace table`: Add new command `restore create` and `migrate` to support Restored logs table/migrate operations

### Network

* `az bastion ssh`: Provide support for Bastion SSH access on Darwin and Linux
* `az network private-endpoint`: Associate IP configurations and ASGs when creating PE

### Packaging

* [BREAKING CHANGE] Drop Ubuntu 14.04 Trusty Tahr and Debian 8 Jessie support
* [BREAKING CHANGE] Drop Ubuntu 21.04 Hirsute Hippo support
* Add Ubuntu 21.10 Impish Indri support
* Bump embedded Python to 3.8 for deb packages

### Profile

* [BREAKING CHANGE] `az account show`: Drop `--sdk-auth`

### RDBMS

* Fix bug for private dns zone provisioning to vnet resource group in different subscription
* Enable rdbms-connect extension in Cloud Shell

### Role

* Add warning to `role` and `ad` commands about Microsoft Graph migration

### SQL

* `az sql server create/update`: Add federated client id support

### Storage

* `az storage account create/update`: Support `--sam-account-name` and `--account-type`
* `az storage blob upload`: Add `--tier`, migrate to track2
* `az storage blob upload-batch`: Migrate to track2

## February 14, 2022

Version 2.33.1

### Compute

* Hotfix: Fix #21224: Fix the issue that VMCustomization is not enabled

### Packaging

* [BREAKING CHANGE] Drop jmespath-terminal from docker image

## February 01, 2022

Version 2.33.0

### ACR

* `az acr connected-registry create`: Add `--notifications` to support adding patterns for generating notification events on connected registry artifacts
* `az acr connected-registry update`: Add `--add-notifications` and `--remove-notifications` to support adding or removing patterns for generating notification events on connected registry artifacts

### AKS

* `az aks nodepool add/update/upgrade`: Add new parameter `--aks-custom-headers` to support custom headers
* `az aks create`: Add new parameter `--snapshot-id` to support creating a nodepool from snapshot when creating a cluster
* `az aks nodepool add/upgrade`: Add new parameter `--snapshot-id` to support creating a nodepool from snapshot
* `az aks snapshot create/delete/list/show`: Add new commands to support the management of snapshot related operations
* `az aks update/az aks nodepool update`: Allow empty string as label value

### App Config

* [BREAKING CHANGE] Support app service slots

### App Service

* `az webapp vnet-integration add`: Fix a bug that prevented adding a vnet in a different subscription from the webapp
* `az functionapp vnet-integration add`: Fix a bug that prevented adding a vnet in a different subscription from the functionapp
* `az webapp create`: Support joining a vnet in a different subscription
* `az functionapp create`: Support joining a vnet in a different subscription
* `az functionapp create` : Remove preview from PowerShell runtime for linux
* `az appservice plan update`: Add `--elastic-scale` and `--max-elastic-worker-count` parameters to support elastic scale
* `az webapp update`: Add `--minimum-elastic-instance-count` and `--prewarmed-instance-count` parameters to support setting instance count
* `az webapp up`: Add help text and debug text for configuration saving and loading
* `az webapp list-runtimes`: Support node 16-lts runtime for linux and windows

### Batch

* `az batch create/activate`: Add clarify application package path help info for argument `--package-file`

### Bot Service

* `az bot create`: Add location as specified by user to bot creation for regionality/EUDB

### Compute

* `az image builder create`: Add new parameter `--proxy-vm-size` to support proxy VM size customization
* `az image builder create`: Add new parameter `--build-vm-identities` to support user assigned identities customization
* `az vmss update`: Add new parameter `--force-deletion` to support force delete VMSS
* `az vm/vmss create`: Add warning log and modify help to inform that the default value `Contributor` of `--role` will be removed
* `az disk-encryption-set create`: Make the parameter `--source-vault` un-required
* `az vm create/update`: Add new parameters `--v-cpus-available` and `--v-cpus-per-core` to support VMSize customization

### Cosmos DB

* `az managed-cassandra cluster status`: Add table format support

### Key Vault

* `az keyvault create`: Add default permissions on keyvault creation

### Monitor

* `az monitor action-group`: Support event hub receiver

### NetAppFiles

* `az netappfiles account ad add`: Add new optional parameter named encrypt-dc-connections
* `az netappfiles volume export-policy add`: Add missing optional parameters kerberos5_read_only, kerberos5_read_write, kerberos5i_read_only, kerberos5i_read_write, kerberos5_p_read_only, kerberos5_p_read_write, has_root_access, chown_mode
* `az netappfiles account ad update`: Add command

### Network

* Add Microsoft.DataFactory/factories to supported Private Endpoints
* Add Microsoft.Databricks/workspaces to supported private endpoints
* `az network private-endpoint`: Add parameter and subgroup to support IP Configuration, ASG and NicName
* `az network traffic-manager endpoint create/update`: Add new arguments `--min-child-ipv4` and `--min-child-ipv6`.
* Add Microsoft.HybridCompute/privateLinkScopes to supported Private Endpoints

### Packaging

* Update Dockerfile base image from Alpine 3.14 to 3.15

### RDBMS

* `az postgres flexible-server create`: Change default postgres version

### Redis

* `az redis create`: Add default value for identity and public network access as `None`

### ServiceConnector

* Support new target resources: servicebus, eventhub, appconfig

### Storage

* Stop supporting `--auth-mode login` for `az storage blob sync` and `az storage fs directory upload/download`

## January 04, 2022

Version 2.32.0

### AKS

* `az aks create`: Add new parameter `--enable-fips-image` to support enabling fips image
* `az aks nodepool add`: Add new parameter `--enable-fips-image` to support enabling fips image

### App Service

* [BREAKING CHANGE] `az webapp up`: Remove support for the python|3.6 (linux and windows), ruby|2.5 (linux), and php|7.3 (windows) runtimes. Add support for the python|3.9 runtime (linux), php|8.0 (linux), and ruby|2.7 (linux)
* [BREAKING CHANGE] `az webapp create`: Remove support for the python|3.6 (linux and windows), ruby|2.5 (linux), and php|7.3 (windows) runtimes. Add support for the python|3.9 runtime (linux), php|8.0 (linux), and ruby|2.7 (linux)
* [BREAKING CHANGE] `az functionapp create`: Remove python 3.6 support
* Fix #19550: `az staticwebapp users update`: Allow updating static web app user roles again
* `az logicapp create`: Autogenerate a WS1 App Service Plan when no value for `--plan` or `--consumption-plan-location` is provided
* `az appservice plan create`: Allow creating App Service Plans for Logic Apps (SKUs WS1, WS2, and WS3)
* Fix #20757: `az webapp up`: Fix list index out of range when no `--plan` argument passed
* Fix #18652: `az webapp up`: Search for \*.csproj in child directories
* `az webapp list-runtimes`: Remove support for the python|3.6 (linux and windows), ruby|2.5 (linux), and php|7.3 (windows) runtimes. Add support for the python|3.9 runtime (linux), php|8.0 (linux), and ruby|2.7 (linux)

### Backup

* `az backup restore restore-azurewl`: Add client side validations
* `az backup container unregister`: Support MAB type for parameter `--backup-management-type`
* `az backup protectable-item list/show`: Add auto-protection policy and node-list field in the response for SQLInstance SQLAG
* `az backup protection auto-enable-for-azurewl/auto-disable-for-azurewl`: Add support for SQLAG

### Compute

* `az vm/vmss create/update`: Expand validate license types for `--license-type` parameter
* `az sig image-definition list-shared`: Add new parameters `--marker` and `--show-next-marker` to support paging
* `az sig image-version list-shared`: Add new parameters `--marker` and `--show-next-marker` to support paging

### IoT

* `az iot hub update`: Add error handling for file-upload parameters and fixes empty $default storage endpoint errors
* `az iot central app create`: Add new parameter `--mi-system-assigned` to support creating an app with system-assigned managed identity
* `az iot central app identity show/assign/remove`: Add new commands to manage the system-assigned managed identity to an existing IoT Central app
* `az iot dps access-policy`: Be replaced with `az iot dps policy`
* `az iot dps linked-hub create`: Add convenience arguments for linking hubs

### Network

* Fix #19482: Azure Bastion AAD fix for new CLI core changes
* `az network lb inbound-nat-pool create`: Add new parameter `--backend-pool-name`

### Profile

* `az account show/set`: Add `-n`, `--name` argument

### Redis

* `az redis identity`: Add support for assigning and modifying Identity

### REST

* [BREAKING CHANGE] `az rest`: Remove `resourceGroup`, `x509ThumbprintHex` transforms

### Role

* [BREAKING CHANGE] `az ad sp create-for-rbac`: Drop `name` property from the output. Use `appId` instead
* [BREAKING CHANGE] `az ad sp create-for-rbac`: No role assignment will be created by default

### Storage

* `az storage copy`: Add positional argument `extra_options` to pass through options to `azcopy`

### Synapse

* [BREAKING CHANGE] `az synapse managed private endpoints create`: Remove `--resource-id` and `--group-id`, use `--file` instead
* `az synapse sql pool create/restore`: Add parameters `--storage-type` to support specifying storage account type
* `az synapse kql-script`: New command group to support Kusto script

## December 07, 2021

Version 2.31.0

### AKS

* `az aks update`: Support edit nodepool label after creation
* `az aks nodepool update`: Support edit nodepool label after creation
* `az aks create`: Fix issue that `--attach-acr` parameter can't work

### AMS

* Remove deprecated variable 'identifier_uri' from creating sp method
* Update api version for AMS and AVA private link registration

### App Service

* `az functionapp create`: Add support for creating a webapp joined to a vnet
* `az webapp up`: Fix failure to detect dotnet 6.0 web apps
* `az appservice ase update`: Support for allowing new private endpoint connections on ASEv3
* `az appservice ase list-addresses`: Support ASEv3
* `az staticwebapp identity assign`: Assign managed service identity to the static web app
* `az staticwebapp identity remove`: Disable static web app's managed service identity
* `az staticwebapp identity show`: Display static web app's managed service identity
* Fix #17507: `az staticwebapp functions`: Add support for linking existing function app to static webapp (bring your own functions)
* `az staticwebapp create`: Update help text with guidance for repos in Github organizations
* `az functionapp deployment source config-zip`: Fix #12289: Allow build on zip deploy for windows function apps
* `az staticwebapp create`: Add better error message when attempting to create a static webapp that already exists
* `az appservice`: Fix AttributeError during user error handling
* `az appservice plan create`: Add `--zone-redundant` parameter to support enabling zone redundancy for high availability
* `az webapp ssh`: Add proxy support
* `az webapp create-remote-connection`: Add proxy support
* `az webapp log download/tail`: Add proxy support
* `az webapp create`: Fix container registry server url parsing for `--deployment-container-image-name/-i` argument
* `az functionapp deployment source config-zip`: Fix returning success when the deployment did not succeed
* `az staticwebapp appsettings set`: Make set functional
* `az staticwebapp appsettings`: Switch to the new SWA app settings SDK methods
* `az functionapp plan create`: Add `--zone-redundant` parameter to give the option to create a zone redundant app service plan
* Support managed identity in App Service container

### ARM

* `az resource\group list`: Support querying data only by passing the tag name to `--tag` parameter
* `az account management-group`: Add new parameters `--no-register` to skip RP registration for `Microsoft.Management`
* `az deployment`: Prettify error output for ARM deployment
* `az bicep install`: Add a new parameter `--target-platform/-t` to specify the running platform of Bicep CLI
* `az bicep upgrade`: Add a new parameter `--target-platform/-t` to specify the running platform of Bicep CLI
* `az deployment sub/tenant/mg create`: Fix the `KeyError: 'resourceGroup'` in outputting results in table format when deploying non-resource group level resources
* `az policy assignment create` and `az policy assignment identity assign` support adding user assigned identity
* `az bicep install`: Work now behind a corporate proxy

### Backup

* GA `az backup` and some bug fixes
* `az backup protectable-item list/show`: Fix AttributeError for server_name
* `az backup restore restore-disks`: Add support for Cross Zonal Restore

### Cognitive Services

* `az cognitiveservices account deployment`: Add new commands `show`, `list`, `create`, `delete`
* `az cognitiveservices account commitment-plan`: Add new commands `show`, `list`, `create`, `delete`
* `az cognitiveservices commitment-tier`: Add new command `list`

### Compute

* Fix #20182: `az snapshot create`: Fix auto-detection bug for `--copy-start`
* Fix #20133: `az vm create`: Fix `--data-disk-delete-option` not working when no `--attach-data-disks` are provided
* Fix boot diagnostics decoding
* `az vm create/update`: Add new parameter `--enable-hibernation` to support enabling hibernation capability
* `az vm/vmss run-command show`: Add new parameter `--instance-view` to support tracking the progress of RunCommand
* Update the help description for unmanaged disks
* `az disk create/update`: Add `--public-network-access` argument to control the policy for export on the disk
* `az disk create/update`: Add `--accelerated-network` argument to support the accelerated networking
* `az snapshot create/update`: Add `--public-network-access` argument to control the policy for export on the disk
* `az snapshot create/update`: Add `--accelerated-network` argument support the accelerated networking
* `az snapshot create`: Fix #20258: Fix creating a snapshot of a Uniform VMSS OS disk

### EventGrid

* GA `az eventgrid system-topic`

### Key Vault

* `az keyvault key encrypt/decrypt`: Support AES algorithm for MHSM
* `az keyvault key rotation-policy update`: Support both camel case and snake case json for `--value`

### NetAppFiles

* `az netappfiles volume create`: Fix volume export policy

### Network

* `az network express-route peering connection ipv6-config`: Add new commands `set`, `remove`
* `az network application-gateway waf-policy managed-rule exclusion`: Add new subgroup `rule-set` to support per rule exclusions
* `az network bastion create`: Fix invalid validator when `--scale-units` is None
* `az network vnet create`: Add `--enable-encryption` argument to support enable encryption on virtual network
* `az network vnet update`: Add `--enable-encryption` argument to support enable encryption on virtual network
* `az network vnet create`: Add `--encryption-enforcement-policy` argument to choose If Virtual Machine without encryption is allowed in encrypted Virtual Network.
* `az network vnet update`: Add `--encryption-enforcement-policy` argument to choose If Virtual Machine without encryption is allowed in encrypted Virtual Network.

### Packaging

* Support Python 3.10
* Add Dockerfile.mariner to support Mariner build

### Profile

* `az logout`, `az account clear`: Remove ADAL token cache file `accessTokens.json`

### RDBMS

* Fix private DNS zone suffix bug
* Fix #20124: `az mysql/postgres flexible-server db create`: Make resource group and server name required
* `az postgres flexible-server`: Remove preview tag

### Storage

* `az storage share list-handle/close-handle`: New commands for share handle
* GA account level and blob version level immutable storage

### Synapse

* [BREAKING CHANGE] `az synapse sql/pool audit-policy`: Remove `--blob-auditing-policy-name`
* `az synapse notebook/spark-job-definition`: Add `--folder-path` argument
* `az synapse spark pool create/update`: Add `--spark-config-file-path`
* `az synapse spark job submit`: Fix for `--main-class-name`
* `az synapse sql-script`: New command group to support sql script management

## November 02, 2021

Version 2.30.0

### Core

* [BREAKING CHANGE] Migrate from ADAL to MSAL. For more details, see [MSAL-based Azure CLI](./msal-based-azure-cli.md)

### ACR

* [BREAKING CHANGE] `az connected-registry`: `--repository` flag short version `-t` is being removed.
* [BREAKING CHANGE] `az connected-registry install renew credentials`: Now it requires the user to confirm password generation.
* `az connected-registry install`: Deprecate and redirect to `az acr connected-registry get-settings`.
* `az connected-registry repo`: Deprecate and redirect to `az acr connected-registry permissions update`.
* `az connected-registry permissions show`: A new command that allows the user to see the sync scope map information.
* `az connected-registry get-settings`: A new command that retrieves the necessary information to install a connected registry and allows the generation of a new sync token password.
* `az connected-registry create`: No longer adds a postfix to the sync token and scope map name.

### AKS

* `az aks create/update`: Add new parameter `--aks-custom-headers` to support for custom headers
* `az aks create`: Support setting `--private-dns-zone` to none for private cluster creation
* `az aks create/update`: Add new parameter `--enable-secret-rotation` and `--rotation-poll-interval` to support secret rotation
* `az aks enable-addons`: Add new parameter `--enable-secret-rotation` and `--rotation-poll-interval` to support secret rotation

### App Config

* `az appconfig kv import/export`: Add new parameter `--profile` to support using `appconfig/kvset` profile

### App Service

* Fix #19617: `az webapp ssh`: Open Web SSH on the specified instance
* `az staticwebapp hostname`: Support adding static webapp hostname via TXT validation
* Enable support for PowerShell on Linux function apps with V4

### ARM

* `az bicep publish`: Add new command to publish bicep modules

### ARO

* `az aro create`: Remove Identifier URIs

### Compute

* `az disk update`: Fix the problem that updating network access policy to `AllowPrivate` failed
* `az vm update`: Add `--host` argument and `--host-group` argument to support assign an existing VM to a specific ADH
* Fix #19599: `az vm create`: Fix the issue that `--nic-delete-option` not working when no `--nics` is provided.
* `az snapshot create`: Support copyStart as createOption
* `az vmss create/update`: Support in-guest patching for VMSS
* `az vm application set/list`: Add new commands to support VM application
* `az vmss application set/list`: Add new commands to support VMSS application
* `az vm create`: Add `--ephemeral-os-disk-placement` argument to support choosing the Ephemeral OS disk provisioning location
* `az vmss create`: Add `--ephemeral-os-disk-placement` argument to support choosing the Ephemeral OS disk provisioning location
* `az vm update`: Add `--size` argument to support the resize
* `az vmss update`: Add `--vm-sku` argument to support the resize
* `az vm run-command`: Add new commands to support managing the running commands in VM
* `az vm update`: Add `--ephemeral-os-disk-placement` argument to support choose the Ephemeral OS disk provisioning location
* `az vmss update`: Add `--ephemeral-os-disk-placement` argument to support choose the Ephemeral OS disk provisioning location
* `az sig gallery-application`: Add new commands to support managing gallery application
* `az sig gallery-application version`: Add new commands to support managing gallery application version
* GA the features related to Flex VMSS

### Container

* `az container create`: Add parameter `--zone` to support Availability Zone selection
* `az container create`: Fix the issue that `--subnet` or `--vnet` cannot be used with IP address type `Public` to allow `Private`
* `az container create`: Add Support for `--registry-login-server` to work with `--acr-identity`

### Cosmos DB

* `az cosmosdb mongodb retrieve-latest-backup-time`: Add new command for fetching latest restorable timestamp for Mongo Account.
* `az cosmosdb locations`: Add new commands for listing account locations and their properties.
* `az managed-cassandra cluster/data-center`: GA support for managed cassandra cluster and data center

### DMS

* `az dms project create/az dms project task create` : Add MySQL projects/tasks for offline migrations.

### FunctionApp

* [BREAKING CHANGE] `az functionapp devops-pipeline`: Remove commands and move them to `functionapp` extension

### HDInsight

* `az hdinsight create`: Add two parameters `--zones` and `--private-link-configurations` to support creating cluster with availability zones feature and creating private link enabled cluster with private link configurations feature.

### Key Vault

* Support Keyvault SKR
* `az keyvault key random`: Request some random bytes from managedHSM
* `az keyvault rotation-policy/key rotate`: Support rotate key and manage key rotation policy
* `az keyvault create/update`: Add `--public-network-access` parameter

### Monitor

* `az monitor metrics alert condition` : Add support for 'skip metric validation'

### NetAppFiles

* [BREAKING CHANGE] `az netappfiles account backup-policy create/update`: Remove optional parameter `--yearly-backups`.
* `az netappfiles account list`: Add option to skip `--resource-group` parameter and fetch accounts for subscription.
* `az netappfiles pool create`: Add optional parameter named `--encryption-type`
* `az netappfiles volume create`: Add optional parameters: `--network-features`, `--avs-data-store`, `--default-group-quota`, `--default-user-quota`, `--is-def-quota-enabled`
* `az netappfiles volume update`: Add optional parameters: `--default-group-quota`, `--default-user-quota`, `--is-def-quota-enabled`

### Network

* `az network bastion create`: Add new parameter `--scale-units` and `--sku` to support setting scale unit
* `az network vnet`: Add parameter `--bgp-community`
* `az network private-endpoint-connection`: Support "Microsoft.Cache/Redis"
* `az network private-endpoint-connection`: Support "Microsoft.SignalRService/WebPubSub"

### RDBMS

* Introduce MySQL georestore command and update validators
* GA `az mysql flexible-server`

### Service Bus

* Fix MU capacity to include 16 when updating namespace

### ServiceConnector

* `az webapp/spring-cloud connection`: New command group to support service to service connection

### SQL

* `az sql server ad-admin`: Fix breaking change made to update and delete

### Synapse

* `az synapse kusto`: Add Kusto pool(mgmt) support

## October 29, 2021

Version 2.29.2

### ARO

* Hotfix: `az aro create`: Remove Identifier URIs

## October 21, 2021

Version 2.29.1

### Compute

* Hotfix: Fix static webapp commands that are broken due to the upgrade of `azure-mgmt-web` to 4.0.0

## October 12, 2021

Version 2.29.0

### AKS

* `az aks check-acr`: Bump canipull to 0.0.3 alpha to support sovereign cloud
* `az aks create/update`: Add new parameter `--disable-local-accounts` to support disable local accounts
* `az aks enable-addons`: Support open-service-mesh addon
* `az aks create/update`: Add support for updating tags

### App Config

* Fix dependencies for multiple installations of `jsondiff` and `javaproperties`

### App Service

* `az webapp create/up`: Correct the typo of wrong java version in help
* `az logicapp create/delete/show/list`: Add new commands to support logicapp related operations
* `az staticwebapp environment delete`: Add command to support deleting static app environment
* `az functionapp show`: Add kind validation for show operation
* `az webapp config backup list`: Fix issue that returned backup configuration instead of backup list
* `az logicapp start/restart/stop`: Add new commands for logicapp
* `az webapp config storage-account`: Update parameter descriptions

### ARM

* `az deployment`: Remove the log of printing request body from custom policy
* `az deployment group create`: Fix incorrect scope in the example of creating deployment from template-spec
* `az ts create`: Simplify overwrite confirmation message

### Backup

* `az backup container register`: Fix refresh container bug
* `az backup`: Add CRR functionality for Azure Workload
* `az backup`: Add support for MAB backup management type in some sub commands

### Compute

* `az sig create/update`: Add new parameter `--soft-delete` to support soft delete
* `az sig image-version`: Add new parameter `--replication-mode` to support setting replication mode
* `az vm/vmss update`: Fix disassociation VM/VMSS from capacity reservation
* `az vm/vmss create`: Hide alias `--data-delete-option` in help
* `az vmss create`: Support quick creation for flexible VMSS

### Container

* [BREAKING CHANGE] `az container create`: Remove `--network-profile` parameter, property no longer supported
* `az container logs`: Fix the attribute error introduced by Track 2 migration
* `az container create`: Add parameter `--acr-identity` for support of MSI authenticated ACR image pull

### Cosmos DB

* `az cosmosdb identity assign/remove`: Add support for user identity

### Eventhub

* `az eventhubs namespace update`: Add `--infra-encryption` for encryption (enable-require-infrastructure-encryption).
* `az eventhubs namespace create/update`: Add `--disable-local-auth` to enable or disable SAS authentication.
* `az eventhubs namespace`: Add `private-endpoint-connection` and `private-link-resource` command groups

### Key Vault

* [BREAKING CHANGE] Fix #18479: `az keyvault network-rule add`: Fix the bug which allows duplicate `--ip-address` with the ones already in the network-rule
* Fix #10254: `az keyvault network-rule add`: Add capability to accept multiple ip-addresses as a list in the form of `--ip-address ip1 [ip2] [ip3]...`
* `az keyvault delete`: Add warning when deleting managed HSM

### Network

* Add `az network custom-ip prefix wait`
* Add `az network vnet-gateway packet-capture wait`
* Add `az network vnet-gateway vpn-client ipsec-policy wait`
* Add `az network vnet-gateway nat-rule wait`
* Add `az network vpn-connection packet-capture wait`
* Private link and endpoint support for provider `Microsoft.BotService/botServices` to supported private endpoints operations
* `az network application-gateway client-cert`: Add commands `update` and `show`
* `az network application-gateway ssl-profile`: Add commands `update` and `show`
* `az network application-gateway http-listener create`: Add parameter `--ssl-profile`
* `az network application-gateway http-listener update`: Add parameter `--ssl-profile`
* Onboard hdinsight private link2 network cmdlets
* `az network bastion create`: Add `--tags` argument
* Private link and endpoint support for provider `Microsoft.Authorization/resourceManagementPrivateLinks`
* Private link and endpoint support for provider `Microsoft.MachineLearningServices/workspaces`

### Profile

* `az account show`: Deprecate `--sdk-auth`

### RDBMS

* [BREAKING CHANGE] `az postgres flexible-server migration`: Change `--properties @{filepath}` to `--properties {filepath}`
* `az postgres flexible-server migration create`: User can pass in filename with double quotes or no quotes and same for absolute paths.
* `az postgres flexible-server migration check-name-availability`: Add a command to check if a migration name is available.
* `az postgres flexible-server migration update`:  Add `--start-data-migration` to reschedule the migration to start right now.
* Update list-skus, create command location setting and replica command

### Role

* `az ad sp create-for-rbac`: Deprecate `--sdk-auth`

### Security

* Add command `az security setting update`

### Storage

* Fix #19279: Add clarification for file system name to also mean container name.
* Fix #19059: Fix doc link to point to public doc website
* `az storage account hns-migration start/stop`: Support migrate a storage account to enable hierarchical namespace
* `az storage container-rm create/update`: Add `--root-squash` to support enable nfsv3 root squash or all squash
* Fix #17858: `az storage blob upload`: make --name optional
* `az storage account create/update`: Add --public-network-access parameter
* `az storage container immutability-policy create`: Add --allow-protected-append-writes-all/--w-all parameter
* `az storage container legal-hold set`: Add --allow-protected-append-writes-all/--w-all parameter
* `az storage account create/update`: Enable account level immutability

### Synapse

* [BREAKING CHANGE] `az synapse sql/pool audit-policy update`: Add parameter `blob-storage-target-state`, `log-analytics-target-state`, `event-hub-target-state` (at least choose one of these 3 paras)
* `az synapse integration-runtime`: Support start/stop integration-runtime
* `az synapse trigger`: Add az synapse trigger wait
* `az synapse trigger-run`: Add az synapse trigger-run cancel
* `az synapse integration-runtime`: Deprecate `create` command and will redirect to `managed create` or `self-hosted create` command
* `az synapse dataset/pipeline/linked-service/trigger`: Deprecate `set` command and will redirect to `update` command
* `az synapse workspace-package`: Support workspace package CRUD
* `az synapse spark pool update`: Support add or remove specific packages
* `az synapse workspace create/update`: Add arguments for supporting synapse workspace repository configuration
* `az synapse spark-job-definition`: Support spark job definition CRUD

## September 09, 2021

Version 2.28.1

### ARM

Hotfix: Fix #19468: pip installs azure-cli 2.0.73 because of the dependency on deprecated package `jsmin`

## September 07, 2021

Version 2.28.0

### ACR

* `az acr create/update`: Add support for disabling export through `--allow-exports`
* `az acr`: Bump core api-version to `2021-06-01-preview` from `2020-11-01-preview`. agent_pool, tasks and runs operations unchanged from `2019-06-01-preview`
* `az acr task credential`: Fix the issue where task credentials were not used
* `az acr task logs`: Fix the AttributeError when querying the task logs

### AKS

* [BREAKING CHANGE] `az aks nodepool update`: Change rejecting the ability to use max-surge with node-image-only
* `az aks install-cli`: Add support for kubelogin darwin/arm64 releases
* Fix incorrectly passed parameter for option `--assign-kubelet-identity` in aks create sub-command
* Upgrade api-version to `2021-07-01` for ACS module
* `az aks create/update`: Add support for private cluster public fqdn feature
* Revert PR #18825: `az aks create/update`: Add parameter `--auto-upgrade-channel` to support auto upgrade (with fix)
* `aks create/aks nodepool add`: Add parameter ` --os-sku` to support choosing the underlying container host OS

### App Config

* `appconfig kv import/export`: Add endpoint validation during import and export

### App Service

* `az webapp config storage-account list/add/update/delete`: Remove preview flag
* Fix #18497: `functionapp identity show`: Fix the crashes when the functionapp name does not reference an existing functionapp
* `az webapp config set`: Add additional help examples for powershell users
* Fix #17818: `az functionapp update`:  Add instance validation for updating functionapp
* `az webapp config hostname add`: Fix the issue caused by AttributeError
* `az webapp config hostname add`: Fix the issue caused by AttributeError
* Fix #16470: `az staticwebapp secrets`: Add commands to manage deployment secrets
* `az webapp deployment source config-local-git`: Fix the issue caused by AttributeError when slot option is specified
* `az webapp deleted restore` : Fix the issue that 'WebAppsOperations' object has no attribute 'restore_from_deleted_app'
* `az webapp up`: Add ability to deploy Linux and Windows webapps to the same resource group
* `az webapp up`: Add support for deploying to an App Service Environment
* Fix #19098: `az webapp deployment slot auto-swap `: Fix the AttributeError error for parameters `--slot --disable`

### ARM

* `az feature registration`: Add az feature registration apis
* `az tag create`: Add the note for handling existing tag in help
* `az ts create`: Fix issue where creating a template spec with inner deployments that reference a common template fails

### CDN

* `az cdn endpoint create`: Fix endpoint creation failure with `--content-types-to-compress`

### Compute

* `az ssh vm`: Raise error for managed identity and Cloud Shell
* Upgrade api-version for VM and VMSS from `2021-03-01` to `2021-04-01`
* `az vmss create/update`: Support spot restore policy to VM scale sets
* Add new examples for creating disk from share image gallery
* `az vm image​ list/list-offers/list-skus/list-publishers/show`: Add new parameter ​`--edge-zone`​ to support querying the image under edge zone
* Fix the issue caused by the lack of `os_type` when creating VM from shared gallery id
* Update shared image gallery doc
* `az capacity reservation`: Add new commands to manage capacity reservation
* `az capacity reservation group`: Add new commands to manage capacity reservation group
* `az vm create/update`: Add new parameter `--capacity-reservation-group` to support association to capacity reservation
* `az vmss create/update`: Add new parameter `--capacity-reservation-group` to support association to capacity reservation
* `az vmss create`: Support creating VMSS from shared gallery image

### IoT

* `az iot hub/dps certificate update/create`: Add `--verified` argument to mark certificates as verified without proof-of-possession flow
* `az iot hub create/update`: Add `--disable-local-auth`, `--disable-device-sas`, and `--disable-module-sas` arguments to configure accepted SAS key authentication methods.

### Key Vault

* `az keyvault private-endpoint-connection list`: Support list mhsm's private endpoint connections
* `az keyvault set-policy`: `--key-permissions` add new option `release`

### Network

* Fix NSG rule creation example mistake
* Add a new command group `az network custom-ip prefix`.
* `az network public-ip`: Add parameter `--ip-address`.
* `az network public-ip prefix create`: Add parameter `--custom-ip-prefix-name`.
* `az network dns record-set {record-type} add-record`: Support idempotent
* PrivateLink supports `Microsoft.Purview/accounts` 2021-07-01
* `az network bastion ssh`: connect to a Virtual machine through ssh using Bastion Tunneling.
* `az network bastion rdp`: connect to a Virtual machine through native RDP using Bastion Tunneling.
* `az network bastion tunnel`: connect to a Virtual machine using Bastion Tunneling.

### Packaging

* Use Python 3.9 in Homebrew formula
* When installed with RPM, run python3.6 if available
* Add Ubuntu 21.04 Hirsute Hippo support
* Add Debian 11 Bullseye support
* Drop Ubuntu 20.10 Groovy Gorilla support

### PowerBI

* Add private link provider Microsoft.PowerBI/privateLinkServicesForPowerBI

### RDBMS

* [BREAKING CHANGE] `az postgres flexible-server migration`: Rename `--migration-id` to `--migration-name`
* [BREAKING CHANGE] `az mysql flexible-server create/update`: `--high-availability` available parameter is changed from 'Enabled' to 'ZoneRedundant' and 'SameZone' .
* Fix maintenance window update issue with MySQL and Change restart parameter to be case insensitive
* `az mysql flexible-server restore` enables network option change from private network  to public network and vice versa.
* `az mysql flexible-server replica create`: Add `zone` parameter.

### Role

* `az role assignment create`: Support `ForeignGroup` for `--assignee-principal-type`
* `az role assignment create`: Do not invoke Graph API if `--assignee-principal-type` is provided

### SQL

* `az sql mi update`: Add --subnet and --vnet-name parameters to support the cross subnet update SLO
* Fix the enum name change in track2 Python SDK

### Storage

* Fix #10765: Refine error message when account key is incorrect padding

### Synapse

* [BREAKING CHANGE] Rename `az synapse workspace key update` to `az synapse workspace key activate` and remove `--is-active`
* Optimize submit spark job arguments
* `az synapse`: Add managed private endpoints feature.
* Spark pool remove library requirement

## August 23, 2021

Version 2.27.2

### Cosmos DB

* Hotfix: `az cosmosdb restore`: Fix the restore command for deleted accounts

## August 17, 2021

Version 2.27.1

### ARM

* Hotfix: Fix #19124: `az deployment what-if`: Handle unsupported and no effect change types

### Batch

Upgrade batch data-plane to [azure-batch 11.0.0](https://pypi.org/project/azure-batch/)
Upgrade batch management-plane to [azure-batch-mgmt 16.0.0](https://pypi.org/project/azure-mgmt-batch/16.0.0/)
`az batch location`: Add `list-skus` command to list SKUs available in a location
`az batch account`: Add `outbound-endpoints` command to list outbound network dependencies

## August 03, 2021

Version 2.27.0

### ACR

* [BREAKING CHANGE] `az acr connected-registry install info`: Add a new required parameter `--parent-protocol`.
* [BREAKING CHANGE] `az acr connected-registry install renew-credentials`: Add a new required parameter `--parent-protocol`.
* `az acr import`: Support new parameter `--no-wait`
* Fix the Python SDK compatibility issue when migrating Track 2
* `az acr build`: Make file .dockerignore include directories with `!`

### AKS

* `az aks check-acr`: Fix issues parsing certain client minor versions

### AppConfig

* [BREAKING CHANGE] `appconfig feature set`: Set the value of parameter `--description` to empty string if it is not specified
* [BREAKING CHANGE] `az appconfig feature`: Support namespacing for feature flags and change output fields
* `az appconfig create`: Add tags support when creating resource

### App Service

* `az webapp config set`: Add support for VNet Route All property.
* `az webapp vnet-integration add`: Default to VNet Route All. Allow cross subscription integration.
* `az appservice ase create`: Support for ASEv3 External and Zone redundancy
* `az webapp hybrid-connection add`: Improve help/error message and unblock Linux
* `az webapp config access-restriction remove`: Fix #18947 issue removing service endpoint rules
* : Fix #17424: `az appservice plan show`: Provide correct exit status

### ARM

* `az what-if`: Fix output formatting
* `az bicep uninstall`: Add new command to uninstall bicep
* `az bicep build`: Fix an issue where running with --stdout doesn't print any output
* `az provider register`: Add deprecate info for `--accept-term`
* `az lock create/delete`: Add examples for operating different levels of locks
* `az deployment group/sub/mg/tenant create`: Add --what-if parameter for invoking What-If with the deployment create commands.
* `az deployment group/sub/mg/tenant create`: Add --proceed-if-no-change parameter to skip confirmation when --confirm-with-what-if is set and there's no changes in What-If results.
* Bump api-version from 2020-10-01 to 2021-04-01
* `az ts create`: Make parameter `--template-file` support bicep file
* `az resource create`: Add example for creating site extension to web app
* `az ts export`: Fix the issue that export template specs with no linked templates failed

### Backup

* `az backup vault`: Add support for Customer Managed Keys(CMK)
* `az backup restore restore-disks`: Add MSI usage in IaaS VM Restore

### CDN

* `az cdn endpoint rule`: Add OriginGroupOverride action support

### Compute

* `az sig image-version create`: Support mixing disks, snapshots, and vhd
* `az vmss update`: Upgrade package version to fix securityProfile issue
* `az vm boot-diagnostics get-boot-log`: Fix crash when getting boot diagnostics log
* `az vm list-skus`: Fix the issue that it can't query the SKU which with partially zones available
* `az vm auto-shutdown`: Fix the issue that `--webhook` is required when `--email` is passed in
* `az vm create`: Support creating VM from shared gallery image
* `az vm secret add`: Add note to use Azure Key Vault VM extension instead in help

### Container

* `az container exec`: Fix and improve terminal experience

### DataBoxEdge

* Migrate databoxedge to track2 SDK

### DMS

* `az dms project create/az dms project task create`: Remove MySQL projects/tasks for online migrations since they are no longer supported.

### IoT

* `az iot hub create/update`: Add checks to prevent bad file-upload identity parameters when hub doesn't have identity
* `az iot hub create/update`: Add `--fileupload-notification-lock-duration` parameter
* `az iot hub create/update`: Deprecate `fileupload-storage-container-uri` parameter
* `az iot dps/hub certificate create`: Certificates will now always be uploaded in base64 encoding.

### Key Vault

* [BREAKING CHANGE] Fix #13752: az keyvault create not idempotent. Creating existing keyvault will fail.
* Fix #6372: table output for secrets isn't correct

### Maps

* `az maps creator create`: Support maps creator create managed
* `az maps creator update`: Support maps creator update managed
* `az maps creator list`: Support maps creator list managed
* `az maps creator show`: Support maps creator show managed
* `az maps creator delete`: Support maps creator delete managed

### NetAppFiles

* `az netappfiles volume pool-change`: Update help description for pool-change

### Network

* `az network application-gateway create`: Add `--ssl-certificate-name` argument
* Private link add Microsoft.ServiceBus/namespaces provider
* `az network application-gateway waf-policy custom-rule match-condition add`: Add examples
* `az network express-route port link update`: Add `--macsec-sci-state` argument.
* Private link add Microsoft.Web/hostingEnvironments provider
* `az network lb frontend-ip update`: Support cross tenant for argument `--gateway-lb`.
* `az network nic ip-config update`: Support cross tenant for argument `--gateway-lb`.
* Private link add Microsoft.StorageSync/storageSyncServices provider
* Private link add Microsoft.Media/mediaservices provider
* Private link add Microsoft.Batch/batchAccounts provider

### Packaging

* Add licenses to all Python packages
* Add SOCKS Proxy Support

### PolicyInsights

* Migrate to track 2 SDK

### RDBMS

* PostgreSQL, MySQL migration to GA API

### Redis

* `az redis create\update`: Add new parameter `--redis-version`

### SQL

* Update Microsoft.Sql to track2 SDK
* `az sql server outbound-firewall-rule create`: Azure CLI Commands for Outbound Firewall Rules

### Storage

* Fix #18352: `az storage fs file list --exclude-dir` breaks with `--show-next-marker`
* `az storage fs generate-sas`:  Support generate sas token for file system in ADLS Gen2 account
* `az storage account blob-service-properties`: Support last access tracking policy
* `storage container-rm migrate-vlw`: Support Version level Worm (VLW)
* `az storage copy` add new option `--cap-mbps`

### Synapse

* `synapse workspace key update`: Fix the issue that updating a workspace key failure due to parameter `--is-active-cmk` lost
* Reimport notebook failure

## July 14, 2021

Version 2.26.1

### ACR

* Hotfix: `az acr build\connected-registry\pack\run\scope-map`: Fix the compatibility bug caused by SDK upgrade

### AKS

* Hotfix: `az aks create`: Fix the issue that `assign-kubelet-identity` option can't work

### Storage

* Hotfix: Fix issue caused by jwt upgrade.
* Hotfix: `az storage fs directory download`: Fix the issue with `--sas-token` to generate valid sas url
* Hotfix: `az storage blob copy start`: Fix the issue in copy from different account

## July 06, 2021

Version 2.26.0

### AKS

* Migrate ACS module to track 2 SDK
* Upgrade api-version to 2021-05-01 for ACS module
* Add UltraSSD support
* Support use custom kubelet identity
* `az aks get-credentials`: Add a check for KUBECONFIG environmental variable

### APIM

* Add version parameter for apim api import
* Fix apim upgrade bug when specifying protocols
* `az apim create`: Fix `--enable-managed-identity` true failure

### App Config

* Stop overwriting KeyVault reference content type during import

### App Service

* [BREAKING CHANGE] `az functionapp create`: Remove support for EOL Node 8 and 10
* [BREAKING CHANGE] `az webapp deployment source config`: Remove vsts-cd-manager
* [BREAKING CHANGE] `az functionapp deployment source config`: Remove vsts-cd-manager
* `az webapp/functionapp config access-restriction add`: Prevent duplicate rules using service endpoints.
* `az webapp/functionapp config access-restriction remove`: Remove service endpoints are case-insensitive
* `az webapp config access-restrictions add`: Skip validation if user does not have access to get service tag list.
* Add support for Linux Consumption and improve how content share name is generated.
* : Fix an issue where adding VNET integration & Hybrid connections on a slot is not working
* `az appservice domain create`: Fix get correct domain agreements
* `az webapp deployment github-actions add/remove`: new commands

### AppConfiguration

* Add support for `disable_local_auth`

### ARM

* `az provider register`: Make parameter `--accept-term` become not required

### ARO

* `az aro create`: Add cidr values for pod/service
* Fail if resource doesn't exist on delete

### Azurestack

* Azure Stack Hub Support for AKS and ACR has been added in 2020-09-01-hybrid profile

### Backup

* `az backup container`: Fix container registration
Workload container registration fix, SDK upgraded to 0.12.0, Fixed and Re-ran tests
* Add Archive Support for Azure CLI

### Billing

* Migrate billing to track2 SDK

### Cognitive Services

* `az cognitiveservices account`: Add list-deleted, show-deleted, recover, purge commands

### Compute

* `az sig create/update`: Add --permissions to specify the permission of sharing gallery.
* `az sig share`: Manage gallery sharing profile.
* `az sig list-shared`:  List shared galleries by subscription id or tenant id.
* `az sig show-shared`:  Get a shared gallery.
* `az sig image-definition list-shared`:  List shared galleries by subscription id or tenant id.
* `az sig image-definition show-shared`:  Get a shared gallery image.
* `az sig image-version list-shared`:  List shared galleries by subscription id or tenant id.
* `az sig image-version show-shared`:   Get a shared gallery image version.
* `az vmss create`: Support NetworkApiVersion for Vmss with OrchestraionMode == Flexible
* Make dependent resources of VM/VMSS support edge zone
* Update from CoreOS to Flatcar
* Add the hint to suggest users use the standard public IP when creating VM

### Container Registry

* Migrate to track2 SDK

### Cosmos DB

* Add point-in-time restore commands to the stable branch.
* Add support for selecting Cosmos DB analytical storage schema type

### HDInsight

* `az hdinsight create`: Remove the incoming breaking change notice for the parameter `--workernode-size` and `--headnode-size`.
* Add three new cmdlets to support new azure monitor feature:

### NetAppFiles

* `az netappfiles account ad add`: Optional parameter added named --administrators
* `az netappfiles pool create`: Optional parameter added --cool-access
* `az netappfiles volume create`: Optional parameters added named --chown-mode, --cool-access, --coolness-period, --coolness-period
* `az netappfiles volume backup restore-status`: Command added to see backup restore status

### Network

* `az network routeserver create`: Add `--public-ip-address` argument.

### RDBMS

* Add autogrow parameter for MySQL and add database name to output json when created

### Resource

* Third-party S2S Consent/Permission Enumeration

### Security

* Remove preview from security module

### SQL

* Bump sdk version
* Fix for server create in SQL 0.28
* `az sql db ledger-digest-uploads`:  Support SQL Ledger
* Fix for IdentityType for UMI
* `az sql db str-policy set/show`: Add Set and Show ShortTermRetentionPolicy

### Storage

* GA support secured SMB
* `az storage account create`: Support `--enable-nfs-v3` to set NFS 3.0 protocol
* Support container soft delete

## June 15, 2021

Version 2.25.0

### ACR

* `az acr connected-registry`: Minor bug fixes

### App Service

* `az webapp deployment source config-local-git`:  Fix to set SiteConfig

### ARM

* `az resource tag`: Fix the problem of tagging resources with resource type `Microsoft.Network/publicIPAddresses`
* `az policy assignment non-compliance-message`: New command group for policy assignment non-compliance messages
* `az policy assignment update`: New command for partially updating existing policy assignments

### Backup

* Migrate backup to track2 SDK

### Compute

* Upgrade api-version for VM and VMSS from '2020-12-01' to '2021-03-01'
* `az vm create`: Support delete option for NICs and Disks for VMs in Azure CLI
* Support user_data for VM and VM Scale Sets

### Container

* `az container exec`: Decode received bytes as utf-8 string

### EventGrid

* Migrate track2 SDK

### HDInsight

* Migrate to track2 Python SDK 7.0.0

### Iot Hub

* Fix for user-assigned identity ARM issue on remove

### Key Vault

* Fix #11871: AKV10032: Invalid issuer error for operations in nondefault tenant/subscription
* `az keyvault set-policy/delete-policy`: Support --application-id
* `az keyvault recover`: Support MHSM
* `az keyvault private-link-resource list`: Support MHSM
* `az keyvault private-endpoint-connection`: Support MHSM

### NetAppFiles

* `az netappfiles volume backup status`: Command added to get the status of the backup for a volume.
* `az netappfiles volume update`: Optional parameter added named `--snapshot-policy-id` o assign a snapshot policy to the volume.
* `az netappfiles volume backup create`: Optional parameter added named `--use-existing-snapshot` to manually backup an already existing snapshot.
* `az netappfiles volume backup update`: Optional parameters added named `--use-existing-snapshot` to manually backup an already existing snapshot. Optional parameter label also added to add a label to backup.

### Network

* Support `Microsoft.Sql/servers` provider in Private link
* `az network private-link-resource list`: Support `--type microsoft.keyvault/managedHSMs`
* `az network private-endpoint-connection`: Support `--type microsoft.keyvault/managedHSMs`

### RDBMS

* Add commands for Github actions
* `az postgres flexible-server migration`: Add customer facing feature to migrate postgres db servers from Sterling to Meru platform
* Private DNS zone parameter added for restore command, high availability validator
* Change server default location (issue reported)

### Role

* [BREAKING CHANGE] `az ad sp create-for-rbac`: `--name` is now only used as the `displayName` of the app. It is not used to generate `identifierUris` anymore. `name` in the output is now the same as `appID` (`servicePrincipalNames`) and deprecated.

### SignalR

* `az signalr identity`: Add managed identity related command
* `az signalr cors update`: Add update command for cors

### Storage

* `az storage blob copy start`: Support --tier and --rehydrate-priority
* GA release storage file share NFS and SMB multichannel
* [BREAKING CHANGE] `az storage account create`: Remove `StorageFileDataSmbShareOwner` option for --default-share-permission
* `az storage blob list`: --delimiter parameter value will now be honored

### Synapse

* Update to AZ Synapse mgmt 2.0.0
* Spark configuration conversion, which cause the failure

### Webapp

* Add to `az webapp deploy` param help text

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

* [BREAKING CHANGE] `az sf cluster certificate`: Remove all commands under this group. Please follow the instructions in [Add a secondary certificate using Azure Resource Manager](/azure/service-fabric/service-fabric-cluster-security-update-certs-azure#add-a-secondary-certificate-using-azure-resource-manager) to add/remove cluster certificates.
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

### Feedback reference

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
* `az postgres|mariadb|mysql server create` : Update create experience for Postgres, MySQL and MariaDB - new fields in the output , Introduce new values for `--public` parameter in create command (all,\<IP\>,\<IPRange\>,0.0.0.0)

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
  * Added `MountConfigurations` for file system mounts (see [Request Body](/rest/api/batchservice/pools/create-pool#request-body) for details)
  * Added optional property `publicIPs` on `NetworkConfiguration` for public IPs on pools
    (see [Request Body](/rest/api/batchservice/pools/create-pool#request-body) for details)
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

### Feedback reference

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
* Print a friendly message when the subscription is not approved to use Azure Red Hat OpenShift

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

### Feedback reference
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
* [BREAKING CHANGE] Removed `--tag` and `--manifest` options from `acr repository delete`

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
* Added `root-cert` subcommands to `application-gateway` to handle trusted root certificates
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

* Changed to return 0 (success) when ending `az aks browse` by pressing [Ctrl+C]

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

### Version 2.0.41

### AKS

* Changed monitoring to use subscription ID

### Version 2.0.40

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

### Version 2.0.37

### Core

* Improved interactive telemetry

### Version 2.0.36

### AKS

* Added advanced networking options to `aks create`
* Added arguments to `aks create` to enable monitoring and HTTP routing
* Added `--no-ssh-key` argument to `aks create`
* Added `--enable-rbac` argument to `aks create`
* [PREVIEW] Added support for Azure Active Directory authentication to `aks create`

### AppService

* Fixed an issue with incompatible urllib versions

## June 5, 2018

### Version 2.0.35

### Interactive

* Added limits to the dependencies of interactive mode

### Version 2.0.34

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

* Changed to use the `virtual-kubelet-for-aks` Helm chart for `aks install-connector` by default
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

### Feedback reference

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
* Removed human names from the admin names disallowed for `[vm|vmss] create`
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
