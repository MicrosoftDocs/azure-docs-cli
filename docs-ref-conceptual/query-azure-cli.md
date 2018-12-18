---
title: Query command results with Azure CLI 
description: Learn how to perform JMESPath queries on the output of Azure CLI  commands.
author: sptramer
ms.author: sttramer
manager: carmonm
ms.date: 11/12/2018
ms.topic: conceptual
ms.prod: azure
ms.technology: azure-cli
ms.devlang: azurecli
---
# Query Azure CLI command output

The Azure CLI uses the `--query` argument to execute a [JMESPath query](http://jmespath.org) on the results of commands. JMESPath is a query language
for JSON, giving you the ability to select and modify data from CLI output. Queries are executed on the JSON output before any display formatting.

The `--query` argument is supported by all commands in the Azure CLI. This article covers how to use the features of JMESPath with a series of small,
simple examples.

## Dictionary and list CLI results

Even when using an output format other than JSON, CLI command results are first treated as JSON for queries. CLI results are either
a JSON array or dictionary. Arrays are sequences of objects that can be indexed, and dictionaries are unordered objects accessed with keys. Commands that
_could_ return more than one object return an array, and commands that _always_ return _only_ a single object return a dictionary.

## Get properties in a dictionary

Working with dictionary results, you can access properties from the top level with just the key. The `.` (__subexpression__) character is used to access
properties of nested dictionaries. Before introducing queries, take a look at the unmodified output of the `az vm show` command:

```azurecli-interactive
az vm show -g QueryDemo -n TestVM -o json
```

The command will output a dictionary. Some content has been omitted.

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

```azurecli-interactive
az vm show -g QueryDemo -n TestVM --query osProfile.linuxConfiguration.ssh.publicKeys -o json
```

```json
[
  {
    "keyData": "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDMobZNJTqgjWn/IB5xlilvE4Y+BMYpqkDnGRUcA0g9BYPgrGSQquCES37v2e3JmpfDPHFsaR+CPKlVr2GoVJMMHeRcMJhj50ZWq0hAnkJBhlZVWy8S7dwdGAqPyPmWM2iJDCVMVrLITAJCno47O4Ees7RCH6ku7kU86b1NOanvrNwqTHr14wtnLhgZ0gQ5GV1oLWvMEVg1YFMIgPRkTsSQKWCG5lLqQ45aU/4NMJoUxGyJTL9i8YxMavaB1Z2npfTQDQo9+womZ7SXzHaIWC858gWNl9e5UFyHDnTEDc14hKkf1CqnGJVcCJkmSfmrrHk/CkmF0ZT3whTHO1DhJTtV stramer@contoso",
    "path": "/home/azureuser/.ssh/authorized_keys"
  }
]
```

To get more than one property, put expressions in square brackets  `[ ]` (a __multiselect list__) as a comma-separated list. To get the VM name,
admin user, and SSH key all at once use the command:

```azurecli-interactive
az vm show -g QueryDemo -n TestVM --query '[name, osProfile.adminUsername, osProfile.linuxConfiguration.ssh.publicKeys[0].keyData]' -o json
```

```json
[
  "TestVM",
  "azureuser",
  "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDMobZNJTqgjWn/IB5xlilvE4Y+BMYpqkDnGRUcA0g9BYPgrGSQquCES37v2e3JmpfDPHFsaR+CPKlVr2GoVJMMHeRcMJhj50ZWq0hAnkJBhlZVWy8S7dwdGAqPyPmWM2iJDCVMVrLITAJCno47O4Ees7RCH6ku7kU86b1NOanvrNwqTHr14wtnLhgZ0gQ5GV1oLWvMEVg1YFMIgPRkTsSQKWCG5lLqQ45aU/4NMJoUxGyJTL9i8YxMavaB1Z2npfTQDQo9+womZ7SXzHaIWC858gWNl9e5UFyHDnTEDc14hKkf1CqnGJVcCJkmSfmrrHk/CkmF0ZT3whTHO1DhJTtV stramer@contoso"
]
```

These values are listed in the result array in the order they were given in the query. Since the result is an array, there are no
keys associated with the results.

## Rename properties in a query

To get a dictionary instead of an array when querying for multiple values, use the `{ }` (__multiselect hash__) operator.
The format for a multiselect hash is `{displayName:JMESPathExpression, ...}`.
`displayName` will be the string shown in output, and `JMESPathExpression` is the JMESPath expression to evaluate. Modifying the example from the
last section by changing the multiselect list to a hash:

```azurecli-interactive
az vm show -g QueryDemo -n TestVM --query '{VMName:name, admin:osProfile.adminUsername, sshKey:osProfile.linuxConfiguration.ssh.publicKeys[0].keyData }' -o json
```

```json
{
  "VMName": "TestVM",
  "admin": "azureuser",
  "ssh-key": "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDMobZNJTqgjWn/IB5xlilvE4Y+BMYpqkDnGRUcA0g9BYPgrGSQquCES37v2e3JmpfDPHFsaR+CPKlVr2GoVJMMHeRcMJhj50ZWq0hAnkJBhlZVWy8S7dwdGAqPyPmWM2iJDCVMVrLITAJCno47O4Ees7RCH6ku7kU86b1NOanvrNwqTHr14wtnLhgZ0gQ5GV1oLWvMEVg1YFMIgPRkTsSQKWCG5lLqQ45aU/4NMJoUxGyJTL9i8YxMavaB1Z2npfTQDQo9+womZ7SXzHaIWC858gWNl9e5UFyHDnTEDc14hKkf1CqnGJVcCJkmSfmrrHk/CkmF0ZT3whTHO1DhJTtV stramer@contoso"
}
```

## Get properties in an array

An array has no properties of its own, but it can be indexed. This feature is shown in the last example with the expression
`publicKeys[0]`, which gets the first element of the `publicKeys` array. There's no guarantee CLI output is ordered, so avoid using
indexing unless you're sure of the order or don't care what element you get. To access the properties of elements in an array,
you do one of two operations: _flattening_ and _filtering_. This section covers how to flatten an array.

Flattening an array is done with the `[]` JMESPath operator. All expressions after the `[]` operator are applied to each element in the current array.
If `[]` appears at the start of the query, it flattens the CLI command result. The results of `az vm list` can be inspected with this feature.
To get the name, OS, and administrator name for each VM in a resource group:

```azurecli-interactive
az vm list -g QueryDemo --query '[].{Name:name, OS:storageProfile.osDisk.osType, admin:osProfile.adminUsername}' -o json
```

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

When combined with the `--output table` output format, the column names match up with the `displayKey` value of the multiselect
hash:

```azurecli-interactive
az vm list -g QueryDemo --query '[].{Name:name, OS:storageProfile.osDisk.osType, Admin:osProfile.adminUsername}' --output table
```

```output
Name     OS       Admin
-------  -------  ---------
Test-2   Linux    sttramer
TestVM   Linux    azureuser
WinTest  Windows  winadmin
```

> [!NOTE]
>
> Certain keys are filtered out and not printed in the table view. These keys are `id`, `type`, and `etag`. To see these values, you can change the key name in a multiselect hash.
>
> ```azurecli-interactive
> az vm show -g QueryDemo -n TestVM --query "{objectID:id}" -o table
> ```

Any array can be flattened, not just the top-level result returned by the command. In the last section, the expression
`osProfile.linuxConfiguration.ssh.publicKeys[0].keyData` was used to get the SSH public key for sign-in. To get _every_
SSH public key, the expression could instead be written as `osProfile.linuxConfiguration.ssh.publicKeys[].keyData`.
This query expression flattens the `osProfile.linuxConfiguration.ssh.publicKeys` array, and then runs the `keyData` expression on each
element:

```azurecli-interactive
az vm show -g QueryDemo -n TestVM --query '{VMName:name, admin:osProfile.adminUsername, sshKeys:osProfile.linuxConfiguration.ssh.publicKeys[].keyData }' -o json
```

```json
{
  "VMName": "TestVM",
  "admin": "azureuser",
  "sshKeys": [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDMobZNJTqgjWn/IB5xlilvE4Y+BMYpqkDnGRUcA0g9BYPgrGSQquCES37v2e3JmpfDPHFsaR+CPKlVr2GoVJMMHeRcMJhj50ZWq0hAnkJBhlZVWy8S7dwdGAqPyPmWM2iJDCVMVrLITAJCno47O4Ees7RCH6ku7kU86b1NOanvrNwqTHr14wtnLhgZ0gQ5GV1oLWvMEVg1YFMIgPRkTsSQKWCG5lLqQ45aU/4NMJoUxGyJTL9i8YxMavaB1Z2npfTQDQo9+womZ7SXzHaIWC858gWNl9e5UFyHDnTEDc14hKkf1CqnGJVcCJkmSfmrrHk/CkmF0ZT3whTHO1DhJTtV stramer@contoso\n"
  ]
}
```

## Filter arrays

The other operation used to get data from an array is _filtering_. Filtering is done with the `[?...]` JMESPath operator.
This operator takes a predicate as its contents. A predicate is any statement that can be evaluated
to either `true` or `false`. Expressions where the predicate evaluates to `true` are included in the output.

JMESPath offers the standard comparison and logical operators. These include `<`, `<=`, `>`, `>=`, `==`, and `!=`. 
JMESPath also supports logical and (`&&`), or (`||`), and not (`!`). Expressions can be grouped within parenthesis, allowing for more
complex predicate expressions. For the full details on predicates and logical operations, see the
[JMESPath specification](http://jmespath.org/specification.html).

In the last section, we flattened an array to get the complete list of all VMs in a resource group. Using filters, this output can be restricted
to only Linux VMs:

```azurecli-interactive
az vm list -g QueryDemo --query "[?storageProfile.osDisk.osType=='Linux'].{Name:name,  admin:osProfile.adminUsername}" --output table
```

```output
Name    Admin
------  ---------
Test-2  sttramer
TestVM  azureuser
```

> [!IMPORTANT]
>
> In JMESPath, strings are always surrounded by single quotes (`'`). If you use double quotes as part of a string in a filter predicate,
> you'll get empty output.

JMESPath also has built-in functions that can help with filtering. One such function is `contains(string, substring)`,
which checks to see if a string contains a substring. Expressions are evaluated before calling the function, so the first
argument can be a full JMESPath expression. The next example finds all VMs using SSD storage for their OS disk:

```azurecli-interactive
az vm list -g QueryDemo --query "[?contains(storageProfile.osDisk.managedDisk.storageAccountType,'SSD')].{Name:name, Storage:storageProfile.osDisk.managedDisk.storageAccountType}" -o json
```

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

This query is a little long. The `storageProfile.osDisk.managedDisk.storageAccountType` key
is mentioned twice, and rekeyed in the output. One way to shorten it is to apply the filter
after flattening and selecting data.

```azurecli-interactive
az vm list -g QueryDemo --query "[].{Name:name, Storage:storageProfile.osDisk.managedDisk.storageAccountType}[?contains(Storage,'SSD')]" -o json
```

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

For large arrays, it may be faster to apply the filter before selecting data.

See the [JMESPath specification - Built-in Functions](http://jmespath.org/specification.html#built-in-functions) for the full list of functions.

## Change output

JMESPath functions also have another purpose, which is to operate on the results of a query. Any function that returns a non-boolean value changes the result of an expression.
For example, you can sort data by a property value with `sort_by(array, &sort_expression)`. JMESPath uses a special operator, `&`, for expressions that should be evaluated later
as part of a function. The next example shows how to sort a VM list by OS disk size:

```azurecli-interactive
az vm list -g QueryDemo --query "sort_by([].{Name:name, Size:storageProfile.osDisk.diskSizeGb}, &Size)" --output table
```

```output
Name     Size
-------  ------
TestVM   30
Test-2   32
WinTest  127
```

See the [JMESPath specification - Built-in Functions](http://jmespath.org/specification.html#built-in-functions) for the full list of functions.

## Experiment with queries interactively

To start experimenting with JMESPath, the [JMESPath-terminal](https://github.com/jmespath/jmespath.terminal) Python package offers an interactive environment to work
with queries. Data is piped as input, and then queries are written and run in the editor.

```bash
pip install jmespath-terminal
az vm list --output json | jpterm
```
