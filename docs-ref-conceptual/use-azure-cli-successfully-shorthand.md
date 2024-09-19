---
title: Use shorthand syntax with parameters | Microsoft Docs
description: Learn to use shorthand syntax with Azure CLI parameters. Pass JSON values easily with simplified shorthand syntax.
ms.date: 08/20/2024
ms.topic: concept-article
ms.custom: devx-track-azurecli
#customer intent: As an Azure CLI developer, I need to learn an easier way to work with JSON syntax in Azure CLI parameter values.
---

# How to use shorthand syntax with Azure CLI

Many Azure CLI parameters accept JSON values, but because it can be challenging to flatten JSON into a string, the Azure CLI supports shorthand syntax. Shorthand syntax is a simplified representation of a JSON string.

This article provides examples of shorthand syntax, and shows how to pass JSON as a file.

> [!NOTE]
>
> You'll know that a parameter accepts shorthand syntax when the parameter description reads similar to `Support shorthand-syntax, JSON-file and YAML-file. Try "??" to show more`.

## Full value shorthand syntax

Shorthand syntax in `Full Value` format is JSON surrounded by _double quotes_. Double quotes cause the JSON value to be passed as a string in both the PowerShell and Bash scripting language. Here's a JSON example:

```JSON
{
  "name": "Bill",
  "age": 20,
  "paid": true,
  "emails": [
    "Bill@microsoft.com",
    "Bill@outlook.com"
  ],
  "address": {
    "country": "USA",
    "company": "Microsoft",
    "details": {
      "line1": "15590 NE 31st St",
      "line2": "Redmond, WA"
    }
  }
}
```

When passing JSON in a parameter value, the JSON is flattened and surrounded by double quotes.

```bash
az some-command --contact "{name:Bill,age:20,paid:true,emails:[Bill@microsoft.com,Bill@outlook.com],address:{country:USA,company:Microsoft,details:{line1:'15590 NE 31st St',line2:'Redmond, WA'}}}"
```

## Partial value shorthand syntax

Shorthand syntax for partial value is composed of two parts joined by an equal (`=`) sign between the index `key` and the `value`.
Here's an example: `key=value`.

The value can be a simple string, full value format, JSON, or a JSON file path. Using the JSON example above, pass properties for the `--contact` parameter following these examples:

Use `Partial Value` for a single key-value pair.

```bash
az some-command --contact name=Bill
```

Use `Partial Value` for two key-value pairs. Note the space that separates the two pairs.

```bash
az some-command --contact age=20 paid=true
```

Use `Partial Value` for second element.

```bash
az some-command --contact emails[1]="Bill@outlook.com"
```

Use `Partial Value` for _details_ property of _address_.

```bash
az some-command --contact address.details="{line1:'15590 NE 31st St',line2:'Redmond, WA'}"
```

## Combine full and partial value shorthand syntax

You can combine full and partial value syntax, but always start with `Full Value` followed by `Partial Value`. If you reverse the order, the final data will only be the `Full Value` without properties defined in `Partial Value`.

Use `Full Value` followed by `Partial Value`:

```bash
az some-command --contact "{name:Bill,age:20,paid:true,emails:[Bill@microsoft.com,Bill@outlook.com]}" motto="One man's bug is another man's lesson."
```

You can also patch a new element of list property in `Full Value`. For example you can set the second email address by `Partial Value`:

```bash
az some-command --contact "{name:Bill,age:20,paid:true,emails:[Bill@microsoft.com]}" emails[1]="Bill@outlook.com" motto="One man's bug is another man's lesson."
```

## Pass JSON in a file

It's also possible to pass a JSON file as a parameter value. This is the recommended approach when working with complex JSON.

```bash
az some-command --contact address.details=./address_details.JSON
```

## Single Quotes String

_Single Quotes String_ is used to pass a __string__ value with special characters: `:`, `,`, `{`, `}`, `[`, `]`, `null`, `??` and space.
These characters often have other meanings when parsing shorthand syntax. Single quotes tell the parser to treat everything as a string.

## Pass a string value with a space and other special characters

Here is example JSON to pass as a value in the `--contact` parameter:

```JSON
{
  "name": "Bill RP",
  "age": 20,
  "paid": true,
  "data": "{a: [1, 2]}"
}
```

Use single quotes in `Full Value` format:

```bash
az some-command --contact "{name:'Bill RP',age:20,paid:true,data:'{a: [1, 2]}'}"
```

Use single quotes in `Partial Value` format:

```bash
az some-command --contact name="'Bill RP'" data="'{a: [1, 2]}'"
```

In the next example, it is also possible to remove single quotes for the `name` key. The parser will not distinguish between a `Full Value` expression, `null` value or the `??` flag.

Use `Partial Value` format:

```bash
az some-command --contact name="Bill RP"
```

## Pass an apostrophe (`'`)

The apostrophe character (`'`) needs special escape (`/'`) in _Single Quotes String_ in order to distinguish the end of a _Single Quotes String_.  A forward slash (`/`) is an escape character __only__ after an apostrophe (`'`) in _Single Quotes String_. If `/` is not in _Single Quotes String_ or `/` is not after `'`, `/` is a normal character.

Pass `Full Value` format:

```bash
az some-command --contact "{name:'bill'/s',age:20,paid:true}"
```

Pass `Partial Value` format:

```bash
az some-command --contact name="'bill'/s'"
```

If value is not in _Single Quotes String_, you don't need to add an escape character after `'`.

Pass `Partial Value` format:

```bash
az some-command --contact name="bill's"
```

Here's another example using the following JSON:

```JSON
{
  "name": "Bill",
  "motto": "One man's bug is another man's lesson.",
  "age": 20,
  "paid": true,
  "emails": [
    "Bill@microsoft.com",
    "Bill@outlook.com"
  ]
}
```

In `Full Value` format, use a _Single Quotes String_ and replace the `'` with  `'/`.

```bash
az some-command --contact "{name:Bill,motto:'One man'/s bug is another man'/s lesson.',age:20,paid:true,emails:[Bill@microsoft.com,Bill@outlook.com]}"
```

In `Partial Value` format, a value containing an apostrophe can be parsed as string, surrounded by double quotes.

```bash
az some-command --contact motto="One man's bug is another man's lesson."
```

## Work with NULL values

### Pass the word "null" as a string value

Sometime it's required to pass a "null" string value. In order to distinguish with `null` value, it needs to be a _Single Quotes String_.
For example if you want to pass "null" string into the _name_ property in the `--contact` parameter:

JSON:
```JSON
{
  "name": "null",
  "age": 20,
  "paid": true
}
```

Use `Full Value` format:
```bash
az some-command --contact "{name:'null',age:20,paid:true}"
```

Use `Partial Value` format:
```bash
az some-command --contact name="'null'"
```

### Pass a `null` value

Shorthand syntax support `null` keyword in both `Full Value` and `Partial Value` formats.

For example if you want to pass following object with a `null` value _address_ property in the `--contact` parameter:

```JSON
{
  "name": "Bill",
  "age": 20,
  "paid": true,
  "emails": [
    "Bill@microsoft.com",
    "Bill@outlook.com"
  ],
  "address": null
}
```

Use `Full Value` format:

```bash
az some-command --contact "{name:Bill,age:20,paid:true,emails:[Bill@microsoft.com,Bill@outlook.com],address:null}"
```

Use `Partial Value` format:

```bash
az some-command --contact name=Bill address=null
```

### Use a `null` value in update commands

In update commands, a `null` value is often used to unset properties of a object, or remove elements of an array or a dictionary.

```JSON
{
  "contact": {
    "name": "Bill",
    "age": 20,
    "paid": true,
    "emails": [
      "Bill@microsoft.com",
      "Bill@outlook.com"
    ],
    "address": {
      "country": "USA",
      "company": "Microsoft",
      "details": {
        "line1": "15590 NE 31st St",
        "line2": "Redmond, WA"
      }
    }
  },

  "other_properties": {}
}
```

If there already exists a resource with the JSON values shown above, passing a `null` value in an update command will reset the key's value.

```bash
az some-update-command --contact address=null
```

Here's another example that removes the first element of a resource's email:

```bash
az some-update-command --emails [0]=null
```

## Use `??` to show help

The use of double question marks `??` is a special keyword to show the available help for a parameter or sub-property. It can also be used within shorthand syntax to get help.

> [!NOTE]
>
> The Bash shell uses `?` as a wildcard.  Make sure the double question marks `??` are wrapped in the **double quotes**.

### Use `??` to show a parameter's help message

Show help message of `--contact` parameter:

```bash
az some-command --contact "??"
```

### Use `??` in `Full Value` format

Show help message of `--contant` parameter when writing `Full Value`:

```bash
az some-command --contact "{??"
```
```bash
az some-command --contact "{name:Bill,??"
```

Show help message of `--contant.address` property when writing `Full Value`:

```bash
az some-command --contact "{name:Bill,address:??"
```

Show help message of `--contant.address.country` property when writing `Full Value`:

```bash
az some-command --contact "{name:Bill,address:{country:??"
```

Show help message of `--contant.emails` property when writing `Full Value`:

```bash
az some-command --contact "{name:Bill,address:{country:USA},emails:??"
```

Show help message of the element of `--contant.emails` property when writing `Full Value`:

```bash
az some-command --contact "{name:Bill,address:{country:USA},emails:[??"
```

### Use `??` in `Partial Value` format

Show help message of `--contant.address` property when writing `Partial Value`:

```bash
az some-command --contact address="??"
```

Show help message of `--contant.emails` property when writing `Partial Value`:

```bash
az some-command --contact emails="??"
```

Show help message of the element of `--contant.emails` property when writing `Partial Value`:

```bash
az some-command --contact emails[0]="??"
```

## See also

* [Quoting differences between scripting languages - JSON strings](./use-azure-cli-successfully-quoting.md#json-strings)
