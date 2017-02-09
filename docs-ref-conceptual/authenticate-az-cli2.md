---
title: Log in to Azure CLI 2.0 (Preview)
description: Get started with Azure 2.0 CLI on Linux, Mac, or Windows.
keywords: Azure CLI 2.0 (Preview), Linux, Mac, Windows, OS X, Ubuntu, Debian, CentOS, RHEL, SUSE, CoreOS, Docker, Windows, Python, PIP
author: allclark
manager: douge
ms.date: 02/18/2017
ms.topic: article
ms.prod: azure
ms.technology: azure
ms.assetid: 65becd3a-9d69-4415-8a30-777d13a0e7aa
---

# Log in to Azure CLI 2.0 (Preview)

## Interactive

Log in interactively.

[!INCLUDE [interactive_login](includes/interactive-login.md)]

## Command line

Provide your credentials on the command line.

```azurecli
az login -u <username> -p <password>
```

## Service principal

Service principals are like user accounts to which you can apply rules using AAD.
The rules control who can use the service principal and how they can use them.
Authenticating with a service principal is the best way to secure the usage of your Azure resources
from your scripts or applications that manipulate resources.

1. If you don't already have one, create a service principal with the appropriate role assignment.

    ```azurecli
    az ad sp create-for-rbac -n "http://my-app" --role contributor
    ```

    The `contributor` role is broad and may not be the best choice in your case.
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
