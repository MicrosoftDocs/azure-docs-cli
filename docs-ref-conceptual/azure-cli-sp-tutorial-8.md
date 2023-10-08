---
title: Service principal cleanup and troubleshooting using Azure CLI | Microsoft Docs
description: Learn how to cleanup and troubleshoot service principals.
manager: jasongroce
author: dbradish-microsoft
ms.author: dbradish
ms.date: 09/29/2023
ms.topic: conceptual
ms.service: azure-cli
ms.tool: azure-cli
ms.custom: devx-track-azurecli
keywords: azure service principal, create service principal azure, create service principal azure cli
---

# Cleanup & troubleshooting

Now that you have completed the tutorial, it's time to clean up the created service principal resources.

## Cleanup resources

The safest way to remove all resources used in this tutorial is to use [az group delete](/cli/azure/group#az-group-delete). The `--no-wait` parameter keeps the CLI from blocking while the deletion takes place.

```
az group delete --name myResourceGroup --no-wait
```

If you prefer, delete individual service principals with the [az ad sp delete](/cli/azure/ad/sp#az-ad-sp-delete) command.

```azurecli-interactive
az ad sp delete --id myServicePrincipalID
```

## Troubleshooting

Congratulations! You learned how to create, retrieve, and work with service principals! Although you have completed the tutorial, you may still have questions regarding service principals that can be answered in this section.

### Insufficient privileges

If your account doesn't have permission to create a service principal, `az ad sp create-for-rbac` returns an error message containing "Insufficient privileges to complete the operation." Contact your Azure Active Directory admin to obtain `User Access Administrator` or `Role Based Access Control Administrator` permissions.

### Invalid tenant

If you have specified an invalid subscription ID, you see the error message "The request didn't have a subscription or a valid tenant level resource provider." If using variables, use the Bash `echo` command to see the value being passed to the reference command. Use [az account set](/cli/azure/account#az-account-set) to change your subscription or learn [How to manage Azure subscriptions with the Azure CLI](./manage-azure-subscriptions-azure-cli.md).

### Resource group not found

If you have specified an invalid resource group name, you see the error message "Resource group 'name' couldn't be found." If using variables, use the Bash `echo` command to see the value being passed to both the subscription and reference commands. Use [az group list](/cli/azure/group#az-group-list) to see the resource groups for the current subscription, or learn [How to manage Azure resource groups with the Azure CLI](./manage-azure-groups-azure-cli.md).

### Authorization to perform action

If your account doesn't have permission to assign a role, you see an error message that your account "does not have authorization to perform action 'Microsoft.Authorization/roleAssignments/write'." Contact your Azure Active Directory admin to manage roles.

### Interactive authentication is needed

 When signing in with password authentication, error message "...Interactive authentication is needed..." occurs if your organization requires multifactor authentication. Switch to certificate-based authentication, or consider using [managed identities](/azure/active-directory/managed-identities-azure-resources/overview).

### Compliant device required

If you try to create a service principal using a device that is not compliant with your organizations access policies, you will receive message "...Conditional Access policy requires a compliant device...".  Switch to a computer that meets your organization's access policies.

## See also

* [Application and service principal objects in Microsoft Entra ID](/azure/active-directory/develop/app-objects-and-service-principals)
* [Manage service principals using the Azure portal](/azure/developer/python/how-to-manage-service-principals)
* [Azure authentication with service principals](/azure/developer/java/sdk/identity-service-principal-auth)
* [View the service principal of a managed identity](/azure/active-directory/managed-identities-azure-resources/how-to-view-managed-identity-service-principal-cli)
