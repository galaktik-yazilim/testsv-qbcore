# MVP oncesi kontrol — verify-server-cfg calistirir
# Kullanim: .\scripts\preflight-server.ps1

$ErrorActionPreference = "Stop"
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$txDataRoot = Split-Path -Parent $scriptDir
$base = Join-Path $txDataRoot "QBCore_2F0666.base"

Write-Host "=== MVP Preflight ===" -ForegroundColor Cyan

& (Join-Path $scriptDir "verify-server-cfg.ps1")
if ($LASTEXITCODE -ne 0) { exit 1 }

$fuelClientFiles = @(
    (Join-Path $base "resources\[qb]\qb-hud\client.lua"),
    (Join-Path $base "resources\[qb]\qb-garages\client.lua"),
    (Join-Path $base "resources\[standalone]\rp-dealership\client\main.lua"),
    (Join-Path $base "resources\[qb]\qb-smallresources\client\cruise.lua")
)

$legacyHits = @()
foreach ($f in $fuelClientFiles) {
    if ((Test-Path $f) -and (Select-String -Path $f -Pattern "exports\['LegacyFuel'\]" -Quiet)) {
        $legacyHits += $f.Replace($txDataRoot + '\', '')
    }
}

if ($legacyHits.Count -eq 0) {
    Write-Host "[OK] MVP fuel client files: no direct LegacyFuel export."
} else {
    Write-Host "[UYARI] LegacyFuel export:"
    $legacyHits | ForEach-Object { Write-Host "  - $_" }
    exit 1
}

Write-Host ""
Write-Host "Preflight OK - restart and in-game test next." -ForegroundColor Green
exit 0
