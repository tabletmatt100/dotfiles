---
name: write-article
description: >-
  Comprehensive pedagogical, narrative prose, UI/E-ink, and publishing rules for creating or editing
  interactive learning articles in ~/matt-learning. Activate whenever writing, updating, or auditing
  an article in matt-learning.
---

# Writing Interactive Learning Articles (`matt-learning`)

Every article in `~/matt-learning` (`/data/data/com.termux/files/home/matt-learning`) must read like an engaging, human-written technical essay (in the spirit of Chris Olah, Andrej Karpathy, Jay Alammar, or Sebastian Raschka) paired with interactive mental-math checks—and must be optimized for both the **Onyx Boox Go 10.3** E-ink tablet and the **Onyx Boox Palma 3** pocket E-ink reader.

Use `~/matt-learning/template2.html` as the structural reference template, and keep articles **tight, narrative-driven, and punchy** so every paragraph and widget earns its space.

---

## 1. Non-Negotiable Writing & Narrative Rules (No Fact-List Dumps!)

1. **Always Introduce the Subject First in Plain English (No Front-Loaded Jargon Dumps)**
   - **NEVER** open an article with a 4-bullet `TL;DR` full of unexplained symbols, a front-loaded Symbol Table, a Fast-Forward Quiz, or a Table of Contents before introducing the subject.
   - **Rule:** Right below `<h1>`, open immediately with **2–3 short, conversational paragraphs** that introduce the subject from first principles:
     1. **What is this topic and why does it exist?** Ground it in a real phenomenon, intuition, or practical problem before naming any paper mechanisms or formulas.
     2. **What is the standard approach and where does it hit a wall?** Explain the specific pain point or bottleneck that forced people to invent this technique.
     3. **What is the core insight in plain words?** State the central idea in one clean sentence without raw symbolic notation.
   - If you include a summary box at the top, keep it to a **2–3 sentence plain-English framing note** (no formulas or symbol soup)—or let the opening paragraphs do the job directly.
   - **Never put a Symbol Table, Fast-Forward Diagnostic, or Table of Contents at the top of the article.** Introduce symbols inline in prose at the exact moment they are first needed (every symbol already has a clickable `.term` popover).

2. **Write Connected Prose Paragraphs, Not Bullet Lists of Facts**
   - AI-generated articles often read like a Wikipedia summary or a checklist of disconnected facts wrapped in `<ul>` / `<ol>` bullets.
   - **Rule:** Explain concepts through **flowing prose paragraphs with causal transitions** (*"That fixes the memory bill, but it creates a second headache when..."*, *"Wait—why not just average the tokens first?"*).
   - Use bullet lists **only** when comparing 2–3 genuinely parallel cases (e.g., *Case A vs. Case B* in a contrasting prediction setup) or listing steps inside a `.worked` arithmetic trace. Never use a bullet list as a substitute for narrative explanation.

3. **Anchor the Entire Article in One Continuous Concrete Scenario**
   - Instead of inventing a brand-new abstract array of numbers in every section, introduce **one intuitive running scenario** early (e.g., a 3-tile warehouse robot hallway, a loan default table, or a 4-token review sentence) and carry that same scenario through the entire article as each new complication arises.

4. **Strip Pedagogical Meta-Jargon from Headings and Widget Labels**
   - Never expose instructional-design rubric terms to the reader.
   - **Banned visible labels:** `"Stage 0"`, `"Stage 1"`, `"Predict-Observe-Explain (Contrasting Cases First)"`, `"Discrete Stepper + Persistent Small Multiples"`, `"Backward-Faded Worked Example"`, `"Micro-Prediction Gate"`, `"Contrastive Matrix"`.
   - Use natural, topic-specific labels instead: `"Quick Prediction"`, `"Try It By Hand"`, `"Step-by-Step Comparison"`, `"Interactive Explorer"`, `"When to Use What"`.

5. **Zero AI Tells, Human Voice**
   - Write like a sharp colleague explaining something at a whiteboard: plain, direct, varied sentence lengths, concrete opinions, and honest caveats about where a method fails in practice.
   - Avoid AI tells: em-dash overuse, "delve", "crucial", "landscape", "it's important to note", "In conclusion", "Let's dive in", rule-of-three padding, emoji, hype adjectives, excessive bolding, and every section ending in a neat summary.

---

## 2. Non-Negotiable Personal & UI Preferences

1. **No Calculator Required for Any Question (Clean-Root & Base-2 Mental Math)**
   - Every prediction hook, worked example, inline faded step, retrieval prompt, and MCQ must be solvable mentally without a calculator.
   - Use clean, mental-math-friendly numbers: small integers, simple fractions, powers of 2 or 10, clean percentages (10%, 25%, 50%), or test conceptual reasoning directly.
   - **Clean square roots:** When a formula divides by $\sqrt{d_k}$ or $\sqrt{n}$, pick $d_k \in \{4, 9, 16\}$ so $\sqrt{d_k} \in \{2, 3, 4\}$ divides integers cleanly by hand.
   - **Base-2 dyadic fractions for logs/entropy/KL:** When tracing log-probabilities, entropy, or KL divergence by hand, use powers of $\frac{1}{2}$ (e.g. $\frac{1}{2}, \frac{1}{4}, \frac{1}{8}, \frac{1}{16}$) with $\log_2$ (bits) or clean integer nats so every log is an exact integer ($-\log_2 P \in \{1, 2, 3, 4\}$) with zero 4-decimal float clutter.

2. **Distinct Numbers in Worked Examples (Easy to Trace)**
   - Use distinct, non-repetitive numbers in worked examples so every element's path through the computation is unambiguous—for example, a matrix like `[0, 1, 2; 3, 4, 5]` instead of `[1, 1, 0; 0, 0, 1]` where repeated `0`s and `1`s hide which row/column contributed to the result.
   - Keep those distinct numbers small enough to compute mentally without a calculator.

3. **All Concepts and Symbols Must Be Clickable with Anchored Popovers**
   - Every non-obvious concept, technical term, acronym, prerequisite, AND every mathematical symbol, variable, or operator (in prose and equations) must be clickable (`.term[data-term]`).
   - Clicking any concept or symbol must open an anchored popover explaining what it means in plain English (with nested `.term` links inside popover definitions when helpful), without a full-screen backdrop so the page remains visible.

4. **E-Ink & Minimal UI (Boox Palma 3 & Go 10.3)**
   - Black and white E-ink styling with zero animations/transitions, sized cleanly for the Boox Palma 3 (`~360–412px` width).
   - Matt is the sole viewer and knows how everything works: never add boilerplate tip banners explaining how to tap underlined terms, never add topic/device tags (`<span class="tag">`) at the top of articles, keep designs as minimal as possible, and prefer icon buttons.

---

## 3. Pedagogical Mechanics (Woven Naturally Into the Story)

1. **Concrete Clash & Intuition *Before* the Formal Equation**
   - Never open a section by dropping a symbolic equation out of nowhere.
   - First show the concrete tension or a 2-case numerical clash in your running story where the naive approach fails, and ask the reader to predict what happens. State the general equation only *after* the reader has seen the numbers work.
2. **Explain Every Piece of an Equation (and What Breaks Without It)**
   - When you introduce a primary equation, explain in plain prose (or a clean, non-boilerplate breakdown) what each piece is doing and what numerically breaks, saturates, or cheats if you remove it.
3. **Interactive Finish-the-Step Inside Worked Examples**
   - When a `.worked` box solves 100% of the arithmetic passively, readers skim past it. Let the worked example walk through Steps 1–2 with distinct numbers, and let the reader punch in the final 5-second mental-math number (`[input] [Check]`).
4. **Commit Before Playing With a Simulator**
   - Preceding an interactive chart or slider with a quick 10-second numerical or directional prediction (plus an `"I'm not sure — show me"` button) turns passive slider-dragging into an active test of understanding.
   - Keep discrete preset buttons (`Step 1 | Step 2 | Step 3`) and side-by-side small multiples so the reader can see the comparison even without dragging a slider.
5. **Palma-Friendly Checks at the End**
   - End the article with a concise **"When to Use What" comparison table**, 2–3 fast auto-graded mental-math / boundary checks (no long essay `<textarea>` boxes that are painful to type on a Palma 3), and collapsed `<details class="mcq-box">` diagnostic questions.
   - Export **5–8 spaced Q&A recall prompts** (`var SPACED_CARDS = [...]`).

---

## 4. Natural Article Flow (The 5-Part Story Arc)

1. **Part 1 — The Plain-English Hook & Running Scenario**
   - 2–3 paragraphs right under `<h1>`: What is this topic, what everyday or engineering bottleneck created it, and what is the core idea in plain English?
   - Introduce the concrete running scenario and let the reader make a quick first prediction on why the naive baseline fails.
2. **Part 2 — The Core Mechanism (Numbers First, Then the Formula)**
   - Walk through how the mechanism fixes that failure using the running scenario's distinct mental-math numbers (with a quick inline finish-the-step input).
   - Then write down the general formula and explain in natural prose what each piece does and what breaks if you delete it.
3. **Part 3 — The Second Complication & Interactive Comparison**
   - Every good technical story has a second act: *"Fixing X created a new trade-off Y—here is how the full method handles it."*
   - Pair with a discrete step-by-step visual comparison (`small-multiples` + interactive explorer preceded by a quick prediction).
4. **Part 4 — Hands-On Practice & Edge Cases (Where It Breaks)**
   - Explain honestly where this method fails in practice, paired with a faded practice problem and 2 fast auto-graded boundary checks.
5. **Part 5 — "When to Use What" Table & Diagnostic MCQs**
   - A clean decision table comparing alternatives, followed by collapsed `<details class="mcq-box">` checks (with `data-explain` on every option) and `var SPACED_CARDS = [...]`.

---

## 5. Shared Assets, Technical Implementation & Publishing Workflow

- **Shared `common.css` and `common.js`**:
  - Every article must load `<link rel="stylesheet" href="common.css">` and `<script src="common.js"></script>` in `<head>` (right after the KaTeX tags). Do not add a manual `<header>` bar in the HTML body (`common.js` injects the top bar automatically).
  - Each article's `<script>` only defines its `var GLOSSARY = {...}`, its `var SPACED_CARDS = [...]`, and its page-specific interactive widget functions.
- **Offline + Online KaTeX**: Load from local `katex/` with `onerror` fallback to jsDelivr.
- **Collapsed MCQs by default**: Wrap every MCQ in `<details class="mcq-box" data-correct="B" data-topic="...">` with `<label class="mcq-option" data-explain="...">Option text</label>`.
- **Publishing Workflow**:
  1. Always add a card/link for any new article to `~/matt-learning/index.html` (and update `srs-cards.json` / `sw.js` if applicable).
  2. Commit and push changes to `main` so they are live on GitHub Pages.
  3. Always include the clickable GitHub Pages link (`https://tabletmatt100.github.io/matt-learning/<filename>`) in the final response. Do not use a `file://` path as the article link.

---

## 6. Pre-Publish Self-Audit Checklist

1. **Human Opening Audit**: Does the article start immediately under `<h1>` with 2–3 plain-English paragraphs introducing *what* the subject is and *why* it matters, with **zero** front-loaded Symbol Tables, Fast-Forward Quizzes, TOCs, or formula-stuffed TL;DR bullets blocking the story?
2. **Prose vs. Fact-List Audit**: Are mechanisms explained through connected, conversational prose paragraphs with causal transitions rather than `<ul>`/`<ol>` bullet lists of facts?
3. **Zero Meta-Jargon Audit**: Have all rubric labels (`"Stage 1"`, `"Predict-Observe-Explain"`, `"Discrete Stepper + Persistent Small Multiples"`, `"Backward-Faded Worked Example"`, `"Micro-Prediction Gate"`) been replaced with natural, topic-specific headings?
4. **No-Calculator, Clean-Root & Base-2 Traceable-Numbers Audit**: Can every question, worked example, and MCQ be solved mentally without a calculator using distinct, traceable numbers?
5. **Popover & MCQ Audit**: Are all unfamiliar concepts AND mathematical symbols/variables/operators clickable with anchored `.term` popovers, and are all MCQs collapsed by default in `<details class="mcq-box">`?
