# Decision Log

This document records key architectural and technical decisions made on this project. Add new decisions at the top.

---

## How to Use This Log

Before making significant changes, check if a relevant decision already exists. If you are about to re-debate something, the rationale here should explain why the current approach was chosen.

**Format for new entries:**
```markdown
### [YYYY-MM-DD] Decision Title

**Status:** Active | Superseded by [link] | Deprecated
**Context:** Why this decision was needed
**Decision:** What was decided
**Alternatives Considered:** Other options and why they were rejected
**Consequences:** Impact of this decision
**Code Links:** Files/components implementing this decision
```

**Status values:**
- **Active** — Currently in effect; follow this guidance
- **Superseded** — Replaced by a newer decision (link to it)
- **Deprecated** — No longer relevant but kept for history

For larger projects, consider also maintaining individual ADR files in `docs/adr/NNNN-title.md`.

---

## Decisions

<!-- Add new decisions below this line, newest first -->

### [YYYY-MM-DD] Adopt Spec-Driven Development

**Status:** Active

**Context:** Needed a structured way to ensure AI coding agents have clear requirements, traceable tests, and consistent delivery quality.

**Decision:** Implement spec-driven development using:
- `specs/NNN-feature/` folders with spec.md, plan.md, tasks.md, qa.md
- Golden thread testing strategy mapped to spec IDs (FR-xxx, QA-xxx, SC-xxx)
- Ralph Wiggum loop for tight verified slices
- Feature flags for all new features in production

**Alternatives Considered:**
- Ad hoc development: Fast but untraceable and error-prone with AI agents
- Issue-only tracking: Lacks the depth needed for agent context
- Full formal methods: Too heavyweight for iterative delivery

**Consequences:**
- Every feature has explicit requirements and test coverage
- Agent sessions produce traceable, verifiable changes
- Overhead of maintaining spec files is offset by reduced rework
- Works with any AI coding tool (Claude, Cursor, Copilot, etc.)

**Code Links:**
- `docs/SPEC-DRIVEN.md` — Workflow documentation
- `docs/TESTING-STRATEGY.md` — Testing approach
- `templates/` — Spec, plan, tasks, QA templates

---

### [YYYY-MM-DD] AI Context Documentation Structure v3.0

**Status:** Active

**Context:** Needed a tool-agnostic way to provide AI assistants with project context that survives machine changes and works with any code generation tool.

**Decision:** Implement modular documentation structure:
- `AGENT.md` as lightweight entry point (always read)
- `CLAUDE.md` as thin pointer for Claude Code auto-discovery
- `/docs/` folder for detailed context (read as needed)
- `/updates/` folder for monthly work tracking (read for recent context)
- `/specs/` folder for feature specifications
- `/templates/` for reusable document templates
- Context ladder for efficient loading
- Safe defaults to prevent destructive actions

**Alternatives Considered:**
- Tool-specific memories: Not portable across tools or machines
- Single large context file: Too much context loaded always
- No documentation: AI loses context between sessions

**Consequences:**
- AI must be told "Read @AGENT.md" at session start (or CLAUDE.md is auto-discovered)
- Context is version-controlled and portable
- Works with any AI tool (Claude, Windsurf, Cursor, Copilot, etc.)

**Code Links:**
- `/AGENT.md` — Entry point
- `/CLAUDE.md` — Claude Code pointer
- `/docs/PROJECT-CONTEXT.md` — Deep context
- `/docs/ARCHITECTURE.md` — System design
- `/docs/CODING-STANDARDS.md` — Conventions
- `/docs/BOOTSTRAP.md` — New repo setup

---

**Last Updated:** [Date]
