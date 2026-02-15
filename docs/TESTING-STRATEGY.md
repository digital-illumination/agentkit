# Testing Strategy (Golden Thread)

## Purpose

Agentic coding is powerful but risky. This strategy creates a golden thread of tests so changes are traceable to specs and regressions are caught early.

## Golden Thread Goals

- Every spec has executable tests.
- Each agent session updates specs, tasks, and tests.
- CI blocks deploys when golden tests fail.

## Test Layers

### 1. Golden Thread (must pass in CI)

Minimal, high-value tests mapped directly to the spec acceptance scenarios:
- [Example: Login -> access protected route]
- [Example: Create record -> reload -> view]
- [Example: Upload file -> download -> verify]

### 2. Integration / Contract Tests

- Auth provider and route guard behaviour
- API endpoint contracts
- Database access patterns (emulator-based where possible)

### 3. Unit / Property Tests

- Core business logic and algorithms
- Serialisation, parsing, and validation
- Utility helpers

## Spec-to-Test Traceability

### File Naming Convention

Name test files with spec IDs where practical:

```
src/__tests__/000-foundation-login.test.ts
src/__tests__/001-vault-items.test.tsx
tests/e2e/000-foundation-login.spec.ts
```

### In-Code Traceability

Test descriptions should reference spec IDs to enable tracing from requirements to test coverage.

**Supported ID prefixes:**

- `FR-xxx` — Functional Requirements from spec.md
- `QA-xxx` — QA Scenarios from qa.md
- `SC-xxx` — Success Criteria from spec.md

**Pattern:**

```typescript
// Reference in describe block for broad coverage
describe("User authentication (FR-001, FR-002)", () => {
  // Reference in it block for specific scenario
  it("creates account and redirects to dashboard (QA-003, QA-004)", async () => {
    // test body
  });

  it("validates required fields before save (FR-007, QA-008)", async () => {
    // test body
  });
});
```

### When to Apply

- **New tests**: Always include relevant spec IDs.
- **Existing tests**: Add spec IDs opportunistically when the file is being modified for other reasons. Do not make bulk-rename-only changes.

### Acceptance Scenario Coverage

Acceptance scenarios in the spec must be reflected in tests. When writing new tests, check the relevant spec's acceptance scenarios and ensure each one has at least one automated test or a manual QA entry in qa.md.

## QA Documents

Each feature spec must include a QA checklist in `specs/<feature>/qa.md`. This is the manual validation plan and must be updated alongside tests. See `templates/qa-template.md` for the standard format.

## CI Gates

- Run unit + golden thread tests on every PR and deploy.
- Block deploy if any golden test fails.
- Full suite runs nightly or on release candidates.

## Pre-PR Local Verification (Required)

Before requesting a PR, run local commands equivalent to CI and fix failures first:

```bash
# Adjust these commands for your stack:
# Node.js/TypeScript example:
npm run lint
npm test
npx tsc --noEmit

# Python example:
ruff check .
pytest
mypy .
```

If CI runs a different runtime version than your shell, also run the test suite using the CI version before PR.

After local verification is green, the agent must commit, push, and open the PR in the same delivery flow.

## Agent Session Checklist

After each agent session:
1. Update the relevant spec and tasks.
2. Add or update tests for changes made.
3. Run local CI-equivalent checks before PR request.
4. Commit and push verified changes, then open the PR.
5. Ensure CI passes with the golden thread intact.

## Tight Loop Execution

Use the Ralph Wiggum loop while implementing:
1. Restate the current slice goal and assumptions.
2. Implement the smallest viable change.
3. Run the smallest relevant test/lint/typecheck immediately.
4. Document outcomes and update spec/tasks/qa before the next slice.

This keeps regressions localised and evidence attached to each change.

## Feature Flags

- All new features are gated behind flags in production.
- QA must validate both ON and OFF states for each flag.
- Security-sensitive features require backend enforcement (rules or server checks).

## Test Stack

[PLACEHOLDER: Choose your project's test stack. Recommendations:]

- **Unit + Integration**: Vitest, Jest, pytest, cargo test, or your framework's built-in runner
- **E2E (when needed)**: Playwright, Cypress, or equivalent
- **Coverage**: Aim for meaningful coverage of acceptance scenarios, not arbitrary percentages

## Current Coverage

[PLACEHOLDER: Document your current test coverage here]

## Next Additions

[PLACEHOLDER: Document planned testing improvements here]
