---
name: write-article
description: >-
  Rules for writing short, human-written learning articles in ~/matt-learning. Activate whenever
  creating, editing, or auditing an article in matt-learning.
---

# Writing Learning Articles (`matt-learning`)

Write every article in `~/matt-learning` as a **short, conversational human essay** (~3–4 sections, ~150–250 lines total) using `~/matt-learning/funnel-transformer.html` (`template2.html`) as the reference pattern.

## 1. Narrative & Prose Style

- **Introduce the subject first in plain English**: Right under `<h1>`, open with 2–3 short paragraphs explaining *what* the subject is, *why* standard approaches waste effort or fail, and the core idea in plain words before showing any math.
- **No front-loaded clutter**: Never include a `TL;DR` box, symbol table, fast-forward quiz, table of contents, or UI tip banner.
- **Connected prose, not bullet-list fact dumps**: Explain how and why things work in flowing paragraphs with natural transitions (*"Here is the catch..."*, *"Why? Because..."*). Do not outsource explanations to bullet lists or multi-column "equation anatomy" tables.
- **Human voice, zero AI tells**: Write directly and plainly. Avoid em-dash overuse, "delve", "crucial", "landscape", hype adjectives, excessive bolding, or pedagogical meta-jargon ("Stage 1", "Predict-Observe-Explain", "Contrastive Matrix").

## 2. Interactive Elements to Include

1. **Clickable `.term` Popovers on Concepts & Symbols**:
   - Wrap every non-obvious technical term, acronym, AND mathematical symbol/variable in `<span class="term" data-term="key">...</span>` and define it in `var GLOSSARY = {...}` in plain English.
2. **1–2 Short Worked Examples (`.worked`) with Clean Mental Math**:
   - Trace the core mechanism with **distinct, non-repetitive numbers** small enough to compute in your head without a calculator (use perfect squares like $d_k \in \{4, 9, 16\}$ for $\sqrt{d_k}$, and powers of $1/2$ with $\log_2$ for logs/entropy).
3. **3–4 Collapsed MCQs Placed Along the Way**:
   - Place a `<details class="mcq-box" data-correct="B" data-topic="Check 1: ...">` right after each key section to test understanding (mental math only, no calculator). Put `data-explain="..."` on every `<label class="mcq-option">`.
   - Include `<div class="score-bar"></div>` and `<div class="interactive-card" id="spaced-widget"></div>` at the bottom of `<main>`.
4. **Clean E-Ink SVG Diagrams (`.figure-box`) When Helpful**:
   - Whenever an architecture, spatial mechanism, or matrix pattern (such as sliding-window vs. global attention, pooling blocks, or routing) is easier to grasp visually, include 1–2 high-contrast black-and-white inline `<svg>` diagrams inside `<div class="figure-box">`.
5. **Compare & Contrast Table Near the End**:
   - Include a `<div class="table-wrap"><table>...</table></div>` comparing the main variants or related approaches across practical decision axes (Mechanism, Tradeoff / Failure Mode, When to Use).
6. **Spaced-Repetition Cards (`var SPACED_CARDS = [...]`)**:
   - Define 4–6 concise Q&A pairs at the bottom of `<script>` for the SRS deck.

## 3. Shared Assets & Publishing

- Load local KaTeX (with CDN `onerror` fallback), `<link rel="stylesheet" href="common.css">`, and `<script src="common.js"></script>` in `<head>`. Never add a `<header>` tag in `<body>` (`common.js` injects it).
- Add new articles to `~/matt-learning/index.html` and `sw.js` (bump `CACHE_NAME`), commit and push to `main`, and return the live URL (`https://tabletmatt100.github.io/matt-learning/<filename>`).
