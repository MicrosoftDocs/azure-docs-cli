---
author: dbradish-microsoft
ms.author: dbradish
ms.date: 08/1/2023
ms.topic: include
ms.custom: devx-track-azurecli
---

Azure CLI uses queries to select and modify the output of Azure CLI commands. Queries are executed client-side on the Azure CLI command's returned JSON object before any display formatting.

The escape characters needed in queries differ for different environments. It's recommended to run queries in Azure Cloud Shell or cmd because these shells require fewer escape characters. To ensure the query examples are syntactically correct, select the tab for the shell you're using.

## Dictionary and list CLI results

CLI command results are first treated as JSON for queries, even when the output format is something other than JSON. CLI results are either a JSON array or dictionary. Arrays are sequences of objects that can be indexed, and dictionaries are unordered objects accessed with keys.

This is an example of an array:
```json
[ 
  1,
  2,
  3
]
```

This is an example of a dictionary:
```json
{
  "isRunning": false,
  "time": "12:00",
  "number": 1
}
```

Commands that _could_ return more than one object return an array, and commands that _always_ return _only_ a single object return a dictionary.

## Get properties in a dictionary

Working with dictionary results, you can access properties from the top level with just the key. The `.` (__subexpression__) character is used to access properties of nested dictionaries. Before introducing queries, take a look at the unmodified output of the [az vm show](/cli/azure/vm#az-vm-show) command:

### [Bash](#tab/bash)

```azurecli-interactive
az vm show --resource-group QueryDemo --name TestVM
```

### [PowerShell](#tab/powershell)

To avoid possible quoting issues with older versions of PowerShell, ensure that you're using the latest version. To install the latest version of PowerShell, see [Install PowerShell on Windows, Linux, and macOS](/powershell/scripting/install/installing-powershell).

```azurecli-interactive
az vm show --resource-group QueryDemo --name TestVM
```

### [Cmd](#tab/cmd)

```azurecli-interactive
az vm show --resource-group QueryDemo --name TestVM
```

---

The command outputs a dictionary. Some content has been omitted.

```json
{
  "additionalCapabilities": null,
  "availabilitySet": null,
  "diagnosticsProfile": {
    "bootDiagnostics": {
      "enabled": true,
      "storageUri": "https://xxxxxx.blob.core.windows.net/"
    }
  },
  ...
  "osProfile": {
    "adminPassword": null,
    "adminUsername": "azureuser",
    "allowExtensionOperations": true,
    "computerName": "TestVM",
    "customData": null,
    "linuxConfiguration": {
      "disablePasswordAuthentication": true,
      "provisionVmAgent": true,
      "ssh": {
        "publicKeys": [
          {
            "keyData": "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDMobZNJTqgjWn/IB5xlilvE4Y+BMYpqkDnGRUcA0g9BYPgrGSQquCES37v2e3JmpfDPHFsaR+CPKlVr2GoVJMMHeRcMJhj50ZWq0hAnkJBhlZVWy8S7dwdGAqPyPmWM2iJDCVMVrLITAJCno47O4Ees7RCH6ku7kU86b1NOanvrNwqTHr14wtnLhgZ0gQ5GV1oLWvMEVg1YFMIgPRkTsSQKWCG5lLqQ45aU/4NMJoUxGyJTL9i8YxMavaB1Z2npfTQDQo9+womZ7SXzHaIWC858gWNl9e5UFyHDnTEDc14hKkf1CqnGJVcCJkmSfmrrHk/CkmF0ZT3whTHO1DhJTtV stramer@contoso",
            "path": "/home/azureuser/.ssh/authorized_keys"
          }
        ]
      }
    },
    "secrets": [],
    "windowsConfiguration": null
  },
  ....
}
```

The following command gets the SSH public keys authorized to connect to the VM by adding a query:

### [Bash](#tab/bash)

```azurecli-interactive
az vm show --resource-group QueryDemo --name TestVM --query "osProfile.linuxConfiguration.ssh.publicKeys"
```

### [PowerShell](#tab/powershell)

```azurecli-interactive
az vm show --resource-group QueryDemo --name TestVM --query "osProfile.linuxConfiguration.ssh.publicKeys"
```

### [Cmd](#tab/cmd)

```azurecli-interactive
az vm show --resource-group QueryDemo --name TestVM --query "osProfile.linuxConfiguration.ssh.publicKeys"
```

---

```json
[
  {
    "keyData": "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDMobZNJTqgjWn/IB5xlilvE4Y+BMYpqkDnGRUcA0g9BYPgrGSQquCES37v2e3JmpfDPHFsaR+CPKlVr2GoVJMMHeRcMJhj50ZWq0hAnkJBhlZVWy8S7dwdGAqPyPmWM2iJDCVMVrLITAJCno47O4Ees7RCH6ku7kU86b1NOanvrNwqTHr14wtnLhgZ0gQ5GV1oLWvMEVg1YFMIgPRkTsSQKWCG5lLqQ45aU/4NMJoUxGyJTL9i8YxMavaB1Z2npfTQDQo9+womZ7SXzHaIWC858gWNl9e5UFyHDnTEDc14hKkf1CqnGJVcCJkmSfmrrHk/CkmF0ZT3whTHO1DhJTtV stramer@contoso",
    "path": "/home/azureuser/.ssh/authorized_keys"
  }
]
```

Query strings are case sensitive. For example, changing 'osProfile' to 'OsProfile' in the previous query doesn't return the correct results.

## Get multiple values

To get more than one property, put expressions separated by commas in square brackets  `[ ]` (a __multiselect list__). The following command gets the VM name, admin user, and SSH key all at once:

### [Bash](#tab/bash)

```azurecli-interactive
az vm show --resource-group QueryDemo --name TestVM --query "[name, osProfile.adminUsername, osProfile.linuxConfiguration.ssh.publicKeys[0].keyData]"
```

### [PowerShell](#tab/powershell)

```azurecli-interactive
az vm show --resource-group QueryDemo --name TestVM --query "[name, osProfile.adminUsername, osProfile.linuxConfiguration.ssh.publicKeys[0].keyData]"
```

### [Cmd](#tab/cmd)

```azurecli-interactive
az vm show --resource-group QueryDemo --name TestVM --query "[name, osProfile.adminUsername, osProfile.linuxConfiguration.ssh.publicKeys[0].keyData]"
```
---

```json
[
  "TestVM",
  "azureuser",
  "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDMobZNJTqgjWn/IB5xlilvE4Y+BMYpqkDnGRUcA0g9BYPgrGSQquCES37v2e3JmpfDPHFsaR+CPKlVr2GoVJMMHeRcMJhj50ZWq0hAnkJBhlZVWy8S7dwdGAqPyPmWM2iJDCVMVrLITAJCno47O4Ees7RCH6ku7kU86b1NOanvrNwqTHr14wtnLhgZ0gQ5GV1oLWvMEVg1YFMIgPRkTsSQKWCG5lLqQ45aU/4NMJoUxGyJTL9i8YxMavaB1Z2npfTQDQo9+womZ7SXzHaIWC858gWNl9e5UFyHDnTEDc14hKkf1CqnGJVcCJkmSfmrrHk/CkmF0ZT3whTHO1DhJTtV stramer@contoso"
]
```

These values are listed in the result array in the order they were given in the query. Since the result is an array, there are no keys associated with the results. To get a dictionary instead of an array, see the next section.

## Rename properties in a query

To get a dictionary instead of an array when querying for multiple values, use the `{ }` (__multiselect hash__) operator.
The format for a multiselect hash is `{displayName:JMESPathExpression, ...}`.
`displayName` is the string shown in output, and `JMESPathExpression` is the JMESPath expression to evaluate. Modify the example from the
last section by changing the multiselect list to a hash:

> [!NOTE]
> If you choose to use a space in a new column name, like `VM name` instead of `VMName`, the quoting
> rules change in both Bash and PowerShell. See [Pass spaces in Azure CLI parameters](../use-azure-cli-successfully-powershell.md#pass-spaces-in-azure-cli-parameters)
> for examples.

### [Bash](#tab/bash)

```azurecli-interactive
az vm show --resource-group QueryDemo --name TestVM --query "{VMName:name, admin:osProfile.adminUsername, sshKey:osProfile.linuxConfiguration.ssh.publicKeys[0].keyData}"
```

### [PowerShell](#tab/powershell)

```azurecli-interactive
az vm show --resource-group QueryDemo --name TestVM --query "{VMName:name, admin:osProfile.adminUsername, sshKey:osProfile.linuxConfiguration.ssh.publicKeys[0].keyData }"
```

### [Cmd](#tab/cmd)

```azurecli-interactive
az vm show --resource-group QueryDemo --name TestVM --query "{VMName:name, admin:osProfile.adminUsername, sshKey:osProfile.linuxConfiguration.ssh.publicKeys[0].keyData }"
```

---

```json
{
  "VMName": "TestVM",
  "admin": "azureuser",
  "ssh-key": "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDMobZNJTqgjWn/IB5xlilvE4Y+BMYpqkDnGRUcA0g9BYPgrGSQquCES37v2e3JmpfDPHFsaR+CPKlVr2GoVJMMHeRcMJhj50ZWq0hAnkJBhlZVWy8S7dwdGAqPyPmWM2iJDCVMVrLITAJCno47O4Ees7RCH6ku7kU86b1NOanvrNwqTHr14wtnLhgZ0gQ5GV1oLWvMEVg1YFMIgPRkTsSQKWCG5lLqQ45aU/4NMJoUxGyJTL9i8YxMavaB1Z2npfTQDQo9+womZ7SXzHaIWC858gWNl9e5UFyHDnTEDc14hKkf1CqnGJVcCJkmSfmrrHk/CkmF0ZT3whTHO1DhJTtV stramer@contoso"
}
```

## Get properties in an array

An array has no properties of its own, but it can be indexed. This feature is shown in the last example with the expression `publicKeys[0]`, which gets the first element of the `publicKeys` array. There's no guarantee CLI output is ordered, so avoid using indexing unless you're sure of the order or don't care which element you get. To access the properties of elements in an array, you do one of two operations: _flattening_ or _filtering_. This section covers how to flatten an array.

Flattening an array is done with the `[]` JMESPath operator. All expressions after the `[]` operator are applied to each element in the current array.
If `[]` appears at the start of the query, it flattens the CLI command result. The results of `az vm list` can be inspected with this feature.
The following query gets the name, OS, and administrator name for each VM in a resource group:

### [Bash](#tab/bash)

```azurecli-interactive
az vm list --resource-group QueryDemo --query "[].{Name:name, OS:storageProfile.osDisk.osType, admin:osProfile.adminUsername}"
```

### [PowerShell](#tab/powershell)

```azurecli-interactive
az vm list --resource-group QueryDemo --query "[].{Name:name, OS:storageProfile.osDisk.osType, admin:osProfile.adminUsername}" 
```

### [Cmd](#tab/cmd)

```azurecli-interactive
az vm list --resource-group QueryDemo --query "[].{Name:name, OS:storageProfile.osDisk.osType, admin:osProfile.adminUsername}"
```

---

```json
[
  {
    "Name": "Test-2",
    "OS": "Linux",
    "admin": "sttramer"
  },
  {
    "Name": "TestVM",
    "OS": "Linux",
    "admin": "azureuser"
  },
  {
    "Name": "WinTest",
    "OS": "Windows",
    "admin": "winadmin"
  }
]
```

Any array can be flattened, not just the top-level result returned by the command. In the last section, the expression `osProfile.linuxConfiguration.ssh.publicKeys[0].keyData` was used to get the SSH public key for sign-in. To get _every_ SSH public key, the expression could instead be written as `osProfile.linuxConfiguration.ssh.publicKeys[].keyData`.
This query expression flattens the `osProfile.linuxConfiguration.ssh.publicKeys` array, and then runs the `keyData` expression on each
element:

### [Bash](#tab/bash)

```azurecli-interactive
az vm show --resource-group QueryDemo --name TestVM --query "{VMName:name, admin:osProfile.adminUsername, sshKeys:osProfile.linuxConfiguration.ssh.publicKeys[].keyData }"
```

### [PowerShell](#tab/powershell)

```azurecli-interactive
az vm show --resource-group QueryDemo --name TestVM --query "{VMName:name, admin:osProfile.adminUsername, sshKeys:osProfile.linuxConfiguration.ssh.publicKeys[].keyData }"
```

### [Cmd](#tab/cmd)

```azurecli-interactive
az vm show --resource-group QueryDemo --name TestVM --query "{VMName:name, admin:osProfile.adminUsername, sshKeys:osProfile.linuxConfiguration.ssh.publicKeys[].keyData }"
```
---

```json
{
  "VMName": "TestVM",
  "admin": "azureuser",
  "sshKeys": [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDMobZNJTqgjWn/IB5xlilvE4Y+BMYpqkDnGRUcA0g9BYPgrGSQquCES37v2e3JmpfDPHFsaR+CPKlVr2GoVJMMHeRcMJhj50ZWq0hAnkJBhlZVWy8S7dwdGAqPyPmWM2iJDCVMVrLITAJCno47O4Ees7RCH6ku7kU86b1NOanvrNwqTHr14wtnLhgZ0gQ5GV1oLWvMEVg1YFMIgPRkTsSQKWCG5lLqQ45aU/4NMJoUxGyJTL9i8YxMavaB1Z2npfTQDQo9+womZ7SXzHaIWC858gWNl9e5UFyHDnTEDc14hKkf1CqnGJVcCJkmSfmrrHk/CkmF0ZT3whTHO1DhJTtV stramer@contoso\n"
  ]
}
```

## Filter arrays with boolean expressions

The other operation used to get data from an array is _filtering_. Filtering is done with the `[?...]` JMESPath operator.
This operator takes a predicate as its contents. A predicate is any statement (including Boolean properties) that can be evaluated to either `true` or `false`. Expressions where the predicate evaluates to `true` are included in the output.

The first query demonstrates how to list the names of all Azure subscriptions connected to your account whose `isDefault` property is true. The second and third queries show two different ways to list all subscriptions whose `isDefault` property is false.

### [Bash](#tab/bash)

```azurecli-interactive
# Boolean values are assumed to be true, so you can directly evaluate the isDefault property to return the default subscription.
az account list --query "[?isDefault].name"

# To check if a Boolean property is false, you can use the comparison operator == or the logical operator !.
az account list --query '[?!isDefault].name'
az account list --query "[?isDefault == \`false\`].name"
```

### [PowerShell](#tab/powershell)

```azurecli-interactive
# Boolean values are assumed to be true, so you can directly evaluate the isDefault property to return the default subscription.
az account list --query "[?isDefault].name"

# To check if a Boolean property is false, you can use the comparison operator == or the logical operator !.
az account list --query "[?!isDefault].name"
az account list --query "[?isDefault == ``false``].name"
```

Notice the extra escape characters (`` ` ``) surrounding the value `false` in the previous command. These extra escape characters are present because Azure CLI commands are considered Command Prompt scripts, so both PowerShell and Command Prompt's parsing need to be considered. Azure CLI will only receive a symbol if it still exists after two rounds of parsing. For more information about other possible quoting issues in PowerShell, see [Considerations for running the Azure CLI in a PowerShell scripting language](../use-azure-cli-successfully-powershell.md).

### [Cmd](#tab/cmd)

```azurecli-interactive
REM Boolean values are assumed to be true, so you can directly evaluate the isDefault property to return the default subscription.
az account list --query "[?isDefault].name"

REM To check if a Boolean property is false, you can use the comparison operator == or the logical operator !.
az account list --query "[?!isDefault].name"
az account list --query "[?isDefault == `false`].name"
```

The example above only works when using the Command Prompt interactively. To execute multiple az commands in a batch script using the Command Prompt, prefix each az command with `call`. For example, use `call az account list` instead of `az account list`.

---

JMESPath offers the standard comparison and logical operators. These include `<`, `<=`, `>`, `>=`, `==`, and `!=`. JMESPath also supports logical and (`&&`), or (`||`), and not (`!`). Expressions can be grouped within parenthesis, allowing for more complex predicate expressions. For the full details on predicates and logical operations, see the [JMESPath specification](http://jmespath.org/specification.html).

In the last section, you flattened an array to get the complete list of all VMs in a resource group. With the use of filters, this output can be restricted to only Linux VMs:

### [Bash](#tab/bash)

```azurecli-interactive
az vm list --resource-group QueryDemo --query "[?storageProfile.osDisk.osType=='Linux'].{Name:name,  admin:osProfile.adminUsername}" --output table
```

### [PowerShell](#tab/powershell)

```azurecli-interactive
az vm list --resource-group QueryDemo --query "[?storageProfile.osDisk.osType=='Linux'].{Name:name,  admin:osProfile.adminUsername}" --output table
```

### [Cmd](#tab/cmd)

```azurecli-interactive
az vm list --resource-group QueryDemo --query "[?storageProfile.osDisk.osType=='Linux'].{Name:name,  admin:osProfile.adminUsername}" --output table
```

---

```json
Name    Admin
------  ---------
Test-2  sttramer
TestVM  azureuser
```

You can also filter numerical values such as the OS disk size. The following example demonstrates how to filter the list of VMs to display ones with a disk size larger than or equal to 50 GB.

### [Bash](#tab/bash)

```azurecli-interactive
az vm list --resource-group QueryDemo --query "[?storageProfile.osDisk.diskSizeGb >=\`50\`].{Name:name,  admin:osProfile.adminUsername, DiskSize:storageProfile.osDisk.diskSizeGb }" --output table
```

### [PowerShell](#tab/powershell)

```azurecli-interactive
az vm list --resource-group QueryDemo --query "[?storageProfile.osDisk.diskSizeGb >=``50``].{Name:name,  admin:osProfile.adminUsername, DiskSize:storageProfile.osDisk.diskSizeGb }" --output table
```

Notice the extra escape characters (`` ` ``) surrounding the 50 in the previous command. These extra escape characters are present because Azure CLI commands are considered Command Prompt scripts, so both PowerShell and Command Prompt's parsing need to be considered. Azure CLI will only receive a symbol if it still exists after two rounds of parsing. For more information about other possible quoting issues in PowerShell, see[Considerations for running the Azure CLI in a PowerShell scripting language](../use-azure-cli-successfully-powershell.md).

### [Cmd](#tab/cmd)

```azurecli-interactive
az vm list --resource-group QueryDemo --query "[?storageProfile.osDisk.diskSizeGb >=`50`].{Name:name, admin:osProfile.adminUsername, DiskSize:storageProfile.osDisk.diskSizeGb }" --output table
```

---

```json
Name     Admin     DiskSize
-------  --------  --------
WinTest  winadmin  127
```

For large arrays, it may be faster to apply the filter before selecting data.

> [!IMPORTANT]
>
> In JMESPath, strings are always surrounded by single quotes (`'`) or escape characters (`` ` ``). If you use double quotes as part of a string in a filter predicate, you'll get empty output.

## JMESPath functions

JMESPath also has built-in functions that allow for more complex queries and for modifying query output. This section focuses on using JMESPath functions to create queries while the [Manipulating output with functions](#manipulating-output-with-functions) section demonstrates how to use functions to modify the output.

Expressions are evaluated before calling the function, so arguments themselves can be JMESPath expressions. The following examples demonstrate this concept by using `contains(string, substring)`, which checks to see if a string contains a substring. This command finds all VMs using SSD storage for their OS disk:

### [Bash](#tab/bash)

```azurecli-interactive
az vm list --resource-group QueryDemo --query "[?contains(storageProfile.osDisk.managedDisk.storageAccountType,'SSD')].{Name:name, Storage:storageProfile.osDisk.managedDisk.storageAccountType}"
```

### [PowerShell](#tab/powershell)

```azurecli-interactive
az vm list --resource-group QueryDemo --query "[?contains(storageProfile.osDisk.managedDisk.storageAccountType,'SSD')].{Name:name, Storage:storageProfile.osDisk.managedDisk.storageAccountType}"
```

### [Cmd](#tab/cmd)

```azurecli-interactive
az vm list --resource-group QueryDemo --query "[?contains(storageProfile.osDisk.managedDisk.storageAccountType,'SSD')].{Name:name, Storage:storageProfile.osDisk.managedDisk.storageAccountType}"
```

---

```json
[
  {
    "Name": "TestVM",
    "Storage": "StandardSSD_LRS"
  },
  {
    "Name": "WinTest",
    "Storage": "StandardSSD_LRS"
  }
]
```

## Pipe expressions

Similar to how `|` is used in the command line, `|` can be used in JMESPath queries to apply expressions to intermediate query results. We can also use `|` to break down complex queries into simpler subexpressions. To shorten the query from the previous section, use `|` to apply the filter after flattening and selecting data.

### [Bash](#tab/bash)

```azurecli-interactive
az vm list --resource-group QueryDemo --query "[].{Name:name, Storage:storageProfile.osDisk.managedDisk.storageAccountType} | [? contains(Storage,'SSD')]"
```

### [PowerShell](#tab/powershell)

```azurecli-interactive
az vm list --resource-group QueryDemo --query "[].{Name:name, Storage:storageProfile.osDisk.managedDisk.storageAccountType} | [? contains(Storage,'SSD')]"
```

### [Cmd](#tab/cmd)

```azurecli-interactive
az vm list --resource-group QueryDemo --query "[].{Name:name, Storage:storageProfile.osDisk.managedDisk.storageAccountType} | [? contains(Storage,'SSD')]"
```

---

```json
[
  {
    "Name": "TestVM",
    "Storage": "StandardSSD_LRS"
  },
  {
    "Name": "WinTest",
    "Storage": "StandardSSD_LRS"
  }
]
```

See the [JMESPath specification - Built-in Functions](http://jmespath.org/specification.html#built-in-functions) for the full list of functions.

## Manipulating output with functions

JMESPath functions also have another purpose, which is to operate on the results of a query. Any function that returns a nonboolean value changes the result of an expression. For example, you can sort data by a property value with `sort_by(array, &sort_expression)`. JMESPath uses a special operator, `&`, for expressions that should be evaluated later as part of a function. The next example shows how to sort a VM list by OS disk size:

### [Bash](#tab/bash)

```azurecli-interactive
az vm list --resource-group QueryDemo --query "sort_by([].{Name:name, Size:storageProfile.osDisk.diskSizeGb}, &Size)" --output table
```

### [PowerShell](#tab/powershell)

```azurecli-interactive
az vm list --resource-group QueryDemo --query "sort_by([].{Name:name, Size:storageProfile.osDisk.diskSizeGb}, &Size)" --output table
```

### [Cmd](#tab/cmd)

```azurecli-interactive
az vm list --resource-group QueryDemo --query "sort_by([].{Name:name, Size:storageProfile.osDisk.diskSizeGb}, &Size)" --output table
```

---

```json
Name     Size
-------  ------
Test-2   30
TestVM   32
WinTest  127
```

See the [JMESPath specification - Built-in Functions](http://jmespath.org/specification.html#built-in-functions) for the full list of functions.

## Formatting query results

The Azure CLI uses JSON as its default output format, however different output formats may better suit a query depending on its purpose and results. Queries are always run on the `JSON` output first and then formatted.

This section will go over `tsv` and `table` formatting and some use cases for each format. For more information about output formats, see [Output formats for Azure CLI commands](../format-output-azure-cli.md).

### TSV output format

The `tsv` output format returns tab- and newline-separated values without extra formatting, keys, or other symbols. This format is useful when the output is stored in a parameter and used in another command.

One use case for `tsv` formatting is queries that retrieve a value out of a CLI command, such as an Azure resource ID or resource name, and store the value in a local environment variable. By default the results are returned in JSON format, which may be an issue when dealing with JSON strings that are enclosed in `"` characters. The quotes may __not__ be interpreted by the shell if the command output is directly assigned to the environment variable. This issue be seen in the following example that assigns a query result to an environment variable:

### [Bash](#tab/bash)

```azurecli-interactive
USER=$(az vm show --resource-group QueryDemo --name TestVM --query "osProfile.adminUsername")
echo $USER
```

### [PowerShell](#tab/powershell)

```azurecli-interactive
$USER=$(az vm show --resource-group QueryDemo --name TestVM --query "osProfile.adminUsername")
echo $USER
```

### [Cmd](#tab/cmd)

```azurecli-interactive
FOR /f %i IN ('az vm show --resource-group QueryDemo --name TestVM --query "osProfile.adminUsername"') DO SET USER=%i
echo %USER%
```

---

```json
"azureuser"
```

Use `tsv` formatting, as demonstrated in the following query, to prevent enclosing return values with type information:

### [Bash](#tab/bash)

```azurecli-interactive
USER=$(az vm show --resource-group QueryDemo --name TestVM --query "osProfile.adminUsername" --output tsv)
echo $USER
```

### [PowerShell](#tab/powershell)

```azurecli-interactive
$USER=$(az vm show --resource-group QueryDemo --name TestVM --query "osProfile.adminUsername" --output tsv)
echo $USER
```

### [Cmd](#tab/cmd)

```azurecli-interactive
FOR /f %i IN ('az vm show --resource-group QueryDemo --name TestVM --query "osProfile.adminUsername" --output tsv') DO SET USER=%i
echo %USER%
```

---

```json
azureuser
```

### Table output format

The `table` format prints output as an ASCII table, making it easy to read and scan. Not all fields are included in the table so this format is best used as a human-searchable overview of data. Fields that aren't included in the table can still be filtered for as part of a query.

> [!NOTE]
>
> Certain keys are filtered out and not printed in the table view. These keys are `id`, `type`, and `etag`. To see these values, you can change the key name in a multiselect hash.
>
>```azurecli
> az vm show --resource-group QueryDemo --name TestVM --query "{objectID:id}" --output table
>```

We can use a previous query to demonstrate this concept. The original query returned a JSON object containing the name, OS, and administrator name for each VM in the resource group:

### [Bash](#tab/bash)

```azurecli-interactive
az vm list --resource-group QueryDemo --query "[].{Name:name, OS:storageProfile.osDisk.osType, admin:osProfile.adminUsername}"
```

### [PowerShell](#tab/powershell)

```azurecli-interactive
az vm list --resource-group QueryDemo --query "[].{Name:name, OS:storageProfile.osDisk.osType, admin:osProfile.adminUsername}"
```

### [Cmd](#tab/cmd)

```azurecli-interactive
az vm list --resource-group QueryDemo --query "[].{Name:name, OS:storageProfile.osDisk.osType, admin:osProfile.adminUsername}"
```

---

```json
[
  {
    "Name": "Test-2",
    "OS": "Linux",
    "admin": "sttramer"
  },
  {
    "Name": "TestVM",
    "OS": "Linux",
    "admin": "azureuser"
  },
  {
    "Name": "WinTest",
    "OS": "Windows",
    "admin": "winadmin"
  }
]
```

When combined with the `--output table` output format, the column names match up with the `displayKey` value of the multiselect hash making it easier to skim the information:

### [Bash](#tab/bash)

```azurecli-interactive
az vm list --resource-group QueryDemo --query "[].{Name:name, OS:storageProfile.osDisk.osType, Admin:osProfile.adminUsername}" --output table
```

### [PowerShell](#tab/powershell)

```azurecli-interactive
az vm list --resource-group QueryDemo --query "[].{Name:name, OS:storageProfile.osDisk.osType, Admin:osProfile.adminUsername}" --output table
```

### [Cmd](#tab/cmd)

```azurecli-interactive
az vm list --resource-group QueryDemo --query "[].{Name:name, OS:storageProfile.osDisk.osType, Admin:osProfile.adminUsername}" --output table
```

---

```json
Name     OS       Admin
-------  -------  ---------
Test-2   Linux    sttramer
TestVM   Linux    azureuser
WinTest  Windows  winadmin
```
