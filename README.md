# dotfiles

Personal configuration files for Termux on Onyx Boox E-ink devices (Boox Go 10.3 and Boox Palma 3).

## Included Configs

- **Shell & Git**
  - `.bashrc` — auto-starts the local `matt-learning` server and defines `dotsync`
  - `.gitconfig` — user identity and GitHub CLI credential helper
- **tmux**
  - `.tmux.conf` — high-contrast monochrome (`#000000` / `#ffffff`) E-ink configuration with zero background refresh (`status-interval 0`) and anti-ghosting settings
- **Termux**
  - `.termux/colors.properties` — high-contrast light E-ink color scheme
  - `.termux/termux.properties` — Termux terminal behavior and extra keys
  - `.termux/boot/start-matt-learning.sh` — `Termux:Boot` startup script
- **Antigravity & Gemini**
  - `.gemini/GEMINI.md` — global user rules, hardware context, and article preferences
  - `.gemini/antigravity-cli/settings.json` — Antigravity CLI settings (colorblind-friendly light theme, permissions, model selection)
  - `.gemini/config/config.json` — plugin settings
  - `.antigravity/settings.json` — terminal color scheme setting

> Note: OAuth tokens (`antigravity-oauth-token`, `credential-user-scope`) and local SQLite/conversation state are excluded via `.gitignore`.

## Setup on a New Device

Clone the repository into `~/dotfiles` and run `install.sh`:

```bash
git clone https://github.com/tabletmatt100/dotfiles.git ~/dotfiles
~/dotfiles/install.sh
```

`install.sh` backs up any existing files to `~/.dotfiles-backup/<timestamp>/`, symlinks every tracked file into `$HOME`, and reloads Termux and `tmux` settings.

## Syncing Across Multiple Devices

Because every config file in `$HOME` is a symlink pointing into `~/dotfiles/`, editing `~/.tmux.conf`, `~/.bashrc`, or changing settings in Antigravity modifies the file inside this git repository directly.

To pull updates from other devices and push local edits in one command, run:

```bash
dotsync
# or directly:
~/dotfiles/sync.sh "optional commit message"
```
