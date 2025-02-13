---
ms.date: 02/10/2025
ms.topic: include
ms.custom: devx-track-azurecli
---

Starting in 2025, Microsoft will enforce mandatory MFA. For more background about this requirement, see our [blog post](https://aka.ms/azuremfablogpost).

MFA will only impact Microsoft Entra ID [user identities](/entra/fundamentals/how-to-create-delete-users).
It will not impact workload identities, such as [service principals](/entra/identity-platform/app-objects-and-service-principals)
and [managed identities](/entra/identity/managed-identities-azure-resources/overview).

If you are using [az login](/cli/azure/reference-index#az-login) with an Entra ID and password to authenticate a script or automated process, plan now to migrate to a workload identity. Here are some helpful links to assist you in making this change:

* [Planning for mandatory multifactor authentication for Azure and other admin portals](/entra/identity/authentication/concept-mandatory-multifactor-authentication).
* [How to verify that users are set up for mandatory Microsoft Entra multifactor authentication (MFA)](/entra/identity/authentication/how-to-mandatory-multifactor-authentication)
* [Deployment considerations for Microsoft Entra multifactor authentication](/entra/identity/authentication/howto-mfa-getstarted)
* [Migrate to Microsoft Entra multifactor authentication with federations](/entra/identity/authentication/how-to-migrate-mfa-server-to-mfa-with-federation)
* [How to use the MFA Server Migration Utility to migrate to Microsoft Entra multifactor authentication](/entra/identity/authentication/how-to-mfa-server-migration-utility)
