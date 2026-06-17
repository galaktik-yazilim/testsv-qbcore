# Test/dev: whitelist kapat (varsayilan)
# Kullanim: .\scripts\enable-dev-mode.ps1

$ErrorActionPreference = "Stop"
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path

Write-Host "=== Dev / Test Modu ===" -ForegroundColor Cyan

& (Join-Path $scriptDir "sync-whitelist-ace.ps1")
if ($LASTEXITCODE -ne 0) { exit 1 }

& (Join-Path $scriptDir "toggle-whitelist.ps1") -Set 0
if ($LASTEXITCODE -ne 0) { exit 1 }

Write-Host ""
Write-Host "Dev modu HAZIR (herkes girebilir). Sunucuyu restart et." -ForegroundColor Green
exit 0
