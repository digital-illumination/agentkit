#!/usr/bin/env bash
set -euo pipefail

# Verify that all required context files exist.

required_files=(
  "AGENT.md"
  "CLAUDE.md"
  "docs/BOOTSTRAP.md"
  "docs/SPEC-DRIVEN.md"
  "docs/TESTING-STRATEGY.md"
  "docs/PROJECT-CONTEXT.md"
  "docs/ARCHITECTURE.md"
  "docs/CODING-STANDARDS.md"
  "docs/DECISIONS.md"
  "updates/MONTHLY-UPDATES-TEMPLATE.md"
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
