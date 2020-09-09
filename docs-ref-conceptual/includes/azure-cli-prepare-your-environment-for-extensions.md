---
ms.topic: include
ms.date: 09/10/2020
author: dbradish-microsoft
ms.author: dbradish
manager: barbkess
---

## Prepare your environment

## Prepare your environment

1. Do a [local install](install-azure-cli.md) of the Azure CLI or start [Azure Cloud Shell](start-azure-cloud-shell.md) to run Azure CLI commands.

1. Sign in using the [az login](/cli/azure/reference-index#az-login) command if you're using a local install.  Follow the steps displayed in your terminal to complete the authentication process.  See [Sign in with Azure CLI](authenticate-azure-cli.md) for additional sign in options.
1. If you don't have a resource group, create one using the [az group create](/cli/azure/group#az-group-create) command.  See [What is Azure Resource Manager](/azure/azure-resource-manager/management/overview) to learn more about resource groups.
1. When working with extension references for the Azure CLI, you must first install the extension. Azure CLI extensions give you access to experimental and pre-release commands that have not yet shipped as part of the core CLI. To learn more about extensions including updating and uninstalling, see [Use extensions with Azure CLI](/cli/azure/azure-cli-extensions-overview).

   Get a list of available extensions

    ```azurecli
    az extension list-available
   ```

   Install an extension substituting **extensionName** with a valid extension name.
   ```azurecli
   az extension add --name extensionName
   ```