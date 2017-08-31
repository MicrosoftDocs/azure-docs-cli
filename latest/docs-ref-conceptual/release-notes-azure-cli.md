---
title: Azure CLI 2.0 release notes
description: Learn about the latest updates to Azure CLI 2.0
keywords: Azure CLI 2.0, release notes
author: sptramer
ms.author: sttramer
manager: douge
ms.date: 04/03/2017
ms.topic: article
ms.prod: azure
ms.technology: azure
ms.devlang: azurecli
ms.service: multiple
ms.assetid: ce0428f7-0a59-4e72-9237-d907b171af51
---

# Azure CLI 2.0 release notes

## August 31, 2017

Version 2.0.16

### Keyvault

* `keyvault secret download`: Fix bug when trying to automatically resolve secret encoding.

### Sf

* Deprecating all commands in favor of Service Fabric CLI (sfctl)

### Storage

* `storage account create`: Fix issue where storage accounts could not be created in regions that don't
  support the NetworkACLs feature.
* Deduce content type and content encoding during blob and file upload if neither content type and content encoding are specified.

## August 28, 2017

Version 2.0.15

### CLI

* Added legal note to `--version`.

### ACS

* Corrected preview regions.
* Formatted default `dns_name_prefix` properly.
* Optimized acs command output.

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

```
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

* Provided a better error message for `cdn endpoint list` when the profile specified by `--profile-name` does not exist.

### Cloud

* Changed API version of cloud metadata endpoint to YYYY-MM-DD format
* Gallery endpoint isn't required
* Support for registering cloud just with ARM resource manager endpoint
* Provided an option for `cloud set` to choose the profile while selecting current cloud
* Exposed `endpoint_vm_image_alias_doc`

### CosmosDB

* Fixed allowing creation of collection with custom partition key
* Added support for collection default TTL.

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
* Fixed issue where `cmss create` with an existing load balancer required `--backend-pool-name`.
* Make datadisks created with `vm image create` lun start with 0


## May 10, 2017

Version 2.0.6

* documentdb renamed to cosmosdb
* Add rdbms (mysql, postgres)
* Include Data Lake Analytics and Data Lake Store modules.
* Include Cognitive Services module.
* Include Service Fabric module.
* Include Interactive module (rename of az-shell).
* Add support for CDN commands.
* Remove Container module.
* Add 'az -v' as shortcut for 'az --version' ([#2926](https://github.com/Azure/azure-cli/issues/2926))
* Improve performance of package load and command execution ([#2819](https://github.com/Azure/azure-cli/issues/2819))

```
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

* Rename documentdb module to cosmosdb.
* Added support for documentdb data-plane APIs:
  database and collection management
* Added support for enabling automatic failover on database accounts
* Added support for new consistency policy ConsistentPrefix

### Data Lake Analytics

* Fix a bug where filtering on result and state for job lists would throw an error.
* Add support for new catalog item type: package. accessed through: `az dla catalog package`
* Made it possible to list the following catalog items from within a database (no schema specification required):

  * Table
  * Table valued function
  * View
  * Table Statistics. This can also be listed with a schema, but without specifying a table name.

### Data Lake Store

* Update the version of the underlying filesystem SDK, which gives better support for handling server side throttling scenarios.
* Improve performance of package load and command execution ([#2819](https://github.com/Azure/azure-cli/issues/2819))
* missed help for access show. adding it. ([#2743](https://github.com/Azure/azure-cli/issues/2743))

### Find

* improve search results and allow for versioning of the search index

### KeyVault

* BC:`az keyvault certificate download` change -e from string or binary to PEM or DER to better represent the options
* BC: Remove --expires and --not-before from `keyvault certificate create` as these parameters are not supported by the service.
* Adds the --validity parameter to `keyvault certificate create` to selectively override the value in --policy
* Fixes issue in `keyvault certificate get-default-policy` where 'expires' and 'not_before' were exposed but 'validity_in_months' was not.
* keyvault fix for import of pem and pfx ([#2754](https://github.com/Azure/azure-cli/issues/2754))

### Lab

* Adding create, show, delete & list commands for environment in the lab.
* Adding show & list commands to view ARM templates in the lab.
* Adding --environment flag in `az lab vm list` to filter VMs by environment in the lab.
* Add convenience command `az lab formula export-artifacts` to export artifact scaffold within a Lab's formula.
* Add commands to manage secrets within a Lab.

### Monitor

* Bug Fix: Modeling `--actions` of `az alert-rules create` to consume JSON string ([#3009](https://github.com/Azure/azure-cli/issues/3009))
* Bug fix - diagnostic settings create does not accept logs/metrics from show commands ([#2913](https://github.com/Azure/azure-cli/issues/2913))

### Network

* Add `network watcher test-connectivity` command.
* Add support for `--filters` parameter for `network watcher packet-capture create`.
* Add support for Application Gateway connection draining.
* Add support for Application Gateway WAF rule set configuration.
* Add support for ExpressRoute route filters and rules.
* Add support for TrafficManager geographic routing.
* Add support for VPN connection policy-based traffic selectors.
* Add support for VPN connection IPSec policies.
* Fix bug with `vpn-connection create` when using the `--no-wait` or `--validate` parameters.
* Add support for active-active VNet gateways
* Remove nulls values from output of `network vpn-connection list/show` commands.
* BC: Fix bug in the output of `vpn-connection create` 
* Fix bug where '--key-length' argument of 'vpn-connection create' was not parsed correctly.
* Fix bug in `dns zone import` where records were not imported correctly.
* Fix bug where `traffic-manager endpoint update` did not work.
* Add 'network watcher' preview commands.

### Profile

* Support login when there are no subscriptions found ([#2560](https://github.com/Azure/azure-cli/issues/2560))
* Support short param name in az account set --subscription ([#2980](https://github.com/Azure/azure-cli/issues/2980))

### Redis

* Adding update command which also adds the ability to scale for redis cache
* Deprecates the 'update-settings' command.

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

* Added az sql server list-usages and az sql db list-usages commands.
* SQL - ability to connect directly to resource provider ([#2832](https://github.com/Azure/azure-cli/issues/2832))

### Storage

* Default location to resource group location for `storage account create`.
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

We released the ACR, Batch, KeyVault, and SQL components in this release.

```
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

* Add acr, lab, monitor, and find modules to default list.
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

* Initial release of Data Lake Analytics module.
* Initial release of Data Lake Store module.
 
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

This release of Azure CLI 2.0 is the first "Generally Available" release.
General availability applies to these command modules:
- Container Service (acs)
- Compute (including Resource Manager, VM, virtual machine scale sets, Managed Disks)
- Networking
- Storage

These command modules can be used in production and are supported by standard Microsoft SLA.
You can open issues directly with Microsoft support or on our [github issues list](https://github.com/azure/azure-cli/issues/).
You can ask questions on [StackOverflow using the azure-cli tag](http://stackoverflow.com/questions/tagged/azure-cli),
or contact the product team at [azfeedback@microsoft.com](mailto:azfeedback@microsoft.com).
You can provide feedback from the command line with the `az feedback` command.

The commands in these modules are stable and the syntax is not expected to change in upcoming releases of this version of Azure CLI.

To verify the version of the CLI, use `az --version`.
The output lists the version of the CLI itself (2.0.0 in this release), the individual command modules,
and the versions of Python and GCC that you're using.

```
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
> Some of the command modules have a "b*n*" or "rc*n*" postfix.
> These command modules are still in preview and will become generally available in the future.

We also have nightly preview builds of the CLI.
For information, see these instructions on [getting the nightly builds](https://github.com/Azure/azure-cli#nightly-builds),
and these instructions on [developer setup and contributing code](https://github.com/Azure/azure-cli#developer-setup).

You can report issues with nightly preview builds in the following ways:
- Report issues in our [github issues list](https://github.com/azure/azure-cli/issues/)
- Contact the product team at [azfeedback@microsoft.com](mailto:azfeedback@microsoft.com).
- Provide feedback from the command line with the `az feedback` command.

