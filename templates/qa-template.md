# QA Test Plan: [###-feature-name]

## Purpose
Manual QA checklist for [feature description]. Maps to acceptance scenarios in spec.md.

## Preconditions
- [Environment requirement, e.g., "App deployed to staging/production"]
- [Account requirement, e.g., "Test user account available"]
- [Feature flag requirement, e.g., "Feature flag enabled via preview URL"]
- [Data requirement, e.g., "Test data seeded"]

## Test Scenarios

### QA-001: [Scenario title]
**Steps**
1. [Step 1]
2. [Step 2]

**Expected**
- [Expected outcome 1]
- [Expected outcome 2]

### QA-002: [Scenario title]
**Steps**
1. [Step 1]
2. [Step 2]

**Expected**
- [Expected outcome 1]
- [Expected outcome 2]

### QA-003: [Scenario title]
**Steps**
1. [Step 1]
2. [Step 2]

**Expected**
- [Expected outcome 1]

<!--
  Add more scenarios as needed. Each scenario should map to an acceptance
  scenario in spec.md or cover an edge case.

  Naming convention: QA-NNN where NNN is sequential within this feature.
-->

## Defect Logging
Record defects with:
- Build/commit SHA
- User account used
- Repro steps
- Expected vs actual
- Screenshot/video evidence

## Execution Notes

| Scenario | Date | Build SHA | Result | Tester | Notes |
|----------|------|-----------|--------|--------|-------|
| QA-001 | YYYY-MM-DD | `abc1234` | PASS/FAIL | [tester] | [notes] |

<!--
  Each execution entry must include:
  - Which scenarios were tested (by QA-xxx ID or range)
  - Date of execution
  - Build SHA or commit reference
  - Pass/Fail result
  - Who ran the test (agent name, CI, or human tester)
  - Relevant notes (failures, environment details, evidence links)
-->
