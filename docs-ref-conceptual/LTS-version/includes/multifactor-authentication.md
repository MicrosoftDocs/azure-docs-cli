---
ms.topic: include
ms.custom: devx-track-azurecli
---

Starting in September 2025, Microsoft will require multifactor authentication (MFA) for Azure CLI
and other command-line tools. This change applies only to Microsoft Entra ID [user identities][02]
and doesn't affect workload identities such as [service principals][03] or
[managed identities][04].

If you're using `az login` with a username and password to authenticate scripts or automated
workflows, now is the time to migrate to a workload identity. For more information, see
[The impact of multifactor authentication on Azure CLI in automation scenarios][01].

<!-- link references -->

[01]: ../authenticate-azure-cli-mfa.md
[02]: /entra/fundamentals/how-to-create-delete-users
[03]: /entra/identity-platform/app-objects-and-service-principals
[04]: /entra/identity/managed-identities-azure-resources/overview
