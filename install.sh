#!/data/data/com.termux/files/usr/bin/bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP_DIR="$HOME/.dotfiles-backup/$(date +%Y%m%d_%H%M%S)"

FILES=(
  ".bashrc"
  ".tmux.conf"
  ".gitconfig"
  ".termux/colors.properties"
  ".termux/termux.properties"
  ".termux/boot/start-matt-learning.sh"
  ".antigravity/settings.json"
  ".gemini/GEMINI.md"
  ".gemini/antigravity-cli/settings.json"
  ".gemini/config/config.json"
  ".gemini/config/skills/q/SKILL.md"
)

link_file() {
  local rel="$1"
  local src="$DOTFILES_DIR/$rel"
  local dst="$HOME/$rel"

  mkdir -p "$(dirname "$dst")"

  if [ -L "$dst" ]; then
    local current_target
    current_target="$(readlink "$dst")"
    if [ "$current_target" = "$src" ]; then
      echo "  [ok] $rel -> $src"
      return
    fi
  fi

  if [ -e "$dst" ] || [ -L "$dst" ]; then
    mkdir -p "$(dirname "$BACKUP_DIR/$rel")"
    mv "$dst" "$BACKUP_DIR/$rel"
    echo "  [backup] Moved existing ~/$rel to $BACKUP_DIR/$rel"
  fi

  ln -s "$src" "$dst"
  echo "  [linked] ~/$rel -> $src"
}

echo "Linking dotfiles from $DOTFILES_DIR..."
for f in "${FILES[@]}"; do
  if [ -e "$DOTFILES_DIR/$f" ]; then
    link_file "$f"
  fi
done

# Ensure ~/.gemini/config/GEMINI.md points to ~/.gemini/GEMINI.md
mkdir -p "$HOME/.gemini/config"
ln -sf "$HOME/.gemini/GEMINI.md" "$HOME/.gemini/config/GEMINI.md"

# Apply Termux and tmux settings if running inside Termux
if command -v termux-reload-settings >/dev/null 2>&1; then
  termux-reload-settings && echo "  [termux] Reloaded Termux settings"
fi

if command -v tmux >/dev/null 2>&1 && tmux info >/dev/null 2>&1; then
  tmux source-file "$HOME/.tmux.conf" && echo "  [tmux] Reloaded ~/.tmux.conf"
fi

echo "Done."
