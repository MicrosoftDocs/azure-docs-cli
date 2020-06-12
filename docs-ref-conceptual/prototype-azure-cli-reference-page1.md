# prototype for Azure CLI Reference changes using IoT

> [!NOTE]
> >
> This section is for talking points.  This section is not an example reference doc 
>
> The purpose of this redesign is to ***improve clarity*** and ***increase visibility*** for each `service reference set`.
>

## terms

- "root reference" = top most reference level like `az monitor` and `az IoT`
- "child reference" = 2nd, 3rd, 4th, 5th... reference levels
   - 2nd level is the `central` in `az iot central`
   - 3rd level is the `app` in `az iot central app`
   - 4th level is the `device` in `az iot central app device`
   - 5th level is the `create` in `az iot central app device create`
- "reference set" = all of the commands that fall under a single root reference
- "released" = core references
- "extension" = extension references
- "preview" = extension references in preview

## goals

1. Rework the Reference TOC so that names are consistent and it is easy to locate and navigate ***all references*** for a ***single service***.
1. Develop new docs focusing on `service reference set` organization  
   - combine core and extension references
   - develop a reference set landing page
1. Add more reference information to pages
   - add the group reference name in each level1 document
   - add prerequisite reminder in each extension reference page
   - enhance table design to provide more information
     a. command type (released, extension, extension preview)
     b. version requirement
   - remove links to GitHub unless we specifically say [GitHub something-or-other](/Azure/azure-cli-extensions/tree/master/src/express-route)
1. Fix the breadcrumbs
   - [az network express-route auth](/cli/azure/network/express-route/auth?view=azure-cli-latest)

## assumptions with a focus on the user experience

1. the name showing on the TOC should always be the full official **service name** like `Azure IoT`, not `IoT`, `az iot`, or `azure-iot`.  We want our service names to match the terminology of the Azure portal.
1. reference and extension references are now combined under the single root reference URL
1. the top level [Overview](/cli/azure/reference-index) is still an alpha list of root Azure CLI references; however, why are we will now be sending users to new [service reference landing pages](#Azure-CLI-for-Azure-IoT)
1. Azure CLI commands that are cross-service will have their own reference set, `Azure CLI`.  Example commands are `az configure`, `az feedback`, `az login`.
1. Azure CLI commands that span multiple services, but have been placed in a mixed service reference name, like `db-up`, can remain there but the references themselves will be grouped into the correct `service reference landing page`.  An example would be `az mysql down`.  It can still be part of `db up` technical reference, but it will show up in the `az mysql` references pages.
1. preview references need a landing page in the TOC, not just a GitHub link.  We can combine them with the reference set to which they belong, and like extensions, provide preview information on pages.  Q: What do we expect a user to know or do when they get to a [preview GitHub page](/Azure/azure-cli-extensions/tree/master/src/express-route)?
1. the new reference TOC will have a different organization which will support these document changes (i.e. only one ***Reference*** TOC header containing both core and extension references)
1. We will still have separate summary pages for [core](/cli/azure/reference-index?view=azure-cli-latest) and [extension](/cli/azure/azure-cli-extensions-list?view=azure-cli-latest)
1. We will not be removing articles that explain how to work with extensions
1. With these changes, our prototype [reference landing page](/azure/data-share/azure-cli-references-for-data-share) can be removed -- there is too much overlap to keep both in sync.

## Next steps after design review

1. Prototype full reference landing page that has core, extension and preview commands
1. Prototype individual root reference Overviews
1. Prototype three sample pages (one for each command type)
1. Prototype TOC with just these example docs

## variables
1. the name of the Azure service
1. the name of the Azure CLI reference set, like `azure-iot` or `notification-hubs`
1. the name of each child command
1. the type of each child command, like `released`, `extension` or `

**********************************************************

# Example root reference page -- prototype 1

> [!NOTE]
> >
> This new page design will replace [az iot](/cli/azure/iot) and combine all reference types.  
>
> Please note the clear identification of the reference name as this is not always the root reference.
>
> If a reference is in preview, this will be indicated in the H1
>

# Azure CLI for Azure IoT

Use Azure CLI to manage Azure IoT with the `azure-iot` reference set.

## Reference set

| | |
|-|-|
| [az iot central](#az-iot-central) | Manage IoT Central assets.
| [az iot dps](#az-iot-dps) | Manage Azure IoT Hub Device Provisioning Service.
| [az iot device](#az-iot-device) | Leverage device-to-cloud and cloud-to-device messaging capabilities.
| [az iot edge](#az-iot-edge) | Manage IoT solutions on the Edge.
| [az iot hub](#az-iot-hub) | Manage Azure IoT hubs.
| [az iot pnp](#az-iot-pnp) | Manage IoT Plug and Play repositories and repository access keys.

## Full reference list

There are two types of Azure CLI references.  Core references have been published as a permanent part of the Azure CLI.  Extension references haven't shipped as part of the CLI but run as CLI commands. With extensions, you gain access to experimental and pre-release commands.  

Click on the name of each command for code samples.

### az iot central

| Command | Type | Description |
|-|-|-|
| [az iot central app](/cli/azure/iot/central/app) | | All commands to manage IoT Central applications INCLUDING EXTENSIONS(!)
| [az iot central app create](/cli/azure/iot/central/app#az-iot-central-app-create) | Released | Create an IoT Central application.
| [az iot central app delete](/cli/azure/iot/central/app#az-iot-central-app-delete) | Released | Delete an IoT Central application.
| [az iot central app list](/cli/azure/iot/central/app#az-iot-central-app-list) | Released | Delete an IoT Central application.
| [az iot central app show](/cli/azure/iot/central/app#az-iot-central-app-show) | Released | Delete an IoT Central application.
| [az iot central app update](/cli/azure/iot/central/app#az-iot-central-app-update) | Released | Delete an IoT Central application.
| [az iot central app device](/cli/azure/ext/azure-iot/iot/central/app/device) | Extension | Manage and configure IoT Central devices.
| [az iot central app device create](/cli/azure/ext/azure-iot/iot/central/app/device#ext-azure-iot-az-iot-central-app-device-create) | Extension | Create a device in IoT Central.
| [az iot central app device delete]() | Extension | Delete a device from IoT Central.
| [az iot central app device list]() | Extension | List all devices in IoT Central.
| [az iot central app device registration-info]() | Extension | Get registration info on device(s) from IoT Central.
| [az iot central app device registration-summary]() | Extension | Provides a registration summary of all the devices in an app.
| [az iot central app device show]() | Extension | Get a device from IoT Central.
| [az iot central app device-template]() | Extension | Manage and configure IoT Central device templates.
| [az iot central app device-template create]() | Extension | Create a device template in IoT Central.
| [az iot central app device-template delete]() | Extension | Delete a device template from IoT Central.
| [az iot central app device-template list]() | Extension | List all device templates in IoT Central.
| [az iot central app device-template map]() | Extension | Returns a mapping of device template name to device template id.
| [az iot central app device-template show]() | Extension | Get a device template from IoT Central.
| [az iot central app device-twin]() | Extension | Manage IoT Central device twins.
| [az iot central app device-twin show]() | Extension | Get the device twin from IoT Hub.
| [az iot central app monitor-events]() | Extension | Monitor device telemetry & messages sent to the IoT Hub for an IoT Central | [app.
| [az iot central app validate-messages]() | Extension | Validate messages sent to the IoT Hub for an IoT Central app.
| [az iot central device-twin]() | Extension | Manage IoT Central device twins.
| [az iot central device-twin show]() | Extension | Get the device twin from IoT Hub.

### az iot dps

| Command | Type | Description |
|-|-|-|
| [az iot dps](/cli/azure/iot/dps) | | All commands to manage Azure IoT Hub Device Provisioning Service INCLUDING EXTENSIONS(!)
| [az iot dps access-policy]() | Released | Manage Azure IoT Hub Device Provisioning Service access policies.
| [az iot dps access-policy create]() | Released | Create a new shared access policy in an Azure IoT Hub device provisioning service.
| [az iot dps access-policy delete]() | Released | Delete a shared access policies in an Azure IoT Hub device provisioning service.
| [az iot dps access-policy list]() | Released | List all shared access policies in an Azure IoT Hub device provisioning service.
| [az iot dps access-policy show]() | Released | Show details of a shared access policies in an Azure IoT Hub device provisioning service.
| [az iot dps access-policy update]() | Released | Update a shared access policy in an Azure IoT Hub device provisioning service.
| [az iot dps certificate]() | Released | Manage Azure IoT Hub Device Provisioning Service certificates.
| [az iot dps certificate create]() | Released | Create/upload an Azure IoT Hub Device Provisioning Service certificate.
| [az iot dps certificate delete]() | Released | Delete an Azure IoT Hub Device Provisioning Service certificate.
| [az iot dps certificate generate-verification-code]() | Released | Generate a verification code for an Azure IoT Hub Device Provisioning Service certificate.
| [az iot dps certificate list]() | Released | List all certificates contained within an Azure IoT Hub device provisioning service.
| [az iot dps certificate show]() | Released | Show information about a particular Azure IoT Hub Device Provisioning Service certificate.
| [az iot dps certificate update]() | Released | Update an Azure IoT Hub Device Provisioning Service certificate.
| [az iot dps certificate verify]() | Released | Verify an Azure IoT Hub Device Provisioning Service certificate.
| [az iot dps create]() | Released | Create an Azure IoT Hub device provisioning service.
| [az iot dps delete]() | Released | Delete an Azure IoT Hub device provisioning service.
| [az iot dps enrollment]() | Extension | Manage enrollments in an Azure IoT Hub Device Provisioning Service.
| [az iot dps enrollment create]() | Extension | Create a device enrollment in an Azure IoT Hub Device Provisioning Service.
| [az iot dps enrollment delete]() | Extension | Delete a device enrollment in an Azure IoT Hub Device Provisioning Service.
| [az iot dps enrollment list]() | Extension | List device enrollments in an Azure IoT Hub Device Provisioning Service.
| [az iot dps enrollment show]() | Extension | Get device enrollment details in an Azure IoT Hub Device Provisioning Service.
| [az iot dps enrollment update]() | Extension | Update a device enrollment in an Azure IoT Hub Device Provisioning Service.
| [az iot dps enrollment-group]() | Extension | Manage Azure IoT Hub Device Provisioning Service.
| [az iot dps enrollment-group create]() | Extension | Create an enrollment group in an Azure IoT Hub Device Provisioning Service.
| [az iot dps enrollment-group delete]() | Extension | Delete an enrollment group in an Azure IoT Hub Device Provisioning Service.
| [az iot dps enrollment-group list]() | Extension | List enrollments groups in an Azure IoT Hub Device Provisioning Service.
| [az iot dps enrollment-group show]() | Extension | Get the details of an enrollment group in an Azure IoT Hub Device Provisioning Service.
| [az iot dps enrollment-group update]() | Extension | Update an enrollment group in an Azure IoT Hub Device Provisioning Service.
| [az iot dps linked-hub]() | Released | Manage Azure IoT Hub Device Provisioning Service linked IoT hubs.
| [az iot dps linked-hub create]() | Released | Create a linked IoT hub in an Azure IoT Hub device provisioning service.
| [az iot dps linked-hub delete]() | Released | Update a linked IoT hub in an Azure IoT Hub device provisioning service.
| [az iot dps linked-hub list]() | Released | List all linked IoT hubs in an Azure IoT Hub device provisioning service.
| [az iot dps linked-hub show]() | Released | Show details of a linked IoT hub in an Azure IoT Hub device provisioning service.
| [az iot dps linked-hub update]() | Released | Update a linked IoT hub in an Azure IoT Hub device provisioning service.
| [az iot dps list]() | Released | List Azure IoT Hub device provisioning services.
| [az iot dps registration]() | Extension | Manage Azure IoT Hub Device Provisioning Service registrations.
| [az iot dps registration delete]() | Extension | Delete a device registration in an Azure IoT Hub Device Provisioning Service.
| [az iot dps registration list]() | Extension | List device registration state in an Azure IoT Hub Device Provisioning Service enrollment group.
| [az iot dps registration show]() | Extension | Get the device registration state in an Azure IoT Hub Device Provisioning Service.
| [az iot dps show]() | Released | Get the details of an Azure IoT Hub device provisioning service.
| [az iot dps update]() | Released | Update an Azure IoT Hub device provisioning service.

### az iot device

Both core and extension command list here

### az iot edge

`Both core and extension command list here`

### az iot hub

`Both core and extension command list here`

### az iot pnp

`Both core and extension command list here`

## Install the extension reference

For extension references, you need to install the extension before running the command. Use the name of the reference set in your `--name` parameter.  

```azurecli
az extension add --name azure-iot
```

To learn more about extensions, see [Use extensions with Azure CLI](/cli/azure/azure-cli-extensions-overview).

Review the extension [wiki tips](https://github.com/Azure/azure-iot-cli-extension/wiki/Tips) to maximize usage.

************************************************************

# Changes to existing child reference designs - prototype 2

> [!NOTE]
>
> Keep the same format and methodology
>
> Add the sentence "This command group is part of the [azure-iot](#Azure-CLI-for-Azure-IoT) reference set." on the level 2 only, such as `az iot central` or `az iot hub`.  It is not necessary to add this sentence on level 3 pages such as `az iot central app` or `az iot hub certificate`.
>

# az iot central

Manage Azure Central (IoT Central) solutions & infrastructure.

This command group is part of the [azure-iot](#Azure-CLI-for-Azure-IoT) reference set.

## Commands

Same list of [links](/cli/azure/ext/azure-iot/iot/central) here.

*************************************************************************************
# Changes to existing child reference designs - prototype 3

> [!NOTE]
> Keep the same format and methodology as seen [here](/cli/azure/ext/azure-iot/iot/central/app).
>
> For extension reference samples, add the sentence, "The [azure-iot extension](#install-the-extension-reference) must  be installed before running this command."
>

# az iot central app

Manage Azure IoT Central applications.

To use `az iot central app` commands, the user must be logged in with the `az login` command, have the correct tenant set (the users home tenant), and have access to the application through http://apps.azureiotcentral.com".

| Command | Type | Description |
|-|-|-|
| [az iot central app](/cli/azure/iot/central/app) | | All commands to manage IoT Central applications INCLUDING EXTENSIONS(!)
| [az iot central app create](/cli/azure/iot/central/app#az-iot-central-app-create) | Released | Create an IoT Central application.
| [az iot central app delete](/cli/azure/iot/central/app#az-iot-central-app-delete) | Released | Delete an IoT Central application.
| [az iot central app list](/cli/azure/iot/central/app#az-iot-central-app-list) | Released | Delete an IoT Central application.
| [az iot central app show](/cli/azure/iot/central/app#az-iot-central-app-show) | Released | Delete an IoT Central application.
| [az iot central app update](/cli/azure/iot/central/app#az-iot-central-app-update) | Released | Delete an IoT Central application.
| [az iot central app device](/cli/azure/ext/azure-iot/iot/central/app/device) | Extension | Manage and configure IoT Central devices.
| [az iot central app device create](/cli/azure/ext/azure-iot/iot/central/app/device#ext-azure-iot-az-iot-central-app-device-create) | Extension | Create a device in IoT Central.
| [az iot central app device delete]() | Extension | Delete a device from IoT Central.
| [az iot central app device list]() | Extension | List all devices in IoT Central.
| [az iot central app device registration-info]() | Extension | Get registration info on device(s) from IoT Central.
| [az iot central app device registration-summary]() | Extension | Provides a registration summary of all the devices in an app.
| [az iot central app device show]() | Extension | Get a device from IoT Central.
| [az iot central app device-template]() | Extension | Manage and configure IoT Central device templates.
| [az iot central app device-template create]() | Extension | Create a device template in IoT Central.
| [az iot central app device-template delete]() | Extension | Delete a device template from IoT Central.
| [az iot central app device-template list]() | Extension | List all device templates in IoT Central.
| [az iot central app device-template map]() | Extension | Returns a mapping of device template name to device template id.
| [az iot central app device-template show]() | Extension | Get a device template from IoT Central.
| [az iot central app device-twin]() | Extension | Manage IoT Central device twins.
| [az iot central app device-twin show]() | Extension | Get the device twin from IoT Hub.
| [az iot central app monitor-events]() | Extension | Monitor device telemetry & messages sent to the IoT Hub for an IoT Central | [app.
| [az iot central app validate-messages]() | Extension | Validate messages sent to the IoT Hub for an IoT Central app.
| [az iot central app device-twin]() | Extension | Manage IoT Central device twins.
| [az iot central app device-twin show]() | Extension | Get the device twin from IoT Hub.

## az iot central app create

Create an IoT Central application.

```azurecli
az iot central app create --name
                          --resource-group
                          --subdomain
                          [--display-name]
                          [--location]
                          [--sku {F1, S1, ST0, ST1, ST2}]
                          [--subscription]
                          [--template]
```

### Examples

Create an IoT Central application in the standard pricing tier ST2, in the region of the resource group.

```azurecli-interactive
az iot central app create --resource-group MyResourceGroup --name my-app-resource --subdomain my-app-subdomain
```

> [!NOTE]
>
> [Existing page syntax](/cli/azure/iot/central/app#az-iot-central-app-create) continues as-is
>

## az iot central app device create

Manage and configure IoT Central devices.

The [azure-iot extension](#install-the-extension-reference) must be installed before running this command.

Create a device in IoT Central.

```azurecli
az iot central app device create --app-id
                                 --device-id
                                 [--central-api-uri]
                                 [--device-name]
                                 [--instance-of]
                                 [--simulated {false, true}]
                                 [--token]
```

### Examples

Create a device

```azurecli-interactive
az iot central app device create --app-id {appid} --device-id {deviceid}
```

> [!NOTE]
>
> [existing page syntax](/cli/azure/ext/azure-iot/iot/central/app/device#ext-azure-iot-az-iot-central-app-device-create) continues as-is
>
