---
title: Microsoft Graph migration | Microsoft Docs
description: Learn about the Microsoft Graph migration of Azure CLI.
author: jiasli
ms.author: jiasli
ms.date: 08/1/2023
ms.topic: conceptual
ms.service: azure-cli
ms.custom: devx-track-azurecli, seo-azure-cli
keywords: microsoft graph, ms graph, active directory graph, ad graph, azure cli 
---

# Impact of Microsoft Graph migration in Azure CLI 

Because of [the deprecation of Azure Active Directory (Azure AD) Graph](/graph/migrate-azure-ad-graph-overview), the underlying Active Directory Graph API is replaced by [Microsoft Graph API](/graph/api/overview) in Azure CLI 2.37.0.

## Breaking changes

For differences of the underlying API and output JSON breaking changes, refer to [Property differences between Azure AD Graph and Microsoft Graph](/graph/migrate-azure-ad-graph-property-differences).

For example, the most outstanding change is that `id` replaces the `objectId` property in the output JSON of a Graph object.

Command argument and behavior breaking changes are listed in the next section.

### `az ad app create/update`

- Split `--reply-urls` into `--web-redirect-uris` and `--public-client-redirect-uris`
- Replace `--homepage` with `--web-home-page-url`
- Replace `--available-to-other-tenants` with `--sign-in-audience`
- Replace `--native-app` with `--is-fallback-public-client`
- Replace `--oauth2-allow-implicit-flow` with `--enable-access-token-issuance`
- Add `--enable-id-token-issuance` to set `web/implicitGrantSettings/enableIdTokenIssuance`
- Remove `--password` and `--credential-description`. Use `az ad app credential reset` to let Graph service create a password for you (https://github.com/Azure/azure-cli/issues/20675)
- Add `--key-display-name` to set `keyCredential`'s `displayName`

### `az ad app permission grant`

- Remove `--expires`
- `--scope` no longer defaults to `user_impersonation` and is now required

### `az ad app credential reset`

- Replace `--credential-description` with `--display-name` (https://github.com/Azure/azure-cli/issues/20561)
- Remove `--password`. Without specifying certificate arguments, Graph service creates a password for you (https://github.com/Azure/azure-cli/issues/20675)

### `az ad sp delete`

- This command no longer deletes the corresponding application. Use `az ad app delete` to explicitly delete the application (https://github.com/Azure/azure-cli/issues/8467)
- This command no longer deletes corresponding role assignments of the service principal. Use `az role assignment delete` to explicitly delete role assignments (https://github.com/Azure/azure-cli/issues/20805)

### `az ad sp credential`

- This command group now operates on service principal, not application (https://github.com/Azure/azure-cli/issues/11458)

### `az ad sp credential reset`

- Replace `--name` with `--id`
- Remove `--password`. Without specifying certificate arguments, Graph service creates a password for you (https://github.com/Azure/azure-cli/issues/20675)

### `az ad user create`

- Replace `--force-change-password-next-login` with `--force-change-password-next-sign-in`

### `az ad user update`

- Replace `--force-change-password-next-login` with `--force-change-password-next-sign-in`

### `az ad group get-member-groups`

- Remove `--additional-properties`

### `az ad group member add`

- Remove `--additional-properties`

## Known issues

- Regarding generic update arguments, the only supported operation is `--set` on the root level of a Graph object. Due to the underlying infrastructure change, the use of `--add`, `--remove` or `--set` on sublevels currently doesn't work. For unsupported scenarios, you may use `az rest` to directly call [Microsoft Graph API](/graph/api/overview). Examples can be found at https://github.com/Azure/azure-cli/issues/22580.
- Microsoft Graph related commands like `az ad` and `az role` fail in Azure Stack environments that don't have Microsoft Graph support. Use Azure CLI 2.36.0 or earlier versions for Azure Stack environments.

## Install a previous version

If you aren't ready for the migration yet, such as lacking Microsoft Graph permissions, you may keep using Azure CLI versions <= 2.36.0. If you have already installed 2.37.0, you may roll back to a previous version following the "Install specific version" section under the [installation documents](./install-azure-cli.md) (except for Homebrew, which doesn't support installing previous versions).

## Troubleshooting

### Graph command fails with `AADSTS50005` or `AADSTS53000`

Your tenant may have Conditional Access policies that block using device code flow to access Microsoft Graph. In such cases, use authorization code flow or a service principal to sign in instead. For more information about sign in methods, see [Sign in with Azure CLI](authenticate-azure-cli.md).

Microsoft tenant (72f988bf-86f1-41af-91ab-2d7cd011db47) has such Conditional Access policies configured.

## More information

You can find more information about the Microsoft Graph migration on https://github.com/Azure/azure-cli/issues/22580.

## Give feedback

If you have any questions, reply to https://github.com/Azure/azure-cli/issues/22580 or create a new issue with the [`az feedback`](/cli/azure/reference-index#az-feedback) command.
