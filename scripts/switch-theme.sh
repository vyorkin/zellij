#!/usr/bin/env bash
set -euo pipefail

CONFIG="${XDG_CONFIG_HOME:-$HOME/.config}/zellij/config.kdl"

if defaults read -g AppleInterfaceStyle 2>/dev/null | grep -q "Dark"; then
    THEME="pencil-dark"
else
    THEME="pencil-light"
fi

sed -i '' "s/theme \"[^\"]*\"/theme \"$THEME\"/" "$CONFIG"
