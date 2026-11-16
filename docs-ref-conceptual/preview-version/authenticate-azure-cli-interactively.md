---
title: Sign in interactively with the Azure CLI (preview)
description: Learn how to sign in to the next-generation Azure CLI preview interactively with az login, save the sign-in as a profile, refresh it, and sign out.
author: msmbaldwin
ms.author: mbaldwin
ms.service: azure-cli
ms.topic: how-to
ms.date: 11/16/2026
ms.custom: devx-track-azurecli
ai-usage: ai-generated
---

# Sign in interactively with the Azure CLI (preview)

Interactive sign-in is the recommended way to authenticate with the Azure CLI preview. You run `az login`, complete sign-in in your browser, and the preview saves the result as a _profile_: a named sign-in context that stores your tenant, subscription, cloud, and identity.

This article shows how to sign in interactively, save and refresh a profile, and sign out. For other sign-in methods, such as managed identities and service principals, see [Get started with the preview](get-started-with-azure-cli.md#authentication).

## Prerequisites

- Azure CLI preview, installed. For more information, see [What is the Azure CLI?](what-is-azure-cli.md).
- An Azure account with access to at least one subscription. If you don't have one, [create a free account](https://azure.microsoft.com/free/).
- The tenant ID and subscription ID that you want to use. To find them, go to the Azure portal, select **Subscriptions**, select the subscription, and then review **Overview**.

## Sign in

Run `az login` with the tenant and subscription you want to work in:

```bash
az login --tenant-id <tenant-id> --subscription-id <subscription-id>
```

Azure CLI opens your default browser. After you complete sign-in, Azure CLI saves the sign-in context as the reserved `default` profile, replacing any existing `default` profile, and makes it the active profile. Later commands run in that tenant and subscription.

The preview doesn't share sign-in state with the classic Azure CLI or with Azure PowerShell. Sign in separately to each tool that you use.

Broker sign-in, such as Web Account Manager (WAM) on Windows, and username and password sign-in aren't available in the preview.

## Save the sign-in as a named profile

To keep a sign-in that you can switch back to later, add `--out-profile` with a profile name:

```bash
az login --tenant-id <tenant-id> --subscription-id <subscription-id> --out-profile dev
```

The new profile becomes the active profile. Use a separate profile for each tenant or subscription that you work in, and then switch between them with `az profile set`. For a walkthrough, see [Quickstart: Set up and switch sign-in profiles](quickstart-profiles.md).

## Sign in without a browser

If a browser isn't available on the machine, for example in an SSH session or a container, add `--use-device-code`. Azure CLI displays a code and a URL. Open the URL on another device, enter the code, and complete sign-in there. Use browser sign-in whenever it's available.

## Check which account you're using

To see the tenant, subscription, and identity that commands use, show the active profile:

```bash
az profile show --active
```

## Refresh an expired sign-in

If the sign-in for a profile expires, sign in again with `--profile` to refresh that profile in place:

```bash
az login --profile dev
```

The `--profile` and `--out-profile` parameters are mutually exclusive. Use `--out-profile` to create or overwrite a profile, and `--profile` to refresh an existing one.

## Sign out

To sign out, run `az logout`:

```bash
az logout
```

`az logout` signs out of the active profile by removing its account from the token cache, and leaves no profile active. To remove a saved profile entirely, use `az profile remove --name <profile-name>`.

## Related content

- For more information, see [Manage sign-in profiles](profile-base-login.md).
- For more information, see [Quickstart: Set up and switch sign-in profiles](quickstart-profiles.md).
- For more information, see [Manage Azure subscriptions with the Azure CLI (preview)](manage-azure-subscriptions-azure-cli.md).
- For more information, see [Get started with the preview](get-started-with-azure-cli.md).
