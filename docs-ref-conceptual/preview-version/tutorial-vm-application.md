---
title: "Tutorial: Deploy and manage a virtual machine application with Azure CLI (preview)"
description: "Deploy a web application on a virtual machine, verify a stop and start cycle, and clean up with Azure CLI preview."
author: msmbaldwin
ms.author: mbaldwin
ms.service: azure-cli
ms.topic: tutorial
ms.date: 10/27/2026
ms.custom: devx-track-azurecli
ai-usage: ai-assisted
---

# Tutorial: Deploy and manage a virtual machine application with Azure CLI (preview)

In this tutorial, you deploy a web application on a virtual machine, verify a stop and start cycle, and clean up with Azure CLI preview.

In this tutorial, you:

> [!div class="checklist"]
> - Prepare the environment
> - Deploy the virtual machine
> - Run the application
> - Operate the virtual machine
> - Clean up

> [!IMPORTANT]
> These draft examples require end-to-end validation against the release build before use.

## Prerequisites

- Bash on Linux or macOS, or PowerShell 7.6 or later on Windows.
- Azure CLI preview, installed and signed in as described in [Set up and switch sign-in profiles](quickstart-profiles.md).
- OpenSSH tools (`ssh` and `ssh-keygen`) and, for the Bash path, `curl`.
- An existing network security group (NSG) in the VM's region that allows SSH (port 22) and HTTP (port 80) only from your IP address, and outbound access for Ubuntu packages.

You need an Azure subscription. If you don't have one, [create a free account](https://azure.microsoft.com/free/).

Verify the SSH host fingerprint when prompted. Do not disable host-key checking.

## Set variables

# [Bash](#tab/bash)

```bash
set -euo pipefail
sub="<test-subscription-id>"
location="<region>"
nsg_id="<existing-NSG-resource-ID>"
run=$(date +%Y%m%d%H%M%S)
rg="azclips-app-$run"
vm="app-$run"
pip="$vm-pip"
admin="azadmin"
image="Canonical:0001-com-ubuntu-server-jammy:22_04-lts-gen2:latest"
key="/tmp/$vm-key"
```

# [PowerShell](#tab/powershell)

```powershell
$ErrorActionPreference = 'Stop'
$sub = '<test-subscription-id>'
$location = '<region>'
$nsgId = '<existing-NSG-resource-ID>'
$run = Get-Date -Format 'yyyyMMddHHmmss'
$rg = "azclips-app-$run"
$vm = "app-$run"
$pip = "$vm-pip"
$admin = 'azadmin'
$image = 'Canonical:0001-com-ubuntu-server-jammy:22_04-lts-gen2:latest'
$key = Join-Path ([IO.Path]::GetTempPath()) "$vm-key"
$scope = @('--subscription-id', $sub, '--resource-group', $rg)
$page = 'AzCLIPS scenario 2 is running'
```

---

## Prepare the environment

# [Bash](#tab/bash)

```bash
az group create --subscription-id "$sub" --name "$rg" --location "$location"
az network public-ip create --subscription-id "$sub" --resource-group "$rg" --name "$pip" --location "$location" --sku Standard --allocation-method Static --version IPv4
```

# [PowerShell](#tab/powershell)

```powershell
az group create --subscription-id $sub --name $rg --location $location
az network public-ip create @scope --name $pip --location $location --sku Standard --allocation-method Static --version IPv4
```

---

## Deploy the virtual machine

# [Bash](#tab/bash)

```bash
ssh-keygen -t ed25519 -f "$key" -C "azclips-$run"
az vm create --subscription-id "$sub" --resource-group "$rg" --name "$vm" --location "$location" --size Standard_D2s_v3 --image "$image" --admin-username "$admin" --ssh-key-values "$key.pub" --network-interface-name "$vm-nic" --virtual-network-name "$vm-vnet" --address-prefixes 10.0.0.0/16 --subnet-names app --subnet-address-prefixes 10.0.2.0/24 --nsg "$nsg_id" --public-ip-address "$pip"
az vm show --subscription-id "$sub" --resource-group "$rg" --name "$vm"
```

# [PowerShell](#tab/powershell)

```powershell
ssh-keygen -t ed25519 -f $key -C "azclips-$run"
az vm create @scope --name $vm --location $location --size Standard_D2s_v3 --image $image --admin-username $admin --ssh-key-values "$key.pub" --network-interface-name "$vm-nic" --virtual-network-name "$vm-vnet" --address-prefixes 10.0.0.0/16 --subnet-names app --subnet-address-prefixes 10.0.2.0/24 --nsg $nsgId --public-ip-address $pip
az vm show @scope --name $vm
```

---

## Run the application

# [Bash](#tab/bash)

```bash
ip=$(az network public-ip show --subscription-id "$sub" --resource-group "$rg" --name "$pip" --query properties.ipAddress --output tsv)
ssh -i "$key" "$admin@$ip" "sudo apt-get update && sudo apt-get install -y nginx && printf '%s\n' 'AzCLIPS scenario 2 is running' | sudo tee /var/www/html/index.html && sudo systemctl enable --now nginx"
test "$(curl -fsS --max-time 30 "http://$ip")" = "AzCLIPS scenario 2 is running"
```

# [PowerShell](#tab/powershell)

```powershell
$ip = az network public-ip show @scope --name $pip --query properties.ipAddress --output tsv
ssh -i $key "$admin@$ip" "sudo apt-get update && sudo apt-get install -y nginx && printf '%s\n' '$page' | sudo tee /var/www/html/index.html && sudo systemctl enable --now nginx"
$response = Invoke-WebRequest -Uri "http://$ip" -TimeoutSec 30
if ($response.Content.Trim() -ne $page) { throw 'Application verification failed.' }
```

---

## Operate the virtual machine

# [Bash](#tab/bash)

```bash
az vm stop --subscription-id "$sub" --resource-group "$rg" --name "$vm"
az vm start --subscription-id "$sub" --resource-group "$rg" --name "$vm"
test "$(curl -fsS --max-time 30 "http://$ip")" = "AzCLIPS scenario 2 is running"
```

Allow up to five minutes after each start for the page to return. The application is unavailable while the VM remains offline.

Optional: deallocate and start the VM, then repeat the check.

```bash
az vm deallocate --subscription-id "$sub" --resource-group "$rg" --name "$vm"
az vm start --subscription-id "$sub" --resource-group "$rg" --name "$vm"
test "$(curl -fsS --max-time 30 "http://$ip")" = "AzCLIPS scenario 2 is running"
```

# [PowerShell](#tab/powershell)

```powershell
az vm stop @scope --name $vm
az vm start @scope --name $vm
$response = Invoke-WebRequest -Uri "http://$ip" -TimeoutSec 30
if ($response.Content.Trim() -ne $page) { throw 'Application verification failed.' }
```

Allow up to five minutes after each start for the page to return. The application is unavailable while the VM remains offline.

Optional: deallocate and start the VM, then repeat the check.

```powershell
az vm deallocate @scope --name $vm
az vm start @scope --name $vm
$response = Invoke-WebRequest -Uri "http://$ip" -TimeoutSec 30
if ($response.Content.Trim() -ne $page) { throw 'Application verification failed.' }
```

---

## Clean up resources

# [Bash](#tab/bash)

```bash
az vm delete --subscription-id "$sub" --resource-group "$rg" --name "$vm"
az group delete --subscription-id "$sub" --name "$rg"
az group exists --subscription-id "$sub" --name "$rg"
rm -f "$key" "$key.pub"
```

# [PowerShell](#tab/powershell)

```powershell
az vm delete @scope --name $vm
az group delete --subscription-id $sub --name $rg
az group exists --subscription-id $sub --name $rg
Remove-Item -LiteralPath $key, "$key.pub"
```

---

## Related content

- For more information, see [Get started with the preview](getting-started.md).
- For more information, see [Set up and switch sign-in profiles](quickstart-profiles.md).
- For more information, see [Access a Key Vault secret with a managed identity](tutorial-managed-identity.md).
