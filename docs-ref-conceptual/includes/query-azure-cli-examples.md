---
author: dbradish-microsoft
ms.author: dbradish
ms.date: 07/05/2023
ms.topic: include
ms.custom: devx-track-azurecli
---
This section contains examples of JMESPath queries for different Azure resources.

### Query examples for Azure accounts

This section shows example queries for storage accounts.

- This example returns the tenant ID and subscription ID of the Azure account and subscription you're using.

### [Bash](#tab/bash)

```azurecli-interactive
az account show --query "{tenantId:tenantId,subscriptionid:id}"
```

### [PowerShell](#tab/powershell)

```powershell-interactive
az account show --query "{tenantId:tenantId,subscriptionid:id}"
```

### [Cmd](#tab/cmd)

```cmd
az account show --query "{tenantId:tenantId,subscriptionid:id}"
```

---

<a name='query-examples-for-azure-active-directory-service-principals'></a>

### Query examples for Microsoft Entra service principals

This section shows example queries for Microsoft Entra service principals.

- The following query returns the first Microsoft Graph application service principal who has read permissions.

### [Bash](#tab/bash)

```azurecli-interactive
az ad sp list --display-name "Microsoft Graph" --query "[0].appRoles[?value=='User.Read.All' && contains(allowedMemberTypes, 'Application')].id" --output tsv
```

### [PowerShell](#tab/powershell)

```powershell-interactive
az ad sp list --display-name "Microsoft Graph" --query "[0].appRoles[?value=='User.Read.All' && contains(allowedMemberTypes, 'Application')].id" --output tsv
```

### [Cmd](#tab/cmd)

```cmd
az ad sp list --display-name "Microsoft Graph" --query "[0].appRoles[?value=='User.Read.All' && contains(allowedMemberTypes, 'Application')].id" --output tsv
```

---

### Query examples for storage accounts

This section shows example queries for storage accounts.

- This example returns the primary endpoints for all tables a storage account.

### [Bash](#tab/bash)

```azurecli-interactive
az storage account show --resource-group QueryDemo --name mystorageaccount --query "primaryEndpoints.table"
```

### [PowerShell](#tab/powershell)

```powershell-interactive 
az storage account show --resource-group QueryDemo --name mystorageaccount --query "primaryEndpoints.table"
```

### [Cmd](#tab/cmd)

```cmd
az storage account show --resource-group QueryDemo --name mystorageaccount --query "primaryEndpoints.table"
```

---

### Query examples for Virtual Machines

This section shows example queries for Virtual Machines (VMs).

- This example returns the names of VMs whose disk size is larger than 50 GB.

### [Bash](#tab/bash)

```azurecli-interactive
az vm list --resource-group QueryDemo --query "[?storageProfile.osDisk.diskSizeGb >=\`50\`].{Name:name,  admin:osProfile.adminUsername, DiskSize:storageProfile.osDisk.diskSizeGb }" --output table
```

### [PowerShell](#tab/powershell)

```powershell-interactive
az vm list --resource-group QueryDemo --query "[?storageProfile.osDisk.diskSizeGb >=``50``].{Name:name,  admin:osProfile.adminUsername, DiskSize:storageProfile.osDisk.diskSizeGb }" --output table
```

Notice the extra escape characters (`` ` ``) surrounding the 50 in the command previous. The extra escape characters are present because Azure CLI commands are considered Command Prompt scripts.  Take into consideration the built-in parsing of both PowerShell and of a Command Prompt. Azure CLI will only receive a symbol if it still exists after 2 rounds of parsing. For more information about other possible quoting issues, see [Quoting issues with PowerShell](https://github.com/Azure/azure-cli/blob/dev/doc/quoting-issues-with-powershell.md).

### [Cmd](#tab/cmd)

```cmd
az vm list --resource-group QueryDemo --query "[?storageProfile.osDisk.diskSizeGb >=`50`].{Name:name, admin:osProfile.adminUsername, DiskSize:storageProfile.osDisk.diskSizeGb }" --output table
```

---

- The following query demonstrates how to list the names and storage account types of VMs who use SSD storage.

### [Bash](#tab/bash)

```azurecli-interactive
az vm list --resource-group QueryDemo --query "[].{Name:name, Storage:storageProfile.osDisk.managedDisk.storageAccountType} | [? contains(Storage,'SSD')]"
```

### [PowerShell](#tab/powershell)

```powershell-interactive
az vm list --resource-group QueryDemo --query "[].{Name:name, Storage:storageProfile.osDisk.managedDisk.storageAccountType} | [? contains(Storage,'SSD')]"
```

### [Cmd](#tab/cmd)

```cmd
az vm list --resource-group QueryDemo --query "[].{Name:name, Storage:storageProfile.osDisk.managedDisk.storageAccountType} | [? contains(Storage,'SSD')]"
```

---

### Query examples for cognitive services
This section shows example queries for cognitive services.

-  The following query demonstrates how to list endpoints of a cognitive service.

### [Bash](#tab/bash)

```azurecli-interactive
az cognitiveservices account show --resource-group QueryDemo --name DemoAccount --query "properties.endpoint"

```

### [PowerShell](#tab/powershell)

```powershell-interactive
az cognitiveservices account show --resource-group QueryDemo --name DemoAccount --query "properties.endpoint"
```

### [Cmd](#tab/cmd)

```cmd
az cognitiveservices account show --resource-group QueryDemo --name DemoAccount --query "properties.endpoint"

```

---

### Query examples for virtual networks

This section shows example queries for virtual networks (VNet).

- The following query lists the IDs of IP addresses that contain the substring in the variable IP.

### [Bash](#tab/bash)

```azurecli-interactive
IP="20.127"
az network public-ip list --query "[?ipAddress!=null]|[?contains(ipAddress, '$IP')].[id]" --output tsv
```

### [PowerShell](#tab/powershell)

```powershell-interactive
$IP="20.127"
az network public-ip list --query "[?ipAddress!=null]|[?contains(ipAddress, '$IP')].[id]" --output tsv
```

### [Cmd](#tab/cmd)

```cmd
Set IP="20.127"
az network public-ip list --query "[?ipAddress!=null]|[?contains(ipAddress, '%IP%')].[id]" --output tsv
```

---

### Query examples for web apps

This section shows example queries for web apps.

- The following query lists all web apps that are currently running.

### [Bash](#tab/bash)

```azurecli-interactive
az webapp list --resource-group DemoGroup --query "[?state=='Running']"
```

### [PowerShell](#tab/powershell)

```powershell-interactive
az webapp list --resource-group DemoGroup --query "[?state=='Running']"
```

### [Cmd](#tab/cmd)

```cmd
az webapp list --resource-group DemoGroup --query "[?state=='Running']"
```

---

- The following query returns the profile name and url of all web apps whose profile name ends with FTP.

### [Bash](#tab/bash)

```azurecli-interactive
az webapp deployment list-publishing-profiles --resource-group DemoGroup --name DemoApp --query "[?ends_with(profileName, 'FTP')].{profileName: profileName, publishUrl: publishUrl}"
```

### [PowerShell](#tab/powershell)

```powershell-interactive
az webapp deployment list-publishing-profiles --resource-group DemoGroup --name DemoApp --query "[?ends_with(profileName, 'FTP')].{profileName: profileName, publishUrl: publishUrl}"
```

### [Cmd](#tab/cmd)

```cmd
az webapp deployment list-publishing-profiles --resource-group DemoGroup --name DemoApp --query "[?ends_with(profileName, 'FTP')].{profileName: profileName, publishUrl: publishUrl}"
```

---
