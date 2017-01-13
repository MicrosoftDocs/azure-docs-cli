---
title: Authenticate with the Azure CLI 2.0 (Preview)
description: How to authenticate using Azure CLI 2.0 (Preview) interactively or using a service principal
keywords: Azure CLI 2.0 (Preview), Authenticate, Azure Python CLI
author: allclark
manager: douge
ms.author: allclark
ms.date: 01/06/2017
ms.topic: article
ms.prod: azure
ms.technology: azure
ms.devlang: azure-cli
ms.assetid: 5e3c57b4-6cfb-44d5-aae6-f8f83d54354b
---

# Authenticate with Azure CLI 2.0 (Preview)

You can log in to Azure CLI 2.0 (Preview) interactively
by providing your credentials on the command-line or by using a service principal.
You'll stay logged unless you log out or you don't use the command-line for a few weeks.

> Azure CLI 2.0 is in preview and it works only with the resource manager deployment model.
> If you're using Azure CLI, 
> which is released and works with all services,
> here's [how to log in with Azure CLI](/azure/xplat-cli-connect).

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
but it's a good way to authenticate your automated tasks with just the credentials needed for that task.

1. If you don't already have one, create a service principal with the appropriate role assignment.

    ```azurecli
    az ad sp create-for-rbac -n "http://my-app" --role contributor
    ```

    The `contributor` role is very broad and may not be the best choice in many cases.
    You can get a list of available roles to see which is appropriate for your case.

    ```azurecli
    az role definition list --query [*].roleName
    ```

    You can add role assignments after you create the service principal, too.
    
    ```azurecli
    az role assignment --name <roleName>
    ```

1. Log in with the service principal.

    ```azurecli
    az login --service-principal -u "http://my-app" -p <password> --tenant <tenant>
    ```

