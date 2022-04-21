---
title: Microsoft Graph migration | Microsoft Docs
description: Learn about the Microsoft Graph migration of Azure CLI.
author: jiasli
ms.author: jiasli
manager: yonzhan
ms.date: 03/08/2022
ms.topic: conceptual
ms.service: azure-cli
ms.devlang: azurecli
ms.custom: devx-track-azurecli, seo-azure-cli
keywords: microsoft graph, ms graph, active directory graph, ad graph
---

# Microsoft Graph migration

Due to [the deprecation of Azure Active Directory (Azure AD) Graph](/graph/migrate-azure-ad-graph-overview), the underlying Active Directory Graph API will be replaced by Microsoft Graph API in Azure CLI 2.37.0.

## Breaking changes

For differences of the underlying API and output JSON breaking changes, please refer to [Property differences between Azure AD Graph and Microsoft Graph](/graph/migrate-azure-ad-graph-property-differences).

Command argument and behavior breaking changes are listed below.

### `az ad app create`

- Split `--reply-urls` into `--web-redirect-uris` and `--public-client-redirect-uris`
- Replace `--homepage` with `--web-home-page-url`
- Replace `--available-to-other-tenants` with `--sign-in-audience`
- Replace `--native-app` with `--is-fallback-public-client`
- Replace `--oauth2-allow-implicit-flow` with `--enable-access-token-issuance`
- Add `--enable-id-token-issuance` to set `web/implicitGrantSettings/enableIdTokenIssuance`
- Remove `--password` and `--credential-description`. Use `az ad app credential reset` to let Graph service create a password for you (https://github.com/Azure/azure-cli/issues/20675)
- Add `--key-display-name` to set `keyCredential`'s `displayName`

### `az ad app permission grant`

- Remove `--expires`

### `az ad app credential reset`

- Replace `--credential-description` with `--display-name` (https://github.com/Azure/azure-cli/issues/20561)
- Remove `--password`. Without specifying certificate arguments, Graph service creates a password for you (https://github.com/Azure/azure-cli/issues/20675)

### `az ad sp delete`

- This command no longer deletes the corresponding application. Use `az ad app delete` to explicitly delete the application (https://github.com/Azure/azure-cli/issues/8467)
- This command no longer deletes corresponding role assignments of the service principal. Use `az role assignment delete` to explicitly delete role assignments (https://github.com/Azure/azure-cli/issues/20805)

### `az ad sp credential`

- This command group now operates on service principal, not application (https://github.com/Azure/azure-cli/issues/11458)

### `az ad sp credential reset`

- Remove `--password`. Without specifying certificate arguments, Graph service creates a password for you (https://github.com/Azure/azure-cli/issues/20675)

### `az ad group get-member-groups`

- Remove `--additional-properties`

### `az ad group member add`

- Remove `--additional-properties`

## Known issues

- Generic update arguments `--add`, `--set` and `--remove` currently don't work. You may use `az rest` to directly call Microsoft Graph API for non-supported properties.
- Microsoft Graph related commands like `az ad` and `az role` will fail in Azure Stack environments which don't have Microsoft Graph support. Please use Azure CLI 3.36.0 or earlier versions for Azure Stack environments.

## Try Azure CLI beta with Microsoft Graph

Azure CLI is built on [Python](https://www.python.org/). The supported Python versions are 3.7, 3.8, 3.9, 3.10. On Windows, you will first need to [install Python](https://www.python.org/downloads/windows/).

Azure CLI beta can only be installed with `pip` from a Microsoft repository. Use `python` or `python3` to execute the following commands, depending on the Linux distribution or your installed Python version.

To avoid overwriting your installed Azure CLI, we recommend installing the beta version in a [virtual environment](https://docs.python.org/3/tutorial/venv.html).

1. Create a virtual environment

   Navigate to the folder where you want to create the virtual environment, then run:

   ```bash
   python -m venv <env_name>
   ```

2. Activate the virtual environment

   ### [PowerShell](#tab/powershell)

   ```powershell
   . .\<env_name>\Scripts\Activate.ps1
   ```

   ### [Linux/macOS Bash](#tab/bash)

   ```bash
   . <env_name>/bin/activate
   ```
   ---
   These commands can also be used to reactivate your virtual environment.

3. Install Azure CLI beta

   ```bash
   python -m pip install --upgrade pip
   pip install --extra-index-url https://azurecliprod.blob.core.windows.net/beta/simple/ azure-cli
   ```
   You can now start using Azure CLI beta.

4. If there is an update, you may upgrade Azure CLI beta

   ```bash
   pip install --extra-index-url https://azurecliprod.blob.core.windows.net/beta/simple/ --upgrade azure-cli
   ```

5. Deactivate the virtual environment

   After you finish using Azure CLI beta, you can close the terminal window, or use the `deactivate` command.

   ```bash
   deactivate
   ```

## Uninstall Azure CLI beta

To uninstall Azure CLI beta, delete the virtual environment folder.

### [PowerShell](#tab/powershell)

```powershell
Remove-Item -Force -Recurse <env_name>
```

### [Linux/macOS Bash](#tab/bash)

```bash
rm -rf <env_name>
```

---
