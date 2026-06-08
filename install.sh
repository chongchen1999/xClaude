#!/usr/bin/env bash
set -euo pipefail

# Symlink the Claude Code config files in this repo into ~/.claude/, so edits
# made here take effect immediately (no re-copy needed). Idempotent.
# WARNING: replaces any existing ~/.claude/{settings.json,CLAUDE.md,commands,themes}.

DOTCLAUDE="$HOME/.claude"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

mkdir -p "$DOTCLAUDE"

for item in settings.json CLAUDE.md commands themes; do
  ln -sfn "$SCRIPT_DIR/$item" "$DOTCLAUDE/$item"
done

claude plugins add pyright-lsp@claude-plugins-official 2>/dev/null || true

echo "Linked settings.json, CLAUDE.md, commands/, themes/ into $DOTCLAUDE."
echo "Run 'claude' to start."
