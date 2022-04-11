--- 
title: Learning Bash with Azure CLI
description: Learning Bash with Azure CLI
author: dbradish-microsoft
ms.author: dbradish
ms.prod: non-product-specific
ms.topic: sample
ms.date: 04/11/2022
---
# Learning Bash with Azure CLI

In this tutorial, you will learn to create and query Azure resources using Bash and the Azure CLI. You will learn how to do the following:

> [!div class="checklist"]
>
> - Querying results as JSON dictionaries or arrays
> - Formatting output as JSON, table, or TSV
> - Querying and formatting single and multiple values
> - Use If/Then, Case, Do Until, Do While, Grep, and For Each
> - Work with local and environment variables

If you don't have an Azure subscription, create an [Azure free account](https://azure.microsoft.com/free/?ref=microsoft.com&utm_source=microsoft.com&utm_medium=docs&utm_campaign=visualstudio) before you begin.

## Starting Bash

Start Bash using Azure Cloud Shell or a local install. For more information, see [Install the Azure CLI](/cli/azure/install-azure-cli). This tutorial assumes that you are either running Bash using Azure Cloud Shell or running Azure CLI locally in a docker container.

## Querying dictionary results

A command that always returns only a single object returns a dictionary as a JSON object. Dictionaries are unordered objects accessed with keys. For this section, we are going to query the [Account](/cli/azure/account) object using the [Account Show](/cli/azure/account#az-account-show) command.

```azurecli-interactive
az account show
```

The command will output a dictionary as a JSON object. The following output has some fields omitted for brevity, and identifying information removed

```JSON
bash-5.1# az account show
{
  "environmentName": "AzureCloud",
  "isDefault": true,
  "managedByTenants": [],
  "name": "C & L Azure developer experience content projects",
  "state": "Enabled",
  "user": {
    "name": "user@contoso.com",
    "type": "user"
  }
}

```

### Formatting the output as a table

Use the `--output table` argument to format the output as an ASCII table. Nested objects aren't included in table output, but can still be filtered as part of a query. You can shorten the argument to `-o table`. We will explore additional formatting options later in this tutorial.

```azurecli
az account show --output table
```

For more information about formatting the output as a table, see [Output Formats](/cli/azure/format-output-azure-cli#table-output-format).

### Querying and formatting single values and nested values

The following queries demonstrate querying single values and nested values. The final query in this set demonstrates formatting the output with the `-o tsv` argument. This argument returns the results as tab- and newline-separated values. This is useful for removing quotation marks

```azurecli-interactive
az account show --query name
az account show --query name -o tsv

az account show --query user.name
az account show --query user.name -o tsv
```

### Querying and formatting multiple values, including nested values

The following queries demonstrate querying multiple values and renaming the values returned, using multiple output formats.

```azurecli-interactive
az account show --query [name,id,user.name] # return multiple values
az account show --query [name,id,user.name] -o table
az account show --query "{SubscriptionName: name, SubscriptionId: id, UserName: user.name}" # rename the values returned
az account show --query "{SubscriptionName: name, SubscriptionId: id, UserName: user.name}" -o table
```

For more information about returning multiple values, see [Get multiple values](/cli/azure/query-azure-cli#get-multiple-values).

## Creating objects

### Setting a random value for use in subsequent commands

Setting and using a random value allows you to run scripts multiple times without naming conflicts. Some values for objects must be unique across the service while others do not. Moreover, when you delete an object, it does not get deleted immediately - causing a naming conflict if you run the script another time immediately after you delete an object.

```azurecli-interactive
let "randomIdentifier=$RANDOM*$RANDOM"
```

### Creating a resource group

The following commands create a uniquely named resource group using variables and the [Az Group Create](/cli/azure/group#az-group-create) command.

```azurecli
resourceGroup="msdocs-learn-bash-$randomIdentifier"
location="East US"
az group create --name $resourceGroup --location "$location"
```

### Using If Exists to create or delete a resource group

The following script creates a new resource group only if one with the specified name does not exist.

```cli
if [ $(az group exists --name $resourceGroup) = false ]; 
   then az group create --name $resourceGroup --location "$location" 
fi
```

The following script deletes an existing new resource group if one of the specified name exists. It uses the `--no-wait` argument to return control without waiting for the command to complete.

```cli
if [ $(az group exists --name $resourceGroup) = true ]; 
   then az group delete --name $resourceGroup -y
fi
az group show --name $resourceGroup
```

### Using Grep to determine if a resource group exists

The following command pipes the output of the `az group list` command to the `grep` command. If the specified resource group does not exist, the command creates the resource group using the previously defined variables.

```cli
az group list --output tsv | grep $resourceGroup -q || az group create --name $resourceGroup --location "$location"
```

### Using CASE statement to determine if a resource group exists

The following CASE statement creates The following script creates a new resource group only if one with the specified name does not exist. If one with the specified name exists, the CASE statement echoes that the resource group exists.

```azurecli
var=$(az group list --query "[? contains(name, '$resourceGroup')].name" --output tsv)
case $resourceGroup in
$var)
echo $resourceGroup exists;;
*)
az group create --name $resourceGroup --location "$location";;
esac
```

## Creating multiple VMs

```azurecli
vm="msdocs-learn-bash-vm-$randomIdentifier"
nic="msdocs-learn-bash-nic-$randomIdentifier"
for i in `seq 1 3`; do
    az vm create \
        --resource-group $resourceGroup \
        --name $vm$i \
        --nics nic$i \
        --image UbuntuLTS \
        --admin-username azureuser \
        --generate-ssh-keys \
        --public-ip-sku Standard \
        --no-wait
done
```



## Creating multiple containers

### Creating storage account

```azurecli
storage="msdocsbash$randomIdentifier"
echo "Creating $storage..."
az storage account create --name $storage --resource-group $resourceGroup --location "$location" --sku Standard_LRS
```

### Using 


## Querying array results

A command that always returns only a single object returns a dictionary as a JSON object. Dictionaries are unordered objects accessed with keys. For this section, we are going to query the [Account](/cli/azure/account) object using the [Account List](/cli/azure/account#az-account-show) command.

```azurecli-interactive
az account list
```

The command will output a dictionary as a JSON object. The following output has some fields omitted for brevity, and identifying information removed

### Querying boolean values

The following queries demonstrates querying all accounts in a subscription, potentially returning a JSON array if there are multiple subscriptions for a given account, and then querying for which account is the default account, and which accounts are not the default account. These queries build on what you learned previously to filter and format the results. Finally, it creates a local variable containing the subscription id for use later in this tutorial.

```azurecli-interactive
az account list
az account list --query "[?isDefault]" # Returns the default subscription
az account list --query "[?isDefault]" -o table # Returns the default subscription as a table
az account list --query "[?isDefault].[name,id]" # Returns the name and id of the default subscription
az account list --query "[?isDefault].[name,id]" -o table # Returns the name and id of the default subscription as a table
az account list --query "[?isDefault].{SubscriptionName: name, SubscriptionId: id}" -o table # Returns the name and id of the default subscription as a table with friendly names
az account list --query "[?isDefault == \`false\`]" # Returns the non-default subscriptions
az account list --query "[?isDefault == \`false\`].name" -o table # Returns the non-default subscriptions as a table
az account list --query "[?isDefault].id" -o tsv # Returns the subscription id without quotation marks
subscriptionId="$(az account list --query "[?isDefault].id" -o tsv)" # Captures the subscription id as a local variable.
echo $subscriptionId # Returns the contents of the local variable.
az account list --query "[? contains(name, 'Test')].id" -o tsv # Returns the subscription id of a non-default subscription containing the substring 'Test'
subscriptionId="$(az account list --query "[? contains(name, 'Test')].id" -o tsv) # Captures the subscription id as a local variable. 
az account set -s $subscriptionId # Sets the current active subscription
```

For more information about querying boolean values, see [Query boolean values](/cli/azure/query-azure-cli#query-boolean-values). For more information about filtering arrays, see [Filter arrays](/cli/azure/query-azure-cli#filter-arrays).
