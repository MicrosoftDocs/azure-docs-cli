---
title: Azure CLI references for Azure Network | Microsoft Docs
description: Find Azure CLI core and extension reference commands to manage Azure Network. Effectively manage the networking services and capabilities in Azure from a command line. 
manager: jasongroce
author: dbradish-microsoft
ms.author: dbradish
ms.topic: reference
ms.date: 06/19/2023
ms.service: azure-cli
ms.tool: azure-cli
ms.reviewer: mohnader
ms.custom: devx-track-azurecli, seo-azure-cli
keywords: azure cli references, azure network
---

# Azure CLI reference commands for Azure Network

The Azure Command-Line Interface ([CLI](./what-is-azure-cli.md)) is a set of commands used to create and manage Azure resources. It's available across many Azure services and gives you the ability to manage networking services from a command-line.

The Azure CLI commands for [Azure Network](/azure/networking/) are composed of two parts: **core** and **extension**. Core Azure CLI commands ship as part of the CLI and are fully supported. An extension gives you access to experimental and pre-release commands, and is automatically installed the first time you run an extension reference. For more information about extension references, see [Use extensions with Azure CLI](./azure-cli-extensions-overview.md).

See [az network](../latest/docs-ref-autogen/network.yml) for an alphabetic list of the Azure CLI core and extension references available for the Azure Network service. For references for each subgroup, see the tables in the following sections:

- [Virtual network](#virtual-network-references)
- [WAN and On-premise connectivity](#wan-and-on-premise-connectivity-references)
- [Load balancing and IP](#load-balancing-and-ip-references)
- [Security](#security-references)
- [Monitoring](#monitoring-references)
- [List](#list-references)

> [!NOTE]
> You're prompted to install an extension reference on first use. Or, you can use the `az extension add` command to manually install an extension.

## Virtual network references 

| Subgroup | Reference | Use | Is extension
|-|-|-|-|
| Appliance | [az network virtual-appliance](../latest/docs-ref-autogen/network/virtual-appliance.yml) | Manage Azure Network Virtual Appliance.
| DNS | [az network private-dns](../latest/docs-ref-autogen/network/private-dns.yml) | Manage Private DNS domains in Azure. |
| Endpoint | [az network service-endpoint](../latest/docs-ref-autogen/network/service-endpoint.yml) | Manage policies related to service endpoints. |
| NAT | [az network nat](../latest/docs-ref-autogen/network/nat.yml) | Manage network address translation resources. |
| NIC | [az network nic](../latest/docs-ref-autogen/network/nic.yml) | Manage network interfaces. |
| NIC | [az network nic vtap-config](../latest/docs-ref-autogen/network/nic/vtap-config.yml) | Manage virtual network tap configurations. | yes
| Peering | [az peering](../latest/docs-ref-autogen/peering.yml) | Manage peering. | yes
| Profile | [az network profile](../latest/docs-ref-autogen/network/profile.yml) | Manage network profiles. |
| Route | [az network route-filter](../latest/docs-ref-autogen/network/route-filter.yml) | Manage route filters. |
| Route | [az network routeserver](../latest/docs-ref-autogen/network/routeserver.yml) | Manage route servers. |
| Route | [az network route-table](../latest/docs-ref-autogen/network/route-table.yml) | Manage route tables. |
| VMware | [az network vmware](../latest/docs-ref-autogen/vmware.yml) | Commands to manage Azure VMware Solutions. | yes
| vNet | [az network vnet](../latest/docs-ref-autogen/network/vnet.yml) | Manage Azure Virtual Networks. |
| vNet | [az network vnet-tap](../latest/docs-ref-autogen/network/vnet/tap.yml) | Manage virtual network taps. | yes
| vNet | [az network vnet-gateway](../latest/docs-ref-autogen/network/vnet-gateway.yml) | Use an Azure Virtual Network Gateway to establish secure, cross-premises connectivity. |

## WAN and On-premise connectivity references

| Subgroup | Reference | Use | Is extension
|-|-|-|-|
| Cross connection | [az network cross-connection](../latest/docs-ref-autogen/network/cross-connection.yml) | Manage Azure Network resources. | yes
| ExpressRoute | [az network express-route](../latest/docs-ref-autogen/network/express-route.yml) | Manage dedicated private network fiber connections to Azure. |
| vHub | [az network vhub](../latest/docs-ref-autogen/network/vhub.yml) | Manage virtual hubs. | yes
| VPN | [az network p2s-vpn-gateway](../latest/docs-ref-autogen/network/p2s-vpn-gateway.yml) | Manage point-to-site VPN gateways. | yes
| VPN | [az network vpn-connection](../latest/docs-ref-autogen/network/vpn-connection.yml) | Manage VPN connections. |
| VPN | [az network vpn-gateway](../latest/docs-ref-autogen/network/vpn-gateway.yml) | Manage VPN gateways. | yes
| VPN | [az network vpn-server-config](../latest/docs-ref-autogen/network/vpn-server-config.yml) | Manage  VPN server configurations. | yes
| VPN | [az network vpn-site](../latest/docs-ref-autogen/network/vpn-site.yml) | Manage VPN site configurations. | yes
| vWAN | [az network vwan](../latest/docs-ref-autogen/network/vwan.yml) | Manage virtual WANs. | yes

## Load balancing and IP references

| Subgroup | Reference | Use | Is extension
|-|-|-|-|
| Application gateway | [az network application-gateway](../latest/docs-ref-autogen/network/application-gateway.yml) | Manage application-level routing and load-balancing services. |
| Front Door | [az network front-door](../latest/docs-ref-autogen/network/front-door.yml) | Manage networking Front Door resources. | yes
| IP | [az network ip-group](../latest/docs-ref-autogen/network/ip-group.yml) | Manage IpGroups. | yes
| IP | [az network public-ip](../latest/docs-ref-autogen/network/public-ip.yml) | Manage public IP addresses. |
| Load balance | [az network cross-region-lb](../latest/docs-ref-autogen/network/cross-region-lb.yml) | Manage and configure cross-region load balancers. |
| Load balance | [az network lb](../latest/docs-ref-autogen/network/lb.yml) | Manage and configure load balancers. |
| Local gateway | [az network local-gateway](../latest/docs-ref-autogen/network/local-gateway.yml) | Manage local gateways. |
| Traffic manager | [az network traffic-manager](../latest/docs-ref-autogen/network/traffic-manager.yml) | Manage the routing of incoming traffic. |

## Security references

| Subgroup | Reference | Use | Is extension
|-|-|-|-|
| ASG | [az asg](../latest/docs-ref-autogen/network/asg.yml) | Manage application security groups. |
| Bastion | [az network bastion](../latest/docs-ref-autogen/network/bastion.yml) | Manage Azure Bastion hosts. |
| DDoS | [az network ddos-protection](../latest/docs-ref-autogen/network/ddos-protection.yml) | Manage DDoS Protection Plans. |
| Firewall | [az network firewall](../latest/docs-ref-autogen/network/firewall.yml) | Manage and configure Azure Firewalls. | yes
| Firewall | [az network security-partner-provider](../latest/docs-ref-autogen/network/security-partner-provider.yml) | Manage Azure security partner providers. |
| NSG | [az network nsg](../latest/docs-ref-autogen/network/nsg.yml)| Manage Azure Network Security Groups. |
| Private endpoint | [az network private-endpoint](../latest/docs-ref-autogen/network/private-endpoint.yml) | Manage private endpoints. |
| Private endpoint | [az network private-endpoint-connection](../latest/docs-ref-autogen/network/private-endpoint-connection.yml) | Manage private endpoint connections. |
| Private link | [az network private-link-resource](../latest/docs-ref-autogen/network/private-link-resource.yml) | Manage private link resources. |
| Private link | [az network private-link-service](../latest/docs-ref-autogen/network/private-link-service.yml) | Manage private link services. |

## Monitoring references

| Subgroup | Reference | Use | Is extension
|-|-|-|-|
| Watcher | [az network watcher](../latest/docs-ref-autogen/network/watcher.yml) | Manage the Azure Network Watcher. |

## List references

| Subgroup | Reference | Use | Is extension
|-|-|-|-|
| Service | [az network list-service-aliases](/cli/azure/network#az_network_list_service_aliases) | List available service aliases in the region that can be used for Service Endpoint Policies. |
| Service | [az network list-service-tags](/cli/azure/network#az_network_list_service_tags) | List all service tags that belong to different resources. |
| Usage | [az network list-usages](/cli/azure/network#az_network_list_usages) | List the number of network resources in a region that are used against a subscription quota. |

## Popular Azure Network articles using the Azure CLI

- [Create virtual machines](./azure-cli-vm-tutorial.yml)
- [Create a virtual network](/azure/virtual-network/quick-create-cli)
- [Azure CLI Samples for Windows virtual machines](/azure/virtual-machines/windows/cli-samples?toc=%2Fcli%2Fazure%2Ftoc.json&bc=%2Fcli%2Fazure%2Fbreadcrumb%2Ftoc.json)
- [Create a virtual machine scale set](/azure/virtual-machine-scale-sets/quick-create-cli)
- [Run Azure IoT Edge on Ubuntu Virtual Machines](/azure/iot-edge/how-to-install-iot-edge-ubuntuvm#deploy-from-azure-cli)
- [Load balance Linux virtual machines in Azure](/azure/virtual-machines/linux/tutorial-load-balancer)
- [Create and manage Azure virtual networks for Linux VMs](/azure/virtual-machines/linux/tutorial-virtual-network)
- [Configure a service endpoint for Cosmos DB](/azure/cosmos-db/how-to-configure-vnet-service-endpoint#configure-using-cli)

## See also

* Manage Linux or Windows virtual machines with [az vm](../latest/docs-ref-autogen/vm.yml).
* Discover additional [reference commands](../latest/docs-ref-autogen/reference-index.yml) and [available extensions](./azure-cli-extensions-list.md) in the Azure CLI documentation.
* [Learn to use Bash with the Azure CLI](./azure-cli-learn-bash.md)
