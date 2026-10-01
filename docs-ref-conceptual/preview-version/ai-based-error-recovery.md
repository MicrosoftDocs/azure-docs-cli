---
title: AI-based error recovery in Azure CLI (Preview)
description: Learn how AI-based error recovery in Azure CLI analyzes command failures, identifies likely root causes, and provides guided troubleshooting steps.
---

# AI-based error recovery in Azure CLI (Preview)

AI-based error recovery is a built-in capability in Azure CLI that helps you resolve command
failures more efficiently.

When an `az` command fails, Azure CLI uses an integrated AI model to analyze the error and provide
guided troubleshooting instead of displaying only raw or cryptic error messages.

The AI model can:

- Analyze the error message
- Identify the likely root cause
- Suggest corrective actions
- Provide a guided plan for resolution

The AI-generated response is designed to be clear and actionable. It typically includes the
following sections:

- **What went wrong:** Explains the error and its likely cause.
- **Plan or next actions:** Recommends steps to resolve the issue.
- **Values to review:** Identifies parameters or inputs that you should review.
- **Disclaimer:** Reminds you that AI-generated content may be inaccurate.

The feature works in interactive terminals and headless environments, such as Azure DevOps agents
and GitHub Actions workflows.

The goal is to reduce debugging time, improve command success rates, and provide a more guided
command-line experience.

> [!NOTE]
> AI-based error recovery is currently available only for Azure CLI (`az`) commands. Azure
> PowerShell workflows aren't supported during the preview.

## Enable or disable AI-based error recovery

AI-based error recovery is disabled by default.

Enable the feature:

```azurecli
az config set --key agent.enabled --value true
```

Disable the feature:

```azurecli
az config set --key agent.enabled --value false
```

View the current setting:

```azurecli
az config get --key agent.enabled
```

After you enable the feature, AI-based error recovery runs automatically whenever an `az` command
fails. You don't need to specify a per-command option.

## Configure the AI provider

By default, AI-based error recovery uses Microsoft's built-in AI provider.

Alternatively, you can configure Azure CLI to use your GitHub Copilot subscription.

Use the built-in provider:

```azurecli
# Requires az login
az config set --key agent.provider --value builtin
```

Use GitHub Copilot:

```azurecli
# Requires copilot login
az config set --key agent.provider --value github
```

## Choose the interaction style

By default, AI-based error recovery uses a one-shot experience that generates a recovery plan and
then exits.

To use a multi-turn interactive session that remains open until you type `exit`, run:

```azurecli
az config set --key agent.sessionStyle --value interactive
```

To return to the default one-shot experience:

```azurecli
az config set --key agent.sessionStyle --value oneshot
```

## Frequently asked questions

### What does AI-based error recovery do?

AI-based error recovery analyzes command failures and provides:

- A root cause explanation
- Suggested fixes
- Step-by-step recovery guidance

Instead of displaying only raw error output, it helps you understand what went wrong and how to
resolve the issue.

### How is this different from existing error messages?

Traditional CLI error messages often:

- Are cryptic or incomplete
- Point to symptoms instead of root causes
- Offer little or no remediation guidance

AI-based error recovery:

- Translates errors into plain language
- Identifies the likely root cause
- Suggests actionable next steps

### What kinds of issues can it handle?

AI-based error recovery can assist with issues such as:

- Invalid arguments or parameters
- Missing required inputs
- Azure service or API errors, such as unavailable SKUs or policy restrictions

In some cases, the AI can query Azure APIs to suggest valid alternatives, such as available SKUs.

### Is the feature enabled by default?

No. AI-based error recovery is disabled by default.

To enable the feature, run:

```azurecli
az config set --key agent.enabled --value true
```

### Does it require authentication?

Yes. You must be signed in to use AI-based error recovery. If you aren't signed in, only the
original error output is displayed.

The required sign-in depends on the configured AI provider:

- **builtin** (default) requires `az login`.
- **github** requires `copilot login`.

### Which model powers this feature?

AI-based error recovery uses a built-in AI model (GPT-5.4).

You can also configure Azure CLI to use your GitHub Copilot subscription:

```azurecli
az config set --key agent.provider --value github
```

### Who pays for AI usage?

Use of the built-in AI provider is currently included at no additional cost.

If you configure Azure CLI to use your GitHub Copilot subscription, costs depend on your
subscription plan and usage.

### What data is used and collected?

AI-based error recovery emits usage telemetry as its own trace, separate from the
telemetry for the command that failed. The trace records:

- How long recovery ran, and how long each phase took
- How many conversation turns and tool calls occurred
- The configured AI provider and interaction style
- The model name and the exit code
- A reference to the failed command's trace, so the two can be correlated

It does **not** record your prompts, the error text, the model's response, or the values
of any command parameters.

To turn all of it off:

```azurecli
az config set --key telemetry.enabled --value false
```

Separately, if you want a local record of the model input and output for debugging or auditing, enable tracing:

```azurecli
az config set --key agent.trace.enabled --value true
```

When tracing is enabled, each session writes a JSONL trace file to the location specified by
`agent.trace.path`. The file contains the model input and output and remains on your local machine.

For more information, see [Configuration Management][01].

### Can I rely completely on the AI suggestions?

No. AI-generated content may be inaccurate.

Always review the suggested recovery plan and values before running commands, especially before
deleting resources, resizing resources, or changing permissions.

### How can I provide feedback?

During the preview, feedback is collected through user interviews and surveys.

<!-- link references -->

[01]: ./config.md
