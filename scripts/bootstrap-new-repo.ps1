$ErrorActionPreference = "Stop"

# Bootstrap a new repo with the AI Context System.
# Assumes the context repo is available in .context (submodule).

if (-not (Test-Path ".context")) {
  Write-Error "Missing .context submodule. Add it first: git submodule add <git-url> .context"
  exit 1
}

# Copy canonical files into project root.
& .context/scripts/update-context.ps1

# Create specs directory with foundation scaffold.
if (-not (Test-Path "./specs/000-foundation")) { New-Item -ItemType Directory -Path "./specs/000-foundation" -Force | Out-Null }

# Create constitution directory.
if (-not (Test-Path "./.specify/memory")) { New-Item -ItemType Directory -Path "./.specify/memory" -Force | Out-Null }

# Create updates folder and current/previous month files if needed.
if (-not (Test-Path "./updates")) { New-Item -ItemType Directory -Path "./updates" | Out-Null }

$CurrentMonth = Get-Date -Format "yyyy-MM"
$MonthFile = "updates/$CurrentMonth.md"

$MonthlyFiles = Get-ChildItem -Path "updates" -Filter "*.md" | Where-Object { $_.Name -ne "MONTHLY-UPDATES-TEMPLATE.md" }

if ($MonthlyFiles.Count -eq 0) {
  $PreviousMonth = (Get-Date).AddMonths(-1).ToString("yyyy-MM")
  Copy-Item "updates/MONTHLY-UPDATES-TEMPLATE.md" -Destination "updates/$PreviousMonth.md" -Force
  Copy-Item "updates/MONTHLY-UPDATES-TEMPLATE.md" -Destination $MonthFile -Force
  Write-Host "Seeded previous and current month files: $PreviousMonth.md, $CurrentMonth.md"
} else {
  if (-not (Test-Path $MonthFile)) {
    Copy-Item "updates/MONTHLY-UPDATES-TEMPLATE.md" -Destination $MonthFile -Force
  }
  Write-Host "Context bootstrap complete. Current month file: $MonthFile"
}

Write-Host ""
Write-Host "Next steps:"
Write-Host "  1. Fill in AGENT.md (replace [PLACEHOLDER] markers)"
Write-Host "  2. Create constitution: cp templates/constitution-template.md .specify/memory/constitution.md"
Write-Host "  3. Create foundation spec in specs/000-foundation/"
Write-Host "  4. Fill in docs/ (PROJECT-CONTEXT, ARCHITECTURE, CODING-STANDARDS, DECISIONS)"
Write-Host "  5. Run: .context/scripts/verify-context.ps1"
Write-Host "  6. See docs/BOOTSTRAP.md for full instructions (Path A or Path B)"
