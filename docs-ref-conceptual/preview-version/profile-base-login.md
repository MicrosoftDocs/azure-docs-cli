---
title: Manage sign-in profiles in Azure CLI (Private preview)
description: Learn how to use named profiles in Azure CLI to save sign-in context, switch between accounts and subscriptions, and run individual commands against a specific profile.
ms.topic: conceptual
---

# Manage sign-in profiles in Azure CLI (Private preview)

A _profile_ is a named sign-in context that Azure CLI saves when you authenticate. Each profile remembers the tenant, subscription, cloud, and sign-in information needed to connect to Azure. Profiles let you switch between accounts, tenants, and subscriptions without signing in each time.

Profiles are useful when you regularly work across multiple contexts, such as personal and corporate subscriptions or separate development and production environments.

## When to use profiles

Profiles are useful when you:

- Work across multiple Azure tenants or subscriptions.
- Separate development and production environments.
- Use both personal and work accounts.
- Occasionally run commands against a different subscription without changing your default context.

## What a profile stores

When you sign in and save a profile, Azure CLI records the connection context for that profile,
including:

- The profile name
- The Azure tenant (directory)
- The Azure subscription
- The cloud environment
- The sign-in identity (the signed-in user, when available)
- The authentication method used to sign in

Profiles are stored locally on your machine. Switching profiles changes which of these saved
contexts Azure CLI uses for subsequent commands.

## Sign in and save a profile

Use `az login` with the `--out-profile` option to sign in and save the result as a named profile.
Specify the tenant and subscription you want the profile to use:

```bash
az login --tenant-id <tenant-id> --subscription-id <subscription-id> --out-profile personal
```

To create a second profile for a different account, tenant, or subscription, sign in again with a
different profile name:

```bash
az login --tenant-id <tenant-id> --subscription-id <subscription-id> --out-profile corp
```

The profile that you sign in to most recently becomes the active profile.

> [!NOTE]
> If you run `az login` without `--out-profile`, Azure CLI saves the sign-in context as the reserved `default` profile (overwriting any existing `default` profile) and sets it as active.
> To keep a reusable, named context, always pass `--out-profile`.

### Profile naming rules

A profile name must:

- Be 1–100 characters long.
- Contain only letters, digits, hyphens (`-`), underscores (`_`), or periods (`.`).

The name `default` is reserved for sign-in without a named profile and can't be used as a profile name.

## List profiles

To see all saved profiles, use `az profile list`:

```bash
az profile list
```

## View a profile

To view the details of a specific profile, use `az profile show` with the profile name:

```bash
az profile show personal
```

To view the currently active profile, omit the profile name or use `--active` option:

```bash
az profile show
az profile show --active
```

## Switch the active profile

Use `az profile set` to change which profile is active. After you switch, commands that don't
specify a profile use the newly activated profile:

```bash
az profile set --name personal
az group list
```

## Run a single command against a specific profile

To run one command against a profile without changing the active profile, use the `--profile`
option. This is useful when you mostly work in one profile but occasionally need another:

```bash
az group list --profile corp
```

The active profile is unchanged, so subsequent commands continue to use it.

## Re-authenticate an existing profile

If a profile's sign-in has expired, sign in again and pass the existing profile name to `--profile`
to refresh it in place:

```bash
az login --profile personal
```

The `--profile` and `--out-profile` options are mutually exclusive: use `--out-profile` to create or
overwrite a profile, and `--profile` to re-authenticate an existing one.

## Remove a profile

To delete a profile you no longer need, use `az profile remove`:

```bash
az profile remove --name corp
```

If you remove the active profile, no profile is active until you set one with `az profile set`.

## Display the active profile in your prompt

To keep track of which profile is active, you can display the active profile name in your shell
prompt. Azure CLI writes the active profile name to an `active-profile` file in its local data
directory.

### Bash

Add the following to your `~/.bashrc` to append the active profile to your prompt:

```bash
azclips_profile() {
  local f="${XDG_DATA_HOME:-$HOME/.local/share}/.azclips/active-profile"
  [ -f "$f" ] && printf '@%s' "$(cat "$f")"
}
PS1='\u@\h \w $(azclips_profile)\$ '
```

### Zsh with Starship

If you use [Starship](https://starship.rs/), add a custom module to your
`~/.config/starship.toml`:

```toml
[custom.profile]
command = 'cat "${XDG_DATA_HOME:-$HOME/.local/share}/.azclips/active-profile"'
symbol = '@'
when = 'test -f "${XDG_DATA_HOME:-$HOME/.local/share}/.azclips/active-profile"'
description = 'Name of the active Azure CLI profile'
```

> [!NOTE]
> Azure CLI stores the active profile pointer at `{LocalApplicationData}/.azclips/active-profile`.
> On Linux, `{LocalApplicationData}` is typically `${XDG_DATA_HOME:-$HOME/.local/share}`.

## Next steps

- To learn the core concepts and current limitations of the preview, see
  [Get started with Azure CLI][01].
- If you run into problems, see [Troubleshoot Azure CLI issues][02].

<!-- link references -->

[01]: ./getting-started.md
[02]: ./troubleshooting.md
