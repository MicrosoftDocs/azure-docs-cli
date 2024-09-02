---
title: Sign into Azure using a managed identity and the Azure CLI
description: Learn how to sign into Azure using an managed identity and the Azure CLI. Find links to articles that show how to use the Azure CLI to manage Azure identities.
ms.date: 09/02/2024
ms.topic: concept-article
ms.service: azure-cli
ms.custom: devx-track-azurecli, seo-azure-cli
#customer intent: As an app developer, I need to security automate authentication to Azure using a managed identity.
---

# Sign into Azure with a managed identity using the Azure CLI 

On resources configured for managed identities for Azure resources, you can sign in using the managed identity.
Here are some of the benefits of using managed identities:

* You don't need to manage credentials. Credentials aren’t even accessible to you.
* You can use managed identities to authenticate to any resource that supports Microsoft Entra authentication, including your own applications.
* Managed identities can be used at no extra cost.

Signing in with the resource's identity is done through the `--identity` flag.

To sign in with a system-assigned managed identity:

```azurecli-interactive
az login --identity
```

To sign in with a user-assigned managed identity, you must specify the client ID, object ID or resource ID of the user-assigned managed identity with `--username`:

```azurecli-interactive
az login --identity --username <client_id|object_id|resource_id>
```

To learn more about managed identities for Azure resources, see [What are managed identities for Azure resources?](/entra/identity/managed-identities-azure-resources/overview). 

Here are three articles showing the use of the `az login --identity` command:

* [How to use managed identities for Azure resources on an Azure VM for sign-in](/azure/active-directory/managed-identities-azure-resources/how-to-use-vm-sign-in).
* [Use an Azure managed identity to authenticate to an Azure container registry](/azure/container-registry/container-registry-authentication-managed-identity?tabs=azure-cli)
* [How to use managed identities with Azure container instances](/azure/container-instances/container-instances-managed-identity)

Here are popular articles for specific Azure services that show how to work with managed identities using Azure CLI commands:

* [Use a managed identity in **Azure Kubernetes Service** (AKS)](/azure/aks/use-managed-identity)
* [How to use Azure managed identities for **Azure Service** and **Azure functions**](/azure/app-service/overview-managed-identity?tabs=cli%2Chttp)
* [Create an **Azure SQL Managed Instance** with a user-assigned managed identity](/azure/azure-sql/managed-instance/authentication-azure-ad-user-assigned-managed-identity-create-managed-instance?tabs=azure-cli)
* [How to use Managed Identity with **Azure Communication Services**](/azure/communication-services/how-tos/managed-identity?tabs=cli%2Cdotnet)
* [Configure managed identities with Microsoft Entra ID for your **Azure Cosmos DB** account](/azure/cosmos-db/how-to-setup-managed-identity#using-the-azure-cli)

## See also

* [A to Z list](./manage-azure-identities-azure-cli.md) of Azure CLI reference commands that manage Azure identities.
