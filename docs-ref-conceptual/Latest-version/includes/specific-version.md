---
ms.topic: include
ms.custom: devx-track-azurecli
---

To download the MSI installer for a specific version, change the version segment in URL
`https://azcliprod.blob.core.windows.net/msi/azure-cli-<version>.msi` (32-bit) or
`https://azcliprod.blob.core.windows.net/msi/azure-cli-<version>-x64.msi` (64-bit).

For example, to install the 32-bit MSI of Azure CLI version [2.51.0][02], your URL would be
`https://azcliprod.blob.core.windows.net/msi/azure-cli-2.51.0.msi`. The corresponding 64-bit install
would be `https://azcliprod.blob.core.windows.net/msi/azure-cli-2.51.0-x64.msi`.

Available Azure CLI versions can be found at [Azure CLI release notes][01]. The 64-bit MSI is
available from version [2.51.0][02].

<!-- link references -->

[01]: ../release-notes-azure-cli.md
[02]: /cli/azure/release-notes-azure-cli#august-01-2023
