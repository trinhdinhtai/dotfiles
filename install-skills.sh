#!/usr/bin/env bash
# Install my global agent skills into ~/.claude/skills (Claude Code).
# Safe to re-run: an already-installed skill is simply overwritten with the latest version.
set -euo pipefail

# One skill per line: "<owner/repo> <skill-name>"
SKILLS=(
  "vercel-labs/skills find-skills"
  "cathrynlavery/diagram-design diagram-design"
)

for entry in "${SKILLS[@]}"; do
  read -r repo skill <<<"$entry"
  echo "==> $skill ($repo)"
  npx -y skills add "$repo" --skill "$skill" -g -a claude-code -y
done

echo
npx -y skills ls -g
