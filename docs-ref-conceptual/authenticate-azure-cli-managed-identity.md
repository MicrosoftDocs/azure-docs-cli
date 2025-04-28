---
title: Sign into Azure using a managed identity and Azure CLI
description: Learn how to sign into Azure using a managed identity and Azure CLI. Find links to articles that show how to use the Azure CLI to manage Azure identities.
ms.topic: concept-article
ms.service: azure-cli
ms.custom: devx-track-azurecli
#customer intent: As an app developer, I need to security automate authentication to Azure using a managed identity.
---

# Sign into Azure with a managed identity using Azure CLI

On resources configured for managed identities for Azure resources, you can sign in using the
managed identity. Here are some of the benefits of using managed identities:

- You don't need to manage credentials. You can't even access the credentials.
- You can use managed identities to authenticate to any resource that supports Microsoft Entra
  authentication, including your own applications.
- You don't incur extra costs for using managed identities.

To sign in with the resource's identity, use the `--identity` flag.

To sign in with a system-assigned managed identity:

```azurecli-interactive
az login --identity
```

To sign in with a user-assigned managed identity, specify the client ID, object ID, or resource ID
of the user-assigned managed identity with `--username`:

```azurecli-interactive
az login --identity --username <client_id|object_id|resource_id>
```

To learn more about managed identities for Azure resources, see
[What are managed identities for Azure resources?][10].

Here are three articles showing the use of the `az login --identity` command:

- [How to use managed identities for Azure resources on an **Azure VM** for sign-in][02].
- [Use an Azure managed identity to authenticate to an **Azure container registry**][08]
- [How to use managed identities with **Azure container instances**][07]

Here are popular articles for specific Azure services that show how to work with managed identities
using Azure CLI commands:

- [Use a managed identity in **Azure Kubernetes Service** (AKS)][03]
- [How to use Azure managed identities for **Azure Service** and **Azure functions**][04]
- [Create an **Azure SQL Managed Instance** with a user-assigned managed identity][05]
- [How to use Managed Identity with **Azure Communication Services**][06]
- [Configure managed identities with Microsoft Entra ID for your **Azure Cosmos DB** account][09]

## See also

- [A to Z list][01] of Azure CLI reference commands that manage Azure identities.

<!-- link references -->

[01]: ./manage-azure-identities-azure-cli.md
[02]: /azure/active-directory/managed-identities-azure-resources/how-to-use-vm-sign-in
[03]: /azure/aks/use-managed-identity
[04]: /azure/app-service/overview-managed-identity?tabs=cli%2Chttp
[05]: /azure/azure-sql/managed-instance/authentication-azure-ad-user-assigned-managed-identity-create-managed-instance?tabs=azure-cli
[06]: /azure/communication-services/how-tos/managed-identity?tabs=cli%2Cdotnet
[07]: /azure/container-instances/container-instances-managed-identity
[08]: /azure/container-registry/container-registry-authentication-managed-identity?tabs=azure-cli
[09]: /azure/cosmos-db/how-to-setup-managed-identity#using-the-azure-cli
[10]: /entra/identity/managed-identities-azure-resources/overview
