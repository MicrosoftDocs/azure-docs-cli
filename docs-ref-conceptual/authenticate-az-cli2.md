---
title: Log in to Azure CLI 2.0
description: Get started with Azure 2.0 CLI on Linux, Mac, or Windows.
keywords: Azure CLI 2.0, Linux, Mac, Windows, OS X, Ubuntu, Debian, CentOS, RHEL, SUSE, CoreOS, Docker, Windows, Python, PIP
author: allclark
manager: douge
ms.date: 02/18/2017
ms.topic: article
ms.prod: azure
ms.technology: azure
ms.assetid: 65becd3a-9d69-4415-8a30-777d13a0e7aa
---

# Log in to Azure CLI 2.0

There are several ways to log in and authenticate with the Azure CLI. Our recommended approach is to use service principals. However, you can log in interactively through your browser or using a simple login at the command line.

## Interactive log-in

Log in interactively from your web browser.

[!INCLUDE [interactive_login](includes/interactive-login.md)]


## Logging in with a service principal

Service principals are like user accounts to which you can apply rules using Azure Active Directory.  Authenticating with a service principal is the best way to secure the usage of your Azure resources from either your scripts or applications that manipulate resources.  You define the roles you want your users to have via the `az role` set of commands.  You can learn more and see examples of service principal roles in our [az role reference articles](..cli/azure/role.md).

1. Log in with the service principal.

    ```azurecli
    az login --service-principal -u "http://my-app" -p <password> --tenant <tenant>
    ```

    To get your tenant, log in interactively and then get the tenantId from your subscription.

    ```azurecli
    az login
    az account show
    ```

    ```json
    {
        "environmentName": "AzureCloud",
        "id": "********-****-****-****-************",
        "isDefault": true,
        "name": "Pay-As-You-Go",
        "state": "Enabled",
        "tenantId": "********-****-****-****-************",
        "user": {
        "name": "********",
        "type": "user"
        }
    }
    ```
## Command line

Provide your credentials on the command line.

> This approach doesn't work with Microsoft accounts or accounts that have two-factor authentication enabled.

```azurecli
az login -u <username> -p <password>
```
