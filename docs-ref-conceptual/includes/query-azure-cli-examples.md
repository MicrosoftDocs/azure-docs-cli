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

This section shows example queries for storage accounts.

* This examples returns the tenant ID and subscription ID of the Azure account and subscription you are using.

## [Bash](#tab/bash)

```azurecli-interactive
az account show --query '{tenantId:tenantId,subscriptionid:id}'
```

## [PowerShell](#tab/powershell)

```powershell
az account show --query '{tenantId:tenantId,subscriptionid:id}'
```

## [Cmd](#tab/cmd)

```cmd
az account show --query '{tenantId:tenantId,subscriptionid:id}'
```

---

## Query examples for Azure Active Directory service principals
This section shows example queries for AAD service principals.

* The following query returns the first Microsoft Graph application service principal who has read permissions.

## [Bash](#tab/bash)

```azurecli-interactive
az ad sp list --display-name "Microsoft Graph" --query "[0].appRoles[?value=='User.Read.All' && contains(allowedMemberTypes, 'Application')].id" --output tsv
```

## [PowerShell](#tab/powershell)

```powershell
az ad sp list --display-name "Microsoft Graph" --query "[0].appRoles[?value=='User.Read.All' && contains(allowedMemberTypes, 'Application')].id" --output tsv
```

## [Cmd](#tab/cmd)

```cmd
az ad sp list --display-name "Microsoft Graph" --query "[0].appRoles[?value=='User.Read.All' && contains(allowedMemberTypes, 'Application')].id" --output tsv
```

---

## Query examples for storage accounts
This section shows example queries for storage accounts.

* This example returns the primary endpoints for all tables a storage account.

## [Bash](#tab/bash)

```azurecli-interactive
az storage account show -n mystorageaccount -g QueryDemo --query "primaryEndpoints.table"
```

## [PowerShell](#tab/powershell)

```powershell 
az storage account show -n mystorageaccount -g QueryDemo --query "primaryEndpoints.table"
```

## [Cmd](#tab/cmd)

```cmd
az storage account show -n mystorageaccount -g QueryDemo --query "primaryEndpoints.table"
```

---
## Query examples for Virtual Machines
This section shows example queries for Virtual Machines (VMs).

* This example returns the names of VMs whose disk size is larger than 50GB.

## [Bash](#tab/bash)

```azurecli-interactive
az vm list -g QueryDemo --query "[?storageProfile.osDisk.diskSizeGb >=`50`].{Name:name, admin:osProfile.adminUsername, DiskSize:storageProfile.osDisk.diskSizeGb }" --output table
```

## [PowerShell](#tab/powershell)

```powershell
az vm list -g QueryDemo --query "[?storageProfile.osDisk.diskSizeGb >=``50``].{Name:name,  admin:osProfile.adminUsername, DiskSize:storageProfile.osDisk.diskSizeGb }" --output table
```

## [Cmd](#tab/cmd)

```cmd
az vm list -g QueryDemo --query '[?storageProfile.osDisk.diskSizeGb >=`50`].{Name:name,  admin:osProfile.adminUsername, DiskSize:storageProfile.osDisk.diskSizeGb }' --output table
```

---

* The following query demonstrates how to list the names and storage account types of VMs who use SSD storage.

## [Badh](#tab/bash)

```azurecli-interactive
az vm list -g QueryDemo --query "[].{Name:name, Storage:storageProfile.osDisk.managedDisk.storageAccountType} | [? contains(Storage,'SSD')]"
```

## [PowerShell](#tab/powershell)

```powershell
az vm list -g QueryDemo --query "[].{Name:name, Storage:storageProfile.osDisk.managedDisk.storageAccountType} | [? contains(Storage,'SSD')]"
```

## [Cmd](#tab/cmd)

```cmd
az vm list -g QueryDemo --query '[].{Name:name, Storage:storageProfile.osDisk.managedDisk.storageAccountType} | [? contains(Storage,`SSD`)]'
```
---

## Query examples for cognitive services
This section shows example queries for cognitive services.

* The following query demonstrates how to list endpoints of a cognitive service.

## [Bash](#tab/bash)

```azurecli-interactive
az cognitiveservices account show --name "resource-name" --resource-group "resource-group-name" --query "endpoint"

```

## [PowerShell](#tab/powershell)

```powershell
az cognitiveservices account show --name "resource-name" --resource-group "resource-group-name" --query "endpoint"
```

## [Cmd](#tab/cmd)

```cmd
az cognitiveservices account show --name "resource-name" --resource-group "resource-group-name" --query "endpoint"

```


---
## Query examples for virtual vetworks
This section shows example queries for virtual networks (VNet).

* e following query lists the IDs of IP addresses that contain the substring in the shell variable IP.

## [Bash](#tab/bash)

```azurecli-interactive
IP="MY_EXTERNAL_IP"
az network public-ip list --query "[?ipAddress!=null]|[?contains(ipAddress, '$IP')].[id]" --output tsv)
```

## [PowerShell](#tab/powershell)

```powershell
$IP="MY_EXTERNAL_IP"
az network public-ip list --query "[?ipAddress!=null]|[?contains(ipAddress, '$IP')].[id]" --output tsv)
```

## [Cmd](#tab/cmd)

```cmd
Set IP="MY_EXTERNAL_IP"
az network public-ip list --query "[?ipAddress!=null]|[?contains(ipAddress, '%IP%')].[id]" --output tsv)
```

---

## Query examples for web apps
This section shows example queries for web apps.

* The following query lists all web apps that are currently running.

## [Bash](#tab/bash)

```azurecli-interactive
az webapp list --query "[?state=='Running']"
```

## [PowerShell](#tab/powershell)

```powershell
az webapp list --query "[?state=='Running']"
```

## [Cmd](#tab/cmd)

```cmd
az webapp list --query "[?state=='Running']"
```

---

* The following query returns the profile name and url of all web apps whose profile name ends with FTP.

## [Bash](#tab/bash)

```azurecli-interactive
az webapp deployment list-publishing-profiles --name DemoApp --resource-group DemoGroup --query "[?ends_with(profileName, 'FTP')].{profileName: profileName, publishUrl: publishUrl}"
```

## [PowerShell](#tab/powershell)

```powershell
az webapp deployment list-publishing-profiles --name DemoApp --resource-group DemoGroup --query "[?ends_with(profileName, 'FTP')].{profileName: profileName, publishUrl: publishUrl}"
```

## [Cmd](#tab/cmd)

```cmd
az webapp deployment list-publishing-profiles --name DemoApp --resource-group DemoGroup --query "[?ends_with(profileName, 'FTP')].{profileName: profileName, publishUrl: publishUrl}"
```
---