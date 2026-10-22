#!/usr/bin/env bash
# Registers research MCP servers in Claude Code at user scope (available in every project).
# These are community servers, not Anthropic products: read each repo before running.
# Prereqs: uv (uvx), Node.js (npx), Zotero 7 desktop running with the local API enabled
#   (Zotero > Settings > Advanced > "Allow other applications on this computer to communicate with Zotero").
set -euo pipefail

: "${FRED_API_KEY:?Set FRED_API_KEY first (free key: https://fred.stlouisfed.org/docs/api/api_key.html)}"
VAULT="${VAULT:-$HOME/vault}"
mkdir -p "$VAULT"/{papers,courses,concepts,inbox} "$HOME/.arxiv-papers"

# 1. Zotero (local library, read) — github.com/kujenga/zotero-mcp
claude mcp add-json zotero -s user \
  '{"command":"uvx","args":["--upgrade","zotero-mcp"],"env":{"ZOTERO_LOCAL":"true","ZOTERO_API_KEY":"","ZOTERO_LIBRARY_ID":""}}'

# 2. Markdown / Obsidian vault — npm: mcp-obsidian
claude mcp add obsidian -s user -- npx -y mcp-obsidian "$VAULT"

# 3. FRED (800k+ macro/financial series) — github.com/stefanoamorelli/fred-mcp-server
claude mcp add-json fred -s user \
  "{\"command\":\"npx\",\"args\":[\"-y\",\"fred-mcp-server\"],\"env\":{\"FRED_API_KEY\":\"$FRED_API_KEY\"}}"

# 4. arXiv (search, download, read) — github.com/blazickjp/arxiv-mcp-server
claude mcp add arxiv -s user -- uvx arxiv-mcp-server --storage-path "$HOME/.arxiv-papers"

echo "Done. In Claude Code, run /mcp to check each server is connected."
