# Test oncesi tam kontrol — preflight + dosya + yapilandirma uyarilari
# Kullanim: .\scripts\test-oncesi.ps1

$ErrorActionPreference = "Stop"
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$txDataRoot = Split-Path -Parent $scriptDir
$base = Join-Path $txDataRoot "QBCore_2F0666.base"
$warnings = @()

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  MVP TEST ONCESI KONTROL" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

Write-Host "[1/4] Preflight..." -ForegroundColor Yellow
& (Join-Path $scriptDir "preflight-server.ps1")
if ($LASTEXITCODE -ne 0) {
    Write-Host ""
    Write-Host "Preflight BASARISIZ - once server.cfg ve resource ensure duzelt." -ForegroundColor Red
    exit 1
}

Write-Host ""
Write-Host "[2/4] Yapilandirma dosyalari..." -ForegroundColor Yellow
$cfgPath = Join-Path $base "server.cfg"
if (Test-Path $cfgPath) {
    Write-Host "[OK] server.cfg mevcut."
} else {
    Write-Host "[HATA] server.cfg yok - server.cfg.example kopyalayip duzenle."
    exit 1
}

$adminsPath = Join-Path $base "admins.json"
if (Test-Path $adminsPath) {
    Write-Host "[OK] admins.json mevcut."
} else {
    $warnings += "admins.json yok - admins.json.example kopyala (txAdmin icin)."
}

$mysqlEnv = Join-Path $scriptDir "mysql.env"
if (-not (Test-Path $mysqlEnv)) {
    $warnings += "scripts/mysql.env yok - yedek icin mysql.env.example doldur (test icin zorunlu degil)."
}

Write-Host ""
Write-Host "[3/4] Kritik MVP dosyalari..." -ForegroundColor Yellow
$keyFiles = @(
    "resources\[standalone]\rp-chat\server\main.lua",
    "resources\[standalone]\rp-dealership\server\main.lua",
    "resources\[standalone]\rp-mileage\server\main.lua",
    "resources\[standalone]\rp-ignition\client\keybinds.lua",
    "resources\[qb]\qb-multicharacter\server.lua",
    "resources\[qb]\qb-garages\server.lua",
    "resources\[qb]\qb-policejob\server\interactions.lua",
    "resources\[qb]\qb-ambulancejob\server\main.lua"
)
$missing = @()
foreach ($rel in $keyFiles) {
    $full = Join-Path $base $rel
    if (-not (Test-Path -LiteralPath $full)) {
        $missing += $rel
    }
}
if ($missing.Count -eq 0) {
    Write-Host "[OK] $($keyFiles.Count) kritik dosya mevcut."
} else {
    Write-Host "[HATA] Eksik dosyalar:"
    $missing | ForEach-Object { Write-Host "  - $_" }
    exit 1
}

Write-Host ""
Write-Host "[4/4] Whitelist durumu..." -ForegroundColor Yellow
$cfgContent = Get-Content $cfgPath -Raw
if ($cfgContent -match 'setr\s+qb_whitelist\s+1') {
    Write-Host "[BILGI] qb_whitelist = 1 (ACIK) - test icin kapali olmasi onerilir."
    Write-Host "        Kapatmak: .\scripts\toggle-whitelist.ps1 -Set 0"
} elseif ($cfgContent -match 'setr\s+qb_whitelist\s+0') {
    Write-Host "[OK] qb_whitelist = 0 (KAPALI) - test icin uygun."
} else {
    $warnings += "qb_whitelist satiri bulunamadi - server.cfg kontrol et."
}

Write-Host ""
Write-Host "========================================" -ForegroundColor Green
Write-Host "  TEST ONCESI KONTROL OK" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Write-Host ""
Write-Host "Sonraki adimlar:" -ForegroundColor Cyan
Write-Host "  1. txAdmin / FXServer ile sunucuyu RESTART et"
Write-Host "  2. docs/gelistirme/OYUN-ICI-TEST-HIZLI.md checklist"
Write-Host "  3. F8 konsolu acik tut"
Write-Host ""

if ($warnings.Count -gt 0) {
    Write-Host "Uyarilar (testi engellemez):" -ForegroundColor Yellow
    foreach ($w in $warnings) {
        Write-Host "  - $w" -ForegroundColor Yellow
    }
    Write-Host ""
}

exit 0
