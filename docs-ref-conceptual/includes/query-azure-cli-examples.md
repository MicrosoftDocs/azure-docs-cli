---
ms.topic: include
ms.date: 28/02/2022
author: dbradish-microsoft
ms.author: dbradish
manager: barbkess
ms.custom: devx-track-azurecli
---

This section contains examples of complex JMESPath queries for different Azure resources.

## Query examples for storage accounts
This section shows example queries for storage accounts.

## Query examples for Virtual Machines
This section shows example queries for Virtual Machines (VMs).

### Example query for VMs with a disk size larger than 10GB
This example returns the names of VMs whose disks are larger than 10GB.

## [Cmd](#tab/cmd)

```azurecli-interactive
az vm list -g QueryDemo --query "[?storageProfile.osDisk.diskSizeGb <=\`10\`].{Name:name,  DiskSize:storageProfile.osDisk.diskSizeGb}" --output table
```

## [PowerShell](#tab/powershell)

```azurecli-interactive
az vm list -g QueryDemo --query "[?storageProfile.osDisk.diskSizeGb <=\`10\`].{Name:name,  DiskSize:storageProfile.osDisk.diskSizeGb}" --output table
```

## [Bash](#tab/bash)

```azurecli-interactive
az vm list -g QueryDemo --query "[?storageProfile.osDisk.diskSizeGb <=\`10\`].{Name:name,  DiskSize:storageProfile.osDisk.diskSizeGb}" --output table
```

---
