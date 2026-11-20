#!/data/data/com.termux/files/usr/bin/bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$DOTFILES_DIR"

echo "==> Pulling latest changes from GitHub..."
git pull --rebase --autostash origin main

echo "==> Ensuring symlinks are up to date..."
"$DOTFILES_DIR/install.sh"

if [ -n "$(git status --porcelain)" ]; then
  echo "==> Local changes detected:"
  git status -s
  MSG="${1:-Sync dotfiles from $(uname -n) ($(date +%Y-%m-%d\ %H:%M))}"
  git add -A
  git commit -m "$MSG"
  echo "==> Pushing to GitHub..."
  git push origin main
  echo "==> Sync complete (changes pushed)."
else
  echo "==> Sync complete (working tree clean)."
fi
