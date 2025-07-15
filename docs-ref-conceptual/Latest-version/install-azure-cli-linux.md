---
title: Install the Azure CLI on Linux | Microsoft Docs
description: Learn how to install and run the Azure CLI on Linux manually. You can install the Azure CLI on Linux computers with one command or a step-by-step process.
ms.service: azure-cli
ms.custom: devx-track-azurecli, linux-related-content
zone_pivot_group_filename: azure/zone-pivot-groups.json
zone_pivot_groups: cli-linux-installation-method
keywords: linux cli, azure cli linux, install azure cli ubuntu, install azure cli linux
---

# Install the Azure CLI on Linux

This article explains how to install the Azure CLI on Linux. Select the appropriate package manager
for your distribution from the options at the top of the page. Using a Linux distribution's package
manager is recommended. However, you can manually install the Azure CLI on Linux by selecting the
[Install script][01] option.

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

## Next Steps

Now that you installed the Azure CLI, take a short tour of its features and common commands.

> [!div class="nextstepaction"]
> [Get started with the Azure CLI][02]

<!-- link references -->

[01]: ?pivots=script
[02]: get-started-with-azure-cli.md
