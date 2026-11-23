---
name: write-article
description: >-
  Comprehensive pedagogical, UI/E-ink, and publishing rules for creating or editing interactive
  learning articles in ~/matt-learning. Activate whenever writing, updating, or auditing an article
  in matt-learning.
---

# Writing Interactive Learning Articles (`matt-learning`)

Every article in `~/matt-learning` (`/data/data/com.termux/files/home/matt-learning`) must be a **commitment, feedback, and retrieval engine**—not a passive display medium—and must be optimized for both the **Onyx Boox Go 10.3** E-ink tablet and the **Onyx Boox Palma 3** pocket E-ink reader.

Use `~/matt-learning/template2.html` as the structural reference template, and keep articles **tight, short, and punchy** so every paragraph and widget earns its space.

---

## 1. Non-Negotiable Personal Preferences

1. **No Calculator Required for Any Question (Clean-Root & Base-2 Mental Math)**
   - Every prediction hook, worked example, inline faded step, retrieval prompt, and MCQ must be solvable mentally without a calculator.
   - Use clean, mental-math-friendly numbers: small integers, simple fractions, powers of 2 or 10, clean percentages (10%, 25%, 50%), or test conceptual reasoning directly.
   - **Clean square roots:** When a formula divides by $\sqrt{d_k}$ or $\sqrt{n}$, pick $d_k \in \{4, 9, 16\}$ so $\sqrt{d_k} \in \{2, 3, 4\}$ divides integers cleanly by hand.
   - **Base-2 dyadic fractions for logs/entropy/KL:** When tracing log-probabilities, entropy, or KL divergence by hand, use powers of $\frac{1}{2}$ (e.g. $\frac{1}{2}, \frac{1}{4}, \frac{1}{8}, \frac{1}{16}$) with $\log_2$ (bits) or clean integer nats so every log is an exact integer ($-\log_2 P \in \{1, 2, 3, 4\}$) with zero 4-decimal float clutter.

2. **Distinct Numbers in Worked Examples (Easy to Trace)**
   - Use distinct, non-repetitive numbers in worked examples so every element's path through the computation is unambiguous—for example, a matrix like `[0, 1, 2; 3, 4, 5]` instead of `[1, 1, 0; 0, 0, 1]` where repeated `0`s and `1`s hide which row/column contributed to the result.
   - Keep those distinct numbers small enough to compute mentally without a calculator.

3. **All Concepts and Symbols Must Be Clickable with Anchored Popovers**
   - Every non-obvious concept, technical term, acronym, prerequisite, AND every mathematical symbol, variable, or operator (in prose, legends, and equations) must be clickable (`.term[data-term]`).
   - Clicking any concept or symbol must open an anchored popover explaining what it means in plain English (with nested `.term` links inside popover definitions when helpful), without a full-screen backdrop so the page remains visible.

4. **E-Ink & Minimal UI (Boox Palma 3 & Go 10.3)**
   - Black and white E-ink styling with zero animations/transitions, sized cleanly for the Boox Palma 3 (`~360–412px` width).
   - Matt is the sole viewer and knows how everything works: never explain UI features, never add topic/device tags (`<span class="tag">`) at the top of articles, keep designs as minimal as possible, and prefer icon buttons.

5. **Human Prose, Zero AI Tells, Short & Tight**
   - Write like a knowledgeable human: plain, direct, varied sentence lengths, concrete opinions and specifics. Keep articles concise and free of bloat.
   - Avoid AI tells: em-dash overuse, "delve", "crucial", "landscape", "it's important to note", "In conclusion", "Let's dive in", rule-of-three padding, emoji, hype adjectives, excessive bolding, and every section ending in a neat summary.
   - Keep headings plain and descriptive, not clever or salesy. Never use raw template labels like "Stage 1" or "Stage 3" as section headings.

---

## 2. Core Pedagogical Rules (Cognitive & HCI Evidence)

1. **Force Constructive (C) output, not just Active (A) clicking (Micro-Predictions Before Every Widget).**
   - Dragging a slider or clicking "Next" is only *Active* (barely beats passive reading and creates a "fluent-yet-fragile" illusion of competence).
   - **Rule:** Never leave an interactive slider or simulator wide open by default. Place a **15-second micro-prediction or numerical commitment** right above *every* interactive widget (with an `"I have no idea — show me"` escape hatch) before unlocking or using the free controls.
2. **Contrasting Cases *Before* the Formal Equation (Schwartz & Bransford; Kapur's Productive Failure).**
   - Never open a section with a formal symbolic definition or an open-ended sandbox (unassisted discovery hurts novices, `d = -0.38`).
   - **Rule:** Before stating any major formula, present a **2-case concrete numerical clash** (e.g., Case A vs. Case B where the naive formula or average fails) and ask the reader to predict/spot the failure first. Introduce the symbolic equation only *after* the contrasting cases establish what problem the symbols solve.
3. **Predict-Observe-Explain (POE) + Refutation Text.**
   - Overlay the true answer/curve directly on the reader's prediction so the error gap is explicit.
   - Name the exact misconception: *"Most people guess [X] because they assume [naive heuristic]. That breaks here because [1-sentence reason]."*
4. **Discrete steppers + persistent small multiples over continuous animation.**
   - Continuous animations suffer from the *Transient Information Effect* (earlier states vanish before working memory links them). Use `Step 1 | Step 2 | Step 3` controls (and constrained presets like `Low | Critical | High` alongside any slider) while keeping prior states visible side-by-side or as ghost traces.
5. **Enforce Spatial Contiguity (zero split-attention).**
   - Put labels directly on SVG curves and bars instead of in separate legends or bottom captions. Link equation symbols, prose terms, and visual elements inline.
6. **Subgoal Labeling + "What Breaks If Deleted" Equation Anatomy (Catrambone).**
   - Readers forget multi-term formulas when they only read symbol definitions.
   - **Rule:** Pair every primary equation with a compact **Equation Anatomy / Ablation Table** (or inline underbraces) showing for each sub-expression: (1) its functional job/subgoal, (2) its shape/units, and (3) **what numerically breaks, saturates, or cheats if you delete that term or set it to 1**.
7. **Strict chunk budget + Concrete -> Abstract (Concreteness Fading).**
   - Keep prose chunks to **150–250 words** per visual or interactive step. Never bury a widget under 1,000 words of text.
   - Walk through one concrete numerical trace with real numbers *before* stating the general equation, then map numbers to symbols.
8. **Inline Fading Inside *Every* Worked Example (Renkl's Backward Fading).**
   - When a `.worked` box solves 100% of the arithmetic from start to finish, readers passively scan and nod along without encoding the rule.
   - **Rule:** Inside **every `.worked` trace** (as well as the dedicated backward-faded practice problem), fade/blank out the final mental-math step or punchline coordinate behind a fast inline input + `Check` button (5 seconds to solve from the numbers right above it).
9. **Palma-Friendly Boundary & Counterfactual Checks Instead of Long Essay Textareas (Roediger & Karpicke).**
   - Long `<textarea>` essay prompts create high typing friction on a 6.13-inch Boox Palma 3 screen, tempting readers to mumble the answer and tap `Reveal` early.
   - **Rule:** Replace long essay textareas with **2–3 fast, auto-graded Palma-friendly retrieval cards**:
     - **Boundary / Counterexample Generation:** *"Enter a concrete input $x$ where this formula's gradient/score collapses to 0 (or fails)"* (auto-checked by formula).
     - **Shape / Invariant Check:** 1-tap or 1-number check on shapes, direction, or conservation rules.
     - **Counterfactual Mental Calculation:** 1-number mental-math completion without looking back.
10. **Mitigate the Expertise Reversal Trap.**
    - Provide a 1-question **Fast-Forward Diagnostic** at the top of the article so experienced readers can collapse basic scaffolding.
11. **End with Contrastive Matrix, Diagnostic Checks, and Spaced Recall.**
    - Include a **Contrastive Matrix** comparing the new concept/variants across 3–4 decision axes (Objective, Failure Mode, Cost/Complexity, When to Use).
    - Include collapsed `<details class="mcq-box">` diagnostic checks (with `data-explain` on every option).
    - Export **5–8 spaced Q&A recall prompts** (`var SPACED_CARDS = [...]`).

---

## 3. Standard 5-Stage Article Architecture

Anchor every article in a continuous, concrete story that explains *why* the problem exists and how each concept fixes a flaw in the previous one. Keep the entire article compact:

1. **Stage 0 — Pre-Training Header (2 min max)**
   - **Bulleted TL;DR**: What problem this solves, the core mechanism in one concrete sentence, and when it breaks.
   - **Inline Symbol / Term Legend**: 3–5 core symbols/terms with 1-line plain-English meanings.
   - **Fast-Forward Diagnostic**: 1-question mental-math check to let experts collapse basic scaffolding.
2. **Stage 1 — Contrasting 2-Case Prediction Hook**
   - A concrete 2-case numerical clash with intuitive tension. Force a prediction before showing the formula or unlocking the widget.
3. **Stage 2 — Gap Reveal & Misconception Refutation**
   - Show the true result overlaid on the reader's guess and refute the naive heuristic directly.
4. **Stage 3 — Segmented Mechanism + Inline-Faded Worked Examples + Equation Ablation Table**
   - 150–250 word chunks, concrete distinct mental-math numbers (clean roots / $\log_2$ bits) -> general equation + **"What Breaks If Deleted" Equation Anatomy table**.
   - **Inline faded final step** inside every `.worked` box.
   - Discrete stepper + persistent small multiples, with a **micro-prediction gating every interactive widget/slider**.
5. **Stage 4 — Backward-Faded Practice & Palma-Friendly Boundary/Counterfactual Retrieval**
   - 70%-worked example where the reader finishes the last step + **2–3 fast auto-graded boundary/counterfactual retrieval cards** (no long essay textareas).
6. **Stage 5 — Contrastive Matrix, Diagnostic MCQs & Spaced Export**
   - Comparison table across decision axes, collapsed `<details class="mcq-box">` checks (with `data-explain` on every option), and exportable spaced-recall Q&A cards.

---

## 4. Shared Assets, Technical Implementation & Publishing Workflow

- **Shared `common.css` and `common.js`**:
  - Every article must load `<link rel="stylesheet" href="common.css">` and `<script src="common.js"></script>` in `<head>` (right after the KaTeX tags) instead of duplicating the E-ink stylesheet or JS engine for font-scaling, KaTeX auto-rendering, anchored popovers, MCQ grading, and spaced-recall cards.
  - Each article's `<script>` only defines its `var GLOSSARY = {...}`, its `var SPACED_CARDS = [...]`, and its page-specific interactive widget functions.
- **Offline + Online KaTeX**: Load from local `katex/` with `onerror` fallback to jsDelivr.
- **Collapsed MCQs by default**: Wrap every MCQ in `<details class="mcq-box" data-correct="B" data-topic="...">` with `<label class="mcq-option" data-explain="...">Option text</label>`. `common.js` automatically generates the `id`, `<summary class="mcq-title">`, `<input type="radio">`, letter prefixes (`A)`, `B)`, `C)`), the `Check answer` button, `<div class="mcq-feedback">`, and the `.score-bar` contents.
- **Collapsible Derivations & Code**: Use `<details>` and `<summary>` tags to hide advanced derivations, deep math proofs, or code implementations by default.
- **Publishing Workflow**:
  1. Always add a card/link for any new article to `~/matt-learning/index.html` (and update `srs-cards.json` / `sw.js` if applicable).
  2. Commit and push changes to `main` so they are live on GitHub Pages.
  3. Always include the clickable GitHub Pages link (`https://tabletmatt100.github.io/matt-learning/<filename>`) in the final response. Do not use a `file://` path as the article link.

---

## 5. Pre-Publish Self-Audit Checklist

1. **No-Click Audit**: If a reader never touches an optional slider, do the default state + discrete steppers/small multiples still communicate 100% of the argument?
2. **Blind-Click Audit (Micro-Prediction Before Every Widget)**: Is *every* interactive slider/simulator gated or preceded by a micro-prediction prompt so readers cannot mistake smooth UI motion for understanding?
3. **Contrasting-Cases-First & Equation-Ablation Audit**: Does a 2-case numerical clash precede the formal equation, and does every primary equation include a subgoal / "what breaks if deleted" breakdown?
4. **Inline-Faded Worked Examples Audit**: Does *every* `.worked` trace have its final mental-math number blanked out behind an inline `[input] [Check]` box?
5. **Palma-Friendly Blank-Sheet Test**: Are long essay textareas replaced by 2–3 fast, auto-graded boundary/counterexample and counterfactual generation prompts?
6. **Popover & MCQ Audit**: Are all unfamiliar concepts AND mathematical symbols/variables/operators clickable with anchored `.term` popovers, and are all MCQs collapsed by default in `<details class="mcq-box">`?
7. **No-Calculator, Clean-Root & Base-2 Traceable-Numbers Audit**: Can every question, worked example, and MCQ be solved mentally without a calculator (using perfect-square dimensions for $\sqrt{d_k}$, powers of $1/2$ with $\log_2$ for logs/KL/confidence, and distinct traceable numbers)?
