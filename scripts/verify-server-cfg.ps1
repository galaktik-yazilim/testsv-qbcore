# Yasak / istenmeyen resource kontrolu (MVP listesi disi)
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
$forbidden = @(
    'qb-phone',
    'qb-vehicleshop',
    'qb-shops',
    'pma-voice',
    'qb-radio',
    'qb-crypto',
    'qb-drugs'
)

$warn = @()
foreach ($res in $forbidden) {
    if ($content -match "(?m)^\s*ensure\s+$([regex]::Escape($res))\s*$") {
        $warn += $res
    }
}

if ($warn.Count -eq 0) {
    Write-Host "[OK] Yasakli resource ensure edilmiyor."
    exit 0
}

Write-Host "[UYARI] Asagidaki resource'lar MVP disi - kaldirin veya bilincli ekleyin:"
foreach ($r in $warn) {
    Write-Host "  - ensure $r"
}
Write-Host ""
Write-Host "Text RP icin ozellikle qb-phone, pma-voice, qb-radio kapali kalmali."
exit 1
