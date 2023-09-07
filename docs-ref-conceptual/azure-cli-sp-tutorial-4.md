---
title: Work with Azure service principals using a password – Azure CLI | Microsoft Docs
description: Use service principals with a password to gain control over which Azure resources can be accessed.
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

# 4 - Sign in using a service principal

## Using Service Principal with password-based authentication

When creating a [Service Principal](./azure-cli-sp-tutorial-1.md), you can choose either password-based or [certificate based-authentication](./azure-cli-sp-tutorial-5.md). This article details how you can use a **password** with the service principal to access the Azure Container Registry.

### How does password-based authentication work?

With password-based authentication, a random password is created for you. If you don't specify a `--name` parameter value, a name containing a time stamp is created for you.  You must specify a `--scopes` as this value doesn't have a default.  If you prefer, you can set the role assignment later by using [az role assignment create](/cli/azure/role/assignment#az-role-assignment-create).

```azurecli-interactive
# Create a service principal with required parameter
az ad sp create-for-rbac --scopes /subscriptions/mySubscriptionID

# Create a service principal for a resource group using a preferred name and role
az ad sp create-for-rbac --name myServicePrincipalName \
                         --role reader \
                         --scopes /subscriptions/mySubscriptionID/resourceGroups/myResourceGroupName
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
az ad sp create-for-rbac --name $servicePrincipalName --role $roleName --scopes /subscriptions/$subscriptionID/resourceGroups/$resourceGroup
```

Output Console:

```
{
  "appId": "myAppId",
  "displayName": "myDisplayName",
  "password": "myPassword",
  "tenant": "myTentantId"
}

```

The output for a service principal with password authentication includes the `password` key. __Make sure you copy this value__ - it can't be retrieved. If you lose the password, [reset the service principal credentials](./azure-cli-sp-tutorial-7.md).

### Sign in with a service principal using a password

You can test the new service principal's credentials and permissions by signing in. To sign in with a service principal, you need the `appId`, `tenant`, and credentials.

To learn more about signing in with a service principal, see [Sign in with the Azure CLI](authenticate-azure-cli.md).

To sign in with a service principal using a password:

> [!IMPORTANT]
> Make sure to use the same password key you received as the output for the service principal in the previous step

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

Now that you've learned how to work with service principals using a password, proceed to the next step to learn how to work with service principals using a certificate.

> [!div class="nextstepaction"]
> [Work with service principals using a certificate](./azure-cli-sp-tutorial-5.md)