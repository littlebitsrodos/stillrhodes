# Agent Memory: Rhodes Meditation

## 🧠 Canonical Source

**Design decisions: read `/DESIGN.md` (root of repo).** That file is the source
of truth for all visual tokens, typography, color, spacing, motion, and the
bilingual pattern. Do not re-derive those here.

**Project conventions: read `/CLAUDE.md`.**

This file is now just for short-form notes that don't belong in either of
those — session-by-session drift, user preferences, things in flight.

## 🧭 Tone & Voice

- Philosophical, minimalist, professional yet accessible.
- Keywords: topology of mind, non-judgment, presence, silence.
- When writing copy: short sentences, concrete sensory nouns, no wellness
  clichés (no "journey," no "transform," no "unlock your best self").

## 📜 Session Log

- **2026-03-14:** Large refactor. Switched from Unsplash to local photos.
  Implemented LifeOS project standards.
- **2026-03-28:** V3 launch — Nano aesthetic variant, AI-generated hero,
  slower motion. Not adopted as canonical.
- **2026-04-22 (session 1):** Moved project out of LifeOS vault to standalone
  git repo at `/Users/littlebits/Developer/rhodes-meditation/`. Extracted
  full design system into `DESIGN.md`. Added root `CLAUDE.md` pointing at
  it. Cleaned up stale Rhodes Meditation remnants in costomenu-brain (half-
  finished PARA-isolation cleanup from March). First run of the landing-page
  pipeline Yorgos is building for client work.
- **2026-04-22 (session 2):** Fixed two pre-ship defects: scroll-reveal
  visibility bug (chapters invisible to crawlers / non-scrolling users —
  commit `ebf7d26`) and George's surname misspelling in index.html
  (`eca0b3f`). Merged both branches to main; 6 linear commits. See
  `/todo.md` "Resume here" for next-session pointer.
