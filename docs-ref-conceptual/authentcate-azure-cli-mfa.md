---
title: The impact of multifactor authentication on Azure CLI in automation scenarios
description: Learn about the impact of mandatory multifactor authentication enforcement on Azure CLI in automation scenarios
ms.date: 02/14/2025
ms.topic: concept-article
ms.service: azure-cli
ms.custom: devx-track-azurecli
---
# The impact of multifactor authentication on Azure CLI in automation scenarios

This article explores how multifactor authentication (MFA) affects automation tasks that use
Microsoft Entra user identities and provides guidance on alternative approaches for uninterrupted
automation.

> [!IMPORTANT]
> Action is required if you're using Microsoft Entra user identities for automation.

MFA requirements prevent you from using Microsoft Entra user identities for authentication in
automation scenarios. Organizations must switch to authentication methods designed for automation,
such as managed identities or service principals, which support non-interactive automation use
cases.

## Limitations of user identities with MFA in automation

- **Interactive authentication**: MFA is triggered during interactive sign-ins when using a
  Microsoft Entra user identity. For automation scripts relying on a user identity, MFA disrupts the
  process because it requires extra verification steps. For example, authenticator app, phone call,
  etc. that you can't automate. This verification prevents automation from running unless
  authentication is handled in a non-interactive way, such as with a managed identity or service
  principal.

- **Scripted login failures**: In automation scenarios like running Azure CLI scripts
  unattended, an MFA-enabled user identity causes the script to fail when trying to authenticate.
  Since MFA requires user interaction, it's incompatible with non-interactive scripts. This means
  you must switch to a managed identity or service principal, both of which use non-interactive
  authentication.

- **Security considerations**: While MFA adds an extra layer of security, it can limit automation
  flexibility, especially in production environments where automation must run without manual
  intervention. Shifting to managed identities or service principals, which don't require MFA, is
  more practical and secure in such environments.

## Scenarios that require updates

The following list provides example scenarios where customers might use a Microsoft Entra user
identity for automation with Azure CLI. This list isn't exhaustive of all scenarios.

> [!WARNING]
> Any automation scenario that uses a Microsoft Entra user identity requires updating.

- **Personalized or specific permissions**: Automation tasks that require user-specific permissions,
  such as actions tied to an individual's role or specific Microsoft Entra ID attributes.

- **Access to resources external to Azure**: Automation scenarios that require access to Microsoft
  365 resources. For example, SharePoint, Exchange, or other cloud services tied to an individual
  user's Microsoft account.

- **User context for auditing or compliance**: Cases where the actions needed to be auditable at an
  individual user level for compliance reasons.

- **Simple configuration for small-scale or low-risk automation**: For small-scale or low-risk
  automation tasks. For example, a script that manages a few resources.

- **User-driven automation in nonproduction environments**: If the automation is intended for
  personal or nonproduction environments where an individual user is responsible for a task.

- **Automation within a user's own Azure subscription**: If a user needs to automate tasks in their
  own Azure subscription where the user already has sufficient permissions.

Switching to a managed identity or service principal is required for automation scenarios due to
mandatory MFA enforcement for Microsoft Entra user identities.

## See also

- [Planning for mandatory multifactor authentication for Azure and other admin portals](/entra/identity/authentication/concept-mandatory-multifactor-authentication).
- [How to verify that users are set up for mandatory Microsoft Entra multifactor authentication (MFA)](/entra/identity/authentication/how-to-mandatory-multifactor-authentication)
- [Deployment considerations for Microsoft Entra multifactor authentication](/entra/identity/authentication/howto-mfa-getstarted)
- [Migrate to Microsoft Entra multifactor authentication with federations](/entra/identity/authentication/how-to-migrate-mfa-server-to-mfa-with-federation)
- [How to use the MFA Server Migration Utility to migrate to Microsoft Entra multifactor authentication](/entra/identity/authentication/how-to-mfa-server-migration-utility)
