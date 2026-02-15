# [PROJECT NAME] Roadmap

**Version**: 1.0.0
**Last Reviewed**: [DATE]
**Next Review**: [DATE + review cadence]

<!--
  PURPOSE: This roadmap bridges strategic direction and tactical spec generation.

  HOW AGENTS USE THIS FILE:
  A planning agent reads this file alongside the constitution and existing specs
  to propose the next feature spec. Features can enter the pipeline two ways:

    STRATEGIC: North Star → Future (outcomes) → Next (features) → Now (specs) → specs/NNN/
    AD-HOC:    User request or agent proposal → Now (specs) → specs/NNN/

  Both paths produce the same spec-driven artifacts. The only difference is origin.

  REVIEW CADENCE:
  Review quarterly at minimum. Move items between horizons as time passes.
  Archive completed items to the Completed section for historical context.

  CONVENTIONS:
  - Priority: P1 (critical), P2 (important), P3 (nice-to-have)
  - Status: Draft, Reviewed, In Progress, Complete, Released
  - Feature IDs: NNN-feature-name (matching specs/ directory names)
  - Origin: Roadmap (from Next horizon) or Ad-hoc (direct request / agent proposal)
  - Use British English throughout

  MAINTENANCE MODE:
  When the North Star is largely achieved, a project enters maintenance mode.
  In this state the "Future" section describes sustaining outcomes (reliability,
  performance, user satisfaction) rather than transformational goals. "Next" may
  be intentionally empty, with work driven by ad-hoc requests flowing directly
  into "Now". The system works identically — only the source of features changes.
-->

## North Star

<!--
  A single sentence describing the ultimate outcome this project is working towards.
  This is NOT a mission statement or tagline. It should be specific enough that an
  agent can evaluate whether a proposed feature moves the project closer to this goal.

  Example: "Every small business owner can accept payments in under 5 minutes,
  without technical knowledge or third-party dependencies."
-->

[PLACEHOLDER: Single sentence — the high-level outcome this project exists to achieve.]

---

## Future (12 months)

<!--
  3-5 HIGH-LEVEL OUTCOMES, not features. These describe the state of the world
  you want to reach, not the work you will do to get there.

  An agent uses these to understand the project's strategic direction and evaluate
  whether proposed features align with it.

  Keep descriptions outcome-focused:
    Good: "Users trust the platform with their most sensitive data"
    Bad:  "Implement encryption and audit logging"
-->

| # | Outcome | Description | Depends On |
|---|---------|-------------|------------|
| 1 | [Outcome name] | [What this looks like when achieved — 1-2 sentences] | [Other outcomes or external factors, or "None"] |
| 2 | [Outcome name] | [What this looks like when achieved] | [Dependencies] |
| 3 | [Outcome name] | [What this looks like when achieved] | [Dependencies] |

---

## Next (6 months)

<!--
  More detailed FEATURE AREAS with enough context for a planning agent to generate
  a draft spec. Each entry should describe the problem space and desired outcome,
  not the implementation.

  The planning agent reads these entries and, when one moves to "Now", generates
  the initial spec.md, plan.md, tasks.md, and qa.md in specs/NNN-feature-name/.

  Target Quarter uses calendar quarters (e.g., Q2 2026).
-->

| Feature ID | Name | Description | Priority | Dependencies | Target Quarter |
|------------|------|-------------|----------|--------------|----------------|
| [NNN-feature-name] | [Short name] | [Problem space and desired outcome — 2-3 sentences] | [P1/P2/P3] | [Other feature IDs or "None"] | [Q# YYYY] |
| [NNN-feature-name] | [Short name] | [Problem space and desired outcome] | [P1/P2/P3] | [Dependencies] | [Q# YYYY] |

---

## Now (3 months)

<!--
  Refined features READY FOR CODE GENERATION. Each entry here should have a
  corresponding directory in specs/NNN-feature-name/ with at minimum a spec.md.

  Features arrive here via two paths:

  FROM ROADMAP (strategic):
  1. Move the item from "Next" to this table
  2. Create specs/NNN-feature-name/ directory
  3. Generate spec.md from the roadmap description + constitution + North Star
  4. Set Origin: Roadmap

  AD-HOC (user request or agent proposal):
  1. Assign the next sequential feature ID (NNN-feature-name)
  2. Create specs/NNN-feature-name/ directory
  3. Generate spec.md from the user request + constitution + North Star
  4. Add directly to this table with Origin: Ad-hoc
  (No "Next" entry required — the feature skips the strategic pipeline.)

  Sprint/Cycle is a free-text field for your project's iteration naming
  (e.g., "Sprint 4", "February", "Cycle 2026-Q1-B").
-->

| Spec | Name | Status | Priority | Origin | Sprint/Cycle | Notes |
|------|------|--------|----------|--------|--------------|-------|
| [`NNN-feature-name`](specs/NNN-feature-name/spec.md) | [Short name] | [Draft/Reviewed/In Progress/Complete] | [P1/P2/P3] | [Roadmap/Ad-hoc] | [Current iteration] | [Brief context or blockers] |

---

## Completed

<!--
  Features that have shipped. Moved here from "Now" when status reaches "Released".
  Maintains historical context so agents understand what has already been built
  and can avoid proposing duplicate work.
-->

| Spec | Name | Released | Summary |
|------|------|----------|---------|
| [`000-foundation`](specs/000-foundation/spec.md) | Foundation | [DATE] | [One-line summary of what shipped] |

---

## Review Cadence

<!--
  Define how often this roadmap is reviewed and by whom.
  Suggested: quarterly for Future/Next, monthly for Now.
-->

| Horizon | Review Frequency | Reviewer |
|---------|-----------------|----------|
| North Star | Annually | [Project owner / stakeholder] |
| Future (12 months) | Quarterly | [Project owner / stakeholder] |
| Next (6 months) | Quarterly | [Project owner / planning agent] |
| Now (3 months) | Monthly (or per sprint) | [Project owner / implementation agent] |

---

## Agent Planning Workflow

<!--
  This section documents the workflow for agents using this roadmap.
  It is NOT a placeholder to fill in — it is reference documentation.
-->

### Proposing a New Feature (from Roadmap)

1. Read: North Star, constitution, this roadmap, and all existing specs
2. Identify the highest-priority item in "Next" that has no unresolved blockers
3. Generate a draft `spec.md` using `templates/spec-template.md`
4. Move the item from "Next" to "Now" with Status: Draft, Origin: Roadmap
5. Present the draft spec for human review

### Proposing an Ad-hoc Feature

1. Read: North Star, constitution, this roadmap, and all existing specs
2. Take the feature request from the user (or propose one based on project gaps)
3. Assign the next sequential feature ID (NNN-feature-name)
4. Generate a draft `spec.md` using `templates/spec-template.md`
5. Add the feature directly to "Now" with Status: Draft, Origin: Ad-hoc
6. Present the draft spec for human review

### Picking Up Work

1. Read this roadmap's "Now" section
2. Find the highest-priority item with Status: Reviewed
3. Generate `plan.md`, `tasks.md`, and `qa.md` from the spec
4. Update Status to: In Progress
5. Begin implementation using the spec-driven workflow

### Completing Work

1. Update the "Now" entry Status to: Complete (then Released when live)
2. Move Released items to the "Completed" section
3. Update `AGENT.md` Active Feature Specs table to stay in sync
4. Update `updates/YYYY-MM.md` with the delivery summary
