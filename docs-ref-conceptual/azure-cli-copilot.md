---
title: Use Microsoft Copilot to learn Azure CLI | Microsoft Docs
description: How to use the new AI functionalities of Microsoft Copilot to learn Azure CLI.
ms.date: 04/05/2024
manager: jasongroce
author: daphnemamsft
ms.author: daphnema
ms.tool: azure-cli
ms.topic: conceptual
ms.service: azure-cli
ms.custom: devx-track-azurecli, seo-azure-cli
keywords: azure cli microsoft copilot, copilot for azure, azure command line
---

# Use Microsoft Copilot for Azure to learn how to use the Azure CLI

[Microsoft Copilot for Azure](https://aka.ms/MicrosoftCopilotforAzureDocs) (preview) is an AI-powered tool to help you do more with Azure. It unifies knowledge and data across hundreds of Azure services to increase productivity, reduce costs, and provide deep insights. Microsoft Copilot for Azure (preview) helps you learn about Azure by answering questions, and it provides information tailored to your own Azure resources and environment. By letting you express your goals in natural language, Copilot simplifies your Azure management experience. This benefits Azure CLI users because the knowledge of Azure CLI is built into Copilot!

Here are some of the benefits of using Microsoft Copilot for Azure:

- **Design**: Create and configure the services needed and align with organizational policies.
- **Operate**: Answer questions, author complex commands, and manage resources.
- **Troubleshoot**: Orchestrate across Azure services for insights to summarize issues, identify causes, and suggest solutions.
- **Optimize**: Receive recommendations to improve costs, scalability, and reliability.

## Enable Microsoft Copilot for Azure

To enable access to Microsoft Copilot for Azure (preview) for your organization, [complete the registration form](https://aka.ms/MSCopilotforAzurePreviewRequest). The application process only needs to be completed once per tenant. Check with your administrator if you have questions about joining the preview.

## Open Microsoft Copilot for Azure

To use Microsoft Copilot, go to the Azure Portal and select the **Copilot** icon on the top taskbar. The copilot window will open with a chat assistant where you can ask questions.

:::image type="content" source="./media/copilot-cli-1.png" alt-text="<Copilot on Azure portal>":::

When you tell Microsoft Copilot about a task you want to perform with Azure CLI, it provides a script with the necessary commands. 

## Search for reference commands

Ask Microsoft Copilot to assist with using the reference command `az group`. Note the placeholder values (marked in blue font) you need to update with actual values.

:::image type="content" source="./media/copilot-cli-2.png" alt-text="<Reference command>":::

Replace the variables (marked in blue) with actual values, or define the variables in your variable block before running the command.

# [Replace variables](#tab/define)

```azurecli-interactive
# Create a resource group
az group create --name myResourceGroup --location eastus
```

# [Use a variable block](#tab/variableblock)

```azurecli-interactive
# Variable block
let "randomIdentifier=$RANDOM*$RANDOM"
resourceGroup="myResourceGroup"
locationName="eastus"

# Create a resource group
az group create --name resourceGroup --location $location
```

***

## Look up an Azure CLI script

Suppose you encounter an Azure CLI script that includes references and parameters that are new to you. Use Microsoft Copilot to look up the reference command by entering the command as if you were in a terminal: 

:::image type="content" source="./media/copilot-cli-3.png" alt-text="<Looking up a script>":::

Microsoft Copilot references and links other Microsoft Learn documents related to your specific CLI topic and automatically generates follow-up questions. 

## Search for a task or job to be done

Use Azure CLI with Microsoft Copilot to help you create an Azure SQL database.

:::image type="content" source="./media/copilot-cli-4.png" alt-text="<Use Azure service>":::

Follow the steps provided:

1. Create an Azure SQL server:

   ```azurecli-interactive
   # Variable block
   serverName="myServerName"
   resourceGroup="myResourceGroup"
   locationName="eastus2"
   adminUser="myAdminUser"
   adminPassword="myPassword"

   az sql server create --name $serverName --resource-group $resourceGroup --location $location --admin-user $adminUser --admin-password $adminPassword
   ```

1. Create your Azure SQL database:

   ```azurecli-interactive
   # Variable block
   databaseName="myDatabaseName"
   resourceroup= "myResourceGroup"
   serverName="myServerName"
   serviceObjective="basic"

   az sql db create --name $databaseName --resource-group $resourceGroup --server $serverName --service-objective $serviceObjective
   ```

## Let us know how we did

Microsoft Copilot for Azure values your feedback. At the bottom of the Copilot response, give us a **thumbs up** if the Copilot response was helpful to you.  Give us a **thumbs down** when we need to make improvements. 

## See also

* [Generate Azure CLI scripts using Microsoft Copilot for Azure (preview)](/azure/copilot/generate-cli-scripts)
* [Apply for access to Microsoft Copilot for Azure](https://azure.microsoft.com/products/copilot#Usecases)
