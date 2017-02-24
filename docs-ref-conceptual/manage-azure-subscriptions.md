---
title: Manage Azure subscriptions with Azure CLI 2.0
description: Manage Azure subscriptions with Azure CLI 2.0 on Linux, Mac, or Windows.
keywords: Azure CLI 2.0, Linux, Mac, Windows, OS X, subscription
author: kamaljit
manager: douge
ms.date: 02/27/2017
ms.topic: article
ms.prod: azure
ms.technology: azure
ms.assetid: 98fb955e-6dbf-47e2-80ac-170d6d95cb70
---

## Manage multiple Azure subscriptions

If you are brand new to Azure, you probably only have a single subscription.
But if you have been using Azure for a while, you may have created multiple Azure subscriptions.
If so, you can configure Azure CLI 2.0 to execute commands against a particular subscription.

1. Get a list of all subscriptions in your account.

    ```azurecli
    az account list --output table
    ```

    ```Output
    Name                                         CloudName    SubscriptionId                        State     IsDefault
    -------------------------------------------  -----------  ------------------------------------  --------  -----------
    My Production Subscription                    AzureCloud   XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX  Enabled
    My DevTest Subscription                      AzureCloud   XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX  Enabled   True
    My Demos                                     AzureCloud   XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX  Enabled
    ```

1. Set the default.
 
    ```azurecli
    az account set --subscription "My Demos"
    ```

You can verify the change by running the `az account list --output table` command again.

Once you set your default subscription, all subsequent Azure CLI commands run against this subscription.
