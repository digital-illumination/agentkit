# Session: Plan Next Feature

Paste this into a new agent session to have it propose the next feature spec. Works for both roadmap-driven and ad-hoc features.

---

```text
Read these files before doing anything:
- AGENT.md
- ROADMAP.md
- .specify/memory/constitution.md (if it exists)
- docs/SPEC-DRIVEN.md

You are a planning agent. Your job is to propose the next feature spec.

## Determine the feature source

Check whether I have given you a specific feature to build:

- **If I specified a feature**: This is an AD-HOC feature. Skip to Step 2.
- **If I said "plan the next feature" (or similar)**: This is a ROADMAP feature.
  Go to Step 1.

## Steps

### Step 1 — Select from roadmap (skip for ad-hoc)

Read the roadmap's "Next" horizon and identify the highest-priority (P1 first)
item that has no unresolved blockers. Check the "Dependencies" column — if a
dependency hasn't reached "Complete" or "Released" in the "Now" or "Completed"
sections, skip that item and move to the next one.

If "Next" is empty (maintenance mode), report this and ask whether I want to
propose an ad-hoc feature instead.

### Step 2 — Review existing work

Read all existing specs in specs/ to understand what has already been built.
Pay attention to deferred items and backlog notes — the new spec should not
duplicate or contradict existing work.

### Step 3 — Create the spec directory

Determine the next sequential feature ID by checking existing specs/ directories.
mkdir -p specs/NNN-feature-name

### Step 4 — Generate the spec

Generate a draft spec.md using the template at templates/spec-template.md.
The spec must:
- Align with the North Star
- Respect the constitution's non-negotiables (if a constitution exists)
- For roadmap features: reference the roadmap description for scope
- For ad-hoc features: reference the user's request for scope
- Include user stories with acceptance scenarios
- Include functional requirements (FR-xxx IDs)
- Include success criteria (SC-xxx IDs)
- Mark Status: Draft in the header

### Step 5 — Update ROADMAP.md

- For roadmap features: move the item from the "Next" table to the "Now" table
- For ad-hoc features: add a new row directly to the "Now" table
- Set Status: Draft
- Set Origin: Roadmap or Ad-hoc
- Link the Spec column to specs/NNN-feature-name/spec.md

### Step 6 — Stop here

Do NOT generate plan.md, tasks.md, or qa.md yet. Stop after the spec.

### Step 7 — Present summary

Present a summary of:
- Which feature was selected and why (or what ad-hoc request was received)
- Key decisions made in the spec
- Any assumptions that need human confirmation
- What the next step is (human review → then implementation session)

### Step 8 — Commit

Commit the new spec and roadmap update, but do NOT push until I confirm.
```
