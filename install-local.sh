#!/usr/bin/env bash
# Install this plugin into ~/.cursor/plugins/local/ai-agent-roles
set -euo pipefail

SRC="$(cd "$(dirname "$0")" && pwd)"
DEST="${HOME}/.cursor/plugins/local/ai-agent-roles"

mkdir -p "$(dirname "$DEST")"
rm -rf "$DEST"
mkdir -p "$DEST"

# Prefer tarball if present (preserves .cursor-plugin)
if [[ -f "$SRC/ai-agent-roles.tar.gz" ]]; then
  tar -xzf "$SRC/ai-agent-roles.tar.gz" -C "$(dirname "$DEST")"
else
  # Copy tree; recreate .cursor-plugin from cursor-plugin/ fallback if needed
  if command -v rsync >/dev/null 2>&1; then
    rsync -a --exclude 'ai-agent-roles.tar.gz' --exclude '.git' "$SRC/" "$DEST/"
  else
    cp -a "$SRC/." "$DEST/"
    rm -f "$DEST/ai-agent-roles.tar.gz" 2>/dev/null || true
  fi
  mkdir -p "$DEST/.cursor-plugin"
  if [[ -f "$SRC/cursor-plugin/plugin.json" ]]; then
    cp "$SRC/cursor-plugin/plugin.json" "$DEST/.cursor-plugin/plugin.json"
  elif [[ -f "$SRC/.cursor-plugin/plugin.json" ]]; then
    cp "$SRC/.cursor-plugin/plugin.json" "$DEST/.cursor-plugin/plugin.json"
  else
    echo "error: no plugin.json found" >&2
    exit 1
  fi
fi

# Ensure manifest exists either way
if [[ ! -f "$DEST/.cursor-plugin/plugin.json" ]]; then
  mkdir -p "$DEST/.cursor-plugin"
  if [[ -f "$SRC/cursor-plugin/plugin.json" ]]; then
    cp "$SRC/cursor-plugin/plugin.json" "$DEST/.cursor-plugin/plugin.json"
  fi
fi

echo "Installed: $DEST"
echo "Next: Developer → Reload Window, then Customize → confirm rules/agents/skills."
test -f "$DEST/.cursor-plugin/plugin.json" && echo "OK: .cursor-plugin/plugin.json present"
