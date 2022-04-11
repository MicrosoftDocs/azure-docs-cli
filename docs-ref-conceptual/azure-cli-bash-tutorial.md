--- 
title: Learning Bash with Azure CLI
description: Learning Bash with Azure CLI
author: dbradish-microsoft
ms.author: dbradish
ms.prod: non-product-specific
ms.topic: sample
ms.date: 04/11/2022
---
# Learning Bash with Azure CLI

In this tutorial, you will learn to create and query Azure resource using Bash and the Azure CLI.

> [!div class="checklist"]
>
> - 
> - 

## Starting Bash

Start Bash using Azure Cloud Shell or a local install. 

If you don't have an [Azure subscription](../articles/guides/developer/azure-developer-guide.md#understanding-accounts-subscriptions-and-billing), create an [Azure free account](https://azure.microsoft.com/free/?ref=microsoft.com&utm_source=microsoft.com&utm_medium=docs&utm_campaign=visualstudio) before you begin.

- Use the Bash environment in [Azure Cloud Shell](../articles/cloud-shell/quickstart.md). For more information, see [Azure Cloud Shell Quickstart - Bash](../articles/cloud-shell/quickstart.md).

   [![Launch Cloud Shell in a new window](media/cloud-shell-try-it/hdi-launch-cloud-shell.png)](https://shell.azure.com)
- If you prefer to run CLI reference commands locally, [install](/cli/azure/install-azure-cli) the Azure CLI. If you are running on Windows or macOS, consider running Azure CLI in a Docker container. For more information, see [How to run the Azure CLI in a Docker container](/cli/azure/run-azure-cli-docker).

  - If you're using a local installation, sign in to the Azure CLI by using the [az login](/cli/azure/reference-index#az-login) command. To finish the authentication process, follow the steps displayed in your terminal. For additional sign-in options, see [Sign in with the Azure CLI](/cli/azure/authenticate-azure-cli).

  - When you're prompted, install Azure CLI extensions on first use.  For more information about extensions, see [Use extensions with the Azure CLI](/cli/azure/azure-cli-extensions-overview).
  - Run [az version](/cli/azure/reference-index?#az-version) to find the version and dependent libraries that are installed. To upgrade to the latest version, run [az upgrade](/cli/azure/reference-index?#az-upgrade).

## Querying dictionary results

A command that always returns only a single object return a dictionary. Dictionaries are unordered objects accessed with keys. For this section, we are going to query the [Account](/cli/azure/account) object.

```azurecli-interactive
az account show
```

The command will output a dictionary. Some content has been omitted.

```bash
bash-5.1# az account show
{
  "environmentName": "AzureCloud",
  "isDefault": true,
  "managedByTenants": [],
  "name": "C & L Azure developer experience content projects",
  "state": "Enabled",
  "user": {
    "name": "v-crabeler@microsoft.com",
    "type": "user"
  }
}

```

