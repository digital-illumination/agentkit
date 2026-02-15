#!/usr/bin/env bash
set -euo pipefail

# Verify that all required context files exist.

required_files=(
  "AGENT.md"
  "docs/BOOTSTRAP.md"
  "docs/SPEC-DRIVEN.md"
  "docs/TESTING-STRATEGY.md"
  "docs/PROJECT-CONTEXT.md"
  "docs/ARCHITECTURE.md"
  "docs/CODING-STANDARDS.md"
  "docs/DECISIONS.md"
  "updates/MONTHLY-UPDATES-TEMPLATE.md"
)

# Agent pointer files — at least one should exist for tool auto-discovery
agent_pointer_files=(
  "CLAUDE.md"
  "AGENTS.md"
  "GEMINI.md"
  ".windsurfrules"
)

recommended_files=(
  "specs/000-foundation/spec.md"
  ".specify/memory/constitution.md"
)

missing=0
for f in "${required_files[@]}"; do
  if [ ! -f "$f" ]; then
    echo "Missing (required): $f"
    missing=1
  fi
done

# Check that at least one agent pointer file exists
pointer_found=0
for f in "${agent_pointer_files[@]}"; do
  if [ -f "$f" ]; then
    pointer_found=1
  fi
done
if [ $pointer_found -eq 0 ]; then
  echo "Warning: No agent pointer files found (CLAUDE.md, AGENTS.md, GEMINI.md, .windsurfrules)"
  echo "  At least one is recommended for tool auto-discovery."
fi

for f in "${recommended_files[@]}"; do
  if [ ! -f "$f" ]; then
    echo "Warning (recommended): $f not found"
  fi
done

if [ $missing -ne 0 ]; then
  echo "Context verification failed."
  exit 1
fi

echo "Context verification passed."
