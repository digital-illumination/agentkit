#!/usr/bin/env bash
set -euo pipefail

# Copy canonical context files from the submodule into the project root.
# Assumes this script is executed from the project root.

CONTEXT_DIR=".context"

if [ ! -d "$CONTEXT_DIR" ]; then
  echo "Missing $CONTEXT_DIR. Add the submodule first." >&2
  exit 1
fi

cp "$CONTEXT_DIR/AGENT.md" ./AGENT.md
cp "$CONTEXT_DIR/CLAUDE.md" ./CLAUDE.md
cp "$CONTEXT_DIR/AGENTS.md" ./AGENTS.md
cp "$CONTEXT_DIR/GEMINI.md" ./GEMINI.md
cp "$CONTEXT_DIR/.windsurfrules" ./.windsurfrules
mkdir -p ./docs
cp -R "$CONTEXT_DIR/docs/." ./docs/
mkdir -p ./templates
cp -R "$CONTEXT_DIR/templates/." ./templates/
mkdir -p ./sessions
cp -R "$CONTEXT_DIR/sessions/." ./sessions/
mkdir -p ./updates
cp "$CONTEXT_DIR/updates/MONTHLY-UPDATES-TEMPLATE.md" ./updates/

echo "Context files updated from $CONTEXT_DIR."
