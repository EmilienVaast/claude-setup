#!/usr/bin/env bash
# Installs the user-level Claude Code setup into ~/.claude (backs up anything it replaces).
set -euo pipefail
HERE="$(cd "$(dirname "$0")" && pwd)"
DEST="$HOME/.claude"
STAMP="$(date +%Y%m%d-%H%M%S)"
mkdir -p "$DEST"/{agents,skills,hooks}

backup() { [[ -e "$1" ]] && cp -r "$1" "$1.bak-$STAMP" && echo "  backed up $1"; true; }

backup "$DEST/CLAUDE.md"
cp "$HERE/user/CLAUDE.md" "$DEST/CLAUDE.md"

if [[ -f "$DEST/settings.json" ]]; then
  backup "$DEST/settings.json"
  echo "  ! settings.json exists: merge the 'hooks' block from user/settings.json by hand."
else
  cp "$HERE/user/settings.json" "$DEST/settings.json"
fi

cp "$HERE"/user/hooks/*.sh "$DEST/hooks/" && chmod +x "$DEST"/hooks/*.sh
cp "$HERE"/user/agents/*.md "$DEST/agents/"
cp -r "$HERE"/user/skills/* "$DEST/skills/"

echo "Installed. Next: FRED_API_KEY=... bash mcp/add-mcp-servers.sh"
