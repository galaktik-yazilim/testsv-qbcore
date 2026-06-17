# Kapali beta: whitelist ac + ACE senkron (tek komut, elle ACE gerekmez)
# Kullanim: .\scripts\enable-beta-mode.ps1

$ErrorActionPreference = "Stop"
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path

Write-Host "=== Kapali Beta Modu ===" -ForegroundColor Cyan

& (Join-Path $scriptDir "sync-whitelist-ace.ps1")
if ($LASTEXITCODE -ne 0) { exit 1 }

& (Join-Path $scriptDir "toggle-whitelist.ps1") -Set 1
if ($LASTEXITCODE -ne 0) { exit 1 }

Write-Host ""
Write-Host "Beta modu HAZIR. Sunucuyu restart et." -ForegroundColor Green
Write-Host "Yeni oyuncu: scripts/whitelist-licenses.txt satir ekle -> sync-whitelist-ace.ps1 -> restart"
Write-Host "Kapatmak icin: .\scripts\enable-dev-mode.ps1"
exit 0
