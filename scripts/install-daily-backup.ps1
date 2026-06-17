# Günlük otomatik yedek — Windows Görev Zamanlayıcı
# Yönetici PowerShell: .\scripts\install-daily-backup.ps1

$ErrorActionPreference = "Stop"
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$txDataRoot = Split-Path -Parent $scriptDir
$backupScript = Join-Path $scriptDir "backup-data.ps1"
$taskName = "txData-FiveM-DailyBackup"

if (-not (Test-Path $backupScript)) {
    Write-Error "backup-data.ps1 bulunamadi: $backupScript"
}

$action = New-ScheduledTaskAction -Execute "powershell.exe" `
    -Argument "-NoProfile -ExecutionPolicy Bypass -File `"$backupScript`"" `
    -WorkingDirectory $txDataRoot

$trigger = New-ScheduledTaskTrigger -Daily -At "04:00"

Register-ScheduledTask -TaskName $taskName -Action $action -Trigger $trigger `
    -Description "txData FiveM gunluk yedek (default/data + MySQL)" -Force

Write-Host "Gorev olusturuldu: $taskName (her gun 04:00)"
Write-Host "Test icin: .\scripts\backup-data.ps1"
