# Design System — Rhodes Meditation (Still Rhodes)

*This document is the source of truth for all visual decisions. It was extracted
from the existing `style.css` and `v3/style.css` on 2026-04-22 — it documents a
design system that is already in production, it does not propose a new one.
Any change to these tokens should be made here first, then propagated to CSS.*

---

## Product Context

- **What this is:** A bilingual (Greek primary, English secondary) one-page site
  for George Ananiadis (Γιώργος Ανανιάδης), certified meditation teacher based
  in Rhodes, Greece. Offers group sessions in the Medieval Town and Faliraki,
  plus private sessions on request.
- **Who it's for:** Tourists and locals searching for meditation in Rhodes;
  practitioners of meditation already familiar with the vocabulary (Vipassana,
  Krishnamurti, Mooji, Osho); people referred via retreat networks.
- **Space/industry:** Wellness / meditation instruction / spiritual tourism.
- **Project type:** Static one-page marketing site with a WhatsApp CTA. No
  booking engine, no auth, no dynamic content.
- **Domain target:** `stillrhodes.com` (tentative).
- **Stack:** Hand-written HTML + CSS + minimal JS. No framework. No build step.
  Google Fonts via `@import`. Images local in `photos/`.

## The Memorable Thing

> The page itself should feel like a held breath. A reader who scrolls through it
> should arrive at the WhatsApp button already a little quieter than when they
> started.

Every decision below serves this: the serif, the 1.85 line-height, the 8rem
vertical padding, the muted gold whisper on labels, the italic quote that sits
in sea-blue like an aside in a book — these are paced pauses, not visual noise.
The design trades density for stillness. That is the whole brief.

*(If this is wrong, update it here first. The tokens follow the memorable thing,
not the other way around.)*

## Aesthetic Direction

- **Direction:** **Editorial-Literary** with a meditative, almost monastic
  restraint. Type does most of the work. Photography is secondary, muted, and
  desaturated. Decoration is near-zero.
- **Decoration level:** **Minimal, with two small flourishes** — (a) the gold
  horizontal line that finishes each section label, (b) the oversized italic
  opening quote mark on the `.aside` block at 10% opacity. Nothing else
  decorative exists.
- **Mood:** Warm, reflective, literate. Reads like the inside of a softcover book
  printed on cream paper. Not wellness-app bright, not Instagram-spiritual
  bright. Closer to a good print magazine's feature essay than to a landing
  page.
- **Reference intuition:** Think slow-journalism publications, small-press
  poetry books, monastic websites — the visual language of reading something
  you chose, not something that chose you.

## Typography

All three families are served from Google Fonts via a single `@import` in CSS.
No self-hosting yet (future perf work — see `todo.md`).

| Role            | Family       | Weight(s) used | Italic | Notes |
|-----------------|--------------|----------------|--------|-------|
| Display / Hero / Headings | `EB Garamond` | 400, 500 | 400 italic | Sets the literary tone. `h1, h2, h3, .garamond` class. |
| Body / Long prose | `Spectral` | 300, 400 | 300 italic | Body `font-weight: 300` — Spectral at 300 is the core prose texture. Georgia as fallback. |
| UI / Labels / Metadata | `Inter` | 300, 400 | — | `.inter` class. `letter-spacing: -0.01em`. Used for session duration, certificate lines, footer sub-lines. |

**Body base:** `19px` desktop / `17px` mobile, `line-height: 1.85`. The long
line-height is non-negotiable — it's what makes the prose breathe.

**Hero headline:** `clamp(2.8rem, 8vw, 4.5rem)` with `letter-spacing: -0.02em`,
`line-height: 1.2`. (v3 uses `clamp(3rem, 10vw, 5rem)` at `-0.03em` — v3 reads
slightly bigger and tighter; consider unifying on v3's sizing if any merge
happens.)

**Section labels (`.chapter h2`):** `0.9rem`, `letter-spacing: 0.3em`,
`text-transform: uppercase`, color `--gold`. Rendered as a flex row with a
hairline gold-muted rule filling the remaining space. This is the signature
typographic move of the site.

**Italic voice (`.aside`):** `EB Garamond` italic at 5rem padded block, sea
color, with a `font-size: 5rem` `"` mark at `opacity: 0.1` in the top-left
corner — the "silent voice" pattern. Used for the non-judgment quote.

**Font stack fallbacks:** Body: `Spectral, Georgia, serif`. Display: `'EB
Garamond', serif`. UI: `'Inter', sans-serif`. Graceful degradation if Google
Fonts fails.

## Color

Palette lives in `:root` custom properties. Inspired by Rhodes (sea, sunset,
limestone) and meditation (warm neutrals, no saturated primaries).

| Token            | Value                          | Role |
|------------------|--------------------------------|------|
| `--cream`        | `#faf8f5`                      | Primary background. Paper-warm off-white. |
| `--warm-black`   | `#2d2a26`                      | Primary text. Never true black — carries a brown warmth. |
| `--gold`         | `#9e8a5f`                      | Accent. Section labels, price, certification, hover borders. |
| `--gold-muted`   | `rgba(158, 138, 95, 0.2)`     | Hairline rules, subtle borders. |
| `--sea`          | `#5a7a7a`                      | Inline text links, quote body. Dusty sea-green, not vivid. |
| `--sea-muted`    | `rgba(90, 122, 122, 0.1)`     | Quote-block background wash. |
| `--rose`         | `#a67f6f`                      | Defined but **currently unused** in live CSS. Reserved as warm accent. |
| `--muted`        | `rgba(45, 42, 38, 0.8)`       | Subdued body — intros, captions, tags. Passes WCAG AA on cream and footer surfaces. |

**Rules of use:**
- Body copy: `--warm-black` at full opacity. Subdued copy: `--muted` (80%).
- Links in body prose: `--sea`, underlined with `text-underline-offset: 3px`.
- Section labels, prices, section-card headings: `--gold`.
- Hover: border color shifts to `--gold` on cards and session blocks.
- Hairlines and dividers: `--gold-muted`.
- Inverted surface (Sessions section): `--warm-black` bg, `--cream` text,
  `--gold` accents. The only dark surface on the page — a deliberate "room
  change."

**Dark mode:** **Not implemented, not planned for v1.** If added later, follow
this rule — do NOT invert `--warm-black` and `--cream`, redesign the surfaces
so gold still reads, sea desaturates by ~10%, and the italic aside gets a
parchment-colored treatment instead of a wash.

**`--rose`:** Left in the palette even though unused. Do not delete — it's
a reserved warm accent for future editorial sections. Document here if
introduced.

## Spacing

**Base unit:** approximately `4px` (`0.25rem`). Most spacing values are multiples
of 4 or 8 px.

**`--safe-padding`:** `2rem` desktop, `1.25rem` mobile — the page gutter. Every
horizontal padding references this.

**Section rhythm (deliberate):**
- **Chapter section:** `padding: 8rem var(--safe-padding)` — enormous vertical
  breathing. This is the single most important spacing decision on the site.
- **Sessions section (`.sessions-chapter`):** `8rem` top/bottom, dark surface.
- **Contact section:** `10rem` top/bottom — even more air before the CTA. The
  pause before the action.
- **Aside:** `5rem` top/bottom margin, `3rem` internal padding.
- **Image break:** `4rem` top/bottom margin outside a `90vh` block (v3 uses
  `60vh` — a tighter breath).

**Content width:** `.chapter` maxes at `720px` centered. Prose-reader width,
not app width. Hero content maxes at `900px`.

**Don't tighten these casually.** If the page feels "empty," that is the
intended state. Adding more content is the fix, not reducing the padding.

## Layout

- **Approach:** **Single-column, center-aligned, prose-width.** No grid system
  beyond the profile section.
- **Grid:** Only one appearance — `.profile-inner` uses
  `grid-template-columns: 280px 1fr; gap: 5rem` for the photo-then-bio layout.
  Collapses to single column at 768px.
- **Max content width:** 720px for reading sections; 900px for hero; full-bleed
  for image-break and sessions sections.
- **Hero:** `min-height: 100vh` (`100svh` on mobile to handle iOS browser
  chrome). Flex column, centered vertically. Background image with a cream
  left-to-right gradient at 0.8 → 0.2 opacity to preserve text legibility.
- **Image-break:** 90vh, parallax (`background-attachment: fixed`), slight
  grayscale + contrast bump, inset shadow. On iOS / touch (`@media (hover:
  none)`), attachment falls back to `scroll` — fixed attachment crashes Safari.
- **Sessions surface:** Full-bleed warm-black band with a nested `.chapter`
  inside. The only dark surface on the page.
- **Border radius:** **`2px` everywhere.** Deliberately sharp, not rounded.
  This is a deliberate anti-"modern SaaS" choice — do not bump it.

## Motion

- **Approach:** **Minimal, functional, respect-first.** No scroll-driven
  animation, no parallax wizardry beyond the single background-attachment,
  no loaders, no bouncy easing.

- **Tokens:**
  - `--transition-slow: 0.8s cubic-bezier(0.4, 0, 0.2, 1)` (v1) —
    v3 uses `1.2s` instead. v1 is canonical.
  - `--transition-med: 0.4s cubic-bezier(0.4, 0, 0.2, 1)` (v1) —
    v3 uses `0.6s`. v1 is canonical.

- **Entrance animations:**
  - Hero: `fadeInPresence` keyframe — `translateY(20px) → 0` over
    `--transition-slow` on load.
  - Chapters & session cards: IntersectionObserver-driven fade-up
    (`translateY(30px) → 0`, 0.8s, same bezier), triggered at 5% visibility with
    `-40px` rootMargin.

- **Interaction:**
  - Session cards: on hover, lift by 5px, border color shifts to `--gold`, bg
    lightens by 3%. **Disabled on mobile** — hover "sticks" on touch devices.
  - WhatsApp button: fill inversion on hover (warm-black bg, cream text).
  - Paragraphs: subtle color shift on hover — subdued → warm-black.
  - Text links: `opacity: 0.7` on hover (works with the underlined sea-color
    treatment).

- **`prefers-reduced-motion: reduce`:** **Hard-stop** — all animations and
  transitions collapsed to `0.01ms`. Non-negotiable. Users with vestibular
  sensitivity get a static page. Don't regress this.

- **`scroll-behavior: smooth`:** Only applied when `prefers-reduced-motion:
  no-preference`.

## Glassmorphism

Used **sparingly**. This is not a "glass app" — glass is a utility for ONE
thing: the fixed lang-toggle chip in the top-right.

Tokens:
- `--glass-bg: rgba(250, 248, 245, 0.7)`
- `--glass-border: rgba(45, 42, 38, 0.05)`
- `--glass-shadow: 0 8px 32px 0 rgba(45, 42, 38, 0.08)`
- `--blur-amount: 12px`

**Utility class:** `.glass-panel` applies all four. Available for future
sticky nav / floating CTA if needed. **Do not scatter glass around** — its
scarcity is what makes the one occurrence feel intentional.

The lang-toggle itself uses a darker variant (`rgba(45, 42, 38, 0.55)` bg,
`blur(8px)`) because it sits over bright hero imagery and needs contrast.

## Photography

- **Hero (v1):** `sunset.jpeg` — warm dusk shot, used with a left-to-right cream
  gradient overlay at 0.8→0.2 so text is legible on the left.
- **Hero (v3):** `nano_banana.png` — AI-generated "Nano aesthetic" image with a
  135° gradient overlay. Treat as experimental; v1's sunset is the canonical
  choice unless/until v3 is adopted.
- **Image-break:** `george cataluna.jpeg` — portrait, parallaxed, with
  `filter: grayscale(20%) contrast(1.05)` and an inset shadow.
- **Profile photo:** `filter: grayscale(15%)`, 3:4 aspect on desktop, round
  (160px, 1:1) on mobile.

**Treatment rules:**
- All feature photography gets **15-20% grayscale** and a **~5% contrast
  bump**. This desaturates the Instagram-spiritual cliché out of the images
  and aligns them with the muted palette.
- Never full-color saturation. Never bright sunset filters. Never bokeh.
- Photo metadata (alt text) must work for both EL and EN — write alt with
  `data-lang` spans when photos are decorative-with-content.

## Bilingual (EL / EN)

- **Primary language:** Greek (`<html lang="el">` and `<body class="lang-el">`).
- **Toggle:** Fixed top-right chip with `Ελ / En` buttons.
- **Mechanism:** Each bilingual element uses two siblings:

  ```html
  <span data-lang="el">Ελληνικό κείμενο</span>
  <span data-lang="en">English text</span>
  ```

  Visibility is controlled by CSS scoped to `body.lang-el` / `body.lang-en`:

  ```css
  body.lang-en [data-lang="el"]:not(.lang-btn) { display: none; }
  body.lang-el [data-lang="en"]:not(.lang-btn) { display: none; }
  ```

  JS (`setLang(lang)`) swaps the body class and updates the active button.

- **Why not i18n routing (`/el/`, `/en/`):** This is a one-page site; the client
  JS toggle keeps URL sharing simple and avoids a build step. If the site grows
  past one page, revisit (static site gen with locale routes would be cleaner
  for SEO).

- **SEO caveat:** Google currently only indexes the default rendered state
  (Greek). If English SEO matters, either pre-render both languages at build
  time, or add `hreflang` alternates pointing at `?lang=en` query variants.
  Flag for the SEO audit in `todo.md`.

## Accessibility

- **Motion:** `prefers-reduced-motion: reduce` collapses all animation.
- **Touch:** `touch-action: manipulation`, tap-highlight suppressed, lang-toggle
  buttons expand to `44×44` min on mobile.
- **Color contrast:** `--warm-black` on `--cream` = 10.8:1 (AAA). Gold on cream
  = 3.4:1 — borderline for body (fails AA for small text) but **only used for
  labels with `0.3em` letter-spacing that function as decorative headers**, not
  as prose. Keep it that way. `--muted` (80% warm-black) on `--cream` and on
  the footer's `#f0ede9` both pass WCAG AA with comfortable margin (~6.8:1) —
  bumped from 50% on 2026-04-26 after a footer contrast failure on PageSpeed.
  The first bump to 70% computed at 4.99:1, just under Lighthouse's threshold
  in practice, so it was pushed to 80% for a robust pass.
- **Small viewport units:** Hero uses `100svh` on mobile to dodge iOS Safari's
  browser-chrome recalculation.
- **iOS background-attachment fallback:** `@media (hover: none)` swaps fixed
  attachment for scroll on hero + image-break.

## Spacing Scale (derived, not explicit)

The CSS doesn't formalize a scale, but values cluster around:

- 2xs: `0.25rem` (4px) — chip gaps
- xs: `0.5rem` (8px) — tight spacing
- sm: `1rem` (16px) — default
- md: `1.5rem` / `2rem` (24–32px) — padding inside cards
- lg: `3rem` / `4rem` (48–64px) — vertical section rhythm (small)
- xl: `5rem` (80px) — aside margin
- 2xl: `8rem` (128px) — chapter padding (the signature)
- 3xl: `10rem` (160px) — contact section

If a formalized scale is wanted later, adopt a 4-based modular scale and
replace these ad-hoc values.

## Decisions Log

| Date       | Decision | Rationale |
|------------|----------|-----------|
| 2026-03-14 | Switch from Unsplash to local photos in `photos/` | Asset control, avoid external dependency, match literary tone |
| 2026-03-14 | Glassmorphism for lang-toggle only | Scarcity as signal |
| 2026-03-28 | v3 "Nano Banana" aesthetic variant spun up | Explore AI-generated hero; slower motion; keeping as branch variant, not replacing v1 |
| 2026-04-22 | Extracted DESIGN.md from existing CSS | Lock the system before any more visual work. Project also moved out of LifeOS vault to standalone repo. |
| 2026-04-26 | Bump `--muted` opacity from 0.5 to 0.8 | Footer text failed WCAG AA contrast on PageSpeed audit; 0.7 computed at 4.99:1 still failed in practice, 0.8 lands at ~6.8:1 |

## Unresolved / Future Decisions

Items that came up during extraction that need a human decision:

- **v1 vs v3 reconciliation.** Two live variants exist. v1 (`index.html` +
  `style.css`) is the shipping candidate per `todo.md`. Decision: port any
  wanted v3 refinements (hero sizing, vertical nano-badge, verify-link icon)
  into v1 and retire `v3/`.
- **Sessions section content.** `todo.md` notes "add a section below Presence
  with the sessions (black)" — already present in current `index.html`. Verify
  that's what's meant.
- **Domain + deploy target.** `stillrhodes.com` is TBD. Host (GitHub Pages,
  Netlify, Cloudflare Pages) is TBD. Affects asset paths (`og:image`
  absolute URL).
- **English SEO.** Client-side lang toggle means English content is
  effectively invisible to search. Decide if this matters.
- **Image optimization.** JPEGs are not WebP; no responsive `srcset`. Per
  `todo.md`.
- **Self-hosted fonts vs Google Fonts CDN.** Current: Google Fonts CDN. Future:
  consider self-hosting for privacy + perf.

---

*When updating this document: change tokens here FIRST, then propagate to
`style.css`. If the code drifts from this file, this file is the bug.*
