# Adam's Frisör Shopify Redesign Skill

This folder contains the reusable skill used to inspect and improve Adam's Frisör Shopify Online Store 2.0 themes.

## Required structure

```text
.agents/skills/adams-shopify-redesign/
├── SKILL.md
├── README.md
├── examples/
│   └── example-prompts.md
├── resources/
│   ├── brand-context.md
│   └── quality-checklist.md
└── scripts/
    ├── README.md
    └── audit-theme.sh
```

## Installation

Copy the entire `.agents` folder into the root of the Shopify theme repository or working directory. The skill must be available in the same workspace as the theme files so the agent can inspect `layout`, `templates`, `sections`, `snippets`, `assets`, `config`, and `locales`.

## Safe use

1. Work on an unpublished or development theme.
2. Read `SKILL.md`, `resources/brand-context.md`, and `resources/quality-checklist.md` first.
3. Inspect the existing theme before editing.
4. Preserve verified Bokadirekt links and merchant settings.
5. Keep visible storefront copy in Swedish.
6. Run `scripts/audit-theme.sh` and `shopify theme check` when available.
7. Never publish, change the theme role, or run `shopify theme push --live` automatically.

## Suggested first prompt

```text
Use the adams-shopify-redesign skill.
Inspect this Shopify theme without changing anything.
Identify the theme architecture, existing Adam-specific components, booking links,
mobile/accessibility/SEO risks, and the safest first implementation step.
Keep the report concise.
```

## Current safe Shopify target

The intended working theme is `Adam's Frisör - Premium Studio Update`. It must remain unpublished while changes are developed and validated. The live theme must remain untouched unless the merchant explicitly requests publication after review.