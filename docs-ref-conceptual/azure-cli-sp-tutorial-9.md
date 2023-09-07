---
title: Summary of using Azure service principals – Azure CLI | Microsoft Docs
description: Sumary of what was taught in the service principal tutorial.
manager: jasongroce
author: daphnemamsft
ms.author: daphnema
ms.date: 09/6/2023
ms.topic: conceptual
ms.service: azure-cli
ms.tool: azure-cli
ms.custom: devx-track-azurecli, seo-azure-cli
keywords: azure service principal, create service principal azure, create service principal azure cli
---

# 9 - Summary

## Troubleshooting

Congratulations! You learned how to create, retrieve, and work with service principals in order to create a resource group. Although you have completed the tutorial, you may still have additional questions regarding service principals that can be answered in this article.

### Insufficient privileges
If your account doesn't have permission to create a service principal, `az ad sp create-for-rbac` returns an error message containing "Insufficient privileges to complete the operation." Contact your Azure Active Directory admin to create a service principal.

### Invalid tenant
If you have specified an invalid subscription ID, you see the error message "The request didn't have a subscription or a valid tenant level resource provider."  If using variables, use the Bash `echo` command to see the value being passed to the reference command.  Use [az account set](/cli/azure/account#az-account-set) to change your subscription or learn [How to manage Azure subscriptions with the Azure CLI](./manage-azure-subscriptions-azure-cli.md).

### Resource group not found
If you have specified an invalid resource group name, you see the error message "Resource group 'name' couldn't be found."  If using variables, use the Bash `echo` command to see the value being passed to both the subscription and reference commands.  Use [az group list](/cli/azure/group#az-group-list) to see the resource groups for the current subscription, or learn [How to manage Azure resource groups with the Azure CLI](./manage-azure-groups-azure-cli.md).

### Authorization to perform action
If your account doesn't have permission to assign a role, you see an error message that your account "does not have authorization to perform action 'Microsoft.Authorization/roleAssignments/write'." Contact your Azure Active Directory admin to manage roles.

## See also

* [Application and service principal objects in Azure Active Directory](/azure/active-directory/develop/app-objects-and-service-principals)
* [Manage service principals using the Azure portal](/azure/developer/python/how-to-manage-service-principals)
* [Azure authentication with service principals](/azure/developer/java/sdk/identity-service-principal-auth)
* [Service principals with Azure Kubernetes Service (AKS)](/azure/aks/kubernetes-service-principal)
* [View the service principal of a managed identity](/azure/active-directory/managed-identities-azure-resources/how-to-view-managed-identity-service-principal-cli)
