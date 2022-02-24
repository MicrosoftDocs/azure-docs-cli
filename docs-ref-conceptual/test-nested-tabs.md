---
title: Do something | Microsoft Docs
description: Learn something...
author: dbradish-microsoft
ms.author: dbradish
manager: barbkess
ms.date: 02/26/2022
ms.topic: conceptual
ms.service: azure-cli
ms.devlang: azurecli
ms.custom: devx-track-azurecli, seo-azure-cli
zone_pivot_group_filename: azure/zone-pivot-groups.json
zone_pivot_groups: cli-linux-installation-method
keywords: az login, authentication types , authentication methods, azure, cli login, az login powershell, cli login
---

# H1

## Zone pivot example

The setup for zone pivots is in _azure-docs-cli/docs-ref-conceptual/zone-pivot-groups.json_ and _azure-docs-cli/docs-ref-conceptual/zone-pivot-groups.yml_.  You can find similar files with more entries in [MicrosoftDocs/azure-docs-pr/articles/zone-pivot-groups.yml](https://github.com/MicrosoftDocs/azure-docs-pr/blob/main/articles/zone-pivot-groups.yml).  For simplicity, this PR reuses existing zone pivot headers already in these JSON files.

::: zone pivot="apt"

# [apt tab 1](#tab/tab1)

Content for the portal in Windows...

# [apt tab 2](#tab/tab2)

Content for the portal in Linux...

---

::: zone-end

::: zone pivot="dnf"

# [dnf tab 1](#tab/tab3)

Do something in the Azure CLI when in Linux ...

# [dnf tab 2](#tab/tab4)

Do something in the Azure CLI when in a Docker container ...

# [dnf tab 3](#tab/tab5)

Do something in the Azure CLI when in macOS

---

::: zone-end

::: zone pivot="zypper"

# [Zypper tab 1](#tab/tab6)

Do something in the Azure PowerShell when in Windows ...

# [Zypper tab 2](#tab/tab7)

Do something in the Azure PowerShell when in Linux ...

---

::: zone-end

## Simple tab example

# [Azure portal](#tab/azure-portal)

Content for the portal ...

# [Azure CLI](#tab/azure-cli)

Content for Azure CLI...

# [Azure PowerShell](#tab/azure-powershell)

Content for Azure PowerShell...

---

## Dependent tab example

Select a tab in **Simple tab example** to see this tab group refresh.

# [Windows](#tab/windows/azure-portal)

Content for the portal in Windows...

# [Linux](#tab/linux/azure-portal)

Content for the portal in Linux...

# [Linux](#tab/linux/azure-cli)

Do something in the Azure CLI when in Linux ...

# [Docker container](#tab/docker-container/azure-cli)

Do something in the Azure CLI when in a Docker container ...

# [macOS](#tab/macOS/azure-cli)

Do something in the Azure CLI when in macOS

# [Windows](#tab/windows/azure-powershell)

Do something in the Azure PowerShell when in Windows ...

# [Linux](#tab/linux/azure-powershell)

Do something in the Azure PowerShell when in Linux ...

---

## Nested tabs don't work

# [Terraform](#tab/terraform)

Content for the portal ...

## [tab1](#tab/tab11)

## [tab2](#tab/tab12)

## [tab3](#tab/tab13)

---

# [Java](#tab/java)

Content for Azure CLI...

# [JavaScript](#tab/javascript)

Content for Azure PowerShell...

---

## Indented tabs don't work

# [Terraform](#tab/terraform)

Content for the portal ...

**Nest tabs via indentation**

    ## [tab4](#tab/tab14)
    
    ## [tab5](#tab/tab15)
    
    ## [tab6](#tab/tab16)
    
    ---

# [Java](#tab/java)

Content for Azure CLI...

# [JavaScript](#tab/javascript)

Content for Azure PowerShell...

---

## Next H2
