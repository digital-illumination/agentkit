# Spec-Driven Development

## Purpose

This project uses a spec-driven workflow. The goal is to make product intent, security decisions, and delivery status explicit and traceable. The spec, plan, and task files follow the Spec Kit structure.

## Core Artifacts

Each feature produces a set of traceable artifacts:

- **Strategic roadmap**: `ROADMAP.md` (project root) — North Star, horizons, and feature pipeline
- **Product spec**: `specs/NNN-feature-name/spec.md`
- **Implementation plan**: `specs/NNN-feature-name/plan.md`
- **Task tracking**: `specs/NNN-feature-name/tasks.md`
- **QA test plan**: `specs/NNN-feature-name/qa.md`
- **Architecture decisions**: `docs/adr/` (optional, for significant decisions)
- **Testing strategy**: `docs/TESTING-STRATEGY.md`

## Workflow

0. Define the North Star and strategic horizons in `ROADMAP.md`.
1. Select the next feature from the roadmap's "Next" horizon and move it to "Now".
2. Capture the product problem and scope in a spec.
3. Translate the spec into a plan with architecture and milestones.
4. Break the plan into tasks and track status.
5. Record architectural and security decisions as ADRs.
6. Implement the minimum shippable slice.
7. Update documentation as infrastructure or scope changes.
8. Validate with the acceptance scenarios in the spec.

## Spec Status Lifecycle

Every feature spec tracks its status in the header. Valid statuses and their meanings:

| Status | Meaning |
|--------|---------|
| **Draft** | Spec is being written or refined; not yet reviewed for implementation |
| **Reviewed** | Spec has been reviewed and accepted; ready for planning and task breakdown |
| **In Progress** | Active implementation work is happening |
| **Complete** | All MVP-scope work is done; backlog items may remain for future iterations |
| **Released** | Feature is live in production with flags fully rolled out |

Transitions follow this order: Draft -> Reviewed -> In Progress -> Complete -> Released.

A spec may skip "Reviewed" if the author and reviewer are the same person (common in solo agent workflows), going directly from Draft to In Progress.

## Agent Session Requirements

After each agent session, update the relevant specs and tasks and add or update tests for the work completed. The golden thread must remain green in CI.

Before requesting a PR (or asking a human to raise one), the agent must run local CI-equivalent verification commands and fix failures first. Minimum gate (adjust for your stack):

```bash
# Example for a Node.js/TypeScript project:
npm run lint
npm test
npx tsc --noEmit

# Example for a Python project:
ruff check .
pytest
mypy .
```

If CI uses a different runtime version than the local shell, also run tests under the CI version before PR.

After verification is green, the agent must complete delivery by:
- Committing the validated changes
- Pushing the feature branch
- Opening the PR with a concise summary and verification results

## Ralph Wiggum Loop Requirement

All implementation sessions must run in tight, verified slices:

1. Restate goal and assumptions before each slice.
2. Make the smallest useful code or docs change.
3. Run the smallest relevant verification immediately.
4. If green, update spec/tasks/qa for the slice before continuing.
5. If red, fix before moving on.
6. After two failed attempts on the same issue, stop and present options.

No big-bang unverified edits are allowed in feature sessions.

## QA Requirement

Every spec must include a `qa.md` file with a manual test checklist that maps to acceptance scenarios. See `templates/qa-template.md` for the standard format.

### QA Execution Notes Format

When recording QA execution results, use the structured table format:

| Scenario | Date | Build SHA | Result | Tester | Notes |
|----------|------|-----------|--------|--------|-------|
| QA-001 through QA-005 | 2026-02-14 | `abc1234` | PASS | Agent + CI | Automated suite green |
| QA-007 (responsive) | 2026-02-15 | `def5678` | PASS | Manual | Checked 375px, 768px, 1280px |
| QA-009 (contrast) | 2026-02-15 | `def5678` | FAIL | Manual | Dark mode heading below 4.5:1 |

Each execution entry must include:

- Which scenarios were tested (by QA-xxx ID or range)
- Date of execution
- Build SHA or commit reference
- Pass/Fail result
- Who ran the test (agent name, CI, or human tester)
- Relevant notes (failures, environment details, evidence links)

Prose-style execution notes are acceptable as supplements but must not replace the structured table for new QA runs.

## Feature Flag Requirement

Use a single production environment. All new features must be gated behind feature flags and validated in both ON and OFF states.

## Feature Folder Structure

Each feature should have its own folder under `specs/`.

Example:

```text
specs/
  000-foundation/
    spec.md           # Product specification
    plan.md           # Implementation plan
    tasks.md          # Task tracking
    qa.md             # QA test plan and execution notes
  001-user-auth/
    spec.md
    plan.md
    tasks.md
    qa.md
```

## Spec Requirements

Every spec should include:
- User stories with acceptance scenarios
- Functional requirements (FR-xxx IDs)
- Key entities and data classification
- Security model and assumptions
- Measurable success criteria (SC-xxx IDs)

## Task Tracking Conventions

### Section Structure

- **Backlog**: upcoming work not started
- **In Progress**: active tasks
- **Done**: completed work

Move tasks between sections as work progresses. Keep the Done list as a factual record of what was delivered.

### Task Format

Use the structured task format:

```
- [ ] T001 [P] [US1] Description with `path/to/file`
```

- `T001`: sequential task ID
- `[P]`: task can run in parallel (different files, no dependencies)
- `[US1]`: maps to a user story in the spec
- Include exact file paths in descriptions

See `templates/tasks-template.md` for the full template with phases and dependency ordering.

## ADR Conventions

- File name format: `docs/adr/NNNN-title.md`
- Each ADR should include: Status, Context, Decision, Alternatives, Consequences
- Use ADRs for decisions that affect architecture, security, or infrastructure

## Definition of Done (per feature)

- Spec, plan, and tasks updated
- ADRs written for material decisions
- QA test plan updated with execution notes
- Acceptance scenarios validated
- Local CI-equivalent verification completed before PR request
- Verified changes committed, pushed, and PR opened

## Rebuild From Specs

Use this approach to recreate a project from the written specs and ADRs:

1. Read the foundation spec (`specs/000-foundation/spec.md`) and all ADRs
2. Recreate the repo structure with `specs/`, `docs/`, and source directories
3. Scaffold the application using the tech stack documented in `AGENT.md`
4. Configure build and deploy pipelines per the deployment documentation
5. Recreate infrastructure per the runbooks
6. Verify against the acceptance scenarios in each spec

---

## Roadmap-to-Spec Pipeline

The roadmap feeds the spec-driven workflow, enabling autonomous feature proposal with human oversight:

1. **Planning agent** reads `ROADMAP.md` (North Star + horizons), `constitution.md`, and existing specs
2. Selects the highest-priority unblocked item from the "Next" horizon
3. Generates a draft `spec.md` in `specs/NNN-feature-name/` using `templates/spec-template.md`
4. Moves the item from "Next" to "Now" in `ROADMAP.md` with Status: Draft
5. **Human reviews** the draft spec and approves (Status: Reviewed)
6. **Implementation agent** picks up the reviewed spec and runs the standard plan → tasks → implement pipeline

This pipeline enables autonomous feature proposal while maintaining human oversight at the spec review gate.
