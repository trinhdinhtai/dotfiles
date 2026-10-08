# dotfiles

Personal setup that should follow me across machines.

## Global agent skills

Skills installed at user level (`~/.claude/skills`), so Claude Code loads them in every project without any per-project files.

New machine (needs Node.js):

```bash
git clone https://github.com/trinhdinhtai/dotfiles.git
./dotfiles/install-skills.sh
```

Adding a skill: add a `"<owner/repo> <skill-name>"` line to `SKILLS` in `install-skills.sh`, run the script, commit and push.

Updating installed skills: `npx skills update -g`.

Project-specific skills stay in their own repos (`.agents/skills` + `skills-lock.json`), not here.
