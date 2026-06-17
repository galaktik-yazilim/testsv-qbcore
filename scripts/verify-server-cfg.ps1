# server.cfg dogrulama — yasak resource + zorunlu MVP ensure
# Kullanim: .\scripts\verify-server-cfg.ps1

$ErrorActionPreference = "Stop"
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$txDataRoot = Split-Path -Parent $scriptDir
$cfgCandidates = @(
    (Join-Path $txDataRoot "QBCore_2F0666.base\server.cfg"),
    (Join-Path $txDataRoot "QBCore_2F0666.base\server.cfg.example")
)

$cfgPath = $null
foreach ($p in $cfgCandidates) {
    if (Test-Path $p) {
        $cfgPath = $p
        break
    }
}

if (-not $cfgPath) {
    Write-Error "server.cfg veya server.cfg.example bulunamadi."
}

Write-Host "Kontrol edilen: $cfgPath"

$content = Get-Content $cfgPath -Raw
$failed = $false

$forbidden = @(
    'qb-phone',
    'qb-vehicleshop',
    'qb-shops',
    'pma-voice',
    'qb-radio',
    'qb-crypto',
    'qb-drugs'
)

$required = @(
    'qb-core',
    'qb-fuel',
    'qb-garages',
    'rp-chat',
    'rp-dealership',
    'rp-ignition',
    'rp-mileage'
)

$forbiddenFound = @()
foreach ($res in $forbidden) {
    if ($content -match "(?m)^\s*ensure\s+$([regex]::Escape($res))\s*$") {
        $forbiddenFound += $res
    }
}

$missingRequired = @()
foreach ($res in $required) {
    if ($content -notmatch "(?m)^\s*ensure\s+$([regex]::Escape($res))\s*$") {
        $missingRequired += $res
    }
}

if ($forbiddenFound.Count -eq 0) {
    Write-Host "[OK] Yasakli resource ensure edilmiyor."
} else {
    $failed = $true
    Write-Host "[HATA] MVP disi resource ensure ediliyor:"
    foreach ($r in $forbiddenFound) {
        Write-Host "  - ensure $r"
    }
    Write-Host "Text RP icin qb-phone, pma-voice, qb-radio kapali kalmali."
}

if ($missingRequired.Count -eq 0) {
    Write-Host "[OK] Zorunlu MVP resource'lari ensure ediliyor."
} else {
    $failed = $true
    Write-Host "[HATA] Eksik ensure satirlari:"
    foreach ($r in $missingRequired) {
        Write-Host "  - ensure $r"
    }
}

if ($failed) { exit 1 }
exit 0
