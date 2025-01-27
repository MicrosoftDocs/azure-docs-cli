---
ms.date: 01/27/2025
ms.topic: include
ms.custom: devx-track-azurecli
---

### PowerShell

To install the Azure CLI using PowerShell, start PowerShell **as administrator** and run the following command:

   ```PowerShell
   $ProgressPreference = 'SilentlyContinue'; Invoke-WebRequest -Uri https://aka.ms/installazurecliwindows -OutFile .\AzureCLI.msi; Start-Process msiexec.exe -Wait -ArgumentList '/I AzureCLI.msi /quiet'; Remove-Item .\AzureCLI.msi
   ```

This will download and install the latest 32-bit installer of the Azure CLI for Windows. If you prefer a 64-bit install, change URL to `https://aka.ms/installazurecliwindowsx64`. If the Azure CLI is already installed, the installer will overwrite the existing version.

To install a specific version, replace the `-Uri` argument with the URL described in [Specific version](#specific-version-1). Here is an example of using the 32-bit installer of the Azure CLI version [2.51.0](/cli/azure/release-notes-azure-cli#august-01-2023) in PowerShell:

   ```PowerShell
   $ProgressPreference = 'SilentlyContinue'; Invoke-WebRequest -Uri https://azcliprod.blob.core.windows.net/msi/azure-cli-2.51.0.msi -OutFile .\AzureCLI.msi; Start-Process msiexec.exe -Wait -ArgumentList '/I AzureCLI.msi /quiet'; Remove-Item .\AzureCLI.msi
   ```

### Specific version

[!INCLUDE [specific version](./specific-version.md)]

### Differences between Bash and PowerShell

Although most Azure CLI documentation is written and tested in a Bash shell, you can also install and run the Azure CLI using PowerShell. There are subtle syntax differences between Bash and PowerShell. Review these articles to avoid scripting errors:
- [Considerations for running the Azure CLI in a PowerShell scripting language](./use-azure-cli-successfully-powershell.md)
- [Use quotation marks in Azure CLI parameters](./use-azure-cli-successfully-quoting.md)
- Compare syntax of Bash, PowerShell and Cmd.exe in [Learn Azure CLI syntax differences in Bash, PowerShell and Cmd](./get-started-tutorial-2-environment-syntax.md)

When running the Azure CLI in PowerShell, there are also error handling differences and the ability to enable tab completion. See these articles for more information:
- [Error handling for the Azure CLI in PowerShell](./use-azure-cli-successfully-powershell.md#error-handling-for-azure-cli-in-powershell)
- [Enable Tab Completion in PowerShell](#enable-tab-completion-in-powershell)
