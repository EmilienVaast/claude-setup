# Claude Code setup — quant finance / Fonds BNI

```
install.sh                 copies user/ into ~/.claude (with backups)
mcp/add-mcp-servers.sh     registers Zotero, vault, FRED, arXiv MCP servers
user/CLAUDE.md             always-on context (who you are, uv/Ruff, quant hygiene, data sources)
user/settings.json         hooks: Ruff after every .py edit; block edits in data/raw/
user/hooks/                the hook scripts
user/agents/               quant-reviewer, literature-scout, data-wrangler
user/skills/               paper-replication, market-review (/market-review), investment-memo, kb-ingest
project-template/CLAUDE.md drop into each new project
```

## Install (macOS)
```bash
unzip claude-setup.zip && cd claude-setup
bash install.sh
export FRED_API_KEY=xxx      # free at fred.stlouisfed.org
bash mcp/add-mcp-servers.sh
claude                        # then /mcp, /agents, /hooks to verify
```

## Using it
- `/market-review` — runs the cross-asset brief (only when you call it).
- "Replicate tables 3–5 of <paper>" → paper-replication skill loads automatically.
- "Use the quant-reviewer subagent on src/" → independent check before you submit.
- "Ingest this paper into my notes" → kb-ingest writes to ~/vault, linked to Zotero.

## Pro plan tip
Chat, Claude Code and the app share one usage pool. Delegate heavy reading/data pulls to subagents,
`/clear` between unrelated tasks, and keep CLAUDE.md short.
