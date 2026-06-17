# txData + MySQL yedekler
# Kullanım: .\scripts\backup-data.ps1

$ErrorActionPreference = "Stop"
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$txDataRoot = Split-Path -Parent $scriptDir
if (-not (Test-Path (Join-Path $txDataRoot "default"))) {
    $txDataRoot = "C:\txData"
}

$timestamp = Get-Date -Format "yyyyMMdd-HHmmss"
$backupDir = Join-Path $txDataRoot "_backups\$timestamp"
New-Item -ItemType Directory -Path $backupDir -Force | Out-Null

Write-Host "Yedek hedefi: $backupDir"

$dataSrc = Join-Path $txDataRoot "default\data"
if (Test-Path $dataSrc) {
    Copy-Item -Path $dataSrc -Destination (Join-Path $backupDir "default-data") -Recurse -Force
    Write-Host "[OK] default/data"
}

$logsSrc = Join-Path $txDataRoot "default\logs"
if (Test-Path $logsSrc) {
    Copy-Item -Path $logsSrc -Destination (Join-Path $backupDir "default-logs") -Recurse -Force
    Write-Host "[OK] default/logs"
}

foreach ($file in @("QBCore_2F0666.base\server.cfg", "admins.json")) {
    $src = Join-Path $txDataRoot $file
    if (Test-Path $src) {
        $destDir = Join-Path $backupDir (Split-Path $file -Parent)
        if ($destDir -and -not (Test-Path $destDir)) {
            New-Item -ItemType Directory -Path $destDir -Force | Out-Null
        }
        Copy-Item -Path $src -Destination (Join-Path $backupDir $file) -Force
        Write-Host "[OK] $file"
    }
}

# MySQL — mysql.env veya server.cfg connection string
$mysqlUser = "root"
$mysqlPass = ""
$mysqlHost = "localhost"
$mysqlDb = "QBCore_2F0666"

$envFile = Join-Path $scriptDir "mysql.env"
if (Test-Path $envFile) {
    Get-Content $envFile | ForEach-Object {
        if ($_ -match '^\s*#' -or $_ -match '^\s*$') { return }
        $pair = $_ -split '=', 2
        if ($pair.Count -eq 2) {
            $key = $pair[0].Trim()
            $val = $pair[1].Trim()
            switch ($key) {
                "MYSQL_HOST" { $mysqlHost = $val }
                "MYSQL_USER" { $mysqlUser = $val }
                "MYSQL_PASSWORD" { $mysqlPass = $val }
                "MYSQL_DATABASE" { $mysqlDb = $val }
            }
        }
    }
    Write-Host "[OK] mysql.env okundu"
} else {
    $cfgPath = Join-Path $txDataRoot "QBCore_2F0666.base\server.cfg"
    if (Test-Path $cfgPath) {
        $line = Select-String -Path $cfgPath -Pattern 'mysql_connection_string\s+"([^"]+)"' | Select-Object -First 1
        if ($line) {
            $uri = $line.Matches.Groups[1].Value
            if ($uri -match 'mysql://([^:@/]+)(?::([^@]*))?@([^/]+)/([^?]+)') {
                $mysqlUser = $Matches[1]
                $mysqlPass = $Matches[2]
                $mysqlHost = $Matches[3]
                $mysqlDb = $Matches[4]
                Write-Host "[OK] server.cfg connection string (sifre repoda yok)"
            }
        }
    }
}

$mysqlDump = Get-Command mysqldump -ErrorAction SilentlyContinue
if ($mysqlDump) {
    $sqlOut = Join-Path $backupDir "database-$mysqlDb.sql"
    $args = @("-h", $mysqlHost, "-u", $mysqlUser, $mysqlDb, "--single-transaction", "--routines", "--triggers")
    if ($mysqlPass) { $args = @("-h", $mysqlHost, "-u", $mysqlUser, "-p$mysqlPass", $mysqlDb, "--single-transaction", "--routines", "--triggers") }
    & mysqldump @args 2>$null | Out-File -FilePath $sqlOut -Encoding utf8
    if ($LASTEXITCODE -eq 0 -and (Get-Item $sqlOut).Length -gt 100) {
        Write-Host "[OK] MySQL dump: $sqlOut"
    } else {
        Write-Host "[UYARI] MySQL dump basarisiz — mysql.env olusturun veya sifreyi kontrol edin."
        Remove-Item $sqlOut -ErrorAction SilentlyContinue
    }
} else {
    Write-Host "[BILGI] mysqldump PATH'te yok."
}

Write-Host ""
Write-Host "Yedek tamamlandi: $backupDir"
