---
title: Sign in with Azure CLI — Login and Authentication
description: Learn the different authentication types for your Azure CLI login — sign in with Azure CLI automatically, locally, or interactively using the az login command.
ms.service: azure-cli
ms.custom: devx-track-azurecli
#customer intent: As a new user of the Azure CLI, I want to learn about the different authentication methods I can use to sign into Azure.
---

# Authenticate to Azure using Azure CLI

The Azure CLI supports several authentication methods. To keep your Azure resources secure, restrict
sign-in permissions for your use case.

## Sign into Azure with Azure CLI

There are four authentication options when working with the Azure CLI:

|          Authentication method          |                                                                                                                                 Advantage                                                                                                                                 |
| --------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [Azure Cloud Shell][08]                 | Azure Cloud Shell automatically logs you in, which is the easiest way to get started.                                                                                                                                                                                      |
| [Sign in interactively][01]             | This option is good when learning Azure CLI commands and running the Azure CLI locally. With the [az login][09] command, you log in through your browser. Interactive login also gives you a subscription selector to automatically set your default subscription.        |
| [Sign in with a managed identity][02]   | [Managed identities][12] provide an Azure-managed identity for applications to use when connecting to resources that support Microsoft Entra authentication. Using a managed identity eliminates the need to manage secrets, credentials, certificates, and keys. |
| [Sign in using a service principal][03] | When you write scripts, using a [service principal][10] is the recommended authentication approach. You grant just the appropriate permissions needed to a service principal, keeping your automation secure.                                                             |

## Multi-factor authentication (MFA)

[!INCLUDE [MFA](includes/multifactor-authentication.md)]

## Find or change your current subscription

After you sign in, CLI commands run against your default subscription. If you have multiple
subscriptions, change your default subscription using `az account set --subscription`.

```azurecli-interactive
az account set --subscription "<subscription ID or name>"
```

To learn more about managing Azure subscriptions, see
[How to manage Azure subscriptions with the Azure CLI][05].

## Refresh tokens

[!INCLUDE [refresh-token](includes/refresh-token.md)]

> [!NOTE]
> Depending on your sign-in method, your tenant might have [Conditional Access policies][11] that
> restrict your access to certain resources.

## See also

- [Azure CLI onboarding cheat sheet][04]
- [Manage Azure subscriptions with the Azure CLI][05]
- Find Azure CLI [samples][07] and [published articles][06].

<!-- link references -->

[01]: ./authenticate-azure-cli-interactively.md
[02]: ./authenticate-azure-cli-managed-identity.md
[03]: ./authenticate-azure-cli-service-principal.md
[04]: ./cheat-sheet-onboarding.md
[05]: ./manage-azure-subscriptions-azure-cli.md
[06]: ./reference-docs-index.md
[07]: ./samples-index.md
[08]: /azure/cloud-shell/overview
[09]: /cli/azure/reference-index#az-login
[10]: /entra/identity-platform/app-objects-and-service-principals
[11]: /entra/identity/conditional-access/overview
[12]: /entra/identity/managed-identities-azure-resources/overview
