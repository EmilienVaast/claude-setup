#!/usr/bin/env bash
# PostToolUse hook: lint + format every Python file Claude writes or edits.
# Reads the hook payload (JSON) on stdin; the edited path is at .tool_input.file_path
set -euo pipefail

payload="$(cat)"
file_path="$(printf '%s' "$payload" | python3 -c 'import json,sys; print(json.load(sys.stdin).get("tool_input",{}).get("file_path",""))' 2>/dev/null || true)"

[[ -z "$file_path" || "$file_path" != *.py || ! -f "$file_path" ]] && exit 0

# Prefer a global ruff (`uv tool install ruff`), fall back to uvx; works inside or outside a uv project.
if command -v ruff >/dev/null 2>&1; then RUFF=(ruff)
elif command -v uvx >/dev/null 2>&1; then RUFF=(uvx ruff)
else exit 0; fi

"${RUFF[@]}" check --fix --quiet "$file_path" 2>/dev/null || true
"${RUFF[@]}" format --quiet "$file_path" 2>/dev/null || true
exit 0
