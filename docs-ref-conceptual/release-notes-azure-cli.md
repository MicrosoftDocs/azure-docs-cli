---
title: Azure CLI 2.0 release notes
description: Learn about the latest updates to Azure CLI 2.0
keywords: Azure CLI 2.0, release notes
author: rloutlaw
ms.author: routlaw
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

## July 7, 2017

Version 2.0.10

* Add billing modules
* Progress Reporting for template deployments
* Support for Azure Stack with profile '2017-03-09-profile'

### Core

* Fix deployment progress exceptions
* Use arm endpoint from the current cloud to create subscription client
* Improve concurrent handling of clouds.config file
* Refresh client request id for each command execution
* core: Create subscription clients with right SDK profile
* output: add support for picking table output fields through jmespath query
* Improves the muting of parse args + appends history with gestures
* Create subscription clients with right SDK profile
* [VM/VMSS] Fix idempotency for VM/VMSS create
* Command paths are no longer case sensitive.
* Certain boolean-type parameters are no longer case sensitive.
* Support login to ADFS on prem server like Azure Stack

### ACR

* Add managed registries with Managed SKU.
* Add webhooks for managed registries with acr webhook command module.
* Add AAD authentication with acr login command.
* Add delete command for docker repositories, manifests, and tags.

### ACS

* fix acs kube get-credentials ssh-key loading
* rbac: clean up role assignments and related AAD application when delete a service principal
* convert master and agent count to integer

### AppService

* webapp: support to retrieve creds from acr
* BC: webapp: remove all commands under 'az appservice web'
* webapp: mask docker registry passwords from 'webapp appsettings/container' commands' output
* webapp: ensure default browser is used on osx and w/o error on launching
* webapp: improve the help of 'az webapp log tail/download'
* webapp: expose traffic-routing command to configure static routing
* webapp: add reliability fixes in configuring source control
* BC: az webapp config update: Remove unsupported --node-version argument for Windows webapps. Instead use "az webapp config appsettings set" with the WEBSITE_NODE_DEFAULT_VERSION key.

### Batch

* Updated to Batch SDK 3.0.0 with support for low-priority VMs in pools.
* Changes to the pool create command: --target-dedicated has been renamed to --target-dedicated-nodes and two
  new options have been added; --target-low-priority-nodes and --application-licenses

### CDN

* Add exception handler for endpoint list that provides a better message when the profile specified by '--profile-name' does not exist.

### Cloud

* Support for registering cloud just with ARM resource manager endpoint
* Provide an option for 'az cloud set' to select the profile while selecting current cloud
* Expose 'endpoint_vm_image_alias_doc'

### CosmosDB

* Added Support for Collection Default TTL.

### Data Lake Analytics

* Add commands for compute policy management under the `dla account compute-policy` heading
* Add show and list commands for job pipeline and recurrence under `dla job pipeline` and `dla job recurrence` respectively

### Data Lake Store

* Add support for user managed key vault key rotation in `dls account update`
* Update underlying Data Lake Store filesystem SDK version, addressing a performance issue.
* Update to add a new command: `az dls enable-key-vault`. This command attempts to enable a user provided Key Vault for use encrypting the data in a Data Lake Store account.

### Interactive

* Enhance the '?' gesture to also inject into the next command
* Fixes Interactive errors with the profile 2017-03-09-profile-preview
* Allows '--version' as a parameter for interactive mode
* Stop Interactive Mode from Throwing errors from Validation completions
* Progress Reporting for template deployments
* --progress flag
* Removed --debug and --verbose from completions
* Bug fixes.
* Remove 'interactive' from completions

### KeyVault

* Adding commands for KeyVault recovery features
* az keyvault purge, recover, list-deleted
* az keyvault secret backup, restore, purge, recover, list-deleted
* az keyvault certificate purge, recover, list-deleted
* az keyvault key purge, recover, list-deleted
* [Role] Service Principal KeyVault integration (#3133)
* Update KeyVault dataplane to 0.3.2. (#3307)
* [KeyVault] Update data plane SDK to 0.3.0 (#3251)

### Lab

* Adding support for claiming any vm in the lab through `az lab vm claim`
* Adding support for claiming existing vm in the lab through `az lab vm claim`
* Adding table output formatter for `az lab vm list` & `az lab vm show`

### Monitor

* Include autoscale template file to fix `az monitor autoscale-settings get-parameters-template` command (#3349)
* BC: `monitor alert-rule-incidents list` renamed `monitor alert list-incidents`
* BC: `monitor alert-rule-incidents show` renamed `monitor alert show-incident`
* BC: `monitor metric-defintions list` renamed `monitor metrics list-definitions`
* BC: `monitor alert-rules` renamed `monitor alert`
* BC: `monitor alert create` completely revamped. `condition` and `action` no longer accepts JSON. 
	  Adds numerous parameters to simplify the rule creation process. `location` no longer required.
	  Added name or ID support for target.
	  `--alert-rule-resource-name` removed. `is-enabled` renamed `enabled` and no longer required.
	  `description` defaults based on the supplied condition. Added examples to help clarifiy the
	  new format.
* BC: Support names or IDs for `monitor metric` commands.
* `monitor alert rule update` - Added numerous convenience arguments to improve usability. Added
  examples to explain usage of the new arguments.

### Network

* `application-gateway address-pool create/update`: fix bug when using the `--servers` argument.
* `application-gateway`: add `redirect-config` commands
* `application-gateway ssl-policy`: add `list-options`, `predefined list` and `predefined show` commands
* `application-gateway ssl-policy set`: new arguments `--name`, `--cipher-suites`, `--min-protocol-version`
* `application-gateway http-settings create/update`: new arguments `--host-name-from-backend-pool`, `--affinity-cookie-name`,
  `--enable-probe`, `--path`
* `application-gateway url-path-map create/update`: new arguments `--default-redirect-config`, `--redirect-config`
* `application-gateway url-path-map rule create`: new argument `--redirect-config`
* `application-gateway url-path-map rule delete`: add support for `--no-wait`
* `application-gateway probe create/update`: new arguments `--host-name-from-http-settings`, `--min-servers`, `--match-body`, `--match-status-codes`
* `application-gateway rule create/update`: new argument `--redirect-config`
* `nic create/update`: Add support for `--accelerated-networking`.
* BC `nic create`: Remove non-functional `--internal-dns-name-suffix` argument.
* `nic update/create`: Add support for --dns-servers.
* `local-gateway create`: fix bug where --local-address-prefixes was ignored.
* `vnet update`: Add support for --dns-servers.
* `express-route peering create`: fix bug when creating a peering without route filtering.
* `express-route update`: fix bug where --provider and --bandwidth arguments did not work.
* `network watcher show-topology`: Fix bug with location defaulting logic.
* `network list-usages`: improve output for TSV and table format.
* `application-gateway http-listener create`: Default frontend IP if only one exists.
* `application-gateway rule create`: Default address pool, HTTP settings, and HTTP listener if
   only one exists.
* `lb rule create`: Default frontend IP and backend pool if only one exists.
* `lb inbound-nat-rule create`: Default frontend IP if only one exists.

### Profile

* account show: support output in SDK auth file format
* Output deprecating information on using '--expanded-view'
* Add get-access-token command to provide raw AAD token
* Support login with a user account with no associated subscriptions

### RDBMS

* Add support for list server across a subscription.
* [RDBMS]Support list servers across a subscription (#3417)
* %s not processed becasue of missing % server_type (#3393)
* Fix doc source map and add CI task to verify (#3361)
* Fix MySQL and PostgreSQL help (#3369)

### Resource

* `group deployment create`: Improve prompting for missing parameters. Improve parsing of `--parameters KEY=VALUE` syntax.
* `group deployment create`: Fixes issue where some parameter files were no longer recognized using @<file> syntax.
* `resource\managedapp` commands: Support `--ids` argument.
* Fix up some parsing and error messages. (#3584)
* Fix --resource-type parsing for the lock command to accept <resource-namespace>/<resource-type>
* Add parameter checking for template link templates (#3629)
* Add support for specifying deployment parameters using KEY=VALUE syntax.

### Role

* create-for-rbac: support output in SDK auth file format
* rbac: clean up role assignments and related AAD application when delete a service principal (#3610)
* ad: for 'app create' command, mention time format in the arg descriptions for --start-date/--end-date
* output deprecating information on using '--expanded-view'
* Add Key Vault integration to the create-for-rbac and reset-credentials commands.

### Service Fabric

* Fixes an issue with large files in applications being truncated on upload (#3666)
* Adding tests for Service Fabric commands and fixing some arugment parsing logic (#3424)
* Fix numerous Service Fabric commands (#3234)

### SQL

* Removed broken az sql server create --identity parameter.
* az sql server create/update command output no longer show administratorLoginPassword values.
* Added az sql db list-editions and az sql elastic-pool list-editions commands.
* Minor fixes.

### Storage

* Update storage metrics, logging and cors commands (#3495)
* Fix #3362: Rephrase exception message from CORS add (#3638)
* Fix #3592: convert generator to a list in download batch command dry run mode
* Fix #3592: Blob download batch dryrun issue (#3640)


```
azure-cli (2.0.10)

acr (2.0.8)
acs (2.0.10)
appservice (0.1.10)
batch (3.0.3)
billing (0.1.3)
cdn (0.0.6)
cloud (2.0.6)
cognitiveservices (0.1.6)
command-modules-nspkg (2.0.1)
component (2.0.6)
configure (2.0.10)
consumption (0.1.3)
core (2.0.11)
cosmosdb (0.1.10)
dla (0.0.10)
dls (0.0.10)
feedback (2.0.6)
find (0.2.6)
interactive (0.3.6)
iot (0.1.9)
keyvault (2.0.8)
lab (0.0.8)
monitor (0.0.8)
network (2.0.10)
nspkg (3.0.1)
profile (2.0.8)
rdbms (0.0.5)
redis (0.2.7)
resource (2.0.10)
role (2.0.8)
sf (1.0.5)
sql (2.0.7)
storage (2.0.10)
vm (2.0.10)
```

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

