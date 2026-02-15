# Changelog

All notable changes to this project will be documented in this file.

## [Unreleased]

## [3.2.0] - 2026-02-15

### Added
- `sessions/` directory with 5 ready-to-paste agent session starters:
  - `01-plan-next-feature.md` — planning agent proposes next spec from roadmap
  - `02-implement-feature.md` — implementation agent builds a reviewed spec
  - `03-qa-review.md` — QA agent verifies completed feature against spec
  - `04-roadmap-review.md` — periodic roadmap horizon review
  - `05-context-recovery.md` — recover context mid-project
- Sessions copied by update-context scripts alongside templates

### Changed
- Renamed repo from `ai-context-system` to `agentkit`
- Updated all internal references to new repo name
- Updated README description to reflect full toolkit scope
- Bumped version to 3.2.0

## [3.1.0] - 2026-02-15

### Added
- `templates/roadmap-template.md` — Strategic roadmap template with North Star, Future/Next/Now horizons, and agent planning workflow
- ROADMAP.md added to recommended files in verify scripts
- Roadmap-to-Spec Pipeline section in SPEC-DRIVEN.md documenting the two-agent workflow
- Roadmap integrated into BOOTSTRAP.md (directory tree, both initialisation paths, post-bootstrap checklist)

### Changed
- Updated Context Ladder in AGENT.md to include ROADMAP.md at level 5 (before proposing features)
- Updated SPEC-DRIVEN.md workflow to start from roadmap (steps 0-1 added)
- Updated BOOTSTRAP.md with new Step 5 "Create Roadmap" in Path A, renumbered subsequent steps
- Updated bootstrap scripts with roadmap creation step in "Next steps" output
- Bumped version to 3.1.0

## [3.0.0] - 2026-02-15

### Added
- `AGENT.md` — Vendor-agnostic entry point (replaces `AI.md`)
- `CLAUDE.md` — Thin pointer for Claude Code auto-discovery
- `AGENTS.md` — Thin pointer for Codex / AGENTS.md-compatible tools
- `GEMINI.md` — Thin pointer for Gemini CLI auto-discovery
- `.windsurfrules` — Thin pointer for Windsurf / Cascade auto-discovery
- `docs/SPEC-DRIVEN.md` — Spec-driven development workflow with status lifecycle, QA format, task conventions
- `docs/TESTING-STRATEGY.md` — Golden thread testing strategy with spec-to-test traceability
- `templates/` directory with 6 reusable templates:
  - `spec-template.md` — Feature specification with prioritised user stories
  - `plan-template.md` — Implementation plan with constitution check gate
  - `tasks-template.md` — Task breakdown with phases and parallel markers
  - `qa-template.md` — QA test plan with structured execution notes
  - `checklist-template.md` — Generic checklist format
  - `constitution-template.md` — Project principles and non-negotiables
- Agent analysis prompts in `docs/BOOTSTRAP.md` for existing codebase bootstrap
- Dual-path initialisation (new repo + existing repo) in `docs/BOOTSTRAP.md`
- Post-bootstrap checklist for human verification
- Recommended files check (specs, constitution) in verify scripts
- Next steps output in bootstrap scripts

### Changed
- Renamed `AI.md` to `AGENT.md` for vendor-agnostic approach
- Completely rewrote `docs/BOOTSTRAP.md` with dual-path initialisation
- Generalised all docs — removed Salesforce/Altia Intel-specific content
- Updated all 6 scripts (bash + PowerShell) for new filenames and additional files
- Updated verify scripts to check for new required files (CLAUDE.md, SPEC-DRIVEN.md, TESTING-STRATEGY.md)
- Updated bootstrap scripts to create `specs/`, `.specify/memory/`, and `templates/` directories

### Removed
- `AI.md` (replaced by `AGENT.md`)
- All Salesforce-specific content (Apex, LWC, SOQL, Flows, Governor limits)
- All Altia Intel-specific content (project details, integrations, business context)

## [2.1.0] - 2025-12-31

- Tool-agnostic AI context system
- Bootstrap instructions and templates
- Update and bootstrap scripts (bash + PowerShell)
- Context version tracking
