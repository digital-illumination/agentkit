$ErrorActionPreference = "Stop"

# Verify that all required context files exist.

$RequiredFiles = @(
  "AGENT.md",
  "docs/BOOTSTRAP.md",
  "docs/SPEC-DRIVEN.md",
  "docs/TESTING-STRATEGY.md",
  "docs/PROJECT-CONTEXT.md",
  "docs/ARCHITECTURE.md",
  "docs/CODING-STANDARDS.md",
  "docs/DECISIONS.md",
  "updates/MONTHLY-UPDATES-TEMPLATE.md"
)

# Agent pointer files — at least one should exist for tool auto-discovery
$AgentPointerFiles = @(
  "CLAUDE.md",
  "AGENTS.md",
  "GEMINI.md",
  ".windsurfrules"
)

$RecommendedFiles = @(
  "specs/000-foundation/spec.md",
  ".specify/memory/constitution.md",
  "ROADMAP.md"
)

$Missing = @()
foreach ($f in $RequiredFiles) {
  if (-not (Test-Path $f)) {
    $Missing += $f
  }
}

# Check that at least one agent pointer file exists
$PointerFound = $false
foreach ($f in $AgentPointerFiles) {
  if (Test-Path $f) {
    $PointerFound = $true
  }
}
if (-not $PointerFound) {
  Write-Host "Warning: No agent pointer files found (CLAUDE.md, AGENTS.md, GEMINI.md, .windsurfrules)" -ForegroundColor Yellow
  Write-Host "  At least one is recommended for tool auto-discovery." -ForegroundColor Yellow
}

foreach ($f in $RecommendedFiles) {
  if (-not (Test-Path $f)) {
    Write-Host "Warning (recommended): $f not found" -ForegroundColor Yellow
  }
}

if ($Missing.Count -gt 0) {
  Write-Host "Missing required files:" -ForegroundColor Red
  $Missing | ForEach-Object { Write-Host "- $_" }
  exit 1
}

Write-Host "Context verification passed." -ForegroundColor Green
