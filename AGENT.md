# Agent Context

**Read this file at session start.** It tells you how to work on this project and where to find detailed context.

For the full spec-driven workflow, see [docs/SPEC-DRIVEN.md](./docs/SPEC-DRIVEN.md).
For the project constitution, see `.specify/memory/constitution.md`.

---

## Project Overview

[PLACEHOLDER: 2-3 line description of this project — what it does, who it serves, and its core value proposition.]

---

## Tech Stack

[PLACEHOLDER: Fill in during bootstrap]

| Layer | Technology |
|-------|------------|
| **Backend** | [e.g., Node.js, Python/Django, Go] |
| **Frontend** | [e.g., React, Vue, Angular] |
| **Database** | [e.g., PostgreSQL, Firestore, MongoDB] |
| **Testing** | [e.g., Vitest, pytest, Jest] |
| **Deployment** | [e.g., Cloud Run, Vercel, Heroku] |

---

## Directory Structure

[PLACEHOLDER: Fill in during bootstrap]

```
[project-root]/
├── [source]/           # [Description]
├── [tests]/            # [Description]
├── ROADMAP.md          # Strategic roadmap
├── docs/               # Project documentation
├── specs/              # Feature specifications
├── sessions/           # Agent session starter prompts
├── templates/          # Document templates
└── updates/            # Monthly work logs
```

---

## Local CI Commands

[PLACEHOLDER: Fill in during bootstrap — the commands your CI runs]

```bash
# Example for Node.js/TypeScript:
# npm run lint
# npm test
# npx tsc --noEmit

# Example for Python:
# ruff check .
# pytest
# mypy .
```

---

## Session Rules

### Behavioural Guidelines

1. **Implement changes directly** — Generate and apply code; do not just suggest (unless asked for analysis/planning only)
2. **British English** — Use British spelling (colour, organisation, behaviour)
3. **Be concise** — No unnecessary preamble
4. **Proactive updates** — Update monthly file after significant work without being asked

### Safe Defaults

- **Never run destructive commands** without explicit confirmation (delete, drop, rm -rf, force push)
- **Never deploy** without asking — validation only unless instructed
- **Never expose credentials** — mask API keys, passwords, org IDs in outputs
- **Ask before network calls** — do not make external API calls without approval

### Commit Policy

**When to commit:**
- After each meaningful change made as part of a user request (small, regular commits)
- After code, config, or documentation updates
- Do NOT commit if user asked for "analysis only" or "no changes"
- Do NOT commit if no files were changed

**Rules:**
- Use clear, descriptive commit messages (what and why)
- **Never push** unless explicitly asked
- Commit little and often — do not let changes accumulate

### Assumptions Rule

If a statement is not confirmed in code or documentation:
1. **Ask** a clarification question, OR
2. **Mark it explicitly** as `(Assumption: [detail])` in the documentation

**Never treat assumed details as facts.**

### Ralph Wiggum Loop (Tight Verified Slices)

All implementation sessions must follow this loop:

1. Restate goal and assumptions before each slice.
2. Make the smallest useful code or docs change.
3. Run the smallest relevant verification immediately.
4. If green, update spec/tasks/qa for the slice before continuing.
5. If red, fix before moving on.
6. After two failed attempts on the same issue, stop and present options.

No big-bang unverified edits are allowed.

### Feature Flag Requirement

All new features must be gated behind feature flags in production. Validate both ON and OFF states.

### Spec & QA Update Requirement

After each session, update the relevant specs, tasks, and QA docs. The golden thread must remain green in CI.

### Delivery Flow

After verification is green:
1. Commit the validated changes
2. Push the feature branch
3. Open the PR with a concise summary and verification results

---

## Code Style Conventions

[PLACEHOLDER: Fill in during bootstrap from codebase analysis. Example structure:]

### File Naming
[e.g., kebab-case: `user-service.ts`, `auth-provider.tsx`]

### Import Ordering
1. Built-in / standard library
2. Third-party dependencies
3. Project-internal imports

### Type Declarations
[e.g., Always use `type`, never `interface`]

### Export Style
[e.g., Prefer named exports over default exports]

### Components
[e.g., Named function declarations with `"use client"` directive]

### Tests
[e.g., Vitest + Testing Library, flat describe/it blocks, dependency injection over module mocking]

---

## Spec-to-Test Traceability

Test descriptions should reference spec IDs:

- `FR-xxx` — Functional Requirements from spec.md
- `QA-xxx` — QA Scenarios from qa.md
- `SC-xxx` — Success Criteria from spec.md

```typescript
describe("User auth (FR-001, FR-002)", () => {
  it("signs up and redirects (QA-003)", async () => {
    // test body
  });
});
```

Always include spec IDs in new tests. Add opportunistically to existing tests when modifying them.

---

## Task Format Convention

Use structured task format:

```
- [ ] T001 [P] [US1] Description with `path/to/file`
```

- `T001`: sequential task ID
- `[P]`: can run in parallel
- `[US1]`: maps to user story in spec

See `templates/tasks-template.md` for the full template.

---

## Active Feature Specs

[PLACEHOLDER: Populate per project]

*This table mirrors the "Now" section of `ROADMAP.md`. Keep both in sync.*

| Spec | Status | Notes |
|------|--------|-------|
| `specs/000-foundation` | [Status] | [Notes] |

---

## Context Ladder

Read context in this order, stopping when you have enough:

| Level | What to Read | When |
|-------|--------------|------|
| **1. Always** | This file (`AGENT.md`) | Every session |
| **2. Recent** | `/updates/YYYY-MM.md` (current month) | Every session |
| **3. If coding** | `/docs/CODING-STANDARDS.md` | Before writing code |
| **4. If architecting** | `/docs/ARCHITECTURE.md` + `/docs/DECISIONS.md` | Before major changes |
| **5. If planning** | `ROADMAP.md` | Before proposing features |
| **6. If deep dive** | `/docs/PROJECT-CONTEXT.md` | When you need full understanding |
| **7. If feature work** | `specs/NNN-feature/spec.md` | When working on a feature |

**Principle:** Load minimum context needed. Do not read everything unless required.

---

## Context Documents

| Document | When to Read | Purpose |
|----------|--------------|---------|
| `/updates/YYYY-MM.md` | **Every session start** | Recent work, in-progress items |
| `/docs/SPEC-DRIVEN.md` | Before feature work | Spec-driven workflow rules |
| `/docs/TESTING-STRATEGY.md` | Before writing tests | Golden thread testing approach |
| `/docs/PROJECT-CONTEXT.md` | Deep understanding needed | Business context, history, components |
| `/docs/ARCHITECTURE.md` | Building features, debugging | System design, integrations |
| `/docs/CODING-STANDARDS.md` | Writing/reviewing code | Style, patterns, conventions |
| `/docs/DECISIONS.md` | Before major changes | Past decisions & rationale |
| `ROADMAP.md` | Before feature planning | Strategic direction, feature pipeline |
| `/updates/MONTHLY-UPDATES-TEMPLATE.md` | Creating/updating monthly files | Template & rules |

---

## Monthly Updates

### Which File to Write
- **Always** identify the current calendar month
- **Write to** `YYYY-MM.md` for that month
- **Never** write new work to a past month unless the task explicitly relates to that period

### Bootstrap Context Creation
When introducing this system to an existing repo:
1. Check if `YYYY-MM.md` exists for current month — if not, create it
2. If no monthly files exist at all:
   - Create current month file
   - Also create previous month file
   - Use `git log --since="60 days ago"` to populate both with recent work

---

## Document Maintenance

**You are responsible for keeping project documentation current.** Update these files proactively:

| Document | Update When... |
|----------|----------------|
| `/updates/YYYY-MM.md` | After completing significant work |
| `/docs/PROJECT-CONTEXT.md` | New features, components, or integrations added |
| `/docs/ARCHITECTURE.md` | System design or tech stack changes |
| `/docs/DECISIONS.md` | Major technical/architectural decisions made |
| `ROADMAP.md` | When features move between horizons or new outcomes identified |
| `specs/NNN-feature/*.md` | After each implementation session |

---

## Tool-Agnostic Usage Patterns

These prompts work with **any AI coding tool** (Claude, Windsurf, Cursor, Copilot, etc.):

### Session Start
```
Read @AGENT.md and @updates/YYYY-MM.md
```

### Before Writing Code
```
Read @docs/CODING-STANDARDS.md then implement [task]
```

### Before Major Changes
```
Read @docs/DECISIONS.md and @docs/ARCHITECTURE.md before proceeding
```

### Context Recovery
```
Read @AGENT.md and the last 2 monthly updates, then summarise what's in progress
```

### Tool-Specific Notes

| Tool | Context Loading |
|------|----------------|
| **Claude Code** | Auto-reads `CLAUDE.md` which points to `AGENT.md` |
| **Windsurf** | Use `@filename` to reference files |
| **Cursor** | Use `@filename` or add to context with Cmd+Enter |
| **Copilot** | Reference files in chat with `#file:` |

---

**Context System Version:** 3.0
**Last Updated:** [Date]
