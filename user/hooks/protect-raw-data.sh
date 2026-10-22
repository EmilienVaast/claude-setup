#!/usr/bin/env bash
# PreToolUse hook: block any edit inside data/raw/ (raw exports are immutable).
# Exit code 2 blocks the tool call and sends stderr back to Claude.
payload="$(cat)"
file_path="$(printf '%s' "$payload" | python3 -c 'import json,sys; print(json.load(sys.stdin).get("tool_input",{}).get("file_path",""))' 2>/dev/null || true)"

if [[ "$file_path" == */data/raw/* ]]; then
  echo "Blocked: data/raw/ is immutable. Write transformed data to data/processed/ instead." >&2
  exit 2
fi
exit 0
