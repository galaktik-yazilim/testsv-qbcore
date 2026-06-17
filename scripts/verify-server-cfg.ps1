# server.cfg dogrulama — yasak resource + zorunlu MVP ensure + locale
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
    'oxmysql',
    'qb-core',
    'qb-multicharacter',
    'qb-spawn',
    'qb-clothing',
    'qb-inventory',
    'qb-banking',
    'qb-vehiclekeys',
    'qb-garages',
    'qb-fuel',
    'qb-policejob',
    'qb-ambulancejob',
    'qb-hud',
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

if ($content -match 'setr\s+qb_locale\s+"tr"') {
    Write-Host "[OK] qb_locale = tr"
} else {
    $failed = $true
    Write-Host "[HATA] setr qb_locale `"tr`" eksik."
}

if ($failed) { exit 1 }
exit 0
