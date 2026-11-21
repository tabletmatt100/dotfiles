# User Memory & Context

## Hardware & Environment
- **Current Device**: **Onyx Boox Palma 3** (`Palma3`) — 6.13-inch pocket phone-sized E-ink reader (2:1 aspect ratio, ~360–412px CSS viewport width, 300 PPI) running Android + Termux.
- **Secondary Device**: **Onyx Boox Go 10.3** (`Go103`) — 10.3-inch E-ink tablet (Carta 1200, 300 PPI) running Android + Termux.
- **Terminal / Chat Viewport Constraints (Boox Palma 3)**:
  - The Termux/tmux chat viewport is **20 visible content lines** tall (21 total with the tmux status bar) and **39 characters** wide (**35 characters** inside indented code blocks).
  - Keep chat responses ultra-compact so they fit in a single screen without scrolling (~15–18 wrapped lines max) unless the user asks for detail, and wrap any code blocks/tables to **<= 35 chars per line**.

## Writing Style
- **Must Not Read as AI-Generated**:
  - Write like a knowledgeable human: plain, direct, varied sentence lengths, concrete opinions and specifics.
  - Avoid AI tells: em-dash overuse, "delve", "crucial", "landscape", "it's important to note", "In conclusion", "Let's dive in", rule-of-three padding, emoji, hype adjectives, excessive bolding, and every section ending in a neat summary.
  - Keep headings plain and descriptive, not clever or salesy.

## Projects
- **matt-learning**:
  - Path: `/data/data/com.termux/files/home/matt-learning` (`~/matt-learning`)
  - Description: Git repository for personal learning notes, experiments, code, and interactive E-ink explainer articles.
  - Branch: `main` | Author: Matt M (`tabletmatt100@gmail.com`)
  - **Rule**: Whenever creating, editing, or auditing an article in `matt-learning`, read `~/matt-learning/GEMINI.md` and activate the `write-article` skill. Always update `index.html`, commit and push to `main`, and return the live GitHub Pages URL (`https://tabletmatt100.github.io/matt-learning/<filename>`).
- **dotfiles**:
  - Path: `/data/data/com.termux/files/home/dotfiles` (`~/dotfiles`)
  - Description: Termux, tmux, and Antigravity (`~/.gemini`) configuration and skills, symlinked via `~/dotfiles/install.sh`.

## Custom Slash Commands
- **`/q <question>`**: When the user invokes `/q` (or the `q` skill), answer their question immediately and as concisely as possible in a single turn **without calling any tools** (do not even call `read_file` on `SKILL.md`).
