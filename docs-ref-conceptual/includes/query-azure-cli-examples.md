---
ms.topic: include
ms.date: 28/02/2022
author: dbradish-microsoft
ms.author: dbradish
manager: barbkess
ms.custom: devx-track-azurecli
---

This section contains examples of JMESPath queries for different Azure resources.

## Query examples for Azure accounts

### Example query for tenant and subscription ID 
This examples returns the tenant ID and subscription ID of the Azure account and subscription you are using.

## [Cmd](#tab/cmd)

```cmd
az account show --query '{tenantId:tenantId,subscriptionid:id}'
```

## [PowerShell](#tab/powershell)

```powershell 
az account show --query '{tenantId:tenantId,subscriptionid:id}'
```

## [Bash](#tab/bash)

```azurecli-interactive
az account show --query '{tenantId:tenantId,subscriptionid:id}'
```

---

## Query examples for storage accounts
This section shows example queries for storage accounts.

### Example query for primary table endpoints of a storage account
This example returns the primary endpoints for all tables a storage account.

## [Cmd](#tab/cmd)

```cmd
az storage account show -n mystorageaccount -g QueryDemo --query "primaryEndpoints.table"
```

## [PowerShell](#tab/powershell)

```powershell 
az storage account show -n mystorageaccount -g QueryDemo --query "primaryEndpoints.table"
```

## [Bash](#tab/bash)

```azurecli-interactive
az storage account show -n mystorageaccount -g QueryDemo --query "primaryEndpoints.table"
```

---
## Query examples for Virtual Machines
This section shows example queries for Virtual Machines (VMs).

### Example query for VMs with a disk size larger than 50GB
This example returns the names of VMs whose disk size is larger than 50GB.

## [Cmd](#tab/cmd)

```cmd
az vm list -g QueryDemo --query "[?storageProfile.osDisk.diskSizeGb >=`50`].{Name:name, admin:osProfile.adminUsername, DiskSize:storageProfile.osDisk.diskSizeGb }" --output table
```

## [PowerShell](#tab/powershell)

```powershell
az vm list -g QueryDemo --query "[?storageProfile.osDisk.diskSizeGb >=``50``].{Name:name,  admin:osProfile.adminUsername, DiskSize:storageProfile.osDisk.diskSizeGb }" --output table
```

## [Bash](#tab/bash)

```azurecli-interactive
az vm list -g QueryDemo --query '[?storageProfile.osDisk.diskSizeGb >=`50`].{Name:name,  admin:osProfile.adminUsername, DiskSize:storageProfile.osDisk.diskSizeGb }' --output table
```

---

### Example query for VMs with SSD storage
The following query demonstrates how to list the names and storage account types of VMs who use SSD storage.

## [Cmd](#tab/cmd)

```cmd
az vm list -g QueryDemo --query "[].{Name:name, Storage:storageProfile.osDisk.managedDisk.storageAccountType} | [? contains(Storage,'SSD')]"
```

## [PowerShell](#tab/powershell)

```powershell
az vm list -g QueryDemo --query "[].{Name:name, Storage:storageProfile.osDisk.managedDisk.storageAccountType} | [? contains(Storage,'SSD')]"
```

## [Bash](#tab/bash)

```azurecli-interactive
az vm list -g QueryDemo --query '[].{Name:name, Storage:storageProfile.osDisk.managedDisk.storageAccountType} | [? contains(Storage,`SSD`)]'
```
---

## Query examples for cognitive services
This section shows example queries for cognitive services.

### Example query for endpoints
The following query demonstrates how to list endpoints of a cognitive service.

## [Cmd](#tab/cmd)

```cmd
az cognitiveservices account show --name "resource-name" --resource-group "resource-group-name" --query "endpoint"

```

## [PowerShell](#tab/powershell)

```powershell
az cognitiveservices account show --name "resource-name" --resource-group "resource-group-name" --query "endpoint"
```

## [Bash](#tab/bash)

```azurecli-interactive
az cognitiveservices account show --name "resource-name" --resource-group "resource-group-name" --query "endpoint"
```
---
## Query examples for virtual vetworks
This section shows example queries for virtual networks (VNet).

### Example query for listing IP address IDs
The following query lists the IDs of IP addresses that contain the substring in the shell variable IP.

## [Cmd](#tab/cmd)

```cmd
Set IP="MY_EXTERNAL_IP"
az network public-ip list --query "[?ipAddress!=null]|[?contains(ipAddress, '%IP%')].[id]" --output tsv)
```

## [PowerShell](#tab/powershell)

```powershell
$IP="MY_EXTERNAL_IP"
az network public-ip list --query "[?ipAddress!=null]|[?contains(ipAddress, '$IP')].[id]" --output tsv)
```

## [Bash](#tab/bash)

```azurecli-interactive
IP="MY_EXTERNAL_IP"
az network public-ip list --query "[?ipAddress!=null]|[?contains(ipAddress, '$IP')].[id]" --output tsv)
```

---
