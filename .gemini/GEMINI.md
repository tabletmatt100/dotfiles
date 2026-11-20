# User Memory & Context

## Hardware & Environment
- **Devices**:
  - **Onyx Boox Go 10.3** (`Go103`) 10.3-inch E-ink tablet (Carta 1200, 300 PPI) running Android + Termux.
  - **Onyx Boox Palma 3** (`Palma3`) 6.13-inch pocket phone-sized E-ink reader (2:1 aspect ratio, ~360–412px CSS viewport width, 300 PPI).
- Every article in `matt-learning` must look great and remain 100% readable and interactive on **both** the wide Boox Go 10.3 tablet and the narrow Boox Palma 3 screen (zero horizontal page overflow, wrapped tables, responsive mobile padding/typography, full-width touch buttons/controls on small viewports, and popovers constrained inside `92vw–94vw`).

## Projects
- **matt-learning**:
  - Path: `/data/data/com.termux/files/home/matt-learning` (`~/matt-learning`)
  - Description: Git repository for personal learning notes, experiments, code, and interactive explainer articles.
  - Branch: `main`
  - Author: Matt M (`tabletmatt100@gmail.com`)

## Article & Explainer Preferences
When creating explainer articles or learning documents for the user:
- **E-ink Optimized Layout**:
  - High contrast monochrome / grayscale (`#000000` text on `#ffffff` background).
  - Crisp solid borders (`1px` or `2px solid #000`), no fuzzy shadows or low-contrast gradients.
  - Zero CSS animations or transitions (`transition: none !important; animation: none !important;`) to prevent ghosting on E-ink screens.
  - Large touch targets and font-scaling controls (`A-` / `A+`).
- **Interactive Elements**:
  - Include as many interactive widgets as possible (e.g. interactive parameter sliders, attention calculators, distribution simulators, steppers).
- **Worked-Out Numerical Examples**:
  - Walk through real numbers, vectors, matrices, and distributions with step-by-step arithmetic.
- **Interactive Concept Popovers (Aggressive)**:
  - Tag non-obvious technical terms, acronyms, formula symbols, and prerequisite concepts aggressively with `.term[data-term]` popovers—including nested `.term` links inside popover definitions—so readers can tap to see more anywhere they get stuck.
- **Collapsible Information**:
  - Use `<details>` and `<summary>` tags to hide advanced derivations, deep math proofs, or code implementations by default.
- **Comprehension Checks (Collapsed by Default)**:
  - Embed multiple-choice questions (MCQs) wrapped in `<details class="mcq-box">` so they are collapsed by default until tapped, with instant feedback and clear explanations for each option.
- **Bulleted TL;DR**:
  - Every article starts with a short bulleted TL;DR summarizing the key takeaways.
- **Always Update `index.html`, Commit, Push, and Provide the GitHub Pages Link**:
  - Whenever creating a new article in `matt-learning`, always add a card/link for it to `index.html`.
  - Whenever creating or editing an article in `matt-learning`, always commit and push the changes to `main` so they are live on GitHub Pages, and include the clickable GitHub Pages link to the article (`https://tabletmatt100.github.io/matt-learning/<filename>`) in the final response. Do not use a `file://` path as the article link.
- **Must Not Read as AI-Generated**:
  - Write like a knowledgeable human: plain, direct, varied sentence lengths, concrete opinions and specifics.
  - Avoid AI tells: em-dash overuse, "delve", "crucial", "landscape", "it's important to note", "In conclusion", "Let's dive in", rule-of-three padding, emoji, hype adjectives, excessive bolding, and every section ending in a neat summary.
  - Keep headings plain and descriptive, not clever or salesy.
