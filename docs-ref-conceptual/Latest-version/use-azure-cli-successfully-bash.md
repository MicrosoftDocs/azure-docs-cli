--- 
title: How-to use the Azure CLI in a Bash environment | Microsoft Docs
description: Learn how to use Bash with Azure CLI. Query, format output, filter, use variables, and use Bash constructs of loops, if/exists/then and case statements.
ms.date: 06/26/2024
ms.topic: concept-article
ms.custom: devx-track-azurecli
#customer intent: As a new user of the Azure CLI and a primary Azure Portal user, I need to learn the Bash scripting language to automate Azure resource management tasks.
---
# How-to use the Azure CLI in a Bash scripting language

Azure CLI reference commands can execute in several [scripting languages](choose-the-right-azure-command-line-tool.md#different-shell-environments).
If you're new to Bash and also the Azure CLI, this article a great place to begin your learning
journey. Work through this article much like you would a tutorial to learn how to use the Azure CLI
in a Bash scripting language with ease.

In this article, you learn how to:

> [!div class="checklist"]
>
> - Query results as JSON dictionaries or arrays
> - Format output as JSON, table, or TSV
> - Query, filter, and format single and multiple values
> - Use if/exists/then and case syntax
> - Use for loops
> - Use grep, sed, paste, and bc commands
> - Populate and use shell and environment variables

If you don't have an Azure subscription, create an [Azure free account](https://azure.microsoft.com/free/?ref=microsoft.com&utm_source=microsoft.com&utm_medium=docs&utm_campaign=visualstudio)
before you begin.

## Starting Bash

Start Bash using [Azure Cloud Shell](/azure/cloud-shell/quickstart) or a [local install of the Azure CLI](./install-azure-cli.md).
This article assumes that you're running Bash either using Azure Cloud Shell or running Azure CLI
locally in a docker container.

## Querying dictionary results

A command that always returns only a single object returns a JSON dictionary. Dictionaries are
unordered objects accessed with keys. For this article, we're going to start by querying the [Account](/cli/azure/account)
object using the [Account Show](/cli/azure/account#az-account-show) command.

```azurecli-interactive
az account show
az account show --output json # JSON is the default format
```

The following JSON dictionary output has some fields omitted for brevity, and identifying
information is removed.

```JSON
bash-5.1# az account show
{
  "environmentName": "AzureCloud",
  "isDefault": true,
  "managedByTenants": [],
  "name": "My test subscription",
  "state": "Enabled",
  "user": {
    "name": "user@contoso.com",
    "type": "user"
  }
}
```

### Formatting the output as YAML

Use the `--output yaml` argument (or `-o yaml`) to format the output in [yaml](https://yaml.org/)
format, a plain-text data serialization format. YAML tends to be easier to read than JSON, and
easily maps to that format. Some applications and CLI commands take YAML as configuration input,
instead of JSON.

```azurecli-interactive
az account show --output yaml
```

For more information about formatting the output as yaml, see [YAML output format](./format-output-azure-cli.md#yaml-output-format).

### Formatting the output as a table

Use the `--output table` argument (or `-o table`) to format the output as an ASCII table. Nested
objects aren't included in table output, but can still be filtered as part of a query.

```azurecli-interactive
az account show --output table
```

For more information about formatting the output as a table, see [Table output format](./format-output-azure-cli.md#table-output-format).

### Querying and formatting single values and nested values

The following queries demonstrate querying single values, including nested values in a JSON
dictionary output. The final query in this set demonstrates formatting the output using the `-o tsv`
argument. This argument returns the results as tab- and newline-separated values. This action is
useful for removing quotation marks in the value returned - which is useful to consume the output
into other commands and tools that need to process the text in some form (as is demonstrated later
in this article).

```azurecli-interactive
az account show --query name # Querying a single value
az account show --query name -o tsv # Removes quotation marks from the output

az account show --query user.name # Querying a nested value
az account show --query user.name -o tsv # Removes quotation marks from the output
```

### Querying and formatting properties from arrays

The following query demonstrates getting properties in a JSON array. Get subscription properties,
displayed as a table of subscriptions.

```azurecli-interactive
az account list --query "[].{subscription_id:id, name:name, isDefault:isDefault}" -o table
```

This query returns results similar to:

```JSON
Subscription_id                       Name                                               IsDefault
------------------------------------  -------------------------------------------------  -----------
11111111-3ddc-45ce-8334-c7b28a9e1c3a  C & L Azure developer experience content projects  False
22222222-8f1c-409b-af1e-8e2e65d9b90a  DevCenter - Infrastructure - Dogfood               False
33333333-c080-42a7-8973-1aa853ab4df3  Babel                                              False
```

### Querying and formatting multiple values, including nested values

To get more than one property, put expressions in square brackets [ ] (a multiselect list) as a
comma-separated list. The following queries demonstrate querying multiple values in a JSON
dictionary output, using multiple output formats.

```azurecli-interactive
az account show --query [name,id,user.name] # return multiple values
az account show --query [name,id,user.name] -o table # return multiple values as a table
```

For more information about returning multiple values, see [Get multiple values](./use-azure-cli-successfully-query.md#get-multiple-values).

### Renaming properties in a query

The following queries demonstrate the use of the { } (multiselect hash) operator to get a dictionary
instead of an array when querying for multiple values. It also demonstrates renaming properties in
the query result.

```azurecli-interactive
az account show --query "{SubscriptionName: name, SubscriptionId: id, UserName: user.name}" # Rename the values returned
az account show --query "{SubscriptionName: name, SubscriptionId: id, UserName: user.name}" -o table # Rename the values returned in a table
```

For more information on renaming properties in a query, see [Rename properties in a query](./use-azure-cli-successfully-query.md#rename-properties-in-a-query).

### Querying boolean values

Boolean values are assumed to be true, so the `"[?isDefault]"` query syntax for the
`az account list` command returns the current default subscription. To get the false values, you
must use an escape character, such as `\`.

The following queries demonstrate querying all accounts in a subscription, potentially returning a
JSON array if there are multiple subscriptions for a given account, and then querying for which
account is the default subscription. It also demonstrates querying for the accounts that aren't the
default subscription. These queries build on what you learned previously to filter and format the
results. Finally, the final query demonstrates storing the query results in a variable.

```azurecli-interactive
az account list
az account list --query "[?isDefault]" # Returns the default subscription
az account list --query "[?isDefault]" -o table # Returns the default subscription as a table
az account list --query "[?isDefault].[name,id]" # Returns the name and id of the default subscription
az account list --query "[?isDefault].[name,id]" -o table # Returns the name and id of the default subscription as a table
az account list --query "[?isDefault].{SubscriptionName: name, SubscriptionId: id}" -o table # Returns the name and id of the default subscription as a table with friendly names

az account list --query "[?isDefault == \`false\`]" # Returns all non-default subscriptions, if any
az account list --query "[?isDefault == \`false\`].name" -o table # Returns all non-default subscriptions, if any, as a table

az account list --query "[?isDefault].id" -o tsv # Returns the subscription id without quotation marks
subscriptionId="$(az account list --query "[?isDefault].id" -o tsv)" # Captures the subscription id as a variable.
echo $subscriptionId # Returns the contents of the variable.
az account list --query "[? contains(name, 'Test')].id" -o tsv # Returns the subscription id of a non-default subscription containing the substring 'Test'
subscriptionId="$(az account list --query "[? contains(name, 'Test')].id" -o tsv) # Captures the subscription id as a variable. 
az account set -s $subscriptionId # Sets the current active subscription
```

- For more information about filtering arrays and querying boolean values, see [Filter arrays with boolean expressions](./use-azure-cli-successfully-query.md#filter-arrays-with-boolean-expressions).
- For more information about using variables, see [How to use variables](./azure-cli-variables.md).
- For more information on working with subscriptions, see [Managing subscriptions](./manage-azure-subscriptions-azure-cli.md).

## Creating objects using variables and randomization

### Setting a random value for use in subsequent commands

Setting and using a random value for use in variables allows you to run scripts multiple times
without naming conflicts. Naming conflicts occur because a value must be unique across the service,
or because an object you deleted still exists within Azure until the deletion process is complete.

`$RANDOM` is a bash function (not a constant) that returns a random signed 16-bit integer (from 0
through 32767). The `let` command is a built-in Bash command to evaluate arithmetic expressions.
Using the following command creates a sufficiently unique value for most purposes.

```azurecli-interactive
let "randomIdentifier=$RANDOM*$RANDOM"
```

### Working with spaces and quotation marks

Spaces are used for separating commands, options, and arguments. Use quote marks to tell the Bash
shell to ignore all special characters, of which a white space is a special character. When the Bash
shell sees the first quote mark, it ignores special characters until the closing quote mark.
However, sometimes you want the Bash shell to parse certain special characters, such as dollar
signs, back quotes, and backslashes. For this scenario, use double quotes.

The following commands use the [az group create](/cli/azure/group#az-group-create) command to
illustrate the use of single and double quote marks. These commands are used to handle spaces and
evaluate special characters when working with variables and creating an object.

```azurecli
resourceGroup='msdocs-learn-bash-$randomIdentifier'
echo $resourceGroup # The $ is ignored in the creation of the $resourceGroup variable
resourceGroup="msdocs-learn-bash-$randomIdentifier"
echo $resourceGroup # The $randomIdentifier is evaluated when defining the $resourceGroup variable
location="East US" # The space is ignored when defining the $location variable
echo The value of the location variable is $location # The value of the $location variable is evaluated
echo "The value of the location variable is $location" # The value of the $location variable is evaluated
echo "The value of the location variable is \$location" # The value of the $location variable is not evaluated
echo 'The value of the location variable is $location' # The value of the $location variable is not evaluated
az group create --name $resourceGroup --location $location # Notice that the space in the $location variable is not ignored and the command fails as it treats the value after the space as a new command 
az group create --name $resourceGroup --location "$location" # Notice that the space in the $location variable is ignored and the location argument accepts the entire string as the value 
```

In the JSON dictionary output, review the properties of the resource group that was created.

### Using If Then Else to determine if variable is null

To evaluate strings, use `!=` and to evaluate numbers use `-ne`. The following If Then Else statement evaluates whether the $resourceGroup variable has been set. If yes, it returns the value of the variable. If no, it sets the variable.

```azurecli
if [ $resourceGroup != '' ]; then
   echo $resourceGroup
else
   resourceGroup="msdocs-learn-bash-$randomIdentifier"
fi
```

### Using If Then to create or delete a resource group

The following script creates a new resource group only if one with the specified name doesn't already exist.

```azurecli
if [ $(az group exists --name $resourceGroup) = false ]; then 
   az group create --name $resourceGroup --location "$location" 
else
   echo $resourceGroup
fi
```

The following script deletes an existing new resource group if one with the specified name already
exists. You could use the `--no-wait` argument to return control without waiting for the command to
complete. However, for this article, we want to wait for the resource group to be deleted before
continuing. For more information on asynchronous operations, see [Tips for using the Azure CLI successfully - Asynchronous operations](./use-azure-cli-successfully-tips.md#asynchronous-operations).
We demonstrate the use of the `--no-wait` argument at the end of this article.

```azurecli
if [ $(az group exists --name $resourceGroup) = true ]; then 
   az group delete --name $resourceGroup -y # --no-wait
else
   echo The $resourceGroup resource group does not exist
fi

```

### Using Grep to determine if a resource group exists, and create the resource group if it doesn't

The following command pipes the output of the `az group list` command to the `grep` command. If the
specified resource group doesn't exist, the command creates the resource group using the previously
defined variables.

```azurecli
az group list --output tsv | grep $resourceGroup -q || az group create --name $resourceGroup --location "$location"
```

### Using CASE statement to determine if a resource group exists, and create the resource group if it doesn't

The following CASE statement creates a new resource group only if one with the specified name
doesn't already exist. If one with the specified name exists, the CASE statement echoes that the
resource group exists.

```azurecli
var=$(az group list --query "[? contains(name, '$resourceGroup')].name" --output tsv)
case $resourceGroup in
$var)
echo The $resourceGroup resource group already exists.;;
*)
az group create --name $resourceGroup --location "$location";;
esac
```

## Using for loops and querying arrays

In this section of the article, we create a storage account and then use for loops to create blobs
and containers. We also demonstrate querying JSON arrays and working with environment variables.

### Create storage account

The following command uses the [az storage account create](/cli/azure/storage/account#az-storage-account-create) command to create a storage account that we use when creating storage containers.

```azurecli
storageAccount="learnbash$randomIdentifier"
az storage account create --name $storageAccount --location "$location" --resource-group $resourceGroup --sku Standard_LRS --encryption-services blob
```

### Get the storage account keys

The following commands use the [az storage account keys list](/cli/azure/storage/account/keys#az-storage-account-keys-list)
command to return storage account key values. We then store a key value in a variable for use when
creating storage containers.

```azurecli
az storage account keys list --resource-group $resourceGroup --account-name $storageAccount --query "[].value" -o tsv # returns both storage account key values

az storage account keys list --resource-group $resourceGroup --account-name $storageAccount --query "[0].value" -o tsv # returns a single storage account key value

accountKey=$(az storage account keys list --resource-group $resourceGroup --account-name $storageAccount --query "[0].value" -o tsv)

echo $accountKey
```

### Create storage container

We start by using the [az storage container create](/cli/azure/storage/container#az-storage-container-create)
to create a single storage container and then use the [az storage container list](/cli/azure/storage/container#az-storage-container-list)
to query the name of the created container.

```azurecli
container="learningbash"
az storage container create --account-name $storageAccount --account-key $accountKey --name $container

az storage container list --account-name $storageAccount --account-key $accountKey --query [].name
```

### Upload data to container

The following script creates three sample files using a for loop.

```azurecli
for i in `seq 1 3`; do
    echo $randomIdentifier > container_size_sample_file_$i.txt
done
```

The following script uses the [az storage blob upload-batch](/cli/azure/storage/blob#az-storage-blob-upload-batch)
command to upload the blobs to the storage container.

```azurecli
az storage blob upload-batch \
    --pattern "container_size_sample_file_*.txt" \
    --source . \
    --destination $container \
    --account-key $accountKey \
    --account-name $storageAccount
```

The following script uses the [az storage blob list](/cli/azure/storage/blob#az-storage-blob-list)
command to list the blobs in the container.

```azurecli
az storage blob list \
    --container-name $container \
    --account-key $accountKey \
    --account-name $storageAccount \
    --query "[].name"
```

The following script displays the total bytes in the storage container.

```azurecli
bytes=`az storage blob list \
    --container-name $container \
    --account-key $accountKey \
    --account-name $storageAccount \
    --query "[*].[properties.contentLength]" \
    --output tsv | paste -s -d+ | bc`

echo "Total bytes in container: $bytes"
echo $bytes
```

### Create many containers using loops

Next, we create multiple containers using a loop demonstrating a couple of ways to write the loop.

```azurecli
for i in `seq 1 4`; do 
az storage container create --account-name $storageAccount --account-key $accountKey --name learnbash-$i
done

for value in {5..8}
for (( i=5; i<10; i++));
do
az storage container create --account-name $storageAccount --account-key $accountKey --name learnbash-$i
done

az storage container list --account-name $storageAccount --account-key $accountKey --query [].name
```

### Use EXPORT to define environment variables

In the preceding storage container scripts, we specified the account name and account key with every
command. Instead, you can store your authentication credentials using the corresponding environment
variables: `AZURE_STORAGE_ACCOUNT` and `AZURE_STORAGE_KEY`. To perform this action, use EXPORT.

```azurecli
export AZURE_STORAGE_ACCOUNT=$storageAccount
export AZURE_STORAGE_KEY=$accountKey
az storage container list # Uses the environment variables to display the list of containers.
```

The following script creates a metadata string and then uses the [az storage container metadata update](/cli/azure/storage/container/metadata#az-storage-container-metadata-update)
command to update a container with that string, again using the environment variables.

```azurecli
metadata="key=value pie=delicious" # Define metadata
az storage container metadata update \
    --name $container \
    --metadata $metadata # Update the metadata
az storage container metadata show \
    --name $containerName # Show the metadata
```

The following command uses the [az storage container delete](/cli/azure/storage/container#az-storage-container-delete)
command to delete a single named container and then delete multiple containers in a loop.

```azurecli
az storage container delete \
    --name $container
```

Get list of containers containing a specific prefix and store results into a variable.

```azurecli
containerPrefix="learnbash"
containerList=$(az storage container list \
    --query "[].name" \
    --prefix $containerPrefix \
    --output tsv)
```

Delete the list of containers in a loop using the `--prefix` argument.

```azurecli
for row in $containerList
do
    tmpName=$(echo $row | sed -e 's/\r//g')
    az storage container delete \
    --name $tmpName 
done
```

## Error handling

To exit a script immediately if a command returns a nonzero status, run the following command:

```azurecli-interactive
set -e
```

For more information about setting shell options and other help, run the following commands:

```azurecli-interactive
help set
help help
```

## Clean up resources

After you complete this article, delete the resource group and all resources within it. Use the
`--no-wait` argument.

```azurecli
if [ $(az group exists --name $resourceGroup) = true ]; then 
   az group delete --name $resourceGroup -y  --no-wait
else
   echo The $resourceGroup resource group does not exist
fi
```

## See also

- [Tutorial: Learn to use the Azure CLI](./get-started-tutorial-0-before-you-begin.md)
- [How to use the Azure CLI successfully](use-azure-cli-successfully-tips.md)
- [How to query Azure CLI command output](use-azure-cli-successfully-query.md)
- Find Azure CLI [samples](./samples-index.md) and [published articles](./reference-docs-index.md)
