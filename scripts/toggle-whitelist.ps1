# qb_whitelist 0 <-> 1 (server.cfg)
# Kullanım:
#   .\scripts\toggle-whitelist.ps1          # durumu göster + tersine çevir
#   .\scripts\toggle-whitelist.ps1 -Set 1   # aç
#   .\scripts\toggle-whitelist.ps1 -Set 0   # kapat

param(
    [ValidateSet('0', '1')]
    [string]$Set
)

$ErrorActionPreference = "Stop"
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$txDataRoot = Split-Path -Parent $scriptDir
$cfgPath = Join-Path $txDataRoot "QBCore_2F0666.base\server.cfg"

if (-not (Test-Path $cfgPath)) {
    Write-Error "server.cfg bulunamadi: $cfgPath"
}

$content = Get-Content $cfgPath -Raw
$match = [regex]::Match($content, 'setr\s+qb_whitelist\s+([01])')
$current = if ($match.Success) { $match.Groups[1].Value } else { '?' }

if ($Set) {
    $next = $Set
} else {
    $next = if ($current -eq '1') { '0' } else { '1' }
}

if ($current -eq $next) {
    Write-Host "qb_whitelist zaten $next"
    exit 0
}

$newContent = [regex]::Replace($content, 'setr\s+qb_whitelist\s+[01]', "setr qb_whitelist $next")
Set-Content -Path $cfgPath -Value $newContent -NoNewline

Write-Host "qb_whitelist: $current -> $next"
if ($next -eq '1') {
    Write-Host "Whitelist ACILDI. ACE satirlarini (group.whitelisted) kontrol edin ve sunucuyu restart edin."
} else {
    Write-Host "Whitelist KAPATILDI. Test icin herkes girebilir — restart gerekir."
}
