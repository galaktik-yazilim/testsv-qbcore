# whitelist-licenses.txt -> server.cfg ACE blogu (otomatik)
# Kullanim: .\scripts\sync-whitelist-ace.ps1

$ErrorActionPreference = "Stop"
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$txDataRoot = Split-Path -Parent $scriptDir
$cfgPath = Join-Path $txDataRoot "QBCore_2F0666.base\server.cfg"
$licPath = Join-Path $scriptDir "whitelist-licenses.txt"

$markerStart = '# --- WHITELIST ACE (auto: sync-whitelist-ace.ps1) ---'
$markerEnd = '# --- WHITELIST ACE END ---'

if (-not (Test-Path $cfgPath)) {
    Write-Error "server.cfg bulunamadi: $cfgPath"
}

function Format-PrincipalLine {
    param([string]$Line)
    $Line = $Line.Trim()
    if ($Line -match '^identifier\.license:') {
        return "add_principal $Line group.whitelisted"
    }
    if ($Line -match '^license:') {
        return "add_principal identifier.$Line group.whitelisted"
    }
    if ($Line -match '^[a-fA-F0-9]{16,}$') {
        return "add_principal identifier.license:$Line group.whitelisted"
    }
    return $null
}

$aceBlock = @(
    $markerStart,
    'add_ace group.whitelisted join allow'
)

if (Test-Path $licPath) {
    Get-Content $licPath | ForEach-Object {
        $raw = $_.Trim()
        if ($raw -eq '' -or $raw.StartsWith('#')) { return }
        $principal = Format-PrincipalLine $raw
        if ($principal) {
            $aceBlock += $principal
        } else {
            Write-Host "[UYARI] Gecersiz satir atlandi: $raw" -ForegroundColor Yellow
        }
    }
}

$aceBlock += $markerEnd
$aceText = ($aceBlock -join "`r`n") + "`r`n"

$content = Get-Content $cfgPath -Raw

if ($content -match [regex]::Escape($markerStart)) {
    $pattern = [regex]::Escape($markerStart) + '[\s\S]*?' + [regex]::Escape($markerEnd) + '\r?\n?'
    $content = [regex]::Replace($content, $pattern, $aceText)
} else {
    # Eski yorum satirlarini temizle, blogu Permissions sonuna ekle
    $content = $content -replace '(?m)^#\s*add_ace group\.whitelisted join allow\s*\r?\n', ''
    $content = $content -replace '(?m)^#\s*add_principal identifier\.license:[^\r\n]+\s*\r?\n', ''
    $content = $content -replace '(?m)^#\s*Whitelis[^\r\n]*\r?\n', ''
    if ($content -notmatch '(?m)^add_ace group\.admin join allow') {
        $aceText = "add_ace group.admin join allow`r`n" + $aceText
    }
    $content = $content.TrimEnd() + "`r`n`r`n" + $aceText
}

$principalCount = @($aceBlock | Where-Object { $_ -match '^add_principal' }).Count
Set-Content -Path $cfgPath -Value $content -NoNewline
Write-Host "[OK] Whitelist ACE blogu guncellendi ($principalCount lisans)."
exit 0
