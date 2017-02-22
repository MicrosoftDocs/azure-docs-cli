## Manage multiple Azure Subscriptions

If you are brand new to Azure, you most probably only have a single subscription. But if you have been using Azure for a while, you might have created multiple Azure subscriptions to manage different projects etc. If so, you can configure Azure CLI 2.0 to execute commands against a particular subscription by running the `az account list` command to get a list of all subscriptions in your account and setting the default.

```azurecli
az account list --output table
```

```Output
Name                                         CloudName    SubscriptionId                        State     IsDefault
-------------------------------------------  -----------  ------------------------------------  --------  -----------
My Producton Subscription                    AzureCloud   1c638cf4-608f-4ee6-b680-c329e824c3a8  Enabled
My DevTest Subscription                      AzureCloud   b6aa872b-f6a7-4cdc-bbc6-0fce6a8b9910  Enabled   True
My Demos                                     AzureCloud   ff696af2-840a-43d1-af03-8f78cdfb5185  Enabled
```

The IsDefault property in the preceding table indicates the default subscription that Azure CLI is set to run against.

To select a different subscription as the default, use the `az account set` command. 

```azurecli
az account set --subscription "My Demos"
```

You can verify the change by running the `az account list --output table` command again.

Once you set your default subscription, all subsequent Azure CLI commands run against this subscription.
