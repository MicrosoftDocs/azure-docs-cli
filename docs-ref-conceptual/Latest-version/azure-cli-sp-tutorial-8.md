---
title: Cleanup & troubleshoot service principals using Azure CLI
description: Learn how to clean up service principal resources and troubleshoot common Azure CLI errors, including permission, tenant, and authentication issues.
ms.service: azure-cli
ms.custom: devx-track-azurecli
keywords: azure service principal, create service principal azure, create service principal azure cli
---

# Cleanup & troubleshoot service principals

You learned how to create, retrieve, and work with service principals. Now that you completed the
tutorial, it's time to clean up the created service principal resources.

## Cleanup service principal resources

The safest way to remove all resources used in this tutorial is to use [az group delete][08]. The
`--no-wait` parameter keeps the CLI from blocking while the deletion takes place.

```azurecli-interactive
az group delete --name myResourceGroup --no-wait
```

If you prefer, delete individual service principals with the [az ad sp delete][07] command.

```azurecli-interactive
az ad sp delete --id myServicePrincipalID
```

## Troubleshoot service principals

Although you completed the tutorial, you might still have questions regarding service principals
that can be answered in this section.

### Insufficient privileges

If your account doesn't have permission to create a service principal, `az ad sp create-for-rbac`
returns an error message containing "Insufficient privileges to complete the operation." Contact
your Microsoft Entra administrator to obtain `User Access Administrator` or
`Role Based Access Control Administrator` permissions.

### Invalid tenant

If you specified an invalid subscription ID, you see the error message "The request didn't have a
subscription or a valid tenant level resource provider." If using variables, use the Bash `echo`
command to see the value being passed to the reference command. Use [az account set][06] to change
your subscription or learn [How to manage Azure subscriptions with the Azure CLI][02].

### Resource group not found

If you specified an invalid resource group name, you see the error message "Resource group 'name'
couldn't be found." If using variables, use the Bash `echo` command to see the value being passed to
both the subscription and reference commands. Use [az group list][09] to see the resource groups for
the current subscription, or learn [How to manage Azure resource groups with the Azure CLI][01].

### Authorization to perform action

If your account doesn't have permission to assign a role, you see an error message that your account
"doesn't have authorization to perform action 'Microsoft.Authorization/roleAssignments/write'."
Contact your Microsoft Entra administrator to manage roles.

### Interactive authentication is needed

When signing in with password authentication, error message "...Interactive authentication is
needed..." occurs if your organization requires multifactor authentication. Switch to
certificate-based authentication, or consider using [managed identities][05].

### Compliant device required

If you try to create a service principal using a device that's not compliant with your
organization's access policies, you receive the message "...Conditional Access policy requires a
compliant device...". Switch to a computer that meets your organization's access policies.

### Potential identity-modification risk

The `az ad sp create-for-rbac` and `az ad app create` commands can modify an existing application or
service principal if another object shares the same **display name**. Display names aren't unique
and can change, which could result in credential loss or incorrect RBAC assignments. Use a **unique
object ID or app ID** instead.

## See also

- [Application and service principal objects in Microsoft Entra ID][03]
- [Create a service principal using the Azure portal][04]
- [Create an Azure service principal with Azure PowerShell][10]

<!-- link references -->

[01]: ./manage-azure-groups-azure-cli.md
[02]: ./manage-azure-subscriptions-azure-cli.md
[03]: /azure/active-directory/develop/app-objects-and-service-principals
[04]: /azure/active-directory/develop/howto-create-service-principal-portal
[05]: /azure/active-directory/managed-identities-azure-resources/overview
[06]: /cli/azure/account#az-account-set
[07]: /cli/azure/ad/sp#az-ad-sp-delete
[08]: /cli/azure/group#az-group-delete
[09]: /cli/azure/group#az-group-list
[10]: /powershell/azure/create-azure-service-principal-azureps
