---
title: Manage Azure subscriptions with the Azure CLI
description: Manage Azure subscriptions with the Azure CLI.
author: dbradish-microsoft
ms.author: dbradish
manager: barbkess
ms.date: 09/09/2018
ms.topic: conceptual
ms.service: azure-cli
ms.devlang: azurecli
ms.custom: devx-track-azurecli
---

# Use multiple Azure subscriptions

Most Azure users will only ever have a single subscription.
You might have multiple subscriptions within Azure.
You can be part of more than one organization or your organization might divide access to certain resources across groupings.
The CLI supports selecting a subscription both globally and per command.

For detailed information on subscriptions, billing, and cost management, see the [billing and cost management documentation](/azure/billing/).

## Tenants, users, and subscriptions

You might have some confusion over the difference between tenants, users, and subscriptions within Azure. A _tenant_ is the Azure Active Directory
entity that encompasses a whole organization. This tenant one or more _subscription_ and _user_. A user is an individual and is associated
with only one tenant, the organization that they belong to. Users are those accounts that sign in to Azure to create, manage, and use resources.
A user may have access to multiple _subscriptions_, which are the agreements with Microsoft to use cloud services, including Azure. Every resource
is associated with a subscription.

* To learn more about the differences between tenants, users, and subscriptions, see the [Azure cloud terminology dictionary](/azure/azure-glossary-cloud-terminology).
* To learn how to add a new subscription to your Azure Active Directory tenant, see [Associate or add an Azure subscription to your Azure Active Directory tenant](/azure/active-directory/active-directory-how-subscriptions-associated-directory).
* To learn how to sign in to a specific tenant, see [Sign in with Azure CLI](./authenticate-azure-cli.md).

## Change the active subscription

To access the resources for a subscription, switch your active subscription or use the **--subscription** argument. Switching your subscription
for all commands is done with [az account set](/cli/azure/account#az-account-set).

To switch your active subscription:

1. Get a list of your subscriptions with the [az account list](/cli/azure/account#az-account-list) command:

    ```azurecli
    az account list --output table
    ```

   This command lists all the subscriptions you can access. If you don't see a subscription you expect, add the **--refresh** parameter to get the most current list of subscriptions.

   > [!TIP]
   > The **--output** parameter is a global parameter, available for all commands. The `table` value presents output in a friendly format. For more information, see [Output formats for Azure CLI commands](/cli/azure/format-output-azure-cli).

1. To see the subscription you're currently using, run the [az account show](/cli/azure/account#az_account_show) command:

   ```azurecli
   az account show --output table
   ```

1. Use [az account set](/cli/azure/account#az-account-set) with the subscription ID or name you want to switch to.

    ```azurecli
    az account set --subscription "My Demos"
    ```

   Your subscriptions have both a name and an ID, which is a GUID. You can use either for these commands. If you use a name that includes spaces, use quotation marks.

To run only a single command with a different subscription, use the **--subscription** argument. This argument takes either a subscription ID or subscription name:

```azurecli
az vm create --subscription "My Demos" --resource-group MyGroup --name NewVM --image Ubuntu
```

## Azure CLI config file

There's a configuration file, named *config,* in this location on the computer where you run Azure CLI:

- *$HOME/.azure* on Linux and macOS
- *%USERPROFILE%\.azure* on Windows

In general, don't edit this file directly. Instead, use the [az config](/cli/azure/config) commands.

Try setting your default location by using the [az config set](/cli/azure/config#az_config_set) command:

```azurecli
az config set defaults.location=eastus
```

> [!TIP]
> To see all available locations for the current subscription, use the [az account list-locations](/cli/azure/account#az_account_list_locations) command.

## Set Azure CLI configuration values

To see your current configuration, run the [az config get](/cli/azure/config#az_config_get) command:

```config
az config get
```

This output shows the default location that you set:

```output
  "defaults": [
    {
      "name": "location",
      "source": "%USERPROFILE%\\.azure\\config",
      "value": "eastus"
    }
```

You can set your default subscription for storage commands:

```azurecli
az config set storage.account="My Demos"
```

The command sets a key-value pair, in this case `storage.account`. For available configuration options, see [Azure CLI configuration](/cli/azure/azure-cli-configuration).

Run [az config get](/cli/azure/config#az_config_get) again to see the value for `storage.account`:

```output
  "storage": [
    {
      "name": "account",
      "source": "%USERPROFILE%\\.azure\\config",
      "value": "My Demos"
    }
```

You can change an existing value by using the [az config set](/cli/azure/config#az_config_set) command again or remove the value by running [az config unset](/cli/azure/config#az_config_unset):

```azurecli
az config unset storage.account
```

The value for `storage` is now empty:

```output
  "storage": []
```

## Access tokens

Azure CLI creates an access token when you sign in by using [az login](/cli/azure/reference-index#az_login). This access token is stored in the *accessTokens.json* file in the *.azure* directory.

> [!CAUTION]
> The *accessTokens.json* file and other files in this directory contain unencrypted values. Do not share the contents of this directory.

The access token expires after, at most, an hour. Azure CLI uses a second token, called a refresh token, to get a new token when needed. The refresh token is also stored in the *accessTokens.json* file. The server manages this token.

Unless you sign out by using [az logout](/cli/azure/reference-index#az_logout), you can continue to run commands without signing in again.

## Azure Cloud Shell working directory

Azure Cloud Shell runs Azure CLI as part of the Azure portal instead of locally. 

> [!NOTE]
> Azure Cloud Shell can also run Azure PowerShell. Control which to use by selecting either **Bash** for Azure CLI or **PowerShell** in the upper left corner of the console. For more information, see [Quickstart for Bash in Azure Cloud Shell](/azure/cloud-shell/quickstart).

When you first use Azure Cloud Shell, the portal requires you to create a storage account. The account hosts a file share to support Azure CLI.
Azure Cloud Shell mounts the file share as *clouddrive* in your working directory. For commands and more details, see [How Cloud Shell storage works](/azure/cloud-shell/persisting-shell-storage#how-cloud-shell-storage-works).

Just like your local Azure CLI, there's an *.azure* directory. It contains the same files and works the same way as your local version.

## See also

* [Azure cloud terminology dictionary](/azure/azure-glossary-cloud-terminology)
* [Associate or add an Azure subscription to your Azure Active Directory tenant](/azure/active-directory/active-directory-how-subscriptions-associated-directory)
* [Sign in with Azure CLI](./authenticate-azure-cli.md)
