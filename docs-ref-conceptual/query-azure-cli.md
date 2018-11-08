---
title: Query command results with Azure CLI 
description: Learn how to perform JMESPath queries on the output of Azure CLI  commands.
author: sptramer
ms.author: sttramer
manager: carmonm
ms.date: 11/09/2018
ms.topic: conceptual
ms.prod: azure
ms.technology: azure-cli
ms.devlang: azure-cli
---
# Query Azure CLI command output

The Azure CLI uses the `--query` argument to execute a [JMESPath query](http://jmespath.org) on the results of commands. JMESPath is a query language for JSON, giving you the ability to select and present data from CLI output. These queries are executed on the JSON output before any display formatting.

The `--query` argument is supported by all commands in the Azure CLI. This article's examples cover common use cases and demonstrate how to use the features of JMESPath.

## Dictionary output and list output

Even when you use the `--output` argument with a CLI command, the results are first treated as JSON. Top-level JSON data structures are either
an array, or a dictionary. Arrays are sequences of objects that can be indexed, and dictionaries are objects accessed with keys. Arrays are not
guaranteed to be returned in any particular order, so avoid using array indexes unless you don't care which object is returned.
Any command which _could_ return more than one object returns an array, and commands which _always_ return _only_ a single object
return a dictionary.

## Accessing dictionary properties

Working with dictionary output, you can access properties directly from the top level with just the key name. By adding the `.` (subexpression)
token after a property name, you can access properties inside of nested dictionaries. For example, the `az vm show` command will return 
a single object.

```azurecli-interactive
az vm show -g QueryDemo -n TestVM
```

The command will output a dictionary with nested entries. Some of the output has been omitted here.

```JSON
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

To get just one property, add a query string to extract it. Here, we get the SSH public keys authorized to connect to the VM.

```azurecli-interactive
az vm show -g QueryDemo -n TestVM --query osProfile.linuxConfiguration.ssh.publicKeys
```

```output
[
  {
    "keyData": "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDMobZNJTqgjWn/IB5xlilvE4Y+BMYpqkDnGRUcA0g9BYPgrGSQquCES37v2e3JmpfDPHFsaR+CPKlVr2GoVJMMHeRcMJhj50ZWq0hAnkJBhlZVWy8S7dwdGAqPyPmWM2iJDCVMVrLITAJCno47O4Ees7RCH6ku7kU86b1NOanvrNwqTHr14wtnLhgZ0gQ5GV1oLWvMEVg1YFMIgPRkTsSQKWCG5lLqQ45aU/4NMJoUxGyJTL9i8YxMavaB1Z2npfTQDQo9+womZ7SXzHaIWC858gWNl9e5UFyHDnTEDc14hKkf1CqnGJVcCJkmSfmrrHk/CkmF0ZT3whTHO1DhJTtV stramer@contoso",
    "path": "/home/azureuser/.ssh/authorized_keys"
  }
]
```

It's also possible to get more than one object, by putting more than one property name inside of an `[ ]` operator (__multiselect list__) as a comma-separated list. Expanding on the last example, we can get the VM name, admin user, and SSH key all at once:

```azurecli-interactive
az vm show -g QueryDemo -n TestVM --query '[name, osProfile.adminUsername, osProfile.linuxConfiguration.ssh.publicKeys[0].keyData]'
```

```output
[
  "TestVM",
  "azureuser",
  "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDMobZNJTqgjWn/IB5xlilvE4Y+BMYpqkDnGRUcA0g9BYPgrGSQquCES37v2e3JmpfDPHFsaR+CPKlVr2GoVJMMHeRcMJhj50ZWq0hAnkJBhlZVWy8S7dwdGAqPyPmWM2iJDCVMVrLITAJCno47O4Ees7RCH6ku7kU86b1NOanvrNwqTHr14wtnLhgZ0gQ5GV1oLWvMEVg1YFMIgPRkTsSQKWCG5lLqQ45aU/4NMJoUxGyJTL9i8YxMavaB1Z2npfTQDQo9+womZ7SXzHaIWC858gWNl9e5UFyHDnTEDc14hKkf1CqnGJVcCJkmSfmrrHk/CkmF0ZT3whTHO1DhJTtV stramer@contoso"
]
```

These values appear in the order which they were listed in the multiselect, but don't have any associated names.

## Rename properties in output

To solve the problem of multiselect list output not having names, there is an alternative: Naming and re-keying values inside of the `{ }`
JMESPath operator (__multiselect hash__). The format for listing a property inside of a multislect hash is `{displayName:propertyName}`.
`displayName` will be the string shown in output, and `propertyName` is the name of the property to be selected. Using the example from the
last section, we can select and re-key properties.

```azurecli-interactive
az vm show -g QueryDemo -n TestVM --query '{VMName:name, admin:osProfile.adminUsername, ssh-key:osProfile.linuxConfiguration.ssh.publicKeys[0].keyData }'
```

```output
{
  "VMName": "TestVM",
  "admin": "azureuser",
  "ssh-key": "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDMobZNJTqgjWn/IB5xlilvE4Y+BMYpqkDnGRUcA0g9BYPgrGSQquCES37v2e3JmpfDPHFsaR+CPKlVr2GoVJMMHeRcMJhj50ZWq0hAnkJBhlZVWy8S7dwdGAqPyPmWM2iJDCVMVrLITAJCno47O4Ees7RCH6ku7kU86b1NOanvrNwqTHr14wtnLhgZ0gQ5GV1oLWvMEVg1YFMIgPRkTsSQKWCG5lLqQ45aU/4NMJoUxGyJTL9i8YxMavaB1Z2npfTQDQo9+womZ7SXzHaIWC858gWNl9e5UFyHDnTEDc14hKkf1CqnGJVcCJkmSfmrrHk/CkmF0ZT3whTHO1DhJTtV stramer@contoso"
}
```

Using multiselect hashes with the `--output table` type is particularly useful. By re-keying the property names, you get new column names
in your table output. The next section on arrays will go into more detail on using this feature.

## Get properties of array objects

An array has no properties of its own, but it can be indexed. This feature is shown in the last example with the subexpression
`publicKeys[0]`, which gets the first element of the `publicKeys` array. Since the CLI has many commands which can return more than one result,
output is often an array. To access the properties of elements in an array, you need to do one of two operations: _filtering_ or _flattening_.
This section covers how to flatten an array.

Flattening an array is done with the `[]` JMESPath operator. This operator applies the following subexpression to each element in the array.
By putting `[]` at the start of a query on an array result, properties on each returned value are queried. Using this feature, we can start
inspecting the results of the `az vm list` command, instead of `az vm show`.

For example, to get the name, OS, and administrator name for each VM in a resource group:

```azurecli-interactive
az vm list -g QueryDemo --query '[].{Name:name, OS:storageProfile.osDisk.osType, admin:osProfile.adminUsername}'
```

```output
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

When combined with the `--output table` output format, the column names match up with the `displayKey` value:

```azurecli-interactive
az vm list -g QueryDemo --query '[].{Name:name, OS:storageProfile.osDisk.osType, admin:osProfile.adminUsername}' --output table
```

```output
Name     OS       Admin
-------  -------  ---------
Test-2   Linux    sttramer
TestVM   Linux    azureuser
WinTest  Windows  winadmin
```

Any array can be filtered, not just the top-level result returned by the command. In the last section, the expression
`osProfile.linuxConfiguration.ssh.publicKeys[0].keyData` was used to get the SSH public key for login. To get _every_
SSH public key, the expression could instead be written as `osProfile.linuxConfiguration.ssh.publicKeys[].keyData`.
This would flatten the `osProfile.linuxConfiguration.ssh.publicKeys` array, and then run the `keyData` subexpression on each
element.

```azurecli-interactive
az vm show -g QueryDemo -n TestVM --query '{VMName:name, admin:osProfile.adminUsername, ssh_keys:osProfile.linuxConfiguration.ssh.publicKeys[].keyData }'```

```output
{
  "VMName": "TestVM",
  "admin": "azureuser",
  "ssh_keys": [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDMobZNJTqgjWn/IB5xlilvE4Y+BMYpqkDnGRUcA0g9BYPgrGSQquCES37v2e3JmpfDPHFsaR+CPKlVr2GoVJMMHeRcMJhj50ZWq0hAnkJBhlZVWy8S7dwdGAqPyPmWM2iJDCVMVrLITAJCno47O4Ees7RCH6ku7kU86b1NOanvrNwqTHr14wtnLhgZ0gQ5GV1oLWvMEVg1YFMIgPRkTsSQKWCG5lLqQ45aU/4NMJoUxGyJTL9i8YxMavaB1Z2npfTQDQo9+womZ7SXzHaIWC858gWNl9e5UFyHDnTEDc14hKkf1CqnGJVcCJkmSfmrrHk/CkmF0ZT3whTHO1DhJTtV stramer@contoso\n"
  ]
}
```

## Filter arrays

The other operation used to get data from an array is _filtering_. Filtering is done with the `[?...]` JMESPath operator
(__filter projection__). This operator takes a predicate as its contents. A predicate is any statement that can be evaluated
to either `true` or `false`. Objects where the predicate evaluates to `true` are included in the output.

JMESPath offers the standard comparison and logical operators. Since the JMESPath specification is subject to change, see the
[JMESPath specification - Comparison Operators](http://jmespath.org/specification.html#filter-expressions) for the full list.
JMESPath also supports AND (`&&`), OR (`||`), NOT (`!`) and parenthesized (`(...)`) expressions in filters.



JMESPath also has built-in functions that can help with filtering. See the [JMESPath specification - Built-in Functions](http://jmespath.org/specification.html#built-in-functions) for the full list.

## Manipulate output



## Experiment with queries interactively

To start learning JMESPath, the [JMESPath-terminal](https://github.com/jmespath/jmespath.terminal) Python package offers an interactive environment to experiment
with queries. Data is piped as input, and then in-program queries are written and edited to extract the data.

```bash
pip install jmespath-terminal
az vm list --output json | jpterm
```

----
> [!NOTE]
> Certain keys are filtered out and not printed in the table view. These keys are `id`, `type`, and `etag`. If you need to see this information, you can change the key name and avoid filtering.
>
> ```azurecli-interactive
> az vm show -g QueryDemo -n TestVM --query "{objectID:id}" -o table
> ```
----