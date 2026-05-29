#!/usr/bin/env bash
set -euo pipefail

DOTCLAUDE="$HOME/.claude"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

mkdir -p "$DOTCLAUDE"

for f in settings.json CLAUDE.md; do
  cp "$SCRIPT_DIR/$f" "$DOTCLAUDE/$f"
done

cp -r "$SCRIPT_DIR/commands" "$DOTCLAUDE/commands"
cp -r "$SCRIPT_DIR/themes" "$DOTCLAUDE/themes"

claude plugins add pyright-lsp@claude-plugins-official 2>/dev/null || true

echo "Done. Run 'claude' to start."
