$ErrorActionPreference = "Stop"

# Verify that all required context files exist.

$RequiredFiles = @(
  "AGENT.md",
  "CLAUDE.md",
  "docs/BOOTSTRAP.md",
  "docs/SPEC-DRIVEN.md",
  "docs/TESTING-STRATEGY.md",
  "docs/PROJECT-CONTEXT.md",
  "docs/ARCHITECTURE.md",
  "docs/CODING-STANDARDS.md",
  "docs/DECISIONS.md",
  "updates/MONTHLY-UPDATES-TEMPLATE.md"
)

$RecommendedFiles = @(
  "specs/000-foundation/spec.md",
  ".specify/memory/constitution.md"
)

$Missing = @()
foreach ($f in $RequiredFiles) {
  if (-not (Test-Path $f)) {
    $Missing += $f
  }
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
