---
ms.date: 01/09/2024
ms.topic: include
ms.custom: devx-track-azurecli
---

When you sign in with a user account, Azure CLI generates and stores an authentication refresh token. Because access tokens are valid for only a short period of time, a refresh token is issued at the same time the access token is issued. The client application can then exchange this refresh token for a new access token when needed. For more information on token lifetime and expiration, see [Refresh tokens in the Microsoft identity platform](/azure/active-directory/develop/refresh-tokens).

Use the [az account get-access-token](/cli/azure/account#az-account-get-access-token) command to retrieve the access token: 

```azurecli
# get access token for the active subscription
az account get-access-token

# get access token for a specific subscription
az account get-access-token --subscription "<subscription ID or name>"
```

Here is some additional information about access token expiration dates:

* Expiration dates are updated in a format that is supported by [MSAL-based Azure CLI](../msal-based-azure-cli.md).
* Starting from Azure CLI 2.54.0, `az account get-access-token` returns the `expires_on` property alongside the `expiresOn` property for the token expiration time.
* The `expires_on` property represents a Portable Operating System Interface (POSIX) timestamp while the `expiresOn` property represents a local datetime.
* The `expiresOn` property doesn't express "fold" when Daylight Saving Time ends. This can cause problems in countries or regions where Daylight Saving Time is adopted. For more information on "fold", see [PEP 495 – Local Time Disambiguation](https://peps.python.org/pep-0495/).
* We recommend for downstream applications to use the `expires_on` property, because it uses the Universal Time Code (UTC). 

Example output:

```json
{
  "accessToken": "...",
  "expiresOn": "2023-10-31 21:59:10.000000",
  "expires_on": 1698760750,
  "subscription": "...",
  "tenant": "...",
  "tokenType": "Bearer"
}
```
