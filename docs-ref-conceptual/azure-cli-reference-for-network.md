---
title: Azure CLI references for Azure Network
description: Azure CLI reference landing page for Azure Network
author: dbradish-microsoft
manager: barbkess
ms.topic: reference
ms.date: 04/09/2021
ms.author: dbradish
ms.service: azure-cli
ms.devlang: azurecli
ms.reviewer: mohnader
ms.custom: devx-track-azurecli
---

# Azure CLI for Azure Network

The Azure Command Line Interface ([Azure CLI](./what-is-azure-cli.md)) is a set of commands used to create and manage Azure resources. It's available across many Azure services, including Azure Network, and gives you the ability to manage networking services from a command line.

## References for Azure Network

The [Azure Network](/azure/networking/) CLI experience is composed of two parts: **core** and **extension**. Core Azure CLI commands ship as part of the CLI and are fully supported. An extension gives you access to experimental and pre-release commands, and is automatically installed the first time you run an extension reference. For more information about extension references, see [Use extensions with Azure CLI](./azure-cli-extensions-overview.md).

See [az network](/cli/azure/network) for a complete list of Azure CLI core references for Azure Network.  Follow the links below for extension references.

> [!NOTE]
> You're prompted to install an extension reference on first use. Or, you can use the `az extension add` command to manually install an extension.

### Virtual network

| Subgroup | Reference | Use | Is extension
|-|-|-|-|
| Appliance | [az network virtual-appliance](/cli/azure/network/virtual-appliance) | Manage Azure Network Virtual Appliance.
| DNS | [az network private-dns](/cli/azure/network/private-dns) | Manage Private DNS domains in Azure. |
| Endpoint | [az network service-endpoint](/cli/azure/network/service-endpoint) | Manage policies related to service endpoints. |
| NAT | [az network nat](/cli/azure/network/nat) | Manage network address translation resources. |
| NIC | [az network nic](/cli/azure/network/nic) | Manage network interfaces. |
| NIC | [az network nic vtap-config](/cli/azure/network/nic/vtap-config) | Manage virtual network tap configurations. | yes
| Peering | [az peering](/cli/azure/peering) | Manage peering. | yes
| Profile | [az network profile](/cli/azure/network/profile) | Manage network profiles. |
| Route | [az network route-filter](/cli/azure/network/route-filter) | Manage route filters. |
| Route | [az network routeserver](/cli/azure/network/routeserver) | Manage route servers. |
| Route | [az network route-table](/cli/azure/network/route-table) | Manage route tables. |
| VMware | [az network vmware](/cli/azure/vmware) | Commands to manage Azure VMware Solutions. | yes
| vNet | [az network vnet](/cli/azure/network/vnet) | Manage Azure Virtual Networks. |
| vNet | [az network vnet-tap](/cli/azure/network/vnet/tap) | Manage virtual network taps. | yes
| vNet | [az network vnet-gateway](/cli/azure/network/vnet-gateway) | Use an Azure Virtual Network Gateway to establish secure, cross-premises connectivity. |

### WAN and On-premise connectivity

| Subgroup | Reference | Use | Is extension
|-|-|-|-|
| Cross connection | [az network cross-connection](/cli/azure/network/cross-connection) | Manage Azure Network resources. | yes
| ExpressRoute | [az network express-route](/cli/azure/network/express-route) | Manage dedicated private network fiber connections to Azure. |
| vHub | [az network vhub](/cli/azure/network/vhub) | Manage virtual hubs. | yes
| VPN | [az network p2s-vpn-gateway](/cli/azure/network/p2s-vpn-gateway) | Manage point-to-site VPN gateways. | yes
| VPN | [az network vpn-connection](/cli/azure/network/vpn-connection) | Manage VPN connections. |
| VPN | [az network vpn-gateway](/cli/azure/network/vpn-gateway) | Manage VPN gateways. | yes
| VPN | [az network vpn-server-config](/cli/azure/network/vpn-server-config) | Manage  VPN server configurations. | yes
| VPN | [az network vpn-site](/cli/azure/network/vpn-site) | Manage VPN site configurations. | yes
| vRouter | [az network vrouter](/cli/azure/network/vrouter) | Manage virtual routers. |
| vWAN | [az network vwan](/cli/azure/network/vwan) | Manage virtual WANs. | yes

### Load balancing and IP

| Subgroup | Reference | Use | Is extension
|-|-|-|-|
| Application gateway | [az network application-gateway](/cli/azure/network/application-gateway) | Manage application-level routing and load-balancing services. |
| Front Door | [az network front-door](/cli/azure/network/front-door) | Manage networking Front Door resources. | yes
| IP | [az network ip-group](/cli/azure/network/ip-group) | Manage IpGroups. | yes
| IP | [az network public-ip](/cli/azure/network/public-ip) | Manage public IP addresses. |
| Load balance | [az network cross-region-lb](/cli/azure/network/cross-region-lb) | Manage and configure cross-region load balancers. |
| Load balance | [az network lb](/cli/azure/network/lb) | Manage and configure load balancers. |
| Local gateway | [az network local-gateway](/cli/azure/network/local-gateway) | Manage local gateways. |
| Traffic manager | [az network traffic-manager](/cli/azure/network/traffic-manager) | Manage the routing of incoming traffic. |

### Security

| Subgroup | Reference | Use | Is extension
|-|-|-|-|
| ASG | [az asg](/cli/azure/network/asg) | Manage application security groups. |
| Bastion | [az network bastion](/cli/azure/network/bastion) | Manage Azure bastion hosts. |
| DDoS | [az network ddos-protection](/cli/azure/network/ddos-protection) | Manage DDoS Protection Plans. |
| Firewall | [az network firewall](/cli/azure/network/firewall) | Manage and configure Azure Firewalls. | yes
| Firewall | [az network security-partner-provider](/cli/azure/network/security-partner-provider) | Manage Azure security partner providers. |
| NSG | [az network nsg](/cli/azure/network/nsg)| Manage Azure Network Security Groups. |
| Private endpoint | [az network private-endpoint](/cli/azure/network/private-endpoint) | Manage private endpoints. |
| Private endpoint | [az network private-endpoint-connection](/cli/azure/network/private-endpoint-connection) | Manage private endpoint connections. |
| Private link | [az network private-link-resource](/cli/azure/network/private-link-resource) | Manage private link resources. |
| Private link | [az network private-link-service](/cli/azure/network/private-link-service) | Manage private link services. |

### Monitoring

| Subgroup | Reference | Use | Is extension
|-|-|-|-|
| Watcher | [az network watcher](/cli/azure/network/watcher) | Manage the Azure Network Watcher. |

### List

| Subgroup | Reference | Use | Is extension
|-|-|-|-|
| Service | [az network list-service-aliases](/cli/azure/network#az_network_list_service_aliases) | List available service aliases in the region that can be used for Service Endpoint Policies. |
| Service | [az network list-service-tags](/cli/azure/network#az_network_list_service_tags) | List all service tags that belong to different resources. |
| Usage | [az network list-usages](/cli/azure/network#az_network_list_usages) | List the number of network resources in a region that are used against a subscription quota. |

## Popular network articles using the Azure CLI

- [Create virtual machines](/cli/azure/azure-cli-vm-tutorial)
- [Create a virtual network](/azure/virtual-network/quick-create-cli)
- [Azure CLI Samples for Windows virtual machines](/azure/virtual-machines/windows/cli-samples?toc=%2Fcli%2Fazure%2Ftoc.json&bc=%2Fcli%2Fazure%2Fbreadcrumb%2Ftoc.json)
- [Create a virtual machine scale set](/azure/virtual-machine-scale-sets/quick-create-cli)
- [Run Azure IoT Edge on Ubuntu Virtual Machines](/azure/iot-edge/how-to-install-iot-edge-ubuntuvm#deploy-from-azure-cli)
- [Load balance Linux virtual machines in Azure](/azure/virtual-machines/linux/tutorial-load-balancer)
- [Create and manage Azure virtual networks for Linux VMs](/azure/virtual-machines/linux/tutorial-virtual-network)
- [Configure a service endpoint for Cosmos DB](/azure/cosmos-db/how-to-configure-vnet-service-endpoint#configure-using-cli)

## See also

- [Get started with Azure CLI](./get-started-with-azure-cli.md) to learn about installation and sign in.

- Discover additional [core](/cli/azure/reference-index) and [extension](./azure-cli-extensions-list.md) references in the Azure CLI documentation.

- Manage Linux or Windows virtual machines with [az vm](/cli/azure/vm).