---
title: Work with Azure service principals using a password – Azure CLI | Microsoft Docs
description: Use service principals with a password to gain control over which Azure resources can be accessed.
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

# 2 - Create a service principal with password-based authentication

When creating a service principal, you choose the type of sign-in authentication it uses. There are two types of authentication available for Azure service principals: **password-based authentication** and **certificate-based authentication**. Password-based authentication is good to use when learning about service principals, but it is not recommended for applications.

This step in the tutorial explains how to use a service principal password to access an Azure resource.

## How does password-based authentication work?

With password-based authentication, a random password is created for you.

```azurecli-interactive
# Create a service principal for a resource group using a preferred name and role
az ad sp create-for-rbac --name spNameForMyApp \
                         --role reader \
                         --scopes /subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/myRG1
```

You can also create a service principal using variables:

```azurecli-interactive
let "randomIdentifier=$RANDOM*$RANDOM"
servicePrincipalName="msdocs-sp-$randomIdentifier"
roleName="azureRoleName"
subscriptionID=$(az account show --query id -o tsv)
# Verify the ID of the active subscription
echo "Using subscription ID $subscriptionID"
resourceGroup="myResourceGroupName"

echo "Creating SP for RBAC with name $servicePrincipalName, with role $roleName and in scopes /subscriptions/$subscriptionID/resourceGroups/$resourceGroup"
az ad sp create-for-rbac --name $servicePrincipalName \
                         --role $roleName \
                         --scopes /subscriptions/$subscriptionID/resourceGroups/$resourceGroup
```

Output Console:

```
{
  "appId": "myAppId",
  "displayName": "myServicePrincipalName",
  "password": "myServicePrincipalPassword",
  "tenant": "myTentantId"
}
```

The output for a service principal with password authentication includes the `password` key. __Make sure you copy this value__ - it can't be retrieved. If you lose the password, [reset the service principal credentials](./azure-cli-sp-tutorial-7.md).

## Sign in with a service principal using a password

You can test the new service principal's credentials and permissions by signing in. To sign in with a service principal, you need the `appId`, `tenant`, and credentials. Here is an example:

```azurecli-interactive
az login --service-principal --username appID --password PASSWORD --tenant tenantID
```

> [!IMPORTANT]
> If you want to avoid displaying your password on console and are using `az login` interactively,
> use the `read -s` command under `bash`.
>
> ```bash
> read -sp "Azure password: " AZ_PASS && echo && az login --service-principal -u <app-id> -p $AZ_PASS --tenant <tenant>
> ```
>
> Under PowerShell, use the `Get-Credential` cmdlet.
>
> ```powershell
> $AzCred = Get-Credential -UserName <app-id>
> az login --service-principal -u $AzCred.UserName -p $AzCred.GetNetworkCredential().Password --tenant <tenant>
> ```


## Next Steps

Now that you've learned how to work with service principals using a password, proceed to the next step to learn how to use service principals with certificate-based authentication.

> [!div class="nextstepaction"]
> [Work with service principals using a certificate](./azure-cli-sp-tutorial-3.md)
