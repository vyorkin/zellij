#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

"$SCRIPT_DIR/switch-theme.sh"

DARK_NOTIFY=""
for candidate in \
    "$(command -v dark-notify 2>/dev/null)" \
    /opt/homebrew/bin/dark-notify \
    /usr/local/bin/dark-notify; do
    if [[ -x "$candidate" ]]; then
        DARK_NOTIFY="$candidate"
        break
    fi
done

if [[ -z "$DARK_NOTIFY" ]]; then
    echo "dark-notify not found; install with: brew install dark-notify" >&2
    exit 1
fi

exec "$DARK_NOTIFY" -c "$SCRIPT_DIR/switch-theme.sh"
