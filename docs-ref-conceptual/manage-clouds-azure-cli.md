---
title: Azure cloud management - Azure CLI | Microsoft Docs
description: Create, sign in, and manage multiple clouds with the Azure CLI. Learn how to get information on clouds, change the current cloud, and register/unregister new clouds.
author: dbradish-microsoft
ms.author: dbradish
ms.date: 06/19/2023
ms.topic: conceptual
ms.service: azure-cli
ms.tool: azure-cli
ms.custom: devx-track-azurecli, seo-azure-cli
keywords: azure cloud management
---

# Azure cloud management with the Azure CLI

If you work across different regions or use [Azure Stack](/azure/azure-stack/user/), you may need to use more than one cloud. Microsoft provides clouds for compliance with regional laws, which are available for your use. This article shows you how to get information on clouds, change the current cloud, and register or unregister new clouds.

## List available clouds

You can list available clouds with the [az cloud list](/cli/azure/cloud#az_cloud_list) command. This command shows which cloud is currently active, what its current profile is, and information on regional suffixes and host names.

To get the active cloud and a list of all the available clouds:

```azurecli-interactive
az cloud list --output table
```

```output
IsActive    Name               Profile
----------  -----------------  ---------
True        AzureCloud         latest
            AzureChinaCloud    latest
            AzureUSGovernment  latest
            AzureGermanCloud   latest
```

The currently active cloud has `True` in the `IsActive` column. Only one cloud can be active at any time. To get more detailed information on a cloud, including the endpoints that it uses for Azure services, use the `cloud show` command:

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

To set the default cloud using a configuration file, see [CLI configuration values and environment variables](./azure-cli-configuration.md#cli-configuration-values-and-environment-variables).  To switch the active cloud, run the [az cloud set](/cli/azure/cloud#az_cloud_set) command. This command takes one required argument, the name of the cloud.

```azurecli-interactive
az cloud set --name AzureChinaCloud
```

> [!IMPORTANT]
> If your authentication for the activated cloud has expired, you need to re-authenticate before performing any other CLI tasks. If this is your first time switching to the new cloud, you also need to set the active subscription.
> For instructions on authenticating, see [Sign in with Azure CLI](authenticate-azure-cli.md). For information on subscription management, see [Manage Azure subscriptions with Azure CLI](manage-azure-subscriptions-azure-cli.md)

## Register a new cloud

Register a new cloud if you have your own endpoints for Azure Stack. Creating a cloud is done with the [az cloud register](/cli/azure/cloud#az_cloud_register) command. This command requires a name and a set of service endpoints. To learn how to register a cloud for use with Azure Stack, see [Use API version profiles with Azure CLI in Azure Stack](/azure/azure-stack/user/azure-stack-version-profiles-azurecli2#connect-to-azure-stack).

You don't need to register information for the China, US Government, or German regions. These clouds are managed by Microsoft and available by default.  For more information on all of the available endpoint settings, see the [documentation for `az cloud register`](/cli/azure/cloud#az_cloud_register).

Registering a cloud doesn't automatically switch to it. Use the `az cloud set` command to select the newly created cloud.

## Update an existing cloud

If you have permissions, you can also update an existing cloud. Updating a cloud switches to a different Azure services profile or modifies the connection endpoints.
Update a cloud with the [az cloud update](/cli/azure/cloud#az_cloud_update) command, which takes the same arguments as `az cloud register`.

## Unregister a cloud

If you no longer need a created cloud, it can be unregistered with the [az cloud unregister](/cli/azure/cloud#az_cloud_unregister) command:

```azurecli-interactive
az cloud unregister --name MyCloud
```
