---
ms.date: 02/15/2025
ms.topic: include
ms.custom: devx-track-azurecli
---

Starting in 2025, Microsoft will enforce mandatory MFA for Azure CLI and other command-line tools. MFA will only impact Microsoft Entra ID [user identities](/entra/fundamentals/how-to-create-delete-users).
It will not impact workload identities, such as [service principals](/entra/identity-platform/app-objects-and-service-principals)
and [managed identities](/entra/identity/managed-identities-azure-resources/overview).

If you are using [az login](/cli/azure/reference-index#az-login) with an Entra ID and password to authenticate a script or automated process, plan now to migrate to a workload identity. For more information, see [The impact of multifactor authentication on Azure CLI in automation scenarios](../authenticate-azure-cli-mfa.md).
