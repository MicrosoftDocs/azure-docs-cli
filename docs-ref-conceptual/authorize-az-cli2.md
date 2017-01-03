---
title: Aurhorize with the Azure CLI 2.0 (Preview)
description: How to authorize using Azure CLI 2.0 (Preview) interactrively or using a service principal
keywords: Azure CLI 2.0 (Preview), Authorize, Azure Python CLI
author: allclark
manager: douge
ms.author: allclark
ms.date: 12/29/2016
ms.topic: article
ms.prod: azure
ms.technology: azure
ms.devlang: azure-cli
ms.assetid: 5e3c57b4-6cfb-44d5-aae6-f8f83d54354b
---

# Authorize with Azure CLI 2.0 (Preview)

You can authorize with Azure CLI 2.0 (Preview) interactively,
by providing your credentials on the command-line, or using a service principal.

> Azure CLI 2.0 is in preview and it works only with the resource manager deployment model.
> You can also [install Azure CLI](/azure/xplat-cli-install),
> which is released and works with all services. 

## Interactive

1. Run the login command.

    ```azurecli
    az login
    ```
    
    You'll be prompted to open https://aka.ms/devicelogin and enter a code.

1. Use a web browser to open the page https://aka.ms/devicelogin and enter the code to authenticate.

    You'll be prompted to log in using your credentials.
    
1. Log in.

## Command-line

Provide your credentials on the command-line.

```azurecli
az login -u <username> -p <password>
```

> You can't log in this way if your account has enabled multi-factor authentication.

## Service principal

A service principal is a little more work,
but it's a good way to authorize your automated tasks with just the credentials needed for that task.

1. If you don't already have one, create a service principal with the appropriate role assignment.

    ```azurecli
    az ad sp create-for-rbac -n "http://my-app" --role contributor --scopes
        /subscriptions/11111111-2222-3333-4444-555555555555/resourceGroups/mygroup
        /subscriptions/11111111-2222-3333-4444-666666666666/resourceGroups/my-another-group
    ```

    > You can add role assignments after you create the role, too, using `az role assignments`.

1. Log in with the service principal.

    ```azurecli
    az login --service-principal -u "http://my-app" -p <password> --tenant <tenant>
    ```

