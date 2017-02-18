---
title: Output formats for Azure CLI 2.0 
description: Use --output to format the output of Azure CLI 2.0 commands to tables, lists or json.
keywords: Azure CLI 2.0, output, format, table, list, json, Linux, Mac, Windows, OS X
author: allclark
manager: douge
ms.date: 02/18/2017
ms.topic: article
ms.prod: azure
ms.technology: azure
ms.assetid: 74bdb727-481d-45f7-a44e-15d18dc55483
---

# Output formats for Azure CLI 2.0 commands

Azure CLI 2.0 uses .json as its default output option, but offers a variety of ways for you to format the output of any command.  Use the `--output` (or `--out` or `-o`) parameter to format the output of the command into one of the output types noted in the below table. 

--output | Description
---------|-------------------------------
`json`   | json string. `json` is the default.
`jsonc`  | colorized json string.
`table`  | table with column headings.
`tsv`    | tab-separated values.

## Using the .json option

The following example displays the list of Azure clouds in the default. json format.

```azurecli
az vm list --output json
```

The results are in this form (only showing partial output for sake of brevity).

```json
[
  {
    "availabilitySet": null,
    "diagnosticsProfile": null,
    "hardwareProfile": {
      "vmSize": "Standard_DS1"
    },
    "id": "/subscriptions/ff696af2-840a-43d1-af03-8f78cdfb5185/resourceGroups/DEMORG1/providers/Microsoft.Compute/virtualMachines/DemoVM010",
    "instanceView": null,
    "licenseType": null,
    "location": "westus",
    "name": "DemoVM010",
    "networkProfile": {
      "networkInterfaces": [
        {
          "id": "/subscriptions/ff696af2-840a-43d1-af03-8f78cdfb5185/resourceGroups/demorg1/providers/Microsoft.Network/networkInterfaces/DemoVM010VMNic",
          "primary": null,
          "resourceGroup": "demorg1"
        }
      ]
    },
          ...
          ...
          ...
             "osDisk": {
        "caching": "ReadWrite",
        "createOption": "fromImage",
        "diskSizeGb": null,
        "encryptionSettings": null,
        "image": null,
        "managedDisk": null,
        "name": "osdiskKBDemo020",
        "osType": "Linux",
        "vhd": {
          "uri": "http://vhdstoragel7jtsfov6vnnu.blob.core.windows.net/vhds/osdiskimage.vhd"
        }
      }
    },
    "tags": {
      "displayName": "VirtualMachine"
    },
    "type": "Microsoft.Compute/virtualMachines",
    "vmId": "ed36baa9-9b80-48a8-b4a9-854c7a858ece"
  }
]
```
 
## Using the table or tsv option

The table or tsv option provides an easy to ready set of output, but note that nested objects are not included in the output with the simple `--output table` or `--output tsv` option, unlike the .json example above.  Using the same example as above with 'table' output format will provide a curated list of most common property values.

'tsv' format returns a simple text-based and tab-separated output with no headings and dashes.

```azurecli
az vm list --out table
```

```
Name         ResourceGroup    Location
-----------  ---------------  ----------
DemoVM010    DEMORG1          westus
demovm212    DEMORG1          westus
demovm213    DEMORG1          westus
KBDemo001VM  RGDEMO001        westus
KBDemo020    RGDEMO001        westus
```

```azurecli
az vm list --out tsv
```

```
None	None		/subscriptions/ff696af2-840a-43d1-af03-8f78cdfb5185/resourceGroups/DEMORG1/providers/Microsoft.Compute/virtualMachines/DemoVM010	None	None	westus	DemoVM010			None	Succeeded	DEMORG1	None			Microsoft.Compute/virtualMachines	cbd56d9b-9340-44bc-a722-25f15b578444
None	None		/subscriptions/ff696af2-840a-43d1-af03-8f78cdfb5185/resourceGroups/DEMORG1/providers/Microsoft.Compute/virtualMachines/demovm212	None	None	westus	demovm212			None	Succeeded	DEMORG1	None			Microsoft.Compute/virtualMachines	4bdac85d-c2f7-410f-9907-ca7921d930b4
None	None		/subscriptions/ff696af2-840a-43d1-af03-8f78cdfb5185/resourceGroups/DEMORG1/providers/Microsoft.Compute/virtualMachines/demovm213	None	None	westus	demovm213			None	Succeeded	DEMORG1	None			Microsoft.Compute/virtualMachines	2131c664-221a-4b7f-9653-f6d542fbfa34
None	None		/subscriptions/ff696af2-840a-43d1-af03-8f78cdfb5185/resourceGroups/RGDEMO001/providers/Microsoft.Compute/virtualMachines/KBDemo001VM	None	None	westus	KBDemo001VM			None	Succeeded	RGDEMO001	None			Microsoft.Compute/virtualMachines	14e74761-c17e-4530-a7be-9e4ff06ea74b
None	None		/subscriptions/ff696af2-840a-43d1-af03-8f78cdfb5185/resourceGroups/RGDEMO001/providers/Microsoft.Compute/virtualMachines/KBDemo02None	None	westus	KBDemo020			None	Succeeded	RGDEMO001	None			Microsoft.Compute/virtualMachinesed36baa9-9b80-48a8-b4a9-854c7a858ece
```

You can use the `--query` to filter and select specific properties, values and flatten nested properties from the json output. For more details on the Query topic, please look at the `Query` article.

Leveraging the above example, if we only want to see the Resource Group and VM Name of all Virtual Machines that are in the Resource Group names starting with "RGD", add the following `--query` parameter to the command.

```azurecli
az vm list --query "[?contains(resourceGroup,'RGD')].{ resource: resourceGroup, name: name }" -o table
```

```
Resource    Name
----------  -----------
RGDEMO001   KBDemo001VM
RGDEMO001   KBDemo020
```

