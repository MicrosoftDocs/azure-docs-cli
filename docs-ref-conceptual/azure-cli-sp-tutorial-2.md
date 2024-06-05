---
title: Create a service principal containing password authentication using the Azure CLI | Microsoft Docs
description: Learn to use service principals with a password to control access to Azure resources.
author: dbradish-microsoft
ms.author: dbradish
ms.date: 10/10/2023
ms.topic: conceptual
ms.service: azure-cli
ms.tool: azure-cli
ms.custom: devx-track-azurecli
keywords: azure service principal, create service principal azure, create service principal azure cli
---

# Use an Azure service principal with password-based authentication

When creating a service principal, you choose the type of sign-in authentication it uses. There are two types of authentication available for Azure service principals: **password-based authentication** and **certificate-based authentication**. Password-based authentication is good to use when learning about service principals, but we recommend using [certificate-based authentication](./azure-cli-sp-tutorial-3.md) for applications.

This step in the tutorial explains how to use a service principal password to access an Azure resource.

## Create a service principal containing a password

The default behavior of [az ad sp create-for-rbac](/cli/azure/ad/sp#az_ad_sp_create_for_rbac) is to create a service principal with a random password.

```azurecli-interactive
az ad sp create-for-rbac --name myServicePrincipalName \
                         --role reader \
                         --scopes /subscriptions/mySubscriptionId/resourceGroups/myResourceGroupName
```

Output Console:

```output
{
  "appId": "myServicePrincipalId",
  "displayName": "myServicePrincipalName",
  "password": "myServicePrincipalPassword",
  "tenant": "myOrganizationTenantId"
}
```

The output for a service principal with password authentication includes the `password` key. __Make sure you copy this value__ - it can't be retrieved. If you lose the password, [reset the service principal credentials](./azure-cli-sp-tutorial-7.md).

## Sign in using a service principal using a password

Test the new service principal's credentials and permissions by signing in. To sign in with a service principal, you need the `appId` (also known as "service principal ID", "username" or "assignee"), `tenant`, and `password`. Here's an example:

```azurecli-interactive
az login --service-principal \
         --username myServicePrincipalId \
         --password myServicePrincipalPassword \
         --tenant myOrganizationTenantID
```

If you don't know your `appId` or `--tenant`, retrieve it by using the `az ad sp list` command.

```azurecli-interactive
spID=$(az ad sp list --display-name myServicePrincipalName --query "[].{spID:appId}" --output tsv)
tenantID=$(az ad sp list --display-name myServicePrincipalName --query "[].{tenant:appOwnerOrganizationId}" --output tsv)
echo "Using appId $spID in tenant $tenantID"

az login --service-principal \
         --username $spID \
         --password {paste your password here} \
         --tenant $tenantID
```

If you're testing in an organization that requires two-factor authentication, error message "...Interactive authentication is needed..." is displayed. As an alternative, use a certificate or [managed identities](/azure/active-directory/managed-identities-azure-resources/overview).

> [!IMPORTANT]
> If you want to avoid displaying your password on console and are using `az login` interactively,
> use the `read -s` command in `bash`.
>
> ```bash
> read -sp "Azure password: " AZ_PASS && echo && az login --service-principal -u <app-id> -p $AZ_PASS --tenant <tenant>
> ```
>
>In PowerShell, use the `Get-Credential` cmdlet.
>
> ```powershell
> $AzCred = Get-Credential -UserName <app-id>
> az login --service-principal -u $AzCred.UserName -p $AzCred.GetNetworkCredential().Password --tenant <tenant>
> ```

## Next Steps

Now that you've learned how to work with service principals using a password, proceed to the next step to learn how to use service principals with certificate-based authentication.

> [!div class="nextstepaction"]
> [Use certificate-based authentication](./azure-cli-sp-tutorial-3.md)
