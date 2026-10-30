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
  "pbakaus/impeccable impeccable"
  "cloudflare/security-audit-skill security-audit"
  # AgriciDaniel/claude-seo: extensions live under extensions/*/skills so each needs --full-depth;
  # the script handles that with a per-entry flag (see install loop below)
  "AgriciDaniel/claude-seo seo"
  "AgriciDaniel/claude-seo seo-agentic"
  "AgriciDaniel/claude-seo seo-audit"
  "AgriciDaniel/claude-seo seo-backlinks"
  "AgriciDaniel/claude-seo seo-cluster"
  "AgriciDaniel/claude-seo seo-competitor-pages"
  "AgriciDaniel/claude-seo seo-content"
  "AgriciDaniel/claude-seo seo-content-brief"
  "AgriciDaniel/claude-seo seo-dataforseo"
  "AgriciDaniel/claude-seo seo-drift"
  "AgriciDaniel/claude-seo seo-ecommerce"
  "AgriciDaniel/claude-seo seo-flow"
  "AgriciDaniel/claude-seo seo-geo"
  "AgriciDaniel/claude-seo seo-google"
  "AgriciDaniel/claude-seo seo-hreflang"
  "AgriciDaniel/claude-seo seo-image-gen"
  "AgriciDaniel/claude-seo seo-images"
  "AgriciDaniel/claude-seo seo-local"
  "AgriciDaniel/claude-seo seo-maps"
  "AgriciDaniel/claude-seo seo-page"
  "AgriciDaniel/claude-seo seo-plan"
  "AgriciDaniel/claude-seo seo-programmatic"
  "AgriciDaniel/claude-seo seo-schema"
  "AgriciDaniel/claude-seo seo-sitemap"
  "AgriciDaniel/claude-seo seo-sxo"
  "AgriciDaniel/claude-seo seo-technical"
  # claude-seo extensions (live data sources; need API keys/MCP servers to be useful)
  "AgriciDaniel/claude-seo seo-ahrefs"
  "AgriciDaniel/claude-seo seo-bing"
  "AgriciDaniel/claude-seo seo-firecrawl"
  "AgriciDaniel/claude-seo seo-matomo"
  "AgriciDaniel/claude-seo seo-profound"
  "AgriciDaniel/claude-seo seo-seranking"
  "AgriciDaniel/claude-seo seo-unlighthouse"
)

for entry in "${SKILLS[@]}"; do
  read -r repo skill <<<"$entry"
  echo "==> $skill ($repo)"
  npx -y skills add "$repo" --skill "$skill" -g -a claude-code -y --full-depth
done

echo
npx -y skills ls -g
