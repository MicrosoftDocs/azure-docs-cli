---
title: Output formats for Azure CLI 2.0 
description: Use --output to format the output of Azure CLI 2.0 commands to tables, lists or json.
keywords: Azure CLI 2.0, output, format, table, list, json, Linux, Mac, Windows, OS X
author: rloutlaw
ms.author: routlaw
manager: douge
ms.date: 02/27/2017
ms.topic: article
ms.prod: azure
ms.technology: azure
ms.assetid: 74bdb727-481d-45f7-a44e-15d18dc55483
---

# Output formats for Azure CLI 2.0 commands

Azure CLI 2.0 uses json as its default output option, but offers various ways for you to format the output of any command.  Use the `--output` (or `--out` or `-o`) parameter to format the output of the command into one of the output types noted in the following table. 

--output | Description
---------|-------------------------------
`json`   | json string. `json` is the default.
`jsonc`  | colorized json string.
`table`  | table with column headings.
`tsv`    | tab-separated values.

## Using the json option

The following example displays the list of virtual machines in your subscriptions in the default json format.

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
    "id": "/subscriptions/XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX/resourceGroups/DEMORG1/providers/Microsoft.Compute/virtualMachines/DemoVM010",
    "instanceView": null,
    "licenseType": null,
    "location": "westus",
    "name": "DemoVM010",
    "networkProfile": {
      "networkInterfaces": [
        {
          "id": "/subscriptions/XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX/resourceGroups/demorg1/providers/Microsoft.Network/networkInterfaces/DemoVM010VMNic",
          "primary": null,
          "resourceGroup": "demorg1"
        }
      ]
    },
          ...
          ...
          ...   
]
```
 
## Using the table option

The table option provides an easy to read set of output, but note that nested objects are not included in the output with the simple `--output table`, unlike the preceding .json example.  Using the same example with 'table' output format provides a curated list of most common property values.

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

You can use the `--query` parameter to customize the properties and columns you want to show in the list output. The following example shows how to select just the VM Name and the Resource Group Name in the `list` command.

```azurecli
az vm list --query "[].{ resource: resourceGroup, name: name }" -o table
```

```
Resource    Name
----------  -----------
DEMORG1     DemoVM010
DEMORG1     demovm212
DEMORG1     demovm213
RGDEMO001   KBDemo001VM
RGDEMO001   KBDemo020
```

## Using the tsv option

'tsv' output format returns a simple text-based and tab-separated output with no headings and dashes. This format makes it easy to consume the output into other commands and tools that need to process the text in some form. Using the preceding example with the `tsv` option outputs the tab-separated result.

```azurecli
az vm list --out tsv
```

```
None	None		/subscriptions/XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX/resourceGroups/DEMORG1/providers/Microsoft.Compute/virtualMachines/DemoVM010	None	None	westus	DemoVM010			None	Succeeded	DEMORG1	None			Microsoft.Compute/virtualMachines	cbd56d9b-9340-44bc-a722-25f15b578444
None	None		/subscriptions/XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX/resourceGroups/DEMORG1/providers/Microsoft.Compute/virtualMachines/demovm212	None	None	westus	demovm212			None	Succeeded	DEMORG1	None			Microsoft.Compute/virtualMachines	4bdac85d-c2f7-410f-9907-ca7921d930b4
None	None		/subscriptions/XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX/resourceGroups/DEMORG1/providers/Microsoft.Compute/virtualMachines/demovm213	None	None	westus	demovm213			None	Succeeded	DEMORG1	None			Microsoft.Compute/virtualMachines	2131c664-221a-4b7f-9653-f6d542fbfa34
None	None		/subscriptions/XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX/resourceGroups/RGDEMO001/providers/Microsoft.Compute/virtualMachines/KBDemo001VM	None	None	westus	KBDemo001VM			None	Succeeded	RGDEMO001	None			Microsoft.Compute/virtualMachines	14e74761-c17e-4530-a7be-9e4ff06ea74b
None	None		/subscriptions/XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX/resourceGroups/RGDEMO001/providers/Microsoft.Compute/virtualMachines/KBDemo02None	None	westus	KBDemo020			None	Succeeded	RGDEMO001	None			Microsoft.Compute/virtualMachinesed36baa9-9b80-48a8-b4a9-854c7a858ece
```

The next example shows how the `tsv` output can be piped to commands like `grep` and `cut` to further parse specific values out of the `list` output. The `grep` command selects only items that have text "RGD" in them and then the `cut` command selects only the eighth field (separated by tabs) value to show in the output.

```azurecli
az vm list --out tsv | grep RGD | cut -f8
```

```
KBDemo001VM
KBDemo020
```

## Setting the default output format

You can use the `az configure` command to set up your environment or establish preferences such as default settings for output formats. For common use, the easiest output format default is the "table" format - select **3** when prompted for output format choices. 

```
What default output format would you like?
 [1] json - JSON formatted output that most closely matches API responses
 [2] jsonc - Colored JSON formatted output that most closely matches API responses
 [3] table - Human-readable output format
 [4] tsv - Tab and Newline delimited, great for GREP, AWK, etc.
Please enter a choice [3]: 
```