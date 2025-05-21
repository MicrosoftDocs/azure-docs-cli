---
title: Use Microsoft Copilot in Azure to learn how to use the Azure CLI
description: Use Microsoft Copilot in Azure to learn and generate Azure CLI commands faster with AI-powered guidance tailored to your resources and tasks.
ms.service: azure-cli
ms.custom: devx-track-azurecli
keywords: azure cli microsoft copilot, copilot for azure, azure command line
---

# Use Microsoft Copilot in Azure to learn how to use the Azure CLI

[Microsoft Copilot in Azure][01] is an AI-powered tool that can help you do more with Azure. It
unifies knowledge and data across hundreds of Azure services to increase productivity, reduce costs,
and provide deep insights. Copilot in Azure helps you learn about Azure by answering questions, and
it provides information tailored to your own Azure resources and environment. By letting you express
your goals in natural language, Copilot simplifies your Azure management experience. This benefits
Azure CLI users because the knowledge of Azure CLI is built into Copilot.

Here are some benefits of using Copilot in Azure:

- **Design**: Create and configure the services needed and align them with organizational policies.
- **Operate**: Answer questions, author complex commands, and manage resources.
- **Troubleshoot**: Orchestrate across Azure services for insights to summarize issues, identify
  causes, and suggest solutions.
- **Optimize**: Receive recommendations to improve costs, scalability, and reliability.

By default, Copilot in Azure is available to all users in an organization. Check with your
administrator if you have questions about access.

## Open Microsoft Copilot in Azure

To use Copilot in Azure, go to the Azure portal and select the **Copilot** icon in the page header.
A new pane opens with a chat assistant where you can ask questions.

:::image type="content" source="./media/azure-cli-copilot/copilot-cli-1.png" alt-text="<Screenshot of the Copilot icon in the Azure portal.>":::

When you tell Copilot in Azure about a task you want to perform with Azure CLI, it provides a script
with the necessary commands.

## Search for reference commands

Ask Copilot in Azure to help you with a specific Azure CLI command. For example, you can ask how to
create a virtual machine in Azure.

:::image type="content" source="./media/azure-cli-copilot/copilot-cli-2.png" alt-text="<Screenshot of Copilot in Azure providing an Azure CLI script to create a virtual machine.>":::

You can copy the script and use it. Replace the variables with actual values or define them in a
variable block before running the command.

## Look up an Azure CLI script

Suppose you encounter an Azure CLI script that includes references and parameters that are new to
you. Use Copilot in Azure to look up the reference command by entering the command as if you were in
a terminal:

:::image type="content" source="./media/azure-cli-copilot/copilot-cli-3.png" alt-text="<Screenshot of Copilot in Azure explaining an Azure CLI script.>":::

## Search for a task or job to be done

You can use Azure CLI with Copilot in Azure to help create an Azure SQL database.

:::image type="content" source="./media/azure-cli-copilot/copilot-cli-4.png" alt-text="<Use Azure service>":::

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
   resourceroup= "myResourceGroup"
   serverName="myServerName"
   databaseName="myDatabaseName"
   serviceObjective="basic"

   az sql db create --resource-group $resourceGroup --server $serverName --name $databaseName --service-objective $serviceObjective
   ```

## Let us know how we did

Microsoft Copilot in Azure values your feedback. At the bottom of the Copilot response, give us a
**thumbs up** if the Copilot response was helpful to you. Give us a **thumbs down** when we need to
make improvements.

## See also

- [Microsoft Copilot in Azure overview][03]
- [Generate Azure CLI scripts using Microsoft Copilot in Azure][02]

<!-- link references -->

[01]: /azure/copilot/
[02]: /azure/copilot/generate-cli-scripts
[03]: /azure/copilot/overview
