---
title: "Find identities and register a Microsoft Entra application with Azure CLI (preview)"
description: "Look up test identities, register a single-tenant Microsoft Entra application, and remove it with Azure CLI preview."
author: msmbaldwin
ms.author: mbaldwin
ms.service: azure-cli
ms.topic: how-to
ms.date: 10/28/2026
ms.custom: devx-track-azurecli
ai-usage: ai-assisted
---

# Find identities and register a Microsoft Entra application with Azure CLI (preview)

In this article, you use Azure CLI preview to look up a user and a group in Microsoft Entra ID, confirm group membership, and register a single-tenant application that you remove when you finish.

When you finish, you've confirmed that the intended user is a member of the intended group, you've created a single-tenant application registration and retrieved its client ID, and you've verified that the registration is deleted.

## Prerequisites

- Bash or zsh on Linux or macOS, or PowerShell 7.6 or later on Windows.
- Azure CLI preview, installed and signed in as described in [Set up and switch sign-in profiles](quickstart-profiles.md).
- A test user and a test group in your tenant, with the test user as a member of the group.
- Permission to read users and groups through Microsoft Graph and to create application registrations.

Use a new application registration, not an existing application. Don't share tenant-wide user data from list output.

## Set variables

Replace the placeholders with the test user's user principal name (UPN), such as `user@contoso.com`, and the test group's display name.

# [Bash](#tab/bash)

```bash
user_upn="<test-user-UPN>"
group_name="<test-group-display-name>"
run=$(date +%Y%m%d%H%M%S)
app_name="azclips-app-$run"
```

# [PowerShell](#tab/powershell)

```powershell
$userUpn = '<test-user-UPN>'
$groupName = '<test-group-display-name>'
$run = Get-Date -Format 'yyyyMMddHHmmss'
$appName = "azclips-app-$run"
```

---

## Get the user and group object IDs

Microsoft Graph identifies users and groups by object ID. Look up the object IDs from the UPN and the display name.

# [Bash](#tab/bash)

```bash
user_id=$(az msgraph user list --upn "$user_upn" --query "[0].id" --output tsv)
group_id=$(az msgraph group list --display-name "$group_name" --query "[0].id" --output tsv)
echo "User: $user_id"
echo "Group: $group_id"
```

# [PowerShell](#tab/powershell)

```powershell
$userId = az msgraph user list --upn $userUpn --query '[0].id' --output tsv
$groupId = az msgraph group list --display-name $groupName --query '[0].id' --output tsv
"User: $userId"
"Group: $groupId"
```

---

Each command prints an object ID, a GUID. If a value is empty, check the UPN or display name. The `--display-name` parameter of `az msgraph group list` matches names that start with the value you provide, so use a display name that identifies a single group.

You can also find object IDs in the [Microsoft Entra admin center](https://entra.microsoft.com). Go to **Users** or **Groups**, select the user or group, and copy the **Object ID** value from the **Overview** page.

## Find identities and check membership

# [Bash](#tab/bash)

```bash
az msgraph user show --id "$user_id"
az msgraph group show --group "$group_id"
az msgraph group member list --group "$group_id"
az msgraph group member check --group "$group_id" --member-id "$user_id"
```

# [PowerShell](#tab/powershell)

```powershell
az msgraph user show --id $userId
az msgraph group show --group $groupId
az msgraph group member list --group $groupId
az msgraph group member check --group $groupId --member-id $userId
```

---

The `show` commands return the details of the test user and group. The member list includes the test user, and `az msgraph group member check` returns `true`.

## Register the application

Create a single-tenant application registration. The command returns the new application, including its object ID (`id`) and its application (client) ID (`appId`). You use the object ID to manage the registration, and the client ID to configure apps that sign in with it.

# [Bash](#tab/bash)

```bash
app_object_id=$(az msgraph app create --display-name "$app_name" --sign-in-audience AzureADMyOrg --query id --output tsv)
client_id=$(az msgraph app show --id "$app_object_id" --query appId --output tsv)
echo "Object ID: $app_object_id"
echo "Client ID: $client_id"
```

# [PowerShell](#tab/powershell)

```powershell
$app = az msgraph app create --display-name $appName --sign-in-audience AzureADMyOrg --output json | ConvertFrom-Json
$appObjectId = $app.id
$clientId = $app.appId
"Object ID: $appObjectId"
"Client ID: $clientId"
```

---

## Inspect the registration

# [Bash](#tab/bash)

```bash
az msgraph app show --id "$app_object_id" --query "{name:displayName, clientId:appId, audience:signInAudience}"
az msgraph app list --display-name "$app_name" --query "length(@)"
```

# [PowerShell](#tab/powershell)

```powershell
az msgraph app show --id $appObjectId --query '{name:displayName, clientId:appId, audience:signInAudience}'
az msgraph app list --display-name $appName --query 'length(@)'
```

---

The first command shows the display name you chose, the client ID from the previous step, and `AzureADMyOrg`, which means that only accounts in your tenant can sign in. The second command returns `1`, because exactly one registration has that display name.

## Clean up resources

Delete the registration, and then confirm that it no longer appears in the list of application registrations.

# [Bash](#tab/bash)

```bash
az msgraph app delete --id "$app_object_id"
az msgraph app list --display-name "$app_name" --query "length(@)"
```

# [PowerShell](#tab/powershell)

```powershell
az msgraph app delete --id $appObjectId
az msgraph app list --display-name $appName --query 'length(@)'
```

---

The list query returns `0`. If it still returns `1`, wait a minute and run it again, because changes can take a short time to replicate in Microsoft Graph. Microsoft Graph keeps deleted application registrations in a recoverable state for 30 days before it removes them permanently.

## Related content

- For more information, see [Get started with the preview](getting-started.md).
- For more information, see [Set up and switch sign-in profiles](quickstart-profiles.md).
- For more information, see [Run repeatable deployments from a pipeline](tutorial-pipeline-deployments.md).
