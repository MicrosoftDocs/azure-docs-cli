---
title: Sign in with Azure CLI — Login and Authentication
description: Learn the different authentication types for your Azure CLI login — sign in with Azure CLI automatically, locally, or interactively using the az login command.
ms.date: 09/02/2024
ms.topic: concept-article
ms.service: azure-cli
ms.custom: devx-track-azurecli
#customer intent: As a new user of the Azure CLI, I want to learn about the different authentication methods I can use to sign into Azure.
---

# Authenticate to Azure using Azure CLI

The Azure CLI supports several authentication methods. Restrict sign-in permissions for your use case to keep your Azure resources secure.

## Sign into Azure with Azure CLI

There are five authentication options when working with the Azure CLI:

| Authentication method | Advantage |
|-|-|
| [Azure Cloud Shell](/azure/cloud-shell/overview) | Azure Cloud Shell automatically logs you in and is the easiest way to get started.
| [Sign in interactively](./authenticate-azure-cli-interactively.md) | This is a good option when learning Azure CLI commands and running the Azure CLI locally. Login through your browser with the [az login](/cli/azure/reference-index#az-login) command. Interactive login also gives you a subscription selector to automatically set your default subscription.
| [Sign in with a managed identity](./authenticate-azure-cli-managed-identity.md) | [Managed identities](/entra/identity/managed-identities-azure-resources/overview) provide an Azure-managed identity for applications to use when connecting to resources that support Microsoft Entra authentication. Using a managed identity eliminates the need for you to manage secrets, credentials, certificates, and keys.
| [Sign in using an service principal](./authenticate-azure-cli-service-principal.md) | When you write scripts, using a [service principal](/entra/identity-platform/app-objects-and-service-principals) is the recommended authentication approach. You grant just the appropriate permissions needed to a service principal keeping your automation secure.

## Find or change your current subscription

After you sign in, CLI commands are run against your default subscription. If you have multiple subscriptions, change your default subscription using `az account set --subscription`.

```azurecli-interactive
az account set --subscription "<subscription ID or name>"
```

To learn more about managing Azure subscriptions, see [How to manage Azure subscriptions with the Azure CLI](./manage-azure-subscriptions-azure-cli.md).

## Refresh tokens

[!INCLUDE [refresh-token](includes/refresh-token.md)]

> [!NOTE]
> Depending on your sign in method, your tenant may have [Conditional Access policies](/entra/identity/conditional-access/overview) that restrict your access to certain resources.

## See also

* [Azure CLI onboarding cheat sheet](./cheat-sheet-onboarding.md)
* [Manage Azure subscriptions with the Azure CLI](./manage-azure-subscriptions-azure-cli.md)
* Find Azure CLI [samples](./samples-index.md) and [published articles](./reference-docs-index.md)
