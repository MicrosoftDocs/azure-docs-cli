---
title: Get started with Azure CLI 2.0
description: Get started with Azure CLI 2.0 on Linux, Mac, or Windows.
keywords: Azure CLI 2.0, Linux, Mac, Windows, OS X, Ubuntu, Debian, CentOS, RHEL, SUSE, CoreOS, Docker, Windows, Python, PIP
author: allclark
manager: douge
ms.date: 02/22/2017
ms.topic: article
ms.prod: azure
ms.technology: azure
ms.assetid: 98fb955e-6dbf-47e2-80ac-170d6d95cb70
---

## Manage multiple Azure Subscriptions

If you are brand new to Azure, you probably only have a single subscription.
But if you have been using Azure for a while, you might have created multiple Azure subscriptions.
If so, you can configure Azure CLI 2.0 to execute commands against a particular subscription.

1. Get a list of all subscriptions in your account.

    ```azurecli
    az account list --output table
    ```

    ```Output
    Name                                         CloudName    SubscriptionId                        State     IsDefault
    -------------------------------------------  -----------  ------------------------------------  --------  -----------
    My Producton Subscription                    AzureCloud   1c638cf4-608f-4ee6-b680-c329e824c3a8  Enabled
    My DevTest Subscription                      AzureCloud   b6aa872b-f6a7-4cdc-bbc6-0fce6a8b9910  Enabled   True
    My Demos                                     AzureCloud   ff696af2-840a-43d1-af03-8f78cdfb5185  Enabled
    ```

1. Set the default.
 
    ```azurecli
    az account set --subscription "My Demos"
    ```

You can verify the change by running the `az account list --output table` command again.

Once you set your default subscription, all subsequent Azure CLI commands run against this subscription.
