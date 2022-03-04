---
title: Microsoft Graph migration | Microsoft Docs
description: Learn about the Microsoft Graph migration of Azure CLI.
author: jiasli
ms.author: jiasli
manager: yonzhan
ms.date: 02/24/2022
ms.topic: conceptual
ms.service: azure-cli
ms.devlang: azurecli
ms.custom: devx-track-azurecli, seo-azure-cli
keywords: microsoft graph, ms graph, active directory graph, ad graph
---

# Microsoft Graph migration

Due to [the deprecation of Azure Active Directory (Azure AD) Graph](/graph/migrate-azure-ad-graph-overview), Azure CLI will be migrated from AD Graph to Microsoft Graph.

## Breaking changes

For differences of the underlying API and output JSON breaking changes, please refer to [Property differences between Azure AD Graph and Microsoft Graph](/graph/migrate-azure-ad-graph-property-differences).

Command argument and behavior breaking changes are listed below.

### `az ad app create`

- `--reply-urls` argument is split into `--web-redirect-uris` and `--public-client-redirect-uris`
- `--homepage` argument is replaced by `--web-home-page-url`
- `--available-to-other-tenants` is replaced by `--sign-in-audience`
- `--native-app` is replaced by `--is-fallback-public-client`
- `--oauth2-allow-implicit-flow` is replaced by `--enable-access-token-issuance`
- `--enable-id-token-issuance` is introduced to set `web/implicitGrantSettings/enableIdTokenIssuance`
- `--password` is removed. Use `az ad app credential reset` to let Graph create a password for you (https://github.com/Azure/azure-cli/issues/20675)

### `az ad app permission grant`

- `--expires` argument is removed

### `az ad app credential reset`

- `--credential-description` is replaced by `--display-name` (https://github.com/Azure/azure-cli/issues/20561)
- `--password` is removed. Without specifying certificate arguments, Graph service creates a password for you (https://github.com/Azure/azure-cli/issues/20675)

### `az ad sp delete`

- This command no longer deletes the corresponding application. Use `az ad app delete` to explicitly delete the application (https://github.com/Azure/azure-cli/issues/8467)
- This command no longer deletes corresponding role assignments of the service principal. Use `az role assignment delete` to explicitly delete role assignments (https://github.com/Azure/azure-cli/issues/20805)

### `az ad sp credential`

- This command group now operates on service principal, not application (https://github.com/Azure/azure-cli/issues/11458)

### `az ad sp credential reset`

- `--password` is removed. Without specifying certificate arguments, Graph service creates a password for you (https://github.com/Azure/azure-cli/issues/20675)

### `az ad group get-member-groups`

- `--additional-properties` argument is removed

### `az ad group member add`

- `--additional-properties` argument is removed

## Known issues

- Generic update arguments `--add`, `--set` and `--remove` currently don't work
- `az ad` and Microsoft Graph related commands like `az role` will fail in Azure Stack environments which don't have Microsoft Graph support

## Try Azure CLI beta with Microsoft Graph

Azure CLI is built on [Python](https://www.python.org/). The supported Python versions are 3.7, 3.8, 3.9, 3.10. On Windows, you will first need to [install Python](https://www.python.org/downloads/windows/).

Azure CLI beta can only be installed with `pip` from a Microsoft repository. Use `python` or `python3` to execute the following commands, depending on the Linux distribution or your installed Python version.

To avoid overwriting your installed Azure CLI, we recommend installing the beta version in a [virtual environment](https://docs.python.org/3/tutorial/venv.html).

1. Create a virtual environment

   Navigate to the folder where you want to create the virtual environment, then run:

   ```bash
   python -m venv <env_name>
   ```

1. Activate the virtual environment

   ### [Windows PowerShell](#tab/powershell)

   ```powershell
   . .\<env_name>\Scripts\Activate.ps1
   ```

   ### [Linux/macOS Bash](#tab/bash)

   ```bash
   . <env_name>/bin/activate
   ```
   ---
   These commands can also be used to reactivate your virtual environment.

1. Install Azure CLI beta

   ```bash
   python -m pip install --upgrade pip
   pip install --extra-index-url https://azcliprod.blob.core.windows.net/beta/simple/ azure-cli
   ```

1. Deactivate the virtual environment

   After you finish using Azure CLI beta, you can close the terminal window, or use the `deactivate` command.

   ```bash
   deactivate
   ```

## Uninstall Azure CLI beta

To uninstall Azure CLI beta, delete the virtual environment folder.

### [Windows PowerShell](#tab/powershell)

```powershell
Remove-Item -Force -Recurse <env_name>
```

### [Linux/macOS Bash](#tab/bash)

```bash
rm -rf <env_name>
```

---
