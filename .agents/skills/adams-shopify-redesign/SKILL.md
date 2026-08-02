---
name: adams-shopify-redesign
description: Redesigns and improves Adam's Frisör Shopify Liquid themes with reusable, Theme Editor-compatible Online Store 2.0 sections, blocks, snippets, CSS, JavaScript, and JSON templates. Use for Shopify storefront redesigns, service pages, booking-flow improvements, mobile UX, accessibility, local SEO, performance, and conversion-focused theme changes while preserving the existing theme architecture and avoiding destructive production edits.
---

# Adam's Frisör Shopify Redesign

## Purpose

Create a premium Scandinavian Shopify storefront for Adam's Frisör through safe, reusable, maintainable Liquid theme changes.

The result must remain easy to edit in Shopify Theme Editor. Prefer modular sections, blocks, snippets, settings, and JSON templates over hardcoded page content.

## Read these resources first

Before making changes, read:

- `resources/brand-context.md`
- `resources/quality-checklist.md`

Use `examples/example-prompts.md` only when examples are helpful.

## When to use this skill

Use this skill when the request involves one or more of the following:

- Redesigning a Shopify storefront or page
- Building reusable Shopify Liquid sections or blocks
- Improving the homepage, services, gallery, about, contact, or booking journey
- Improving mobile layout, accessibility, performance, SEO, or conversion
- Refactoring hardcoded storefront code into Theme Editor controls
- Creating reusable service cards, CTAs, trust sections, galleries, FAQs, or recommendation flows
- Working in a Shopify Online Store 2.0 Liquid theme

Do not use this skill for Shopify Admin API apps, checkout extensions, Hydrogen storefronts, product inventory management, or order management.

## Core rules

1. **Inspect before editing**
   - Identify the theme and version from the repository instead of assuming them.
   - Inspect the existing architecture and naming conventions.
   - Review relevant files in `layout/`, `templates/`, `sections/`, `blocks/`, `snippets/`, `assets/`, `config/`, and `locales/`.
   - Check `git status` and the current diff when Git is available.

2. **Preserve the existing theme architecture**
   - Extend an existing component when it already solves most of the problem.
   - Do not replace native theme systems with a separate custom framework.
   - Do not introduce React, Vue, jQuery, Bootstrap, Tailwind, or another dependency unless the user explicitly requests it and the theme already uses it.

3. **Make the smallest safe reusable change**
   - Avoid broad rewrites when a section, block, snippet, or scoped asset is enough.
   - Reuse shared patterns rather than duplicating markup, styles, or scripts.
   - Keep each component responsible for one clear purpose.

4. **Keep merchant content editable**
   - Do not hardcode headings, descriptions, prices, images, labels, links, or service items when they can be exposed through section or block settings.
   - Use blocks for repeated content such as services, benefits, reviews, steps, FAQs, gallery items, and CTAs.
   - Add valid presets so compatible sections can be added through Theme Editor.
   - Use sensible default content in Swedish.

5. **Work safely**
   - Never publish a theme or push to the live theme unless the user explicitly requests that exact action.
   - Never run `shopify theme push --live` automatically.
   - Do not change the theme role.
   - Avoid editing `config/settings_data.json` unless the user specifically asks for content configuration that requires it.
   - Preserve existing merchant settings and content.

6. **Use Swedish customer-facing content**
   - All visible storefront text must be in natural Swedish unless the user requests another language.
   - Never use the word `grooming` in Swedish storefront content.
   - Keep copy confident, premium, clear, and easy to scan.
   - Avoid exaggerated or unsupported claims.

## Shopify implementation standards

### Sections and blocks

For a reusable section:

- Use a clear, unique file name.
- Include valid `{% schema %}` JSON.
- Include a descriptive section name.
- Define merchant-editable `settings`.
- Define `blocks` for repeatable items where appropriate.
- Add `max_blocks` when a practical limit improves usability.
- Add a `presets` entry when the section should be addable in Theme Editor.
- Use `enabled_on` or `disabled_on` only when the section should be limited to specific template areas.
- Add `{{ block.shopify_attributes }}` to the correct block wrapper.
- Support app blocks with an `@app` block only when app content is relevant.

### JSON templates

- Prefer JSON templates for editable Online Store 2.0 pages.
- Keep templates focused on section composition and order.
- Do not place Liquid markup inside JSON templates.
- Preserve existing section IDs and settings unless a migration is intentionally required.
- Avoid unnecessary template duplication.

### Snippets

Create a snippet when markup or logic is reused in multiple sections or templates.

- Pass explicit variables using `render`.
- Avoid hidden dependencies on unrelated global variables.
- Keep presentation logic simple and predictable.
- Document non-obvious parameters with a short Liquid comment.

### CSS

- Reuse the theme's existing design tokens and CSS variables first.
- Scope new section-specific styles to the component or section ID.
- Avoid broad selectors that can affect unrelated theme elements.
- Use mobile-first responsive CSS.
- Test at approximately 360, 390, 768, 1024, and 1440 pixels.
- Avoid excessive animations, filters, shadows, and layout shifts.
- Respect `prefers-reduced-motion`.
- Put widely reused styles in an asset; keep truly section-specific styles scoped and compact.

### JavaScript

- Prefer HTML and CSS when JavaScript is unnecessary.
- Use vanilla JavaScript unless the theme already provides an appropriate utility.
- Make initialization idempotent so it can run safely more than once.
- Support Shopify Theme Editor section reloads when the component is interactive.
- Do not create parser-blocking scripts.
- Load shared scripts through theme assets using the theme's established loading pattern.
- Clean up event listeners when a section is unloaded if needed.
- Fail gracefully when optional elements are absent.

### Liquid and media

- Use modern Liquid patterns and the theme's existing conventions.
- Escape merchant-entered plain text where appropriate.
- Use Shopify image filters such as `image_url` and `image_tag`.
- Provide meaningful image alt text settings or sensible fallbacks.
- Use `render` rather than deprecated inclusion patterns.
- Avoid unnecessary loops, repeated expensive operations, and duplicated image requests.

## Design direction

The storefront should feel:

- Premium Scandinavian
- Modern and calm
- Precise and professional
- Masculine without becoming harsh or visually heavy
- Easy to understand and easy to book from

Use the established visual identity from `resources/brand-context.md`.

Prioritize:

1. Clear page hierarchy
2. Strong but tasteful booking CTAs
3. Readable service and price information
4. Real haircut photography
5. Trust, reviews, location, and practical information
6. Fast mobile booking

Avoid:

- Generic template appearance
- Large empty sections without purpose
- Excessive gold decoration
- Overly small text
- Too many simultaneous CTAs
- Carousels when a stable grid is easier to use
- Decorative animations that slow the booking journey

## Customer journey

A visitor should be able to:

1. Understand what Adam's Frisör offers within a few seconds.
2. See the most relevant services and prices without confusion.
3. Get help choosing a service when unsure.
4. Open the correct Bokadirekt booking destination with minimal friction.
5. Find reviews, gallery images, contact details, opening hours, and location easily.

For booking links:

- Preserve verified existing links when available.
- Do not invent service IDs or Bokadirekt URLs.
- When a direct service URL is unavailable, use the verified main booking page.
- Clearly distinguish internal navigation links from external booking links.

## SEO requirements

- Use one clear page-level H1.
- Keep heading levels logical.
- Use natural Swedish local search phrases without keyword stuffing.
- Prioritize phrases such as `barberare Örnsköldsvik`, `herrklippning Örnsköldsvik`, `skin fade`, and `skäggtrimning` only where they fit naturally.
- Preserve canonical, metadata, structured-data, and social-sharing systems already provided by the theme.
- Do not add duplicate schema markup without inspecting existing structured data.
- Use descriptive link text instead of vague repeated text where practical.

## Accessibility requirements

- Use semantic HTML landmarks and headings.
- Keep interactive controls keyboard accessible.
- Use real buttons for actions and links for navigation.
- Provide visible focus states.
- Associate labels and form fields correctly.
- Do not rely on color alone to communicate state.
- Maintain readable contrast and touch targets.
- Use ARIA only when native HTML does not provide the required meaning.
- Ensure dialogs, accordions, tabs, sliders, and menus have correct keyboard behavior when used.

## Decision tree

Use this order when choosing an implementation:

1. **Can an existing section or block be configured to solve it?**
   - Configure or extend it.

2. **Is the same visual pattern repeated?**
   - Create or reuse a snippet or theme block.

3. **Does the merchant need to add, remove, or reorder the content?**
   - Use blocks inside a reusable section.

4. **Is the layout page-specific but still merchant-editable?**
   - Create a section and reference it from a JSON template.

5. **Is the setting global across many pages?**
   - Reuse an existing theme setting or add a carefully named global setting only when necessary.

6. **Is custom JavaScript truly required?**
   - Add the smallest accessible, resilient script possible.

## Work sequence

### 1. Inspect

Identify:

- Theme name and architecture
- Relevant current files
- Existing reusable patterns
- Existing design tokens
- Existing booking links
- Risks of the requested change

### 2. State the intended change

Before a large edit, briefly state:

- What will change
- Which files will be affected
- What will remain untouched

Do not produce a long generic plan.

### 3. Implement

- Follow existing naming and formatting conventions.
- Keep the change focused.
- Add Theme Editor settings and presets.
- Preserve existing content and integrations.
- Use reusable code rather than page-specific duplication.

### 4. Validate

When available, run:

```bash
shopify theme check
```

Also validate:

- Liquid syntax
- Section schema JSON
- JSON template syntax
- Missing snippet or asset references
- Mobile layout
- Theme Editor add, remove, reorder, and reload behavior
- Keyboard navigation and focus
- Booking links
- Empty states and missing-image states
- Console errors

If Shopify CLI is unavailable, say so and perform the strongest available static checks instead.

### 5. Report

End with a concise result using this structure:

- **Changed:** What was implemented
- **Files:** Files created or modified
- **Theme Editor:** What the merchant can now edit
- **Checked:** Validation performed
- **Remaining:** Any real limitation or recommended next step

## Required acceptance criteria

A completed change should satisfy all applicable criteria:

- The code follows the theme's current architecture.
- Repeated content is editable through sections or blocks.
- The section has valid schema and a preset when appropriate.
- Customer-facing content is Swedish.
- The design matches Adam's Frisör visual identity.
- The layout works on small mobile screens and desktop.
- Booking CTAs are clear and use verified links.
- Accessibility fundamentals are present.
- There are no obvious Liquid, JSON, JavaScript, or console errors.
- Existing theme functionality and merchant content remain intact.
- The live theme has not been published or overwritten without explicit permission.
