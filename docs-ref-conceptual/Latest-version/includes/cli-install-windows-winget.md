---
ms.topic: include
ms.custom: devx-track-azurecli
---

### WinGet (Windows Package Manager)

Use [WinGet][01], Microsoft's Package manager for Windows, to install and manage updates for Azure
CLI. By default, Winget installs the 64-bit Azure CLI on 64-bit operating systems.

> [!NOTE]
> WinGet is available by default in Windows 11 and modern versions of Windows 10. However, it may
> not be installed in older versions of Windows. See the [winget documentation][01] for installation
> instructions.

```PowerShell
winget install --exact --id Microsoft.AzureCLI
```

The `--exact` option is to ensure the official Azure CLI package is installed. This command installs
the latest version by default. To specify a version, add a `--version <version>` with your desired
version to the command. Here's an example:

```PowerShell
winget install --exact --id Microsoft.AzureCLI --version 2.67.0
```
<!-- link references -->

[01]: /windows/package-manager/winget/
