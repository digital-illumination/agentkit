# Contributing

Thanks for your interest in improving the AI Context System.

## How to Contribute

1. Create a feature branch
2. Make focused changes
3. Update `CHANGELOG.md` under [Unreleased]
4. Ensure scripts remain POSIX-safe and PowerShell-compatible
5. Submit a PR with a concise description and rationale

## Style Guidelines

- Keep instructions tool-agnostic
- Avoid hardcoded months or project-specific details
- Prefer placeholders (`YYYY-MM`, `[PROJECT NAME]`, `[PLACEHOLDER]`) in templates
- Use British English spelling
- Keep templates generic — no project-specific content

## Templates

When adding or modifying templates in `templates/`:
- Use placeholder markers for project-specific content
- Include comments explaining what to fill in
- Keep formatting consistent with existing templates
- Test that templates work with the bootstrap flow

## Spec-Driven Conventions

When modifying `docs/SPEC-DRIVEN.md` or `docs/TESTING-STRATEGY.md`:
- Keep conventions generic across tech stacks
- Provide examples for multiple languages where practical
- Reference the templates directory for format details

## Versioning

- Tag releases using semver (e.g., `v3.0.0`)
- Update `CONTEXT-VERSION.md` and `CHANGELOG.md`
- Bump MAJOR for breaking changes (file renames, removed features)
- Bump MINOR for new files, templates, or features
- Bump PATCH for documentation fixes and clarifications
