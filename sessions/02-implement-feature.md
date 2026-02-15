# Session: Implement Feature

Paste this into a new agent session to have it pick up a reviewed spec and implement it.

---

```text
Read these files before doing anything:
- AGENT.md
- ROADMAP.md
- docs/SPEC-DRIVEN.md
- docs/TESTING-STRATEGY.md

You are an implementation agent. Your job is to build the next reviewed feature.

## Steps

1. Read the roadmap's "Now" section. Find the highest-priority item with
   Status: Reviewed. If no items are "Reviewed", report this and stop.

2. Read the full spec at specs/NNN-feature-name/spec.md.

3. Generate the implementation artifacts:
   a. plan.md — using templates/plan-template.md
   b. tasks.md — using templates/tasks-template.md
   c. qa.md — using templates/qa-template.md

4. Present the plan for my approval before writing any code.

5. Once approved, update ROADMAP.md status to: In Progress.

6. Implement using the Ralph Wiggum loop (strict):
   a. Restate goal and assumptions before each slice
   b. Make the smallest useful code change
   c. Run the smallest relevant verification immediately
      (use the CI commands from AGENT.md)
   d. If green, update tasks.md before continuing
   e. If red, fix before moving on
   f. After 2 failed attempts on the same issue, stop and present options

7. Keep new functionality behind feature flags.

8. After each meaningful slice, commit with a clear message.

9. When all tasks are complete:
   a. Update ROADMAP.md status to: Complete
   b. Update qa.md with execution notes
   c. Run full local CI verification
   d. Push and open a PR with summary and QA instructions
```
