---
title: Manage Azure subscriptions with the Azure CLI (preview)
description: Learn how the next-generation Azure CLI preview selects a subscription, and how to switch subscriptions, target one subscription for a single command, and list the subscriptions you can access.
author: msmbaldwin
ms.author: mbaldwin
ms.service: azure-cli
ms.topic: how-to
ms.date: 11/16/2026
ms.custom: devx-track-azurecli
ai-usage: ai-generated
---

# Manage Azure subscriptions with the Azure CLI (preview)

In the Azure CLI preview, the subscription that commands use comes from your active _profile_, the saved sign-in context that `az login` creates. The preview doesn't include the classic `az account list`, `az account set`, or `az account show` commands. Instead, you change subscriptions by switching profiles, or you target a subscription for a single command.

This article shows how to check the current subscription, switch subscriptions, run one command against a different subscription, and list the subscriptions you can access.

## Prerequisites

- Azure CLI preview, installed and signed in. For more information, see [Sign in interactively with the Azure CLI (preview)](authenticate-azure-cli-interactively.md).

## Check the current subscription

Show the active profile:

```bash
az profile show --active
```

The output includes the tenant and subscription that commands use when you don't specify a subscription.

## Switch subscriptions

To make a different subscription the default for later commands, save a profile for it, and then make that profile active.

1. Sign in to the subscription and save the sign-in as a named profile:

    ```bash
    az login --tenant-id <tenant-id> --subscription-id <subscription-id> --out-profile prod
    ```

    A new profile becomes the active profile as soon as you create it.

1. Later, to switch back to an existing profile, use `az profile set`. Switching doesn't sign you in again:

    ```bash
    az profile set --name dev
    ```

To see all your saved profiles and the subscription each one uses, run `az profile list`.

## Run one command against a different subscription

To run a single command in a different subscription without changing the active profile, use either of these parameters:

- `--subscription-id`, which resource management commands such as `az group`, `az vm`, and `az deployment group` accept:

    ```bash
    az group list --subscription-id <subscription-id>
    ```

- `--profile`, which uses the tenant, subscription, and sign-in saved in another profile:

    ```bash
    az group list --profile prod
    ```

In both cases, the active profile doesn't change.

## List the subscriptions you can access

The preview doesn't include a command that lists subscriptions. Use `az rest` to call the Azure Resource Manager [Subscriptions - List](/rest/api/resources/subscriptions/list) API instead:

```bash
az rest --method GET --uri "/subscriptions?api-version=2022-12-01"
```

The response body contains a `value` array with one entry for each subscription in the tenant of your active profile. Each entry includes `subscriptionId`, `displayName`, `state`, and `tenantId`. `az rest` doesn't follow paged results. If the response includes a `nextLink` value, call `az rest` again with that URL to get the next page.

## Related content

- For more information, see [Sign in interactively with the Azure CLI (preview)](authenticate-azure-cli-interactively.md).
- For more information, see [Manage sign-in profiles](profile-base-login.md).
- For more information, see [Quickstart: Set up and switch sign-in profiles](quickstart-profiles.md).
- For more information, see [Discover commands and call Azure REST APIs](how-to-discover-commands-rest.md).
