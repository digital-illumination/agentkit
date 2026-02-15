# AI Context System

A tool-agnostic, versioned context system for AI coding agents. Provides spec-driven development workflows, document templates, and structured project context that works with any AI tool (Claude, Windsurf, Cursor, Copilot, etc.).

## What's Included

| Directory | Contents |
|-----------|----------|
| `AGENT.md` | Entry point — project context, session rules, conventions |
| `CLAUDE.md` | Thin pointer for Claude Code auto-discovery |
| `docs/` | 7 context documents (bootstrap, spec-driven, testing, architecture, standards, decisions, project context) |
| `templates/` | 6 reusable templates (spec, plan, tasks, QA, checklist, constitution) |
| `scripts/` | 6 helper scripts (3 bash + 3 PowerShell) for setup and maintenance |
| `updates/` | Monthly work log template |

## Quick Start

### 1. Add as submodule

```bash
git submodule add https://github.com/digital-illumination/ai-context-system.git .context
```

### 2. Run bootstrap

```bash
bash .context/scripts/bootstrap-new-repo.sh
```

### 3. Fill in your project details

Follow the instructions in `docs/BOOTSTRAP.md`:
- **Path A** — New repository (fill in placeholders manually)
- **Path B** — Existing repository (AI agent analyses codebase and generates context)

### 4. Verify setup

```bash
bash .context/scripts/verify-context.sh
```

## Two Initialisation Paths

### Path A: New Repository
For brand new projects. The bootstrap script copies all files, then you (or an agent) fill in the `[PLACEHOLDER]` markers in AGENT.md and the docs.

### Path B: Existing Repository
For projects that already have code. An AI agent analyses your codebase (dependency files, source code, CI config, git history) and generates all context docs automatically. See `docs/BOOTSTRAP.md` for detailed instructions and copy-paste agent prompts.

## Using with AI Tools

### Session Start (any tool)
```
Read @AGENT.md and @updates/YYYY-MM.md
```

### Tool-Specific Notes

| Tool | How It Loads Context |
|------|---------------------|
| **Claude Code** | Auto-reads `CLAUDE.md` which points to `AGENT.md` |
| **Windsurf** | Use `@filename` to reference files |
| **Cursor** | Use `@filename` or add to context with Cmd+Enter |
| **Copilot** | Reference files in chat with `#file:` |

## Updating an Existing Project

```bash
git submodule update --remote --merge
bash .context/scripts/update-context.sh
git add AGENT.md CLAUDE.md docs/ templates/ updates/MONTHLY-UPDATES-TEMPLATE.md .context
git commit -m "chore: update ai context system"
```

## Upgrading from v2.x

If you're upgrading from v2.x:
1. Rename `AI.md` to `AGENT.md`
2. Create `CLAUDE.md` (see template in this repo)
3. Add the new files: `docs/SPEC-DRIVEN.md`, `docs/TESTING-STRATEGY.md`, `templates/`
4. Update your scripts to reference `AGENT.md` instead of `AI.md`
5. Run `bash .context/scripts/verify-context.sh` to check

## Versioning

- Tag releases (e.g., `v3.0.0`) in this repo
- Pin project submodules to a release tag for stability
- Upgrade deliberately when ready

## Security & Privacy

- Never commit secrets (API keys, tokens, passwords)
- Avoid logging PII or client data in examples
- Redact sensitive values in documentation when needed

## Contributing

See [CONTRIBUTING.md](./CONTRIBUTING.md) for guidelines.

---

**Version:** 3.0.0 | **License:** MIT
