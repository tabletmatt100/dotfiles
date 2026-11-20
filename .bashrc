export PATH="$HOME/.local/bin:$PATH"

# Auto-start matt-learning local server on port 8080
[ -x "$HOME/matt-learning/ensure-server.sh" ] && "$HOME/matt-learning/ensure-server.sh" start

# Dotfiles sync helper (`dotsync [optional commit message]`)
alias dotsync='"$HOME/dotfiles/sync.sh"'
