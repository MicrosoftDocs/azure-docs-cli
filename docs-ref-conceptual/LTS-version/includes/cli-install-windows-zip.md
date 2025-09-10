---
ms.topic: include
ms.custom: devx-track-azurecli
---

### ZIP Package

> [!IMPORTANT]
> This package is currently in preview.

You can use the ZIP package to install the Azure CLI on Windows. This package is useful when you don't have administrative privilege.

Unzip the package to a folder, then using Cmd or PowerShell, call the Azure CLI by running `<unzipped folder path>\bin\az.cmd`.

If you want to run the `az` command directly, follow the steps below to add the Azure CLI to your `PATH` environment variable.

1. Open the Start Menu and search for `environment variables`.  Click `Edit the system environment variables`.
1. Click the `Environment Variables...` button.
1. In the `User variables for <username>` box, select `Path` and click the `Edit...` button.
1. Click the `New` button and add the `<unzipped folder path>\bin` to the list.
1. **Restart your terminal.**  You should now be able to run `az` commands.

### Latest version

> [!div class="nextstepaction"]
> [Latest ZIP of the Azure CLI (64-bit)](https://aka.ms/installazurecliwindowszipx64)

### Specific version

If you prefer, you can download a specific version of the Azure CLI by using a URL.

To download the ZIP package for a specific version, change the version segment in URL `https://azcliprod.blob.core.windows.net/zip/azure-cli-<version>-x64.zip`.

For example, to install the 64-bit ZIP of Azure CLI version 2.57.0, your URL would be `https://azcliprod.blob.core.windows.net/zip/azure-cli-2.57.0-x64.zip`. 

Available Azure CLI versions can be found at [Azure CLI release notes](../release-notes-azure-cli.md). The ZIP package is available from version 2.57.0. Only 64-bit is available.
