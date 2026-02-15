# Changelog

All notable changes to this project will be documented in this file.

## [Unreleased]

## [3.0.0] - 2026-02-15

### Added
- `AGENT.md` — Vendor-agnostic entry point (replaces `AI.md`)
- `CLAUDE.md` — Thin pointer for Claude Code auto-discovery
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
