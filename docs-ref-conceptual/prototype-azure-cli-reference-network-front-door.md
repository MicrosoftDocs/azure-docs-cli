# az network front-door

Manage networking Front Door resources

The use of `az network front-door` extension commands requires Azure CLI version x.x.x or higher.  The [reference extension](prototype-azure-cli-reference-network#install-the-extension-reference) must also be installed prior to running extension commands.

# Commands

| Command | Extension | Description |
|-|-|-|
| az network front-door backend-pool | [Extension]() | Manage Front Door backend pools.
| az network front-door backend-pool backend | [Extension]() | Manage backends of Front Door backend pools.
| az network front-door backend-pool backend add | [Extension]() | Add a backend to a Front Door backend pool.
| az network front-door backend-pool backend list | [Extension]() | List backends of a Front Door backend pool.
| az network front-door backend-pool backend remove | [Extension]() | Remove a backend from a Front Door backend pool.
| az network front-door backend-pool create | [Extension](az-network-front-door-backend-pool-create) | Create a Front Door backend pool.
| az network front-door backend-pool delete | [Extension](az-network-front-door-backend-pool-delete) | Delete a Front Door backend pool.
| az network front-door backend-pool list | [Extension]() | List Front Door backend pools.
| az network front-door backend-pool show | [Extension]() | Get the details of a Front Door backend pool.

***The rest of the `az network front-door` commands would be listed here**

## az network front-door backend-pool create

Create a Front Door backend pool using extension commands

```azurecli
az network front-door backend-pool create --address
                                          --front-door-name
                                          --load-balancing
                                          --name
                                          --probe
                                          --resource-group
                                          [--backend-host-header]
                                          [--disabled {false, true}]
                                          [--http-port]
                                          [--https-port]
                                          [--priority]
                                          [--weight]
```

### Required Parameters

[same syntax as in current doc](/cli/azure/ext/front-door/network/front-door/backend-pool#ext-front-door-az-network-front-door-backend-pool-create)

### Optional Parameters

[same syntax as in current doc](/cli/azure/ext/front-door/network/front-door/backend-pool#ext-front-door-az-network-front-door-backend-pool-create)


## az network front-door backend-pool delete

[same syntax as in current doc](/cli/azure/ext/front-door/network/front-door/backend-pool#ext-front-door-az-network-front-door-backend-pool-delete)
