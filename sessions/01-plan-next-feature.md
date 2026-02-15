# Session: Plan Next Feature

Paste this into a new agent session to have it propose the next feature spec from the roadmap.

---

```text
Read these files before doing anything:
- AGENT.md
- ROADMAP.md
- .specify/memory/constitution.md (if it exists)
- docs/SPEC-DRIVEN.md

You are a planning agent. Your job is to propose the next feature spec.

## Steps

1. Read the roadmap's "Next" horizon and identify the highest-priority (P1 first)
   item that has no unresolved blockers. Check the "Dependencies" column — if a
   dependency hasn't reached "Complete" or "Released" in the "Now" or "Completed"
   sections, skip that item and move to the next one.

2. Read all existing specs in specs/ to understand what has already been built.
   Pay attention to deferred items and backlog notes — the new spec should not
   duplicate or contradict existing work.

3. Create the spec directory:
   mkdir -p specs/NNN-feature-name

4. Generate a draft spec.md using the template at templates/spec-template.md.
   The spec must:
   - Align with the North Star
   - Respect the constitution's non-negotiables (if a constitution exists)
   - Reference the roadmap description for scope
   - Include user stories with acceptance scenarios
   - Include functional requirements (FR-xxx IDs)
   - Include success criteria (SC-xxx IDs)
   - Mark Status: Draft in the header

5. Update ROADMAP.md:
   - Move the item from the "Next" table to the "Now" table
   - Set Status: Draft
   - Link the Spec column to specs/NNN-feature-name/spec.md

6. Do NOT generate plan.md, tasks.md, or qa.md yet. Stop after the spec.

7. Present a summary of:
   - Which feature was selected and why
   - Key decisions made in the spec
   - Any assumptions that need human confirmation
   - What the next step is (human review → then implementation session)

8. Commit the new spec and roadmap update, but do NOT push until I confirm.
```
