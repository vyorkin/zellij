#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SCRIPTS_DIR="$REPO_DIR/scripts"
PLIST_SRC="$REPO_DIR/launchagents/com.user.zellij-theme.plist"
PLIST_DEST="$HOME/Library/LaunchAgents/com.user.zellij-theme.plist"

chmod +x "$SCRIPTS_DIR/switch-theme.sh"
chmod +x "$SCRIPTS_DIR/start-theme-watcher.sh"

sed "s|SCRIPTS_DIR|$SCRIPTS_DIR|g" "$PLIST_SRC" > "$PLIST_DEST"

launchctl bootstrap "gui/$(id -u)" "$PLIST_DEST" 2>/dev/null || \
    launchctl load "$PLIST_DEST" 2>/dev/null || true

echo "Installed. Zellij theme will now follow macOS appearance automatically."
