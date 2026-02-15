# AI Context System Bootstrap

This document guides you through setting up the spec-driven AI context system for a project. It supports two scenarios: starting fresh with a new repository, or adding the system to an existing codebase.

---

## Quick Start

**Add the submodule, then run the bootstrap script:**

```bash
git submodule add https://github.com/digital-illumination/ai-context-system.git .context
bash .context/scripts/bootstrap-new-repo.sh
```

Then follow **Path A** (new repo) or **Path B** (existing repo) below to complete setup.

---

## What Gets Created

```
repository/
├── AGENT.md                          # Entry point (always read by AI)
├── CLAUDE.md                         # Claude Code auto-discovery pointer
├── docs/
│   ├── BOOTSTRAP.md                  # This file (reference)
│   ├── SPEC-DRIVEN.md                # Spec-driven workflow
│   ├── TESTING-STRATEGY.md           # Golden thread testing
│   ├── PROJECT-CONTEXT.md            # Deep project understanding
│   ├── ARCHITECTURE.md               # System design
│   ├── CODING-STANDARDS.md           # Code conventions
│   └── DECISIONS.md                  # Decision log
├── specs/
│   └── 000-foundation/
│       ├── spec.md                   # Foundation specification
│       ├── plan.md                   # Implementation plan
│       ├── tasks.md                  # Task tracking
│       └── qa.md                     # QA test plan
├── templates/                        # Reusable document templates
├── updates/
│   ├── MONTHLY-UPDATES-TEMPLATE.md   # Template for monthly files
│   └── YYYY-MM.md                    # Current month's log
└── .specify/
    └── memory/
        └── constitution.md           # Project principles
```

---

## Path A: New Repository (No Existing Code)

Use this path when starting a brand new project from scratch.

### Step 1: Add Submodule and Run Bootstrap

```bash
git submodule add https://github.com/digital-illumination/ai-context-system.git .context
bash .context/scripts/bootstrap-new-repo.sh
```

This copies the canonical files (AGENT.md, CLAUDE.md, docs/, templates/) into your project root and seeds the monthly updates.

### Step 2: Fill in AGENT.md

Open `AGENT.md` and replace all `[PLACEHOLDER]` markers with your project details:
- **Project Overview**: 2-3 line description of what you are building
- **Tech Stack**: Languages, frameworks, dependencies you plan to use
- **Directory Structure**: Your planned folder layout
- **Local CI Commands**: Lint, test, and typecheck commands for your stack
- **Code Style Conventions**: Naming, imports, types, exports patterns

### Step 3: Create Constitution

Copy the template and fill in your project principles:

```bash
mkdir -p .specify/memory
cp templates/constitution-template.md .specify/memory/constitution.md
```

Edit `.specify/memory/constitution.md` with your project's:
- Product principles (what matters most)
- Engineering principles (how you build)
- Non-negotiables (hard constraints)

### Step 4: Create Foundation Spec

```bash
mkdir -p specs/000-foundation
cp templates/spec-template.md specs/000-foundation/spec.md
cp templates/plan-template.md specs/000-foundation/plan.md
cp templates/tasks-template.md specs/000-foundation/tasks.md
cp templates/qa-template.md specs/000-foundation/qa.md
```

Edit `specs/000-foundation/spec.md` to describe the foundation of your project (auth, core data model, initial UI, deployment).

### Step 5: Fill in Project Docs

Edit the docs copied by the bootstrap script:
- `docs/PROJECT-CONTEXT.md` — Project identity, business context, scope boundaries
- `docs/ARCHITECTURE.md` — Tech stack, project structure, deployment
- `docs/CODING-STANDARDS.md` — Language-specific conventions
- `docs/DECISIONS.md` — Add initial decision for adopting spec-driven development

### Step 6: Verify and Commit

```bash
bash .context/scripts/verify-context.sh
git add AGENT.md CLAUDE.md docs/ specs/ templates/ updates/ .specify/ .context
git commit -m "docs: Initialise AI context system v3.0"
```

---

## Path B: Existing Repository with Code

Use this path when adding the context system to a project that already has code, history, and conventions.

### Step 1: Add Submodule and Run Bootstrap

Same as Path A:

```bash
git submodule add https://github.com/digital-illumination/ai-context-system.git .context
bash .context/scripts/bootstrap-new-repo.sh
```

### Step 2: Analyse the Codebase

Before filling in the context files, the AI agent (or human) should analyse the existing codebase. Use the analysis prompts in the next section, or follow this manual checklist:

#### 2a. Identify Tech Stack
- Read `package.json`, `Cargo.toml`, `requirements.txt`, `build.gradle`, `go.mod`, or equivalent
- Note: language(s), framework(s), build tool(s), test framework(s), key dependencies

#### 2b. Map Directory Structure
- Run `ls -la` at project root
- Identify source directories, config, tests, docs, assets
- Note the main entry points

#### 2c. Read Existing Documentation
- Read `README.md` for project purpose and setup instructions
- Read any existing docs, guides, or wikis
- Read CI config (`.github/workflows/`, `Dockerfile`, `Makefile`, etc.)
- Read `.env.example` or config files for environment setup

#### 2d. Analyse Code Conventions
- Read 3-5 representative source files
- Infer: file naming convention, import ordering, type style, export pattern, function style
- Read linter config (`.eslintrc`, `ruff.toml`, `.editorconfig`, etc.)

#### 2e. Review Test Patterns
- Read test files to determine test framework and patterns
- Note: test structure (describe/it, test classes, etc.), mocking approach, coverage tools

#### 2f. Understand Recent History
- Run `git log --oneline -30` to see recent development patterns
- Identify active work areas and recent architectural changes

### Step 3: Generate Project Context Files

Using the analysis from Step 2, fill in all context files:

#### AGENT.md
Replace all `[PLACEHOLDER]` markers:
- Project overview from README + package description
- Tech stack from dependency files
- Directory structure from filesystem analysis
- CI commands from workflow files or scripts
- Code conventions from source file analysis

#### Constitution
```bash
mkdir -p .specify/memory
cp templates/constitution-template.md .specify/memory/constitution.md
```
Draft initial principles based on:
- Existing README guidelines
- Code patterns observed (security, testing, etc.)
- Domain context from project description

#### docs/PROJECT-CONTEXT.md
From README, dependency files, git history:
- Project identity and business context
- Current initiatives and feature map
- Integrations and environment details

#### docs/ARCHITECTURE.md
From directory structure, key files, config:
- System overview and tech stack
- Project structure diagram
- Key feature flows and deployment architecture

#### docs/CODING-STANDARDS.md
From source analysis, linter config, existing style guides:
- Language-specific naming and patterns
- Import ordering, type conventions
- Testing and component standards

#### docs/DECISIONS.md
Seed with any major architectural decisions visible in the codebase or git history.

### Step 4: Create Foundation Spec for Existing Features

```bash
mkdir -p specs/000-foundation
cp templates/spec-template.md specs/000-foundation/spec.md
```

Edit the spec to describe **what already exists** (not what you plan to build). Mark all user stories with `**Status**: Complete`. This creates a traceable record of the current state.

### Step 5: Verify and Commit

```bash
bash .context/scripts/verify-context.sh
git add AGENT.md CLAUDE.md docs/ specs/ templates/ updates/ .specify/ .context
git commit -m "docs: Initialise AI context system v3.0 from existing codebase"
```

### Step 6: Human Review

All agent-generated context files should be reviewed by a human. Check:
- [ ] AGENT.md accurately describes the project
- [ ] Constitution reflects actual project values
- [ ] Code conventions match real codebase patterns
- [ ] Architecture doc is accurate
- [ ] Foundation spec covers existing features

---

## Agent Analysis Prompts

Copy-paste these prompts to have an AI agent analyse your existing codebase:

### Prompt 1: Tech Stack Discovery

```
Analyse this repository and identify: programming language(s), framework(s),
build tool(s), test framework(s), CI/CD platform, deployment target, and key
dependencies. Output as a structured table.
```

### Prompt 2: Code Convention Inference

```
Read 5 representative source files and infer: file naming convention, import
ordering, type declaration style, export pattern, function declaration style,
error handling pattern, and test structure. Output as a conventions list.
```

### Prompt 3: Architecture Summary

```
Analyse the directory structure and key configuration files. Describe: high-level
architecture pattern (monorepo, monolith, microservices), key directories and
their purposes, data flow, and external integrations. Output as a structured
architecture summary.
```

### Prompt 4: Foundation Spec Draft

```
Based on the codebase analysis, draft a foundation spec (specs/000-foundation/spec.md)
that describes what currently exists. Include user stories for each major feature
area, mark all as "Complete" status. Use the spec template format from
templates/spec-template.md.
```

### Prompt 5: Full Bootstrap (All-in-One)

```
Read @docs/BOOTSTRAP.md and execute Path B (existing repository) for this
repository. Analyse the codebase, fill in all context files, create the
foundation spec, and verify the setup.
```

---

## Post-Bootstrap Checklist

After completing either path, verify:

- [ ] `AGENT.md` has no remaining `[PLACEHOLDER]` markers
- [ ] `CLAUDE.md` exists and points to AGENT.md
- [ ] Constitution reflects actual project values
- [ ] At least one spec exists in `specs/`
- [ ] CI commands in AGENT.md actually work when run
- [ ] Code conventions match actual codebase patterns
- [ ] All generated docs have been human-reviewed
- [ ] `scripts/verify-context.sh` passes

---

## After Bootstrap

**Every session:**
```
Read @AGENT.md and @updates/YYYY-MM.md
```

**The AI will automatically:**
- Update monthly files after work
- Maintain PROJECT-CONTEXT.md as the repo evolves
- Log decisions in DECISIONS.md
- Keep specs and QA docs current

---

**Bootstrap Version:** 3.0
**Created:** December 2025
**Updated:** February 2026 — Added spec-driven development, dual-path initialisation, agent analysis prompts, templates
