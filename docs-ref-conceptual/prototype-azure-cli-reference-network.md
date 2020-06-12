> [!NOTE]
> >
> This prototype for `az network` is a service reference landing page that replaces the following group / summary reference pages: 
>
> 1. [Core reference list](/cli/azure/network?view=azure-cli-latest) for Azure Networks
> 1. Separate [Extension firewall](/cli/azure/ext/azure-firewall/?view=azure-cli-latest)
> 1. Separate [Extension express-route](/cli/azure/ext/express-route/?view=azure-cli-latest)
> 1. Separate [Extension express-route-cross-connection](/cli/azure/ext/express-route-cross-connection/?view=azure-cli-latest)
> 1. Separate [Extension virtual-network-tap](/cli/azure/ext/virtual-network-tap/network?view=azure-cli-latest)
> 1. Separate [Extension virtual-wan](/cli/azure/ext/virtual-wan/network?view=azure-cli-latest)
> ... and whatever other network command groups we have
>

# Azure CLI for Azure Networking

Use Azure CLI to manage Azure networks with the `network` reference set.

## Reference set

| Reference | Use |
|-|-|
| [az network application-gateway](#az-network-application-gateway) | Manage application-level routing and load balancing services..
| [az network asg](#az-network-asg) | Manage application security groups (ASGs).
| [az network bastion](#az-network-bastion) | Manage Azure bastion host.
| [az network cross-connection](#az-network-cross-connection) | Manage Azure Network resources.
| [az network dns](#az-network-dns) | Manage DNS domains in Azure.
| [az network express-route](#az-network-express-route) | Manage Azure IoT hubs.
| [az network firewall](#az-network-firewall) | Manage and configure Azure Firewalls.
| [az network front-door](#az-network-front-door) | Manage networking Front Door resources
| [az network ib](reference-network-ib) | Manage and configure load balancers.
| [az network list-service-aliases]() |List available service aliases in the region which can be used for Service Endpoint Policies..
| [az network list-service-tags]() | List all service tags which are below to different resources.
| [az network list-usages]() | List the number of network resources in a region that are used against a subscription quota.
| [az network local-gateway]() | Manage local gateways..
| [az network nat]() | Manage NAT resources.
| [az network nic]() | Manage network interfaces.
| [az network nsg]() | Manage Azure Network Security Groups (NSGs)..
| [az network private-dns]() | Manage Private DNS links.
| [az network private-endpoint]() | Manage private endpoints.
| [az network private-link-resource]() | Manage private link resources.
| [az network private-link-service]() | Manage private link services.
| [az network profile]() | Manage network profiles.
| [az network public-ip]() | Manage public IP addresses.
| [az network route-filter]() | Manage route filters.
| [az network security-partner-provider]() | Manage Azure security partner provider.
| [az network route-table]() | Manage route tables.
| [az network service-endpoint]() | Manage policies related to service endpoints.
| [az network traffic-manager]() | Manage the routing of incoming traffic.
| [az network vnet]() | Manage Azure Virtual Networks.
| [az network vnet-gateway]() | Use an Azure Virtual Network Gateway to establish secure, cross-premises connectivity..
| [az network vpn-connection]() | Manage VPN connections.
| [az network vrouter]() | Manage the virtual router.
| [az network watcher]() | Manage the Azure Network Watcher.

***more az network root commands will be listed in alphabetical order above***

## Full reference list

There are three types of Azure CLI references:

1. Core references have been published as a permanent part of the Azure CLI.  
2. Extension references haven't shipped as part of the CLI but run as CLI commands. With extensions, you gain access to experimental and pre-release commands.
3. Extension preview references ... `need more information here`

Prerequisites for extension and extension preview commands are provided on each code sample page.  

## az network application-gateway

| Core Command | Use |
|-|-|
| [az network application-gateway](/cli/azure/network/application-gateway?view=azure-cli-latest) | All commands to manage Azure Application Gateway
| [az network application-gateway address-pool](/cli/azure/network/application-gateway/address-pool?view=azure-cli-latest) | Manage address pools of an application gateway.
| [az network application-gateway address-pool create](/cli/azure/network/application-gateway/address-pool?view=azure-cli-latest#az-network-application-gateway-address-pool-create) | Create an address pool.
| [az network application-gateway address-pool delete]() | Delete an address pool.
| [az network application-gateway address-pool list]() | List address pools.
| [az network application-gateway address-pool show]() | Get the details of an address pool.
| [az network application-gateway address-pool update]() | Update an address pool.
| [az network application-gateway auth-cert]() | Manage authorization certificates of an application gateway.
| [az network application-gateway auth-cert create]() | Create an authorization certificate.
| [az network application-gateway auth-cert delete]() | Delete an authorization certificate.
| [az network application-gateway auth-cert list]() | List authorization certificates.
| [az network application-gateway auth-cert show]() | Show an authorization certificate.
| [az network application-gateway auth-cert update]() | Update an authorization certificate.
| [az network application-gateway create]() | Create an application gateway.
| [az network application-gateway delete]() | Delete an application gateway.
| [az network application-gateway frontend-ip]() | Manage frontend IP addresses of an application gateway.
| [az network application-gateway frontend-ip create]() | Create a frontend IP address.
| [az network application-gateway frontend-ip delete]() | Delete a frontend IP address.
| [az network application-gateway frontend-ip list]() | List frontend IP addresses.

***The rest of the `az network application-gateway` commands would be listed here**

## az network asg

## az network bastion

## az network dns

## az network express-route

| Core Command | Use |
|-|-|-|
| [az network express-route](prototype-azure-cli-reference-network-express-route) | All commands to manage Azure ExpressRoute
| [az network express-route auth]() | Manage authentication of an ExpressRoute circuit.
| [az network express-route auth create]() | Create a new link authorization for an ExpressRoute circuit.
| [az network express-route auth delete]() | Delete a link authorization of an ExpressRoute circuit.
| [az network express-route auth list]() | List link authorizations of an ExpressRoute circuit.
| [az network express-route auth show]() | Get the details of a link authorization of an ExpressRoute circuit.
| [az network express-route create](prototype-azure-cli-reference-network-express-route#az-network-express-route-create) | Create an ExpressRoute circuit.
| [az network express-route delete]() | Delete an ExpressRoute circuit.
| [az network express-route gateway]() | Manage ExpressRoute gateways with new extension commands.
| [az network express-route gateway connection]() | Manage ExpressRoute gateway connections.
| [az network express-route gateway connection create]() | Create an ExpressRoute gateway connection.
| [az network express-route gateway connection delete]() | Delete an ExpressRoute gateway connection.
| [az network express-route gateway connection list]() | List ExpressRoute gateway connections.

## az network firewall

| Command | Use |
|-|-|-|
| [az network firewall](prototype-azure-cli-reference-network-firewall) | All commands to manage and configure Azure Firewall.
| [az network firewall application-rule]() | Manage and configure Azure Firewall application rules.
| [az network firewall application-rule collection]() | Manage and configure Azure Firewall application rule collections.
| [az network firewall application-rule collection delete]() | Delete an Azure Firewall application rule collection.
| [az network firewall application-rule collection list]() | List Azure Firewall application rule collections.
| [az network firewall application-rule collection show]() | Get the details of an Azure Firewall application rule collection.
| [az network firewall application-rule create]() | Create an Azure Firewall application rule.
| [az network firewall application-rule delete]() | Delete an Azure Firewall application rule.

***The rest of the `az network firewall` commands would be listed here**

## az network front-door

| Command | Extension | Description |
|-|-|-|
| [az network front-door](prototype-azure-cli-reference-network-front-door) | All commands to manage Azure Front Door.
| [az network front-door backend-pool]() | Manage Front Door backend pools.
| [az network front-door backend-pool backend]() | Manage backends of Front Door backend pools.
| [az network front-door backend-pool backend add]() | Add a backend to a Front Door backend pool.
| [az network front-door backend-pool backend list]() | List backends of a Front Door backend pool.
| [az network front-door backend-pool backend remove]() | Remove a backend from a Front Door backend pool.
| [az network front-door backend-pool create]() | Create a Front Door backend pool.
| [az network front-door backend-pool deleten]() | Delete a Front Door backend pool.
| [az network front-door backend-pool list]() | List Front Door backend pools.
| [az network front-door backend-pool show]() | Get the details of a Front Door backend pool.

***The rest of the `az network front-door` commands would be listed here**

## az network ib

## az network list-service-aliases

## az network list-service-tags

## az network list-usages

## az network local-gateway

## az network nat

## az network nic

## az network nsg

## az network private-dns

## az network private-endpoint

## az network private-link-resource

## az network private-link-service

## az network profile

## az network public-ip

## az network route-filter

## az network security-partner-provider

## az network route-table

## az network service-endpoint

## az network traffic-manager

## az network vnet

## az network vnet-gateway

## az network vpn-connection

## az network vrouter

## az network watcher

## Install the extension reference

For extension references, you need to install the extension before running the command. Use the name of the reference set in your `--name` parameter.  

```azurecli
az extension add --name network
```

To learn more about extensions, see [Use extensions with Azure CLI](/cli/azure/azure-cli-extensions-overview).

Review the extension [wiki tips](https://github.com/Azure/azure-network-cli-extension/wiki/Tips) to maximize usage.
