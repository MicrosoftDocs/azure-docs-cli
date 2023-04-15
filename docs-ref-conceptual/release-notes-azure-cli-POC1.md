---
title: Release notes & updates – Azure CLI | Microsoft Docs
description: Learn about the latest Azure Command-Line Interface (CLI) release notes and updates for both the current and beta versions of the CLI.
manager: mkluck
author: dbradish-microsoft
ms.author: dbradish
ms.date: 04/04/2023
ms.topic: article
ms.service: azure-cli
ms.tool: azure-cli
ms.custom: devx-track-azurecli, seo-azure-cli
keywords: azure cli updates, azure cli notes, azure cli versions
---

# Azure CLI release notes

>[!CHANGES]
> 1. Group by reference group (the first word after `az`) not internal group/extension name
>    - "ARM" is now "Deployment"
>    - "App Service" is now "functionapp"
>    - "RDBMS" is now "mysql"
>    - "arctransfer" is now "arc"
> 2. Both Core and Extension are in one `Release Notes` doc
> 3. Conceptual tabs have been used when a single reference group contains both `Core` and `Extension` commands
> 4. `H4`s have been used for version/date headers due to its smaller font and resulting readability
> 5. A sentence has been added if the reference group is extension-only

## account

# [Core](#tab/azurecli-core)

#### Version 2.39.0, August 02, 2022

- az account list: Add TenantId column to table output

#### Version 2.34.0, March 01, 2022

- az account management-group entities: Add a new command group to support entities (Management Groups and Subscriptions) operations for the authenticated user
- az account management-group hierarchy-settings: Add a new command group to support operations on hierarchy settings defined at the management group level
- az account management-group tenant-backfill: Add a new command group to support backfilling subscriptions for the tenant
- az account management-group subscription show: Get the details of a given subscription under a given management group
- az account management-group subscription show-sub-under-mg: Show what subscription is under a given management group
- az account management-group check-name-availability: Check if a management group name is valid and available
- [BREAKING CHANGE] az account show: Drop --sdk-auth

#### Version 2.32.0, January 04, 2022

- az account show/set: Add -n, --name argument

# [Extension](#tab/azurecli-extension)

#### Version 0.2.5

* Update SDK `azure-mgmt-subscription` version to 3.1.1
* Add new command `az account accept-ownership-status` to support accept subscription ownership status

#### Version 0.2.4

* Update `minCliCoreVersion` requirement from `2.3.1` to `2.38.0`.
* GA of `az account alias`: Manage subscription alias.
* Update SDK `azure-mgmt-subscription` version to 3.0.0 and api-version to 2021-10-01.

#### Version 0.2.1

* az account alias create: add --reseller-id

#### Version 0.2.0

* Breaking Change: remove `az account subscription create`.
* Add az account alias commands.
* Add az account tenant commands.
* Support sovereign clouds.

#### Version 0.1.0

* Initial release.

---

## adp

This reference group is an extension of the Azure CLI.

#### 0.1.0
Initial release.

## aks

#### Version 2.47.0, April 04, 2023

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

#### Version 2.46.0, March 07, 2023

* `az aks check-acr`: Fix mariner node missing cert
* Fix #25521: `az aks nodepool upgrade`: Fix the crashes when the version passed in through the parameter `--kubernetes-version` is the same as the cluster version
* Fix #25530: `az aks nodepool upgrade`: Fix agent pool property name used for fetching current k8s version
* `az aks create`: Add new parameter `--pod-cidrs` for setting the IP ranges used to allocate IPs to pods
* `az aks create`: Add new parameter `--service-cidrs` for setting the K8s service IPs
* `az aks create`: Add new parameter `--ip-families` for setting the IP types that should be used in a cluster (IPv4 or IPv6)
* `az aks create`: Add new parameter `--load-balanacer-managed-outbound-ipv6-count` for setting the number of IPv6 outbound IPs that AKS should managed for a cluster with IPv6 enabled
* `az aks update`: Support changing the load balancer managed outbound IPv6 count property
* Fix #22321: `az aks get-credentials`: Fix path separator for Windows when finding `kubeconfig_path`

#### Version 2.45.0, February 07, 2023

* Make ContainerInsights DataCollectionRuleName consistent with Portal and other onboarding clients
* `az aks upgrade`: Show warning if the Kubernetes version isn't supplied
* `az aks create`: Deprecate parameters `--aad-client-app-id`, `--aad-server-app-id` and `--aad-server-app-secret`
* `az aks update-credentials`: Deprecate parameters `--reset-aad`, `--aad-client-app-id`, `--aad-server-app-id` and `--aad-server-app-secret`

## appconfig

#### Version 2.47.0, April 04, 2023

* `az appconfig import/export`: Add warning log info to output even when `--yes` flag is set
* `az appconfig kv import`: Ensure the case of imported boolean values does not change for string conversion from file

#### Version 2.43.0, December 06, 2022

* `az appconfig`: Update raised errors in app config command module

#### Version 2.41.0, October 11, 2022

* [BREAKING CHANGE] `az appconfig kv import`: Add validation to JSON file import to ensure that only valid JSON objects are imports
* [BREAKING CHANGE] `az appconfig kv export`: Update the array conversion logic to prevent dropping keys during export
* `az appconfig kv export`: Fix MemoryError while exporting large stores
* `az appconfig replica`: New command group to support geo-replication
* `az appconfig kv export`: Support exporting app configuration settings as references to App Service
* `az appconfig kv import`: Ensure app configuration references are not imported from App Service
* `az appconfig feature filter update`: Add new command to support updating functionality for feature filters

## Next command group

**more history here**

## GA release

#### Version 2.0.0, February 27, 2017

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
