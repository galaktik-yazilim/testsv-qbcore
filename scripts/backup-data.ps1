# txData runtime verilerini yedekler (Git işlemlerinden ÖNCE çalıştırın).
# Kullanım: .\scripts\backup-data.ps1

$ErrorActionPreference = "Stop"
$txDataRoot = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)
if (-not (Test-Path (Join-Path $txDataRoot "default"))) {
    $txDataRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
    if (-not (Test-Path (Join-Path $txDataRoot "default"))) {
        $txDataRoot = "C:\txData"
    }
}

$timestamp = Get-Date -Format "yyyyMMdd-HHmmss"
$backupDir = Join-Path $txDataRoot "_backups\$timestamp"
New-Item -ItemType Directory -Path $backupDir -Force | Out-Null

Write-Host "Yedek hedefi: $backupDir"

# txAdmin oyuncu DB ve runtime data
$dataSrc = Join-Path $txDataRoot "default\data"
if (Test-Path $dataSrc) {
    Copy-Item -Path $dataSrc -Destination (Join-Path $backupDir "default-data") -Recurse -Force
    Write-Host "[OK] default/data yedeklendi"
}

# txAdmin logları (opsiyonel)
$logsSrc = Join-Path $txDataRoot "default\logs"
if (Test-Path $logsSrc) {
    Copy-Item -Path $logsSrc -Destination (Join-Path $backupDir "default-logs") -Recurse -Force
    Write-Host "[OK] default/logs yedeklendi"
}

# Yerel server.cfg ve admins.json (Git'te yok)
foreach ($file in @("QBCore_2F0666.base\server.cfg", "admins.json")) {
    $src = Join-Path $txDataRoot $file
    if (Test-Path $src) {
        $destDir = Join-Path $backupDir (Split-Path $file -Parent)
        if ($destDir -and -not (Test-Path $destDir)) {
            New-Item -ItemType Directory -Path $destDir -Force | Out-Null
        }
        Copy-Item -Path $src -Destination (Join-Path $backupDir $file) -Force
        Write-Host "[OK] $file yedeklendi"
    }
}

# MySQL dump (mysqldump PATH'te ise)
$mysqlDump = Get-Command mysqldump -ErrorAction SilentlyContinue
if ($mysqlDump) {
    $dbName = "QBCore_2F0666"
    $sqlOut = Join-Path $backupDir "database-$dbName.sql"
    & mysqldump -u root $dbName 2>$null | Out-File -FilePath $sqlOut -Encoding utf8
    if ($LASTEXITCODE -eq 0) {
        Write-Host "[OK] MySQL dump: $sqlOut"
    } else {
        Write-Host "[UYARI] MySQL dump basarisiz - kullanici/sifre kontrol edin veya manuel alin."
        Remove-Item $sqlOut -ErrorAction SilentlyContinue
    }
} else {
    Write-Host "[BILGI] mysqldump bulunamadi - veritabani yedegini manuel alin."
}

Write-Host ""
Write-Host "Yedek tamamlandi: $backupDir"
Write-Host "_backups/ klasoru gitignore listesinde - repoya gitmez."
