---
title: Azure CLI references for Azure Network
description: Azure CLI reference landing page for Azure Network
author: dbradish-microsoft
manager: barbkess
ms.devlang: azurecli
ms.topic: reference
ms.date: 06/30/2020
ms.author: dbradish
ms.service: azure-cli
ms.devlang: azurecli
ms.reviewer:
---

# Azure CLI for Azure Network

The Azure Command Line Interface ([Azure CLI](/cli/azure/what-is-azure-cli)) is a set of commands used to create and manage Azure resources.  It is available across many Azure services including Azure Network.  There are over 100 references for Azure Network giving you the ability to work effectively with Network services from a command line.

## References for Azure Network

The [Azure Network](/azure/azure-Network/) CLI experience is composed of two parts: Azure CLI (commonly referred to as CLI **core**) and the Azure Network CLI **extension**.  Azure CLI extension references must be installed prior to use. The [az extension add](/cli/azure/extension?view=azure-cli-latest#az-extension-add) command installs an extension reference by name.

| Azure Service | Reference | Use | Is extension
|-|-|-|-|
| Azure Network | [az network](/cli/azure/network) | All Azure Network reference
| Application Gateway | [az network application-gateway](/cli/azure/network/application-gateway) | Manage application-level routing and load balancing services. |
| Network security | [az asg](/cli/azure/network/asg) | Manage application security groups (ASGs). |
| Virtual machines | [az network bastion](/cli/azure/network/bastion) | Manage Azure bastion host. |
| ExpressRoute | [az network cross-connection](/cli/azure/ext/express-route-cross-connection/network/cross-connection) | Manage Azure Network resources. | yes
| Networking | [az network dns](/cli/azure/ext/privatedns/network/private-dns) | Manage Domain Name System (DNS) in Azure. | yes
| ExpressRoute | [az network express-route](/cli/azure/network/express-route) | Manage Azure IoT hubs. |
| Firewall | [az network firewall](/cli/azure/network/firewall) | Manage and configure Azure Firewalls. |
| Front Door | [az network front-door](/cli/azure/ext/frontdoor/network/front-door) | Manage networking Front Door resources. | yes
| Networking | [az network ib](/cli/azure/network/reference-network-ib) | Manage and configure load balancers. |
| Virtual network | [az network list-service-aliases](/cli/azure/network/list-service-aliases) | List available service aliases in the region which can be used for Service Endpoint Policies. |
| Virtual network | [az network list-service-tags](/cli/azure/nsecurity-partner-provideretwork/list-service-tags) | List all service tags which are below to different resources. |
| Virtual network | [az network list-usages](/cli/azure/network/list-usages) | List the number of network resources in a region that are used against a subscription quota. |
| On-premises data gateways | [az network local-gateway](/cli/azure/network/local-gateway) | Manage local gateways. |
| Hyper-V | [az network nat](/cli/azure/network/nat) | Manage network address translation (NAT) resources. |
| Networking | [az network nic](/cli/azure/network/nic) | Manage network interfaces. |
| Networking | [az network nsg](/cli/azure/network/nsg)| Manage Azure Network Security Groups (NSG). |
| Domain Name System | [az network private-dns](/cli/azure/network/private-dns) | Manage Private DNS links. |
| Private link | [az network private-endpoint](/cli/azure/network/private-endpoint) | Manage private endpoints. |
| Private link | [az network private-link-resource](/cli/azure/network/private-link-resource) | Manage private link resources. |
| Private link | [az network private-link-service](/cli/azure/network/private-link-service) | Manage private link services. |
| Virtual network | [az network profile](/cli/azure/network/profile) | Manage network profiles. |
| Networking | [az network public-ip](/cli/azure/network/public-ip) | Manage public IP addresses. |
| ExpressRoute | [az network route-filter](/cli/azure/network/route-filter) | Manage route filters. |
| Firewall manager | [az network security-partner-provider](/cli/azure/network/security-partner-provider) | Manage Azure security partner provider. |
| ExpressRoute | [az network route-table](/cli/azure/network/route-table) | Manage route tables. |
| Virtual network | [az network service-endpoint](/cli/azure/network/service-endpoint) | Manage policies related to service endpoints. |
| Traffic manager | [az network traffic-manager](/cli/azure/network/traffic-manager) | Manage the routing of incoming traffic. |
| Virtual network | [az network vhub](/cli/azure/ext/virtual-wan/network/vhub) | Manage virtual hubs. | yes
| Virtual network | [az network vm-repair](/cli/azure/ext/vm-repair/vm) | Manage Linux or Windows virtual machines. | yes
| Virtual network | [az network vmware](/cli/azure/ext/vmware/vmware) | Commands to manage Azure VMware Solutions. | yes
| Virtual network | [az network vnet](/cli/azure/network/vnet) | Manage Azure Virtual Networks. |
| Virtual network | [az network vnet-tap](/cli/azure/ext/virtual-network-tap/network/vnet/tap) | Manage virtual network taps. | yes
| Virtual network | [az network vnet-gateway](/cli/azure/network/vnet-gateway) | Use an Azure Virtual Network Gateway to establish secure, cross-premises connectivity. |
| Virtual network | [az network vpn-connection](/cli/azure/network/vpn-connection) | Manage VPN connections. |
| Virtual network | [az network vpn-gateway](/cli/azure/ext/virtual-wan/network/vpn-gateway) | Manage VPN gateways. | yes
| Virtual network | [az network vpn-site](/cli/azure/ext/virtual-wan/network/vpn-site) | Manage VPN site configurations. | yes
| Virtual network | [az network vrouter](/cli/azure/network/vrouter) | Manage the virtual router. |
| Virtual network | [az network vwan](/cli/azure/ext/virtual-wan/network/vwan) | Manage virtual WANs. | yes
| Virtual network | [az network watcher](/cli/azure/network/watcher) | Manage the Azure Network Watcher. |
| Virtual machine | [az image](/cli/azure/image) | Manage custom virtual machine images. |
| Virtual machine | [az snapshot](/cli/azure/snapshot) | Manage point-in-time copies of managed disks, native blobs, or other snapshots. |
| Virtual machine | [az vm](/cli/azure/vm) | Manage Linux or Windows virtual machines. |
| Virtual machine | [az vmss](/cli/azure/vmss) | Manage groupings of virtual machines in an Azure Virtual Machine Scale Set (VMSS). |

## Installing extension references

Azure CLI extension references must be installed prior to use.  The [az extension add](/cli/azure/azure-cli-extensions-overview) command installs an extension reference by name.  Learn more about extension references in [Use extensions with Azure CLI](/cli/azure/azure-cli-extensions-overview).

```azurecli
# install the extension for az network vm-repair
az extension add --name virtual-network-tap

# install the extension for az network virtual-wan
az extension add --name virtual-wan

# install the extension for az network vmware
az extension add --name vmware

# install the extension for az network express-route-cross-connection
az extension add --name express-route-cross-connection
```

## Popular Network articles using the Azure CLI

- [Create virtual machines](/cli/azure/azure-cli-vm-tutorial)
- [Create a virtual network](/azure/virtual-network/quick-create-cli)
- [Azure CLI Samples for Windows virtual machines](/azure/virtual-machines/windows/cli-samples?toc=%2Fcli%2Fazure%2Ftoc.json&bc=%2Fcli%2Fazure%2Fbreadcrumb%2Ftoc.json)
- [Create a virtual machine scale set](/azure/virtual-machine-scale-sets/quick-create-cli)
- [Run Azure IoT Edge on Ubuntu Virtual Machines](/azure/iot-edge/how-to-install-iot-edge-ubuntuvm#deploy-from-azure-cli)
- [Load balance Linux virtual machines in Azure](/azure/virtual-machines/linux/tutorial-load-balancer)
- [Create and manage Azure virtual networks for Linux VMs](/azure/virtual-machines/linux/tutorial-virtual-network)
- [Configure a service endpoint for Cosmos DB](/azure/cosmos-db/how-to-configure-vnet-service-endpoint#configure-using-cli) 

## See also

- [Get started with Azure CLI](/cli/azure/get-started-with-azure-cli) to learn about installation and sign in.

- Discover additional [released](/cli/azure/reference-index) and [extension](/cli/azure/azure-cli-extensions-list) references in the Azure CLI documentation.
