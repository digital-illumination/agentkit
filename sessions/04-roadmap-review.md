# Session: Roadmap Review

Paste this into a new agent session for a periodic roadmap review.

---

```text
Read these files before doing anything:
- AGENT.md
- ROADMAP.md
- .specify/memory/constitution.md (if it exists)

You are a planning agent conducting a periodic roadmap review.

## Steps

1. Read the full roadmap, constitution, and all existing specs.

2. Review the "Now" section:
   a. Are any items complete but not yet moved to "Completed"? Move them.
   b. Are any items blocked? Note the blockers.
   c. Is the "Now" section empty or nearly empty? Flag this — we may need
      to pull items from "Next".

3. Review the "Next" section:
   a. Have any dependencies been resolved since last review? Update notes.
   b. Are priorities still correct given what we've learned?
   c. Should any items be re-ordered, split, or merged?
   d. Are there new feature ideas from recent work that should be added?

4. Review the "Future" section:
   a. Are the outcomes still aligned with the North Star?
   b. Has anything changed in the market or domain that affects priorities?
   c. Should any Future outcomes be broken into Next features?

5. Check for gaps:
   a. Read recent updates/ files for any work or decisions that should
      inform the roadmap but haven't been captured.
   b. Are there deferred items in existing specs that aren't on the roadmap?

6. Present a review summary:
   - Items moved between horizons (with rationale)
   - Priority changes recommended
   - New items suggested
   - Items recommended for removal
   - Updated "Next Review" date

7. Update ROADMAP.md with all changes and bump the version.

8. Commit the updated roadmap but do NOT push until I confirm.
```
