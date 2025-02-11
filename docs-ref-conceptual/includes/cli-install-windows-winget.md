---
ms.date: 01/27/2025
ms.topic: include
ms.custom: devx-track-azurecli
---

### WinGet (Windows Package Manager)

Use [WinGet](/windows/package-manager/winget/), Microsoft's Package manager for Windows, to install and manage updates for Azure CLI. By default, Winget installs the 64-bit Azure CLI on 64-bit operating systems.

> [!NOTE]
> WinGet is available by default in Windows 11 and modern versions of Windows 10. However, it may not be installed in older 
versions of Windows. See the [winget documentation](/windows/package-manager/winget/) for installation instructions.

```PowerShell
winget install --exact --id Microsoft.AzureCLI
```

The `--exact` option is to ensure the official Azure CLI package is installed. This command installs the latest version by default. To specify a version, add a `--version <version>` with your desired version to the command. Here's an example:

```PowerShell
winget install --exact --id Microsoft.AzureCLI -v 2.67.0
```
