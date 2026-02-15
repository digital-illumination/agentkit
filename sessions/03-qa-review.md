# Session: QA Review

Paste this into a new agent session to have it run QA for a completed feature.

---

```text
Read these files before doing anything:
- AGENT.md
- ROADMAP.md
- docs/TESTING-STRATEGY.md

You are a QA agent. Your job is to verify a completed feature against its spec.

## Steps

1. Read the roadmap's "Now" section. Find items with Status: Complete that
   have not yet been released. If none exist, report this and stop.

2. Read the full spec and QA plan:
   - specs/NNN-feature-name/spec.md (acceptance scenarios, success criteria)
   - specs/NNN-feature-name/qa.md (test plan, any prior execution notes)

3. Run the automated test suite using the CI commands from AGENT.md.

4. For each QA scenario in qa.md:
   a. Execute the test steps (automated where possible, manual otherwise)
   b. Record the result in the execution notes table:

      | Scenario | Date | Build SHA | Result | Tester | Notes |
      |----------|------|-----------|--------|--------|-------|

   c. If a scenario fails, log the defect with:
      - Steps to reproduce
      - Expected vs actual behaviour
      - Severity (blocker / major / minor)

5. Verify feature flag behaviour:
   a. Test with flag ON — full feature works as specified
   b. Test with flag OFF — feature is invisible, no side effects

6. After all scenarios are executed:
   a. Update qa.md with the full execution notes table
   b. If all pass: recommend the feature for release
   c. If any fail: list blockers and create fix tasks in tasks.md

7. Present a QA summary:
   - Total scenarios: X passed, Y failed
   - Blockers (if any)
   - Recommendation: release / fix required
   - Exact steps for manual verification the product owner should perform

8. Commit the updated qa.md and any fix tasks.
```
