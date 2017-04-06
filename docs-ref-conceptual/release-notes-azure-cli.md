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

* Add acr, lab, monitor and find modules to default list.
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

* [Compute] Add AppGateway support to VMSS create ([#2570](https://github.com/Azure/azure-cli/pull/2570))
* [VM/VMSS] Improved disk caching support ([#2522](https://github.com/Azure/azure-cli/pull/2522))
* VM/VMSS: incorporate credentials validation logic used by portal ([#2537](https://github.com/Azure/azure-cli/pull/2537))
* Add wait commands and --no-wait support ([#2524](https://github.com/Azure/azure-cli/pull/2524))
* vmss: support * to list instance view across vms ([#2467](https://github.com/Azure/azure-cli/pull/2467))
* Add --secrets for VM and VMSS ([#2212}(https://github.com/Azure/azure-cli/pull/2212))
* Allow VM creation with specialized VHD ([#2256](https://github.com/Azure/azure-cli/pull/2256))

## February 27, 2017

Version 2.0.0

This release of Azure CLI 2.0 is the first "Generally Available" release.
General availability applies to these command modules:
- Container Service (acs)
- Compute (including Resource Manager, VM, VM Scale Sets, Managed Disks)
- Networking
- Storage

These command modules can be used in production and are supported by standard Microsoft SLA.
You can open issues directly with Microsoft support or on our [github issues list](https://github.com/azure/azure-cli/issues).
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
- Report issues in our [github issues list](https://github.com/azure/azure-cli/issues)
- Contact the product team at [azfeedback@microsoft.com](mailto:azfeedback@microsoft.com).
- Provide feedback from the command line with the `az feedback` command.

