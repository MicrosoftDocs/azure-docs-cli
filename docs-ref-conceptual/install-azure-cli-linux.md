---
title: Install the Azure CLI on Linux | Microsoft Docs
description: Learn how to install and run the Azure CLI on Linux manually. You can install the Azure CLI on Linux computers with one command or a step-by-step process.
author: chasecrum
ms.author: chasecrum
manager: mamccrea
ms.date: 06/19/2023
ms.topic: conceptual
ms.service: azure-cli
ms.tool: azure-cli
ms.custom: devx-track-azurecli, seo-azure-cli
zone_pivot_group_filename: azure/zone-pivot-groups.json
zone_pivot_groups: cli-linux-installation-method
keywords: linux cli, azure cli linux, install azure cli ubuntu, install azure cli linux
---

# Install the Azure CLI on Linux

The Azure CLI is a cross-platform command-line tool that can be installed locally on Linux computers. You can use the Azure CLI on Linux to connect to Azure and execute administrative commands on Azure resources. The CLI on Linux allows the execution of various commands through a terminal using interactive command-line prompts or a script.
When you are ready to install the Azure CLI on Linux, it is recommended to use a Linux distribution's package manager. Select the appropriate package manager for your distribution from the options above.  If you do not have one of the listed package managers, you may manually install the Azure CLI on Linux by selecting the [Install script](?pivots=script) option.

[!INCLUDE [current-version](includes/current-version.md)]

::: zone pivot="dnf"

[!INCLUDE [cli-install-linux-dnf](includes/cli-install-linux-dnf.md)]

::: zone-end

::: zone pivot="zypper"

[!INCLUDE [cli-install-linux-zypper](includes/cli-install-linux-zypper.md)]

::: zone-end

::: zone pivot="apt"

[!INCLUDE [cli-install-linux-apt](includes/cli-install-linux-apt.md)]

::: zone-end

::: zone pivot="tdnf"

[!INCLUDE [cli-install-linux-tdnf](includes/cli-install-linux-tdnf.md)]

::: zone-end

::: zone pivot="script"

[!INCLUDE [cli-install-linux-apt](includes/cli-install-linux-script.md)]

::: zone-end

## Remove data

If you don't plan to reinstall Azure CLI, remove its data.

```bash
rm -rf ~/.azure
```

## Next Steps

Now that you've installed the Azure CLI, take a short tour of its features and common commands.

> [!div class="nextstepaction"]
> [Get started with the Azure CLI](get-started-with-azure-cli.md)
