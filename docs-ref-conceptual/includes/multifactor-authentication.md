---
ms.date: 02/10/2025
ms.topic: include
ms.custom: devx-track-azurecli
---

Mandatory multifactor authentication (MFA) is being released in early 2025. MFA will only impact Microsoft Entra ID [users](/entra/fundamentals/how-to-create-delete-users). It will not impact [service principals](/entra/identity-platform/app-objects-and-service-principals) or [managed identities](/entra/identity/managed-identities-azure-resources/overview).

If you are using `az login` with password authentication, plan now to migrate to service principals or managed identities. Here are some helpful links to assist you in making this change:

* [Planning for mandatory multifactor authentication for Azure and other admin portals](/entra/identity/authentication/concept-mandatory-multifactor-authentication).
* [How to verify that users are set up for mandatory Microsoft Entra multifactor authentication (MFA)](/entra/identity/authentication/how-to-mandatory-multifactor-authentication)
* [Deployment considerations for Microsoft Entra multifactor authentication](/entra/identity/authentication/howto-mfa-getstarted)
* [Migrate to Microsoft Entra multifactor authentication with federations](/entra/identity/authentication/how-to-migrate-mfa-server-to-mfa-with-federation)
* [How to use the MFA Server Migration Utility to migrate to Microsoft Entra multifactor authentication](/entra/identity/authentication/how-to-mfa-server-migration-utility)
