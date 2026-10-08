#!/usr/bin/env bash
# Install my global agent skills into ~/.claude/skills (Claude Code).
# Safe to re-run: an already-installed skill is simply overwritten with the latest version.
set -euo pipefail

# One skill per line: "<owner/repo> <skill-name>"
SKILLS=(
  "vercel-labs/skills find-skills"
  "cathrynlavery/diagram-design diagram-design"
  "mattpocock/skills grill-me"
  "mattpocock/skills grilling" # grill-me and grill-with-docs delegate to this one
  "mattpocock/skills grill-with-docs"
  "mattpocock/skills domain-modeling" # also needed by grill-with-docs
  "mattpocock/skills improve-codebase-architecture"
  "mattpocock/skills codebase-design" # needed by improve-codebase-architecture
  "mattpocock/skills tdd"
  "mattpocock/skills setup-matt-pocock-skills"
  "mattpocock/skills triage"
  "mattpocock/skills handoff"
  "mattpocock/skills prototype"
  "mattpocock/skills teach"
  "mattpocock/skills diagnosing-bugs"
  "mattpocock/skills code-review"
  "mattpocock/skills implement"
  "mattpocock/skills ask-matt"
  "mattpocock/skills wayfinder"
  "mattpocock/skills research" # needed by wayfinder
  "mattpocock/skills to-spec"
  "mattpocock/skills to-tickets"
  "vercel-labs/agent-browser agent-browser"
  "juliusbrussee/caveman caveman"
  "dietrichgebert/ponytail ponytail"
  "dietrichgebert/ponytail ponytail-review"
  "dietrichgebert/ponytail ponytail-audit"
  "dietrichgebert/ponytail ponytail-debt"
  "dietrichgebert/ponytail ponytail-gain"
  "dietrichgebert/ponytail ponytail-help"
  "blader/humanizer humanizer"
)

for entry in "${SKILLS[@]}"; do
  read -r repo skill <<<"$entry"
  echo "==> $skill ($repo)"
  npx -y skills add "$repo" --skill "$skill" -g -a claude-code -y
done

echo
npx -y skills ls -g
