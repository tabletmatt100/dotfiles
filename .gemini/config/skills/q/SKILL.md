---
name: q
description: >-
  Answer the user's question as quickly and concisely as possible without calling any tools.
  Only activate when explicitly invoked via `/q`.
---

# Quick Answer (`/q`)

Answer the user's question immediately and as concisely as possible using only your existing knowledge and the current conversation context.

## Strict Constraints

1. **Zero Tool Calls**: You are strictly forbidden from calling ANY tools (no `run_command`, `read_file`, `search_web`, `invoke_subagent`, `write_file`, `edit_file`, or any other tool). Do not even read this `SKILL.md` file again if you already know the rule—respond directly in the very first turn.
2. **Speed & Brevity**: Give a direct, ultra-compact answer right away without filler, preamble, or unnecessary elaboration.
3. **If Local/Live Info is Required**: If answering accurately requires reading a file, running a command, or searching the web, state briefly what you know immediately and note that tool use is disabled for `/q`.
