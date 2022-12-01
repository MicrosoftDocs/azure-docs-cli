You have been asked to evaluate Azure command-line tools in order to make a recommendation for automating the creation of Azure storage resources.  You have experience working with Azure through the Azure Portal, but a recent promotion has put you in charge of managing hundreds of Azure storage accounts.  One of your tasks is to respond to requests for new storage accounts through your company's web application.

We'll review a few concepts that allow you to make a qualified recommendation.

## Automating the management of Azure resources

Every action you take inside the portal translates somewhere to code being executed to read, create, modify, or delete resources. By using the existing automation that runs Azure, command-line tools reduce the time it takes to manage Azure resources. You can also automate routine operations and make it easy to share scripts.

### Automation options in Azure

There are four tools commonly used to automate the management of Azure resources.  Click on each tab for a brief overview of each tool.

# [Azure CLI](#tab/biazurecli)

The Azure Command-Line Interface (CLI) is a cross-platform command-line tool to connect to Azure and execute administrative commands on Azure resources. It allows the execution of commands through a terminal using interactive command-line prompts or a script.

For interactive use, you first launch a shell such as cmd.exe on Windows, or Bash on Linux or macOS, and then issue a command at the shell prompt. To automate repetitive tasks, you assemble the CLI commands into a shell script using the script syntax of your chosen shell, and then you execute the script.

You can [install the Azure CLI locally](/cli/azure/install-azure-cli) on Linux, Mac, or Windows computers. It can also be used from a browser through the [Azure Cloud Shell](/azure/cloud-shell/quickstart) or run from inside a [Docker container](/cli/azure/run-azure-cli-docker).

# [Azure PowerShell](#tab/azurepowershell)

[Azure PowerShell](/powershell/azure/what-is-azure-powershell) is a set of cmdlets for managing Azure resources directly from PowerShell. Azure
PowerShell is designed to make it easy to learn and get started with, but provides powerful features
for automation.

The Az PowerShell module is based on the .NET Standard, and works with PowerShell 7.0.6 LTS and
PowerShell 7.1.3 or higher on all platforms including Windows, macOS, and Linux. It's also
compatible with Windows PowerShell 5.1.

# [Bicep](#tab/bicep)

[Bicep](/azure/azure-resource-manager/bicep/overview) is a domain-specific language (DSL) that uses declarative syntax to deploy Azure resources. In a Bicep file, you define the infrastructure you want to deploy to Azure, and then use that file throughout the development lifecycle to repeatedly deploy your infrastructure. Your resources are deployed in a consistent manner.

Bicep provides concise syntax, reliable type safety, and support for code reuse. Bicep offers a first-class authoring experience for your [infrastructure-as-code](/devops/deliver/what-is-infrastructure-as-code) solutions in Azure.

# [Terraform](#tab/terraform)

[Hashicorp Terraform](https://www.terraform.io/) is an open-source IaC (Infrastructure-as-Code) tool for provisioning and managing cloud infrastructure. It codifies infrastructure in configuration files that describe the desired state for your topology. Terraform enables the management of any infrastructure - such as public clouds, private clouds, and SaaS services - by using [Terraform providers](https://www.terraform.io/language/providers).  

#### Terraform providers for Azure infrastructure

There are several Terraform providers that enable the management of Azure infrastructure:

- [AzureRM](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs): Manage stable Azure resources and functionality such as virtual machines, storage accounts, and networking interfaces.
- [AzureAD](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs): Manage Azure Active directory resources such as groups, users, service principals, and applications.
- [AzureDevops](https://registry.terraform.io/providers/microsoft/azuredevops/latest/docs): Manage Azure DevOps resources such as agents, repositories, projects, pipelines, and queries.
- [AzAPI](https://registry.terraform.io/providers/Azure/azapi/latest/docs): Manage Azure resources and functionality using the Azure Resource Manager APIs directly. This provider compliments the AzureRM provider by enabling the management of Azure resources that aren't released. For more information about the AzAPI provider, see [Terraform AzAPI provider](overview-azapi-provider.md).
- [Azure Stack](https://registry.terraform.io/providers/hashicorp/azurestack/latest/docs): Manage Azure Stack resources such as virtual machines, DNS, VNet, and storage.

---

## How do the tools compare?

The Azure CLI, Azure PowerShell, Bicep and Terraform have many similarities, but they also offer distinct advantages.  Since you are tasked with managing Azure Storage, which tool capabilities give the highest advantage in your environment?

| Capability | Azure CLI | Azure PowerShell | Bicep | Terraform
|-|-|-|-|-|
|Imperative IaC | yes | yes | yes | |
|Declarative IaC | | | | yes|
|Azure-native | yes | yes | yes| |
|Cloud-agnostic | | | | yes
|Can run in Windows, macOS and Linux shells| yes | yes | yes | yes
|Is a command-line tool | yes | yes | | |
|Can execute a script from a command-line | yes | yes | yes | yes
|Uses [MSAL](https://github.com/AzureAD/microsoft-authentication-library-for-python) as the underlying authentication library | yes | yes | yes | yes
|Can authenticate with ...(?) | yes | yes | | |
|Can create, edit and delete Azure Storage resources | yes | yes | yes | yes
|Can `do something else` | | | yes | yes
|Can `do something else` | yes | yes | | |
|Can `do something else` | yes | yes | yes | yes

> [!NOTE]
> Azure management tools are continually adding the ability to work with more and more Azure services.
> This learning unit is focusing on Azure Storage.  To see a list of Azure services each tool can
> manage, see **Azure Services the** [Azure CLI](/cli/azure/azure-services-the-azure-cli-can-manage), [Azure PowerShell](), [Bicep]() and [Terraform]() **Can Manage**.

Take a deeper look at each tool.  What features of the Azure CLI vs Azure PowerShell, Bicep vs Terraform, make
one or more a good fit in your environment?

# [Azure CLI vs Azure PowerShell](#tab/cli-ps)

### Azure CLI vs Azure PowerShell

Azure CLI and Azure PowerShell are command-line tools that enable you to create and manage Azure resources. Both are cross-platform, installable on Windows, macOS, and Linux.  

**Azure CLI**

* Cross-platform command-line interface, installable on Windows, macOS, Linux
* Runs in Windows PowerShell, Cmd, or Bash and other Unix shells.
* Is based on Python
* Defaults to outputting a JSON string. Other format options can be found on the [Output formats for Azure CLI commands](/cli/azure/format-output-azure-cli).
* Allows you to query for command output using [JMESPath query syntax](/azure/query-azure-cli).
* Supports asynchronous operations

**Azure PowerShell**

* Cross-platform PowerShell module, runs on Windows, macOS, Linux
* Requires Windows PowerShell or PowerShell
* Is based on the .NET Standard
* Defaults to outputting objects. To learn more about formatting in PowerShell, read the [Using Format Commands to Change Output View](/powershell/scripting/samples/using-format-commands-to-change-output-view).

#### Different shell environments

|Shell Environment|Azure CLI|Azure PowerShell|
|---|:---:|:---:|
|Cmd|Yes||
|Bash|Yes|
|Windows PowerShell|Yes|Yes|
|PowerShell|Yes|Yes|

Windows PowerShell, PowerShell, Cmd, and Bash are shell environments. Your shell environment not only determines which tools you can use but also changes your command-line experience.

For example, for the line continuation character, Bash uses the backslash `\` while Windows PowerShell uses the backtick  `` ` ``. The differences in the shell environment doesn't change how Azure CLI and Azure PowerShell operate. However, they do change your command-line experience.

Azure CLI has an installer that makes its commands executable in all four shell environments.

Azure PowerShell is set of cmdlets packaged as a PowerShell module named `Az`; not an executable. Windows PowerShell or PowerShell must be used to install the `Az` module. 

Windows PowerShell is the standard scripting shell that comes preinstalled with most Windows operating systems. PowerShell is a stand-alone installation that uses .NET Core as it's run time, allowing it to be installed on macOS, Linux, and Windows.

**Additional points:**

* AzureRM is a PowerShell module that is still referenced for Azure administration with PowerShell. However, it has been replaced by Azure PowerShell and has an official retirement date of February 29 2024.  If you're using AzureRM, you can [migrate Azure PowerShell from AzureRM to Az](/powershell/azure/migrate-from-azurerm-to-az).

* Feature parity for Azure services doesn't always exist between Azure CLI and Azure PowerShell.  Azure CLI currently supports xxx Azure services.  Azure PowerShell supports yyy Azure services.  Both tools continue to add Azure services and features at each bi-monthly release.

# [Bicep vs Terraform](#tab/bicep-terrafrom)

Say something here
Say something here
Say something here
Say something here

---

## What about Azure Cloud Shell?

Azure Cloud Shell is a hosted shell environment that runs on an Ubuntu container.

Cloud Shell provides two shell environments: Bash (with Azure CLI preinstalled) and PowerShell (with Azure PowerShell preinstalled). A dropdown list at the top of the Cloud Shell window allows you to easily switch between the two environments.

Cloud Shell is accessible in a web browser and has integrations for [Windows Terminal](/Shows/IT-Ops-Talk/Azure-Cloud-Shell-in-the-Windows-Terminal) and [Visual Studio Code](https://azure.microsoft.com/blog/cloudshelleditor/).

![Azure CloudShell Bash and PowerShell environments](./media/choosing-the-right-azure-tool/azure-cloud-shell-bash-powershell.png)

> [!NOTE]
> Azure Cloud Shell may not always _immediately reflect_ the most recent Azure PowerShell and Azure CLI releases as the publishing schedule for all three tools is different.  However, Azure Cloud Shell is generally thought to always contain the most recent versions of both tools.

## Which Azure automation tool is right for you?

When picking the right tool, consider your past experience and current work environment.

Azure CLI syntax is similar to that of Bash scripting. If you work primarily with Linux systems, Azure CLI feels more natural.

Azure PowerShell is a PowerShell module. If you work primarily with Windows systems, Azure PowerShell is a natural fit. Commands follow a verb-noun naming scheme and data is returned as objects.

Choose the tool that uses your experience and shortens your learning curve. Being open-minded will only improve your abilities. Use a different tool when it makes sense.
