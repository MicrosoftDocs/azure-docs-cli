---
title: "Quickstart: Set up and switch sign-in profiles with Azure CLI (preview)"
description: "Set up named sign-in profiles, switch tenants and subscriptions, and remove test profiles with Azure CLI preview."
author: msmbaldwin
ms.author: mbaldwin
ms.service: azure-cli
ms.topic: quickstart
ms.date: 10/28/2026
ms.custom: devx-track-azurecli
ai-usage: ai-assisted
---

# Quickstart: Set up and switch sign-in profiles with Azure CLI (preview)

In this quickstart, you set up Azure CLI preview so that you can move between the classic Azure CLI and the preview, and between two subscriptions, without signing in again each time.

By the end of this quickstart, you:

- Switch the `az` command between the classic Azure CLI and the preview in the same shell.
- Save two named sign-in profiles, one for each subscription, and confirm that each profile selects the intended tenant and subscription.
- Run a single command against the other subscription without changing your active profile.
- Remove the test profiles and restore the profile you started with.

## Prerequisites

- Azure CLI preview, installed by following [Install Azure CLI preview](install-overview.md).
- Bash or zsh on Linux or macOS, or PowerShell 7.6 or later on Windows.
- Two Azure subscriptions you can sign in to. The subscriptions can be in the same tenant or in different tenants. If you don't have a subscription, [create a free account](https://azure.microsoft.com/free/).

To find each subscription ID and its directory (tenant) ID, go to the Azure portal, select **Subscriptions**, select the subscription, and then review **Overview**. If both subscriptions are in the same directory, use the same tenant ID for both.

## Set variables

Replace the placeholders with your values. The script also records the profile that's active now, if any, so that you can restore it when you finish. If you've never used Azure CLI preview, there's no active profile and the variable is empty.

# [Bash](#tab/bash)

```bash
tenant_a="<tenant-A-id>"
sub_a="<subscription-A-id>"
tenant_b="<tenant-B-id>"
sub_b="<subscription-B-id>"
run=$(date +%Y%m%d%H%M%S)
profile_a="review-a-$run"
profile_b="review-b-$run"
previous_profile=$(az profile show --active --query name --output tsv 2>/dev/null || true)
echo "Previous profile: ${previous_profile:-<none>}"
```

# [PowerShell](#tab/powershell)

```powershell
$tenantA = '<tenant-A-id>'
$subA = '<subscription-A-id>'
$tenantB = '<tenant-B-id>'
$subB = '<subscription-B-id>'
$run = Get-Date -Format 'yyyyMMddHHmmss'
$profileA = "review-a-$run"
$profileB = "review-b-$run"
$previousProfile = az profile show --active --query name --output tsv 2>$null
"Previous profile: $(if ($previousProfile) { $previousProfile } else { '<none>' })"
```

---

## Verify the installation

Confirm that `az` resolves to the preview and that the preview commands are available.

# [Bash](#tab/bash)

```bash
command -v az
az --version
az --help
```

# [PowerShell](#tab/powershell)

```powershell
Get-Command az
az --version
az --help
```

---

The first command returns the path of the preview `az` executable, `~/.local/share/azcli/az` on Linux or macOS or `%LOCALAPPDATA%\Programs\azcli\az.exe` on Windows, if you installed to the default location. `az --version` prints the preview version, which matches the version in the file name you downloaded. `az --help` lists the available command groups, including `profile`.

If the first command returns a different path or nothing, add the preview to `PATH` as described in [Install Azure CLI preview](install-overview.md).

## Switch between the classic Azure CLI and the preview

If you also have the classic Azure CLI installed, you can switch the `az` command between the two in the same shell. Add the `switch-az` (Bash or zsh) or `Switch-Az` (PowerShell) helper function to your shell profile as described in [Switch between the classic Azure CLI and the preview build](switch-cli-versions.md), and then run it twice.

# [Bash](#tab/bash)

```bash
switch-az
switch-az
```

# [PowerShell](#tab/powershell)

```powershell
Switch-Az
Switch-Az
```

---

Each call prints the path of the `az` executable that's now active. The first call switches to the classic Azure CLI, and the second call switches back to the preview. The two tools keep separate sign-in state, so signing in with one doesn't sign you in to the other.

Make sure the preview is active before you continue.

## Save two sign-in profiles

Sign in once for each subscription. Each command opens a browser window for interactive sign-in and saves the result as a named profile.

# [Bash](#tab/bash)

```bash
az login --tenant-id "$tenant_a" --subscription-id "$sub_a" --out-profile "$profile_a"
az login --tenant-id "$tenant_b" --subscription-id "$sub_b" --out-profile "$profile_b"
```

# [PowerShell](#tab/powershell)

```powershell
az login --tenant-id $tenantA --subscription-id $subA --out-profile $profileA
az login --tenant-id $tenantB --subscription-id $subB --out-profile $profileB
```

---

Each command completes after you finish signing in, and creates a profile that stores the tenant, subscription, cloud, and authentication method from that sign-in.

## Switch between profiles

List the saved profiles, make the first profile active, and then run a command against the second subscription without changing the active profile.

# [Bash](#tab/bash)

```bash
az profile list --output table
az profile set --name "$profile_a"
az profile show --active
az group list --output table
az group list --profile "$profile_b" --output table
```

# [PowerShell](#tab/powershell)

```powershell
az profile list --output table
az profile set --name $profileA
az profile show --active
az group list --output table
az group list --profile $profileB --output table
```

---

Confirm the following results:

- `az profile list` includes both test profiles, and each shows the tenant and subscription you specified.
- `az profile show --active` returns the first test profile, with subscription A.
- The first `az group list` returns the resource groups in subscription A.
- The second `az group list` returns the resource groups in subscription B. The `--profile` parameter applies only to that command, so subscription A remains active.

Switching the active profile doesn't sign you in again. If a profile's sign-in expires, refresh it with `az login --profile <profile-name>`.

## Clean up resources

Sign out of each test profile, remove it, and then restore the profile that was active when you started, if there was one.

# [Bash](#tab/bash)

```bash
for p in "$profile_a" "$profile_b"; do
  az profile set --name "$p"
  az logout
  az profile remove --name "$p"
done
if [ -n "$previous_profile" ]; then
  az profile set --name "$previous_profile"
fi
az profile list --output table
```

# [PowerShell](#tab/powershell)

```powershell
foreach ($p in $profileA, $profileB) {
    az profile set --name $p
    az logout
    az profile remove --name $p
}
if ($previousProfile) {
    az profile set --name $previousProfile
}
az profile list --output table
```

---

The final list no longer includes the test profiles. If you had an active profile when you started, it's active again. Otherwise, no profile is active.

## Related content

- For more information, see [Switch between the classic Azure CLI and the preview build](switch-cli-versions.md).
- For more information, see [Get started with the preview](getting-started.md).
- For more information, see [Deploy and manage a virtual machine application](tutorial-vm-application.md).
