---
title: Get an existing service principal – Azure CLI | Microsoft Docs
description: Learn how to retrieve an existing service principal.
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

# 4 - Get an existing service principal

If you already have an existing service principal that you wish to use, this steps details how to retrieve your existing service principal.

A list of the service principals in a tenant can be retrieved with [az ad sp list](/cli/azure/ad/sp#az-ad-sp-list). By default this command returns the first 100 service principals for your tenant. To get all of a tenant's service principals, use the `--all` parameter. Getting this list can take a long time, so it's recommended that you filter the list with one of the following parameters:

* `--display-name` requests service principals that have a _prefix_ that match the provided name. The display name of a service principal is the value set with the `--name`
parameter during creation. If you didn't set `--name` during service principal creation, the name prefix is `azure-cli-`.
* `--spn` filters on exact service principal name matching. The service principal name always starts with `https://`.
if the value you used for `--name` wasn't a URI, this value is `https://` followed by the display name.
* `--show-mine` requests only service principals created by the signed-in user.
* `--filter` takes an OData filter, and performs _server-side_ filtering. This method is recommended over filtering client-side with the CLI's `--query` parameter. To learn about OData filters, see [OData expression syntax for filters](/rest/api/searchservice/odata-expression-syntax-for-azure-search).

The information returned for service principal objects is verbose. To get only the information necessary for sign-in, use the query string
`[].{id:appId, tenant:appOwnerOrganizationId}`. For example, to get the sign-in information for all service principals created by the currently logged in user:

```azurecli-interactive
az ad sp list --show-mine --query "[].{SPname:displayName, SPid:appId, tenant:appOwnerTenantId}"
```

If you are working in a large organization with many service principals, try these command examples:

```
# get service principals containing a keyword
az ad sp list --display-name mySearchWord --output table

# get service principals using an OData filter
az ad sp list --filter "displayname eq 'myServicePrincipalName'"

# get a service principal having a certain servicePrincipalNames property value
az ad sp list --spn https://spURL.com
```

> [!IMPORTANT]
>
> The user and tenant can both be retrieved with [`az ad sp list](/cli/azure/ad/sp#az-ad-sp-list) and [az ad sp show](/cli/azure/ad/sp#az-ad-sp-show), but authentication secrets _or_ the authentication method is not available. Secrets for certificates in Key Vault can be retrieved with [az keyvault secret show](/cli/azure/keyvault/secret#az-keyvault-secret-show), but no other secrets are stored by default. If you forget an authentication method or secret, [reset the service principal credentials](./azure-cli-sp-tutorial-7.md).

## Next Steps

Now that you've learned how to retrieve your existing service principal, proceed to the next step to learn how to manage your service principal roles.

> [!div class="nextstepaction"]
> [Manage service principal roles](./azure-cli-sp-tutorial-5.md)
