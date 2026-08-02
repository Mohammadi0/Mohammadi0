# Example Prompts for `adams-shopify-redesign`

These prompts demonstrate when and how to use the skill. Adapt the scope to the actual Shopify repository and never assume that a listed file already exists.

## 1. Inspect the theme before redesigning

```text
Use the `adams-shopify-redesign` skill.

Inspect this Shopify theme without changing anything.

Identify:
- Theme name and likely version
- Main layout and template structure
- Existing reusable sections and snippets
- Current design tokens
- Existing Bokadirekt booking links
- Mobile UX, accessibility, SEO, and performance risks
- The safest first redesign step

Keep the report concise and name the exact files that would likely be affected.
```

## 2. Redesign the homepage safely

```text
Use the full `adams-shopify-redesign` skill end to end.

Redesign the homepage for Adam's Frisör®️ into a premium Scandinavian experience that increases Bokadirekt bookings.

Requirements:
- All customer-facing copy in Swedish
- Keep the current theme architecture
- Use reusable Online Store 2.0 sections and blocks
- Keep content editable in Theme Editor
- Preserve verified booking links and integrations
- Do not edit or publish the live theme
- Prioritize mobile screens from 360 px upward

Desired homepage flow:
1. Hero with one clear “Boka tid” CTA
2. Trust bar
3. Featured services and prices
4. “Hjälp mig välja” section
5. Why choose Adam's Frisör
6. Gallery
7. Simple booking steps
8. Reviews
9. Location and opening hours
10. Final booking CTA

Inspect first, briefly state the intended change and affected files, implement the smallest safe reusable solution, validate it, and finish with the required result report.
```

## 3. Build a reusable service cards section

```text
Use the `adams-shopify-redesign` skill.

Create or extend a reusable Shopify section for featured services.

Each service block should support:
- Service name
- Short description
- Price or “från”-price
- Duration label
- Optional image
- Accessible image alt text
- CTA label
- Verified booking URL
- Optional highlighted state

Use natural Swedish defaults. Keep the cards readable on 360 px screens and use the theme's existing design tokens. Do not invent Bokadirekt URLs. Add a valid schema and preset, validate the Liquid and schema JSON, and report changed files.
```

## 4. Improve the services and prices page

```text
Use the full `adams-shopify-redesign` skill.

Improve the “Tjänster & priser” page so customers can compare services quickly without feeling overwhelmed.

Goals:
- Group services logically: klippning, fade, skägg, kombinationer, barn och ungdom
- Show price and duration clearly
- Use a small number of clear booking choices
- Provide short explanations only where they reduce confusion
- Keep all service items editable and reorderable in Theme Editor
- Use verified booking links only
- Add natural local SEO for Örnsköldsvik without keyword stuffing
- Maintain accessibility and strong mobile readability

Inspect existing service components first and extend them instead of duplicating a similar system.
```

## 5. Create a “Hjälp mig välja” flow

```text
Use the `adams-shopify-redesign` skill.

Build an accessible “Hjälp mig välja” section that guides uncertain visitors toward a suitable service without creating a long questionnaire.

Use no more than a few simple steps. Possible inputs may include:
- Vem bokningen gäller
- Hårlängd
- Om kunden vill ha fade
- Om skägg ska ingå
- Önskat resultat

Requirements:
- Swedish customer-facing copy
- Clear progress and back controls
- Keyboard-accessible controls
- No invented Bokadirekt service IDs
- Use the verified main booking page when no direct service link exists
- Vanilla JavaScript only if needed
- Support Theme Editor section reloads
- Provide a useful no-JavaScript fallback
- Keep configuration editable through section settings and blocks where practical

Inspect the theme's existing forms, tabs, accordions, and JavaScript patterns before implementing.
```

## 6. Improve the mobile booking journey

```text
Use the `adams-shopify-redesign` skill.

Audit and improve the mobile booking journey for Adam's Frisör®️.

Focus on:
- Header and mobile navigation
- Visibility of the primary “Boka tid” action
- Tap-target size
- Service-card readability
- Booking link clarity
- Sticky elements that do not hide content
- Keyboard and screen-reader behavior
- Performance and layout shift

Do not redesign unrelated desktop components. Make the smallest safe reusable change and test around 360, 390, and 768 px.
```

## 7. Create a premium gallery section

```text
Use the `adams-shopify-redesign` skill.

Create or extend a gallery section for real haircut photography.

Requirements:
- Stable responsive grid instead of an unnecessary carousel
- Theme Editor blocks for images
- Editable alt text and optional short captions
- Shopify responsive image filters
- Clean missing-image state
- Premium Scandinavian spacing and typography
- Strong mobile performance
- Optional category labels only if they remain simple and accessible
- No heavy animation or external gallery library

Reuse existing card, media, modal, or lightbox patterns when the theme already provides them.
```

## 8. Improve local SEO and accessibility

```text
Use the `adams-shopify-redesign` skill.

Review the homepage and service page for local SEO and accessibility issues, then implement focused corrections.

Check:
- One clear H1 per page
- Logical heading hierarchy
- Natural use of “barberare Örnsköldsvik”, “herrklippning Örnsköldsvik”, “frisör Örnsköldsvik”, “skin fade”, and “skäggtrimning”
- Descriptive internal links
- Image alt text
- Button versus link semantics
- Focus visibility
- Form labels
- Color contrast
- Touch targets
- Existing canonical, metadata, social sharing, and structured data

Do not add duplicate schema markup or keyword blocks. Preserve native theme SEO systems.
```

## 9. Refactor a hardcoded section

```text
Use the `adams-shopify-redesign` skill.

Refactor the hardcoded homepage service area into a reusable Theme Editor section.

Preserve the current visual appearance and merchant content as closely as possible.

Move appropriate content into:
- Section settings
- Reorderable service blocks
- Shared snippets when markup repeats
- Scoped CSS or an existing shared asset

Do not rewrite unrelated homepage sections. Add a preset only if the section should be addable elsewhere. Validate that existing content is not silently lost.
```

## 10. Validate an existing redesign

```text
Use the `adams-shopify-redesign` quality checklist to review the current branch.

Do not make changes initially.

Inspect the diff and report:
- Architecture problems
- Theme Editor limitations
- Liquid or schema risks
- Mobile layout risks
- Accessibility issues
- Unverified booking links
- SEO regressions
- Performance concerns
- Any risk to existing merchant content

Then fix only high-confidence issues that are within the original redesign scope. Run `shopify theme check` when available and clearly state any validation that could not be performed.
```

## 11. Full realistic Adam's Frisör request

```text
Use the full `adams-shopify-redesign` skill end to end on the Shopify development theme for Adam's Frisör®️.

Business context:
- Location: Krokstavägen 37, 891 43 Örnsköldsvik
- Language: Swedish
- Visual identity: charcoal #1C1C1E, warm off-white #E8E6E1, restrained sand or gold accents
- Style: premium Scandinavian, modern, calm, precise, professional, and welcoming
- Main conversion: Bokadirekt booking
- Main CTA: “Boka tid”

Navigation direction:
- Hem
- Tjänster & priser
- Hjälp mig välja
- Galleri
- Om oss
- Kontakt

Improve:
- Homepage hierarchy
- Services and price presentation
- Booking journey
- Mobile navigation
- Gallery
- Reviews and trust
- Location and opening hours
- Accessibility
- Local SEO
- Performance

Technical rules:
- Inspect before editing
- Preserve the theme architecture
- Keep all suitable content editable in Theme Editor
- Prefer sections, blocks, snippets, scoped CSS, vanilla JavaScript, and JSON templates
- Preserve verified Bokadirekt links
- Do not invent booking URLs, service IDs, reviews, or business claims
- Do not edit `config/settings_data.json` without a demonstrated need
- Do not publish or overwrite the live theme

First report the theme architecture, existing reusable patterns, risks, and exact intended files. Then implement the safest focused redesign, validate it, and finish with:
- Changed
- Files
- Theme Editor
- Checked
- Remaining
```

## 12. Minimal low-usage prompt

```text
Use `adams-shopify-redesign`.

Inspect this Shopify theme briefly. Do not change anything.
Identify the theme, main files, existing booking link pattern, and safest next redesign step.
Keep the answer short.
```

## Prompt-writing guidance

A strong request should state:

- The page or customer journey to improve
- The desired customer outcome
- Whether the task is inspection-only or allows code changes
- The development branch or theme when known
- Elements that must remain untouched
- Whether verified booking links already exist
- The most important mobile, accessibility, SEO, or performance requirements

Avoid asking the skill to “redesign everything” without repository inspection, scope boundaries, or a safe development target.