# oa.log — Design System

Visual system for Osvaldo's personal site (`oa.log`).

> **Concept:** `oa.log` is **Osvaldo's log**. A single chronological feed where every entry is a `build`, `write`, `talk`, or `make`. The visual system backs it: editorial, technical, undecorated, everything numbered like a technical manual.

> Distinct from the matchbox/stage system (lime green + Instrument Serif) used elsewhere under the Creators Crate umbrella. Here in `oa.log` the language is its own: monochrome + a single red, pure neo-grotesque sans, tabular layouts.

---

## 1. Color

Six tokens, two modes (light/dark with parity).

```css
/* light mode (default) */
--ink-900: #131313;   /* primary text */
--ink-700: #1A1A1A;   /* dark secondary */
--ink-500: #474747;   /* medium · dim */
--ink-300: #BCBCBC;   /* dividers · placeholders · tertiary text */
--ink-100: #D5D5D5;   /* secondary surfaces · card backgrounds */
--paper:   #F4F4F2;   /* base background (slightly warm vs pure #FFF) */
--accent:  #FF202B;   /* single accent · use SPARINGLY */
```

```css
/* dark mode */
--ink-900: #F4F4F2;
--ink-700: #BCBCBC;
--ink-500: #888888;
--ink-300: #474747;
--ink-100: #1A1A1A;
--paper:   #0E0E0E;
--accent:  #FF202B;   /* same in both modes */
```

**Red accent rule:** maximum 1–2 appearances per screen. Valid uses: heart on "like", focus rings, "now/current" indicator, active dot in dot navigation. Never as a large background nor in body copy.

---

## 2. Typography

**One single family: `PP Neue Montreal`** (Pangram Pangram foundry, ~$199 desktop license). Recommended free fallback: **Geist** (Vercel) or **Inter Display**.

```css
--font-display: 'PP Neue Montreal', 'Geist', 'Inter Display', system-ui, sans-serif;
--font-mono:    'PP Neue Montreal Mono', 'Geist Mono', ui-monospace, monospace;
```

8-step scale:

| Token | Size | Line-height | Use |
|---|---|---|---|
| h1 | 100px | 104px | Single hero on the cover |
| h2 | 72px | 84px | Page/project titles |
| h3 | 48px | 58px | Large subsections · TOC numbers |
| h4 | 36px | 43px | Card headlines |
| h5 | 24px | 30px | Sub-headlines |
| h6 | 18px | 25px | Large eyebrows · leads |
| h7 | 14px | 21px | Body · meta · nav |
| h8 | 12px | 16px | Captions · small metadata |

Letter-spacing: **0** by default. Optionally `-0.01em` on h1–h2 to tighten.

Weights: **Regular (400) and Medium (500) only.** Never 700 bold on display — the regular weight already has presence.

**Signature typographic move:** *one dominant word per line* in hero. Almost poster-like verticality ("Archive / Market / Studio" stacked).

---

## 3. Grid

**Desktop:** 12 columns of 96px, 1318px container in a 1366px viewport. Gutters 24px outer / 15px inner.
**Mobile:** 4 columns of 75px, 330px container in a 360px viewport. Gutters 15px outer / 10px inner.

```css
.container { max-width: 1318px; margin: 0 auto; padding: 0 24px; }
@media (max-width: 768px) { .container { padding: 0 15px; } }
```

Vertical spacing: multiples of 8px (8, 16, 24, 32, 48, 64, 96, 128). Major blocks separated by 96–128px.

---

## 4. Iconography

4 custom, minimalist icons:

| Icon | Use | Color |
|---|---|---|
| `♥` filled heart | Like / favorite | `--accent` |
| `→` standard arrow | Links, "see more", CTAs | `--ink-900` |
| `→` elongated arrow | Emphasis · transitions | `--ink-900` |
| `+` plus | Add, expand, open | `--ink-900` |

**No emoji. No Tabler.** Only these four + occasional utilities (bicolor mode toggle, language toggle).

---

## 5. Layout patterns

### 5.1 Numbering as a system
**Everything is numbered.** Sections, case studies, table items, chapters. The number is part of the design, not decoration.

```
Intro                                          01
Home page                                      02
Contact                                        03
```

Name on the left in h2–h3, number on the right at the same size, right-aligned. Optional hairline divider below.

### 5.2 Table as the dominant element
Projects, talks, writings, etc. are listed as tables with hairline rules:

```
Filter: by newest    [All] [App] [Identity] [...]    35 of 35    ☰  ⊞

no.    project name        category         date         →
1      PKP Intercity       App              2022.05.21   →
2      Kraken              Typography       2021         →
3      Sanodental          Website          2021         →
```

Columns: index · name · type · date · arrow. Rows with generous vertical padding (16–24px), hairline divider, arrow as a link affordance.

### 5.3 Filter chips
Rounded pills, thin border, transparent. Active chip has `--ink-900` fill and `--paper` text.

```css
.chip { padding: 6px 14px; border: 1px solid var(--ink-300); border-radius: 999px; font-size: 14px; background: transparent; }
.chip[aria-pressed="true"] { background: var(--ink-900); color: var(--paper); border-color: var(--ink-900); }
```

### 5.4 Hero pattern (project/section page)
```
[Title: h1–h2, one dominant word]
[breathing ~48px]
[hairline divider]
[meta row with 3 columns: Date | Programs | Category]
[content]
```

### 5.5 Document / case-study pattern
Technical manual–style layout:
- Chapter letters (A, B, C, D, E)
- Tabular tables with hairlines
- Parallel numbering (01, 02, 03…) and alphabetical (A, B, C…) at different levels
- Color swatches with HEX/RGB/CMYK values when applicable

### 5.6 Top nav (signature)
- **Left:** monogram logo
- **Center-left:** ES/EN toggle + heart count (optional)
- **Center-right:** contact (phone + email)
- **Right:** right-aligned vertical menu, max 5 items, font-size h7–h8, no separators
- **Mode toggle:** bicolor half-light/half-dark circle, next to the menu

The right-aligned vertical menu is very signature — items stacked, no underline.

---

## 6. Motion

Minimal. Identity does NOT come from animation — it comes from typography and layout.

| Element | Duration | Easing |
|---|---|---|
| Link hover | 160ms | ease-out |
| Filter chip toggle | 180ms | ease-out |
| Page transitions | 280–360ms | cubic-bezier(0.7, 0, 0.3, 1) |
| Theme toggle | 200ms | ease |
| Table row hover | 140ms | ease-out (subtle bg) |

**One exception:** the hero h1 may have a letter-by-letter or word-by-word reveal on first paint (200–400ms stagger). Only on the main cover, not on every page.

---

## 7. Light/Dark mode

Parity is mandatory. Both modes are primary, not one as an afterthought. Bicolor toggle in the nav, persistence via `localStorage`.

> **Gotcha:** when embedded in a host environment (Claude widgets, dashboards, iframes) the host's base CSS may set `color` on `h1/h2/h3` via theme variables. Always override headings explicitly:
> ```css
> h1, h2, h3, h4 { color: var(--ink-900); }
> ```
> Otherwise display type may render with the host's text color and become invisible against `--paper`.

---

## 8. Identity decisions

1. **Hero word:** `oa.log` anchors the cover. The period (`.`) is rendered in `--accent` red — that's the brand mark inside the wordmark.
2. **Log categories:** the main table's filter chips are **`build` · `write` · `talk` · `make`**. They cover code, writing, talks, and visual content respectively.
3. **Red accent (`#FF202B`):** restricted to — heart (likes/favorites), "now" indicator (most recent entry), focus rings, error states, hero's final punctuation, "Next" badge on Stage card.
4. **Logo:** vertical stack monogram of `oa` inside a 28px rounded square with 1.5px stroke. Hover rotates -90° and turns red. A more refined mark is pending a dedicated design pass.
5. **Bilingual:** ES/EN toggle. Audience and content are bilingual; content defaults to Spanish (es-MX) on the index.

---

## 9. Intentional exclusions

- Large custom cursor / scroll-triggered marquees / playful effects — omitted by default. Add later only if justified by a use case. (A small lerped red cursor follower is permitted on desktop as an exception, with `prefers-reduced-motion` support.)
- E-commerce / shop — does not apply.
- Giant page-number watermark in margins — optional for internal project detail, not on home.
- Drop shadows, gradients, glows — banned. The identity is flat.
- Skeuomorphic textures, paper grain, film grain — banned.

---

## 10. Stack and structure

Static site generated with **Hugo** (v0.140.2 extended), deployed to GitHub Pages via Actions.

```
oa.log/
├── hugo.toml                              ← config: permalinks, params, taxonomies
├── archetypes/default.md                  ← `hugo new content` template
├── content/
│   ├── _index.md                          ← home
│   ├── blog/                              ← writes (essays, notes)
│   │   ├── _index.md
│   │   └── *.md
│   └── stage/                             ← talks (keynotes, workshops)
│       ├── _index.md
│       └── *.md
├── layouts/
│   ├── _default/baseof.html
│   ├── index.html
│   ├── partials/{head,topnav,footer,scripts}.html
│   ├── blog/{list,single}.html
│   └── stage/{list,single}.html
├── assets/css/main.css                    ← shared styles (Hugo fingerprinted)
├── static/                                ← unprocessed assets, served at /
│   └── stage/<slug>/keynote.html          ← Reveal-style decks
├── .github/workflows/hugo.yml             ← build + deploy to GitHub Pages
├── DESIGN_SYSTEM.md                       ← this file
├── profile.json                           ← identity source of truth
└── README.md
```

Adding content is `hugo new content blog/x.md` or `hugo new content stage/x.md`. The archetype seeds the right frontmatter (title, slug, entry_kind, etc.). Push to main → Actions builds Hugo → deploys.

**Why Hugo over a single flat HTML or Next.js:** Hugo gives us per-entry pages and an RSS feed with zero JavaScript, and the build is fast enough that "publish" stays a `git push` away. Next.js was overkill for a personal log; flat HTML hit its ceiling once we needed three blog posts and three stage pages with consistent chrome.
