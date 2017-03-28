---
title: Log in with Azure CLI 2.0
description: Log in with Azure 2.0 CLI on Linux, Mac, or Windows.
keywords: Azure CLI 2.0, Linux, Mac, Windows, OS X, Ubuntu, Debian, CentOS, RHEL, SUSE, CoreOS, Docker, Windows, Python, PIP
author: rloutlaw
ms.author: routlaw
manager: douge
ms.date: 02/27/2017
ms.topic: article
ms.prod: azure
ms.technology: azure
ms.assetid: 65becd3a-9d69-4415-8a30-777d13a0e7aa
---

# Log in with Azure CLI 2.0

There are several ways to log in and authenticate with the Azure CLI. The simplest way to get started is to log in interactively through your browser, or to log in at the command line. Our recommended approach is to use service principals, which provide a way for you to create non-interactive accounts that you can use to manipulate resources. By granting just the appropriate permissions needed to a service principal, you can ensure your automation scripts are even more secure.

Commands that you run with the CLI are run against your default subscription.  If you have more than one subscription, you may want to [confirm your default subscription](manage-azure-subscriptions-azure-cli.md) and change it appropriately.

## Interactive log-in

Log in interactively from your web browser.

[!INCLUDE [interactive_login](includes/interactive-login.md)]

## Command line

Provide your credentials on the command line.

> This approach doesn't work with Microsoft accounts or accounts that have two-factor authentication enabled.

```azurecli
az login -u <username> -p <password>
```

## Logging in with a service principal

Service principals are like user accounts to which you can apply rules using Azure Active Directory.
Authenticating with a service principal is the best way to secure the usage of your Azure resources
from either your scripts or applications that manipulate resources.
You define the roles you want your users to have via the `az role` set of commands.
You can learn more and see examples of service principal roles in our [az role reference articles](https://docs.microsoft.com/cli/azure/role.md).

1. If you don't already have a service principal, [create one](create-an-azure-service-principal-azure-cli.md).

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
    
