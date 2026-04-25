---
description: Pending tasks and goals for Rhodes Meditation
---
# 📋 Rhodes Meditation — Task List

## ▶️ Resume here (2026-04-22 checkpoint)

**State:** Design system extracted into `DESIGN.md`, scroll-reveal visibility
bug fixed, George's name spelling corrected. Main is at 6 linear commits. No
uncommitted work.

**Decisions pending from Yorgos:**
1. **Domain.** Is `stillrhodes.com` registered? If not, decide: register it or
   pick a different domain?
2. **Hosting.** GitHub Pages / Netlify / Cloudflare Pages — pick one. Affects
   deploy skill config.
3. **v3 retirement.** DESIGN.md recommends retiring `v3/` folder and porting
   any wanted refinements (hero sizing, `.verify-link` pattern) into v1.
   Confirm or keep v3 around?
4. **Memorable Thing in DESIGN.md** — I wrote "the page should feel like a
   held breath." Confirm or rewrite.

**Next session options:**
- **Ship path** (needs decisions above): `/design-review` → `/benchmark` →
  `/setup-deploy` → `/ship` → `/land-and-deploy` → `/canary`. Gets Rhodes
  live.
- **Pipeline run #2:** Pick another friend/family page. Exercises the
  build-from-brief path instead of the extract-existing path. Better for
  codifying the skill before shipping Rhodes alone.
- **Small cleanup:** LifeOS vault has ~55 pending deletions from the Apr 22
  move — scoped commit takes 30 seconds.

## 🎯 P1: Design & Content (existing)
- [ ] Add Yoga Alliance logos to the footer (credentialing badges).
- [ ] SEO Audit: Check all meta tags and descriptions across versions.
- [ ] Image Optimization: Convert large JPEGs to WebP for performance.
- [ ] Language Consistency: Final proofread of Greek and English translations.
- [x] Fix name spelling: Αναννιάδης → Ανανιάδης (done 2026-04-22, commit
  `eca0b3f`).
- [x] Fix scroll-reveal visibility bug so above-fold content renders at load
  (done 2026-04-22, commit `ebf7d26`).
- [x] Tighten existing JSON-LD: added `knowsLanguage`, `sameAs` and
  `worksFor` on Person; pointed credential `url` at George's verifiable
  Yoga Alliance profile (done 2026-04-26).
- [x] Audit JSON-LD against Google's search-gallery rich-result types;
  added `WebSite` node, `Person.alumniOf` (Amrita School), `serviceType`
  on both Services, `availableLanguage` on LocalBusiness, and a second
  image. Skipped Course/Event/FAQ/Review/Video/Breadcrumb — would have
  fabricated content (done 2026-04-26).

## 🎯 P2: Deployment
- [ ] Choose Hosting (GitHub Pages / Netlify / Cloudflare Pages).
- [ ] Configure Domain (stillrhodes.com if/when ready).
- [ ] Final Mobile Responsiveness test.
- [ ] Set up email forwarding via **ImprovMX** (free tier):
  `giorgos@stillrhodes.com` → `littlebits.rodos@gmail.com`. Add ImprovMX's
  MX + SPF records at the registrar, configure the alias in ImprovMX
  dashboard, verify end-to-end. Decide later whether to upgrade to
  Premium ($3/mo) for SMTP send-as, or keep receive-only.
- [ ] After ImprovMX is live, add a DMARC TXT record so the domain isn't
  trivially spoofable. Minimum viable:
  `_dmarc.stillrhodes.com  TXT  "v=DMARC1; p=none; rua=mailto:giorgos@stillrhodes.com"`.
  `p=none` is monitor-only — safe default; tighten to `quarantine`/`reject`
  later once the `rua` reports show no legitimate senders are being missed.

## 📝 Deferred
- Resolve v1 vs v3 reconciliation (see DESIGN.md "Unresolved" section).
- Replace `og:image` with absolute URL before deploy (`photos/PHOTO-...`).
- Consider self-hosted fonts instead of Google Fonts CDN (privacy + perf).
- English SEO strategy (current client-side lang toggle hides EN from
  crawlers — may not matter, decide before deploy).
- Schema.org expansion: model the two session offerings (Group €10/60min,
  Private "upon arrangement") as `Service`/`Offer` entries. **Done 2026-04-26**
  — both Services live in the @graph with `serviceType: "Meditation instruction"`.

---
next time (Yorgos's original notes):
- index.html δουλεύουμε
- να βάλουμε κάτω από την παρουσία το sectiον με τις συνεδρίες (μαύρο)
  → done, the sessions section is in index.html
