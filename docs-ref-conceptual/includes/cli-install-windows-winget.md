---
ms.date: 01/27/2025
ms.topic: include
ms.custom: devx-track-azurecli
---

### winget

You can also use `winget`, Microsoft's Package manager for Windows, to install and manage updates for Azure CLI.

> [!NOTE]
> winget is available by default in Windows 11 and modern versions of Windows 10. However, it may not be installed in older versions of Windows. See the [winget documentation](/windows/package-manager/winget/) for installation instructions.

   ```PowerShell
   winget install -e --id Microsoft.AzureCLI
   ```

The `-e` option is to ensure the official Azure CLI package is installed. This command installs the latest version by default. To specify a version, add a `-v <version>` with your desired version to the command.
