#!/data/data/com.termux/files/usr/bin/sh
# Auto-start matt-learning server on Android boot (requires Termux:Boot add-on app)
termux-wake-lock
"$HOME/matt-learning/ensure-server.sh" start
