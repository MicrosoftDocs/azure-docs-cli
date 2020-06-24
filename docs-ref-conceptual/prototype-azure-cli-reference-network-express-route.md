# az network express-route

Manage dedicated private network fiber connections to Azure.

To learn more about ExpressRoute circuits see [Create and modify an ExpressRoute circuit using CLI](https://docs.microsoft.com/azure/expressroute/howto-circuit-cli).

# Commands

| Service | Core | Extension | Experimental | Use | Minimum CL version
|-|-|-|-|-|-|
| az network express-route auth | [core](/cli/azure/network/express-route/auth) | | | Manage authentication of an ExpressRoute circuit. | 2.3.1
| az network express-route auth create | [core]() | [extension]() | | Create a new link authorization for an ExpressRoute circuit. | 2.8.0
| az network express-route auth delete | [core]() | | | Delete a link authorization of an ExpressRoute circuit. | 2.3.1
| az network express-route auth list | [core]() | | | List link authorizations of an ExpressRoute circuit. | 2.3.1
| az network express-route auth show | [core]() | | | Get the details of a link authorization of an ExpressRoute circuit. | 2.3.1
| az network express-route create | [core](#az-network-express-route-create) | [extension](#az-network-express-route-create-(extension)) | | Create an ExpressRoute circuit. | 2.8.0
| az network express-route delete | [core]() | | | Delete an ExpressRoute circuit. | 2.3.1
| az network express-route gateway | [core](/cli/azure/network/express-route/gateway) | [extension]() | | Manage ExpressRoute gateways with new extension commands. | 2.7.2
| az network express-route gateway connection | [core]() | [extension]()| [experimental]() | Manage ExpressRoute gateway connections. | 2.8.0
| az network express-route gateway connection create | [core]() | [extension]() | [experimental]() | Create an ExpressRoute gateway connection. | 2.8.0
| az network express-route gateway connection delete | [core]() | [extension]() | [experimental]() | Delete an ExpressRoute gateway connection. | 2.8.0
| az network express-route gateway connection list | [core]() | [extension]() | [experimental]() | List ExpressRoute gateway connections. | 2.8.0

> [!NOTE]
> >
> All `az network express-route` commands will be listed above
>

See [Overview: Azure CLI references](prototype-azure-cli-reference-types) for information on working with extension and experimental references.

## az network express-route create

Create an ExpressRoute circuit using core references.

```azurecli
az network express-route create --bandwidth
                                --name
                                --peering-location
                                --provider
                                --resource-group
                                [--allow-classic-operations {false, true}]
                                [--allow-global-reach {false, true}]
                                [--express-route-port]
                                [--location]
                                [--no-wait]
                                [--sku-family {MeteredData, UnlimitedData}]
                                [--sku-tier {Basic, Local, Premium, Standard}]
                                [--subscription]
                                [--tags]
```

### Examples

```azurecli
az network express-route create --bandwidth 200 -n MyCircuit --peering-location "Silicon Valley" -g MyResourceGroup --provider "Equinix" -l "West US" --sku-family MeteredData --sku-tier Standard
```

### Required Parameters

**--bandwidth**

    Bandwidth of the circuit. Usage: INT {Mbps,Gbps}. Defaults to Mbps.
    value from: az network express-route list-service-providers

**--name -n**

    ExpressRoute circuit name.

**--peering-location**

    Name of the peering location.
    value from: az network express-route list-service-providers

**--provider**

    Name of the ExpressRoute Service Provider.
    value from: az network express-route list-service-providers

> [!NOTE]
> >
> the rest of the Core `az network express-route create` parameters (required and optional) here
>

## az network express-route create (extension)

The use of `az network express-route` extension commands require Azure CLI version x.x.x or higher.  The [reference extension](prototype-azure-cli-reference-network#install-the-extension-reference) must also be installed prior to running the command.

Create an ExpressRoute circuit using extension references.

```azurecli
az network express-route create --bandwidth
                                --name
                                --resource-group
                                [--allow-global-reach {false, true}]
                                [--express-route-port]
                                [--location]
                                [--no-wait]
                                [--peering-location]
                                [--provider]
                                [--sku-family {MeteredData, UnlimitedData}]
                                [--sku-tier {Premium, Standard}]
                                [--tags]

```

### Examples

```azurecli
az network express-route create --bandwidth 200 -n MyCircuit --peering-location "Silicon Valley" -g MyResourceGroup --provider "Equinix" -l "West US" --sku-family MeteredData --sku-tier Standard
```

### Required Parameters

**--bandwidth**

    Bandwidth of the circuit. Usage: INT {Mbps,Gbps}. Defaults to Mbps.
    value from: az network express-route list-service-providers

**--name -n**

    ExpressRoute circuit name.

**--resource-group -g**

    Name of resource group. You can configure the default group using az configure --defaults group=<name>.

### Optional Parameters

**--allow-global-reach**

    Enable global reach on the circuit.
    accepted values: false, true

**--express-route-port**

    Name or ID of an ExpressRoute port.

**--location -l**

    Location. Values from: az account list-locations. You can configure the default location using az configure --defaults location=<location>.

> [!NOTE]
> >
> the rest of the Extension `az network express-route create' parameters here
>

# Alternative table layout

| Core Command | Extension | Use |
|-|-|-|
| [az network express-route auth]() | | Manage authentication of an ExpressRoute circuit.
| [az network express-route auth create]() | | Create a new link authorization for an ExpressRoute circuit.
| [az network express-route auth delete]() | | Delete a link authorization of an ExpressRoute circuit.
| [az network express-route auth list]() | | List link authorizations of an ExpressRoute circuit.
| [az network express-route auth show]() | | Get the details of a link authorization of an ExpressRoute circuit.
