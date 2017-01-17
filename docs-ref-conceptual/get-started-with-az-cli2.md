---
title: Get started with Azure 2.0 CLI Preview 
description: Get started with Azure 2.0 CLI Preview on Linux, Mac, or Windows.
keywords: Azure CLI 2.0, Linux, Mac, Windows, OS X, Ubuntu, Debian, CentOS, RHEL, SUSE, CoreOS, Docker, Windows, Python, PIP
author: allclark
manager: douge
ms.date: 01/03/2017
ms.topic: article
ms.prod: azure
ms.technology: azure
ms.assetid: 85c418a8-6177-4833-bb8d-ff4ce2233c1a
---

# Get started with Azure CLI 2.0 (Preview)

1. [Install Azure CLI 2.0 (Preview)](install-az-cli2.md)
on whatever platform you use.

2. Run `az` with no arguments to verify the installation. You should get a page like this:

    ```
    Welcome to the cool new Azure CLI!

    Here are the base commands:

        account  : Manages stored and default subscriptions.
        acs      : Manage Azure container services.
        ad       : Synchronize on-premises directories and manage Azure Active Directory (AAD)
                resources.
        cloud    : Manage the Azure clouds registered.
        component: Manages and updates Azure CLI components.
        configure: Interactive experience for setting up the Azure CLI.
        context  : Manage contexts.
        feedback : Loving or hating the CLI?  Let us know!
        login    : Log in to access Azure subscriptions.
        logout   : Log out to remove accesses to Azure subscriptions.
        network  : Manages Network resources.
        provider : Manage resource providers.
        resource : Generic commands to manage Azure resources.
        role     : Use role assignments to manage access to your Azure resources.
        storage  : Durable, highly available, and massively scalable cloud storage.
        tag      : Manage resource tags.
        vm       : Provision Linux and Windows virtual machines in minutes.
        vmss     : Create highly available, auto-scalable Linux or Windows virtual machines.
    ```

3. Run the login command.

    ```azurecli
    az login
    ```
    
    You'll be prompted to open https://aka.ms/devicelogin and enter a code.

4. Use a web browser to open the page https://aka.ms/devicelogin and enter the code to authenticate.

    You'll be prompted to log in using your credentials.
    
5. Log in.

    Now you can run any command that accesses your account.

## Create a resource group

```azurecli
az resource group create -l westus -n MyRG
```


## Create a VM

```azurecli
az vm create -g MyRG -n MyVM --admin-username admin --admin-password Password@1234
```

## Get samples

[Samples](https://github.com/Azure/azure-cli-samples)

## Get help

```azurecli
az [command-group [command]] -h
```

For example, to see what commands and subgroups are available for VMs, use

```azurecli
az vm -h
```

To get help with the command to create a VM, use

```azurecli
az vm create -h
```

## Authenticating using a service principal

[Service principal](authenticate-az-cli2.md#service-principal)

## Query the results

- Use the `--query` parameter to execute a [JMESPath query](http://jmespath.org) on the results of your `az` command.
    For example, the following lists the sql endpoints for each Azure cloud.

    ```azurecli
    az cloud list --query [*].[name,endpoints.sqlManagement]
    ```

## Format the output

- Use the `--output` parameter to format the output of the command into one of these forms.

    --output | Description
    ---------|-------------------------------
    json     | json string. This is the default.
    jsonc    | colorized json string.
    list     | an easily read list.
    table    | table with column headings.
    tsv      | tab-separated values.

    For example, the following displays the list of Azure clouds in an easy to read list format.

    ```azurecli
    az cloud list --output list
    ```

    The results are in this form.

    ```
    Name      : AzureCloud
    Endpoints :
        Active Directory                   : https://login.microsoftonline.com
        Active Directory Graph Resource Id : https://graph.windows.net/
        Active Directory Resource Id       : https://management.core.windows.net/
        Gallery                            : https://gallery.azure.com/
        Management                         : https://management.core.windows.net/
        Resource Manager                   : https://management.azure.com/
        Sql Management                     : https://management.core.windows.net:8443/
    Suffixes  :
        Azure Datalake Analytics Catalog And Job Endpoint : azuredatalakeanalytics.net
        Azure Datalake Store File System Endpoint         : azuredatalakestore.net
        Keyvault Dns                                      : .vault.azure.net
        Sql Server Hostname                               : .database.windows.net
        Storage Endpoint                                  : core.windows.net
    ```

    When you use table or tsv, nested objects aren't included in the output.
    Since the only name-value pair at the top level of the cloud object is the name,
    that's all you get with either `--output table` or `--output tsv`.

    ```azurecli
    az cloud list --output table
    ```

    Just returns the top level name-value pairs, which is just the names in this case.

    ```
    Name
    -----------------
    AzureCloud
    AzureChinaCloud
    AzureUSGovernment
    AzureGermanCloud
    ```

    You can use a JMESPath operation to flatten the object.
    If we get the name and the sql endpoint, it looks like this.

    ```azurecli
    az cloud list --query [*].[name,endpoints.sqlManagement] --output table
    ```

    ```
    Column1            Column2
    -----------------  -----------------------------------------------
    AzureCloud         https://management.core.windows.net:8443/
    AzureChinaCloud    https://management.core.chinacloudapi.cn:8443/
    AzureUSGovernment  https://management.core.usgovcloudapi.net:8443/
    AzureGermanCloud   https://management.core.cloudapi.de:8443/
    ```

    The column names are lost in this case because they don't exist in our JMESPath query results.
    To get meaningful column names when displaying the results of a JMESPatch qyery in a table,
    add them to the JMESPath query like this.

    ```azurecli
    az cloud list --query [*].{Name:name,SQL:endpoints.sqlManagement} --output table
    ```

    The results have the column headings.

    ```
    Name               SQL
    -----------------  -----------------------------------------------
    AzureCloud         https://management.core.windows.net:8443/
    AzureChinaCloud    https://management.core.chinacloudapi.cn:8443/
    AzureUSGovernment  https://management.core.usgovcloudapi.net:8443/
    AzureGermanCloud   https://management.core.cloudapi.de:8443/
    ```

## Read the API reference docs

[API reference](/cli/azure)

## Send us your feedback

```azurecli
az feedback
```