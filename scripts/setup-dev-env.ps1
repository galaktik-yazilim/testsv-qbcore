# Dev ortami hazirlik — whitelist kapali + ACE sync + test kontrol
# Kullanim: .\scripts\setup-dev-env.ps1

$ErrorActionPreference = "Stop"
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path

Write-Host ""
Write-Host "=== Dev Ortami Kurulumu ===" -ForegroundColor Cyan
Write-Host ""

& (Join-Path $scriptDir "enable-dev-mode.ps1")
if ($LASTEXITCODE -ne 0) { exit 1 }

Write-Host ""
& (Join-Path $scriptDir "test-oncesi.ps1")
exit $LASTEXITCODE
