# CLAUDE.md — Rhodes Meditation

Bilingual (Greek / English) one-page site for George Ananiadis, a certified
meditation teacher in Rhodes. Static HTML/CSS, no framework, no build step,
deploys as a static site.

## Design System

**Always read `DESIGN.md` before making any visual or UI decision.**

All typography (EB Garamond / Spectral / Inter), color tokens, spacing rhythm,
motion timing, and bilingual conventions are defined there. Do not introduce
new tokens, fonts, or spacing values without updating `DESIGN.md` first —
then propagate into CSS.

When in doubt about a visual change:
1. Look it up in `DESIGN.md`.
2. If it's not defined, the tokens there are the authority — use the closest
   existing token, or surface the gap to the user before inventing one.
3. Flag any code that drifts from `DESIGN.md` as a bug.

## Bilingual Pattern

Every piece of user-facing copy must exist in both Greek (primary) and English
(secondary). Use the `data-lang` span pattern:

```html
<span data-lang="el">Ελληνικό</span>
<span data-lang="en">English</span>
```

Visibility is controlled by CSS based on `body.lang-el` / `body.lang-en`.
Greek is the default class on `<body>`. Do not hardcode English-only text.

## Versions

- `index.html` + `style.css` — shipping candidate (v1). Canonical.
- `v3/` — "Nano aesthetic" exploratory variant (Mar 28). Not canonical;
  any refinements worth keeping should be ported into v1 and `v3/` retired.

## What not to do

- Do not add purple gradients, 3-column icon grids with colored circles,
  bubbly border-radius, or any other generic AI-landing-page pattern — the
  design is deliberately editorial.
- Do not change border-radius from `2px`. The sharpness is a deliberate
  anti-SaaS choice.
- Do not regress `prefers-reduced-motion` handling.
- Do not add glassmorphism to more elements. Its scarcity is what makes
  the one use (lang-toggle) feel intentional.

## Project context

- Domain target: `stillrhodes.com` (tentative).
- Hosting: TBD (GitHub Pages / Netlify / Cloudflare Pages).
- Contact CTA: WhatsApp (`wa.me/306946138241`).
- Photos: `photos/` — local only, never fetched from CDN.

## References

- `DESIGN.md` — design system, source of truth.
- `todo.md` — pending tasks (SEO audit, WebP optimization, responsive QA).
- `ΗΜΕΡΟΛΟΓΙΟ.md` — session-by-session work log (Greek).
- `.agent/memory.md` — short-form agent preferences across sessions.
- `george description.md` — George's own bio, verbatim.
