---
title: Azure cloud management with the Azure CLI | Microsoft Docs
description: Create, sign in, and manage multiple clouds with the Azure CLI. Learn how to get information on clouds, change the current cloud, and register/unregister new clouds.
ms.service: azure-cli
ms.custom: devx-track-azurecli
keywords: azure cloud management
---

# Azure cloud management with the Azure CLI

If you work across different regions or use [Azure Stack][02], you might need to use more than one
cloud. Microsoft provides clouds that comply with regional laws, which are available for your use.
This article shows you how to get information on clouds, change the current cloud, and register or
unregister new clouds.

## List available clouds

You can list available clouds with the [az cloud list][04] command. This command displays the
currently active cloud, its current profile, and information on regional suffixes and host names.

To get the active cloud and a list of all the available clouds:

```azurecli-interactive
az cloud list --output table
```

```Output
IsActive    Name               Profile
----------  -----------------  ---------
True        AzureCloud         latest
            AzureChinaCloud    latest
            AzureUSGovernment  latest
            AzureGermanCloud   latest
```

The currently active cloud has `True` in the `IsActive` column. Only one cloud can be active at any
time. To get more detailed information on a cloud, including the endpoints that it uses for Azure
services, use the `cloud show` command:

```azurecli-interactive
az cloud show --name AzureChinaCloud --output json
```

```json
{
  "endpoints": {
    "activeDirectory": "https://login.chinacloudapi.cn",
    "activeDirectoryDataLakeResourceId": null,
    "activeDirectoryGraphResourceId": "https://graph.chinacloudapi.cn/",
    "activeDirectoryResourceId": "https://management.core.chinacloudapi.cn/",
    "batchResourceId": "https://batch.chinacloudapi.cn/",
    "gallery": "https://gallery.chinacloudapi.cn/",
    "management": "https://management.core.chinacloudapi.cn/",
    "resourceManager": "https://management.chinacloudapi.cn",
    "sqlManagement": "https://management.core.chinacloudapi.cn:8443/",
    "vmImageAliasDoc": "https://raw.githubusercontent.com/Azure/azure-rest-api-specs/master/arm-compute/quickstart-templates/aliases.json"
  },
  "isActive": false,
  "name": "AzureChinaCloud",
  "profile": "latest",
  "suffixes": {
    "azureDatalakeAnalyticsCatalogAndJobEndpoint": null,
    "azureDatalakeStoreFileSystemEndpoint": null,
    "keyvaultDns": ".vault.azure.cn",
    "sqlServerHostname": ".database.chinacloudapi.cn",
    "storageEndpoint": "core.chinacloudapi.cn"
  }
}
```

## Switch the active cloud

To set the default cloud using a configuration file, see
[CLI configuration values and environment variables][01]. To switch the active cloud, run the
[az cloud set][06] command. This command takes one required argument, the name of the cloud.

```azurecli-interactive
az cloud set --name AzureChinaCloud
```

> [!IMPORTANT]
> If your authentication for the activated cloud expired, you must reauthenticate before performing
> any other tasks with the Azure CLI. If this is your first time switching to the new cloud, you
> must also set the active subscription. For instructions on authenticating, see
> [Sign in with Azure CLI][09]. For information on subscription management, see
> [Manage Azure subscriptions with Azure CLI][10]

## Register a new cloud

Register a new cloud if you have your own endpoints for Azure Stack. Creating a cloud is performed
with the [az cloud register][05] command. This command requires a name and a set of service
endpoints. To learn how to register a cloud for use with Azure Stack, see
[Use API version profiles with Azure CLI in Azure Stack][03].

You don't need to register information for the China, US Government, or German regions. Microsoft
manages these clouds, and they're available by default. For more information on the available
endpoint settings, see the [documentation for `az cloud register`][05].

Registering a cloud doesn't automatically switch to it. Use the `az cloud set` command to select the
newly created cloud.

## Update an existing cloud

If you have permissions, you can also update an existing cloud. Updating a cloud switches to a
different Azure services profile or modifies the connection endpoints. Update a cloud with the
[az cloud update][08] command, which takes the same arguments as `az cloud register`.

## Unregister a cloud

If you no longer need a created cloud, it can be unregistered with the [az cloud unregister][07]
command:

```azurecli-interactive
az cloud unregister --name MyCloud
```

<!-- link references -->

[01]: ./azure-cli-configuration.md#cli-configuration-values-and-environment-variables
[02]: /azure/azure-stack/user/
[03]: /azure/azure-stack/user/azure-stack-version-profiles-azurecli2#connect-to-azure-stack
[04]: /cli/azure/cloud#az_cloud_list
[05]: /cli/azure/cloud#az_cloud_register
[06]: /cli/azure/cloud#az_cloud_set
[07]: /cli/azure/cloud#az_cloud_unregister
[08]: /cli/azure/cloud#az_cloud_update
[09]: authenticate-azure-cli.md
[10]: manage-azure-subscriptions-azure-cli.md
