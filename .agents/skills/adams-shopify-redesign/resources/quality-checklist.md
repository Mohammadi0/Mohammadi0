# Adam's Frisör Shopify Redesign Quality Checklist

Use this checklist before reporting a Shopify theme change as complete.

## 1. Safety and scope

- [ ] The existing theme architecture was inspected before editing.
- [ ] The theme name or likely theme family was identified from repository evidence.
- [ ] Relevant files in `layout`, `templates`, `sections`, `blocks`, `snippets`, `assets`, `config`, and `locales` were reviewed as needed.
- [ ] Existing merchant content and settings were preserved unless the request required a focused change.
- [ ] `config/settings_data.json` was not edited without a clear reason.
- [ ] No live theme was published or assigned a new role.
- [ ] No `shopify theme push --live` command was used.
- [ ] No unrelated files were changed.

## 2. Architecture and maintainability

- [ ] Existing native theme components were reused or extended where practical.
- [ ] The smallest safe reusable implementation was chosen.
- [ ] Repeated markup or logic was moved into a snippet or reusable theme block when appropriate.
- [ ] Page-specific layouts use JSON templates rather than hardcoded Liquid page composition.
- [ ] No unnecessary framework or dependency was introduced.
- [ ] No React, Vue, jQuery, Bootstrap, or Tailwind was added unless explicitly requested and already compatible with the theme.
- [ ] Naming and formatting follow the repository's existing conventions.

## 3. Theme Editor usability

- [ ] Merchant-facing headings, descriptions, images, labels, links, prices, and repeated items are editable where appropriate.
- [ ] Repeated content uses blocks.
- [ ] Reorderable content can be added, removed, and reordered in Theme Editor.
- [ ] Section schema JSON is valid.
- [ ] Section and setting names are clear to a non-technical merchant.
- [ ] A valid preset is included when the section should be addable.
- [ ] Practical `max_blocks` limits are used where helpful.
- [ ] `{{ block.shopify_attributes }}` is present on the correct wrapper.
- [ ] Empty states do not create broken or confusing layouts.
- [ ] Theme Editor section reloads do not break interactive behavior.

## 4. Brand and content

- [ ] Customer-facing content is written in natural Swedish.
- [ ] The word `grooming` is not used in Swedish storefront content.
- [ ] The tone is confident, clear, premium, and easy to scan.
- [ ] No unsupported awards, guarantees, ratings, urgency, or exaggerated claims were invented.
- [ ] The visual direction feels premium Scandinavian, modern, calm, and professional.
- [ ] Charcoal `#1C1C1E` and warm off-white `#E8E6E1` are used consistently when relevant.
- [ ] Gold, sand, beige, or brass accents are restrained.
- [ ] Real haircut photography remains the primary visual proof when available.
- [ ] Decorative effects do not distract from services or booking.

## 5. Customer journey and conversion

- [ ] The page purpose is understandable within a few seconds.
- [ ] The primary CTA is clear and not competing with too many equal-weight actions.
- [ ] `Boka tid` is used where it is the clearest primary action.
- [ ] Services and prices are readable and logically grouped.
- [ ] Visitors can reach booking with minimal friction.
- [ ] Visitors who are unsure can get help choosing without a long or stressful questionnaire.
- [ ] Reviews, gallery, location, opening hours, and contact information are easy to find when relevant.
- [ ] The mobile booking journey is fast and obvious.

## 6. Booking links

- [ ] Existing verified Bokadirekt links were preserved when available.
- [ ] No Bokadirekt service ID or direct URL was invented.
- [ ] The verified main booking page is used when a verified service-specific link is unavailable.
- [ ] External booking links are distinguishable from internal navigation.
- [ ] Booking links were checked for correct destination and behavior.
- [ ] Link text is descriptive and accessible.

## 7. Liquid and schema

- [ ] Liquid syntax was checked.
- [ ] Deprecated `{% include %}` patterns were not introduced.
- [ ] Reusable snippets receive explicit variables through `render`.
- [ ] Merchant-entered plain text is escaped where appropriate.
- [ ] Loops and repeated operations are efficient.
- [ ] Missing settings, blocks, products, images, or links fail gracefully.
- [ ] Section schema JSON parses correctly.
- [ ] JSON template syntax parses correctly.
- [ ] No Liquid markup appears inside JSON templates.
- [ ] Existing section IDs and settings were preserved unless an intentional migration was required.

## 8. Images and media

- [ ] Shopify image filters such as `image_url` and `image_tag` are used.
- [ ] Responsive image sizes are appropriate for the layout.
- [ ] Width and height information helps reduce layout shift.
- [ ] Meaningful alt text is available through a setting or sensible fallback.
- [ ] Missing images have a clean fallback or do not leave broken placeholders.
- [ ] Images are not requested multiple times unnecessarily.
- [ ] Heavy autoplay media is avoided.

## 9. CSS and responsive layout

- [ ] Existing design tokens and CSS variables were reused first.
- [ ] New selectors are scoped to the section, component, or section ID.
- [ ] Broad selectors do not unintentionally affect unrelated theme elements.
- [ ] CSS is mobile-first.
- [ ] The layout was reviewed around 360, 390, 768, 1024, and 1440 pixels.
- [ ] Text remains readable without horizontal scrolling.
- [ ] Buttons and links have comfortable touch targets.
- [ ] Cards and grids remain stable with long Swedish text.
- [ ] Excessive shadows, filters, animations, and layout shifts are avoided.
- [ ] `prefers-reduced-motion` is respected when motion is used.

## 10. JavaScript

- [ ] JavaScript was used only when HTML and CSS were insufficient.
- [ ] The implementation uses vanilla JavaScript or an existing theme utility.
- [ ] Initialization is idempotent.
- [ ] Optional elements can be absent without console errors.
- [ ] Event listeners do not multiply after Theme Editor reloads.
- [ ] Section load and unload events are handled when required.
- [ ] Scripts are not parser-blocking.
- [ ] No unnecessary external script was added.
- [ ] The browser console was checked when a preview environment was available.

## 11. Accessibility

- [ ] The page uses semantic landmarks and a logical heading hierarchy.
- [ ] There is one clear page-level H1 where applicable.
- [ ] Buttons are used for actions and links for navigation.
- [ ] Interactive controls work with a keyboard.
- [ ] Focus states are visible.
- [ ] Form inputs have associated labels.
- [ ] Error, selection, and state are not communicated through color alone.
- [ ] Text and controls have readable contrast.
- [ ] Touch targets are comfortably sized.
- [ ] ARIA is used only when native HTML is insufficient.
- [ ] Accordions, dialogs, tabs, sliders, and menus have correct keyboard behavior when used.

## 12. SEO

- [ ] Heading levels are logical.
- [ ] Local phrases are used naturally rather than repeated mechanically.
- [ ] Relevant phrases such as `barberare Örnsköldsvik`, `herrklippning Örnsköldsvik`, `frisör Örnsköldsvik`, `skin fade`, and `skäggtrimning` appear only where they fit.
- [ ] Descriptive internal link text is used.
- [ ] Existing canonical, metadata, social sharing, and structured-data systems were preserved.
- [ ] Duplicate structured data was not added without inspecting existing schema.
- [ ] Hidden keyword blocks or keyword stuffing were not introduced.

## 13. Validation commands

Run when available:

```bash
shopify theme check
```

Also perform the strongest available checks for:

- [ ] Liquid syntax
- [ ] Section schema JSON
- [ ] JSON templates
- [ ] Missing snippet or asset references
- [ ] Broken booking links
- [ ] Mobile layout
- [ ] Keyboard navigation
- [ ] Theme Editor add, remove, reorder, load, and unload behavior
- [ ] Empty states
- [ ] Console errors

When Shopify CLI or a preview store is unavailable, state that limitation clearly and describe the static checks that were completed.

## 14. Final report format

End with:

- **Changed:** What was implemented
- **Files:** Files created or modified
- **Theme Editor:** What the merchant can edit
- **Checked:** Validation performed
- **Remaining:** Real limitations or the safest next step

Do not claim that a visual preview, Shopify CLI validation, booking destination, or live-theme behavior was checked unless it actually was.