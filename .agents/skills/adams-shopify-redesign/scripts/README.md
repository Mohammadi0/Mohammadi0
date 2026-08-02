# Skill Scripts

## `audit-theme.sh`

Runs lightweight read-only checks against a local Shopify theme before editing.

It verifies:

- Required Shopify theme directories
- Presence of `layout/theme.liquid`
- JSON syntax for templates and configuration files when Python is available
- Section schema markers
- Potential hardcoded Bokadirekt links
- Duplicate Adam local-business schema snippets
- References to forbidden live publishing commands inside project scripts or documentation

Run from the Shopify theme root:

```bash
bash .agents/skills/adams-shopify-redesign/scripts/audit-theme.sh
```

This script does not edit or publish the theme. It is not a replacement for:

```bash
shopify theme check
```

Use both when Shopify CLI is available.