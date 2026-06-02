# Improved one-click launcher for RCW / Ruff Cut & Wash site
# Double-click this or run.ps1 / run.bat
# It will try to start the backend server (if Node installed) and open the browser.

$ErrorActionPreference = 'Continue'
Write-Host "=== Ruff Cut & Wash Launcher ===" -ForegroundColor Cyan
Write-Host "Loading environment..."

# Load .env
$envFile = Join-Path $PSScriptRoot ".env"
if (Test-Path $envFile) {
    Get-Content $envFile | ForEach-Object {
        if ($_ -match '^\s*([^#=]+?)\s*=\s*(.+?)\s*$') {
            $name = $matches[1].Trim()
            $value = $matches[2].Trim().Trim('"').Trim("'")
            [Environment]::SetEnvironmentVariable($name, $value, "Process")
        }
    }
    $key = [Environment]::GetEnvironmentVariable("ELEVENLABS_API_KEY", "Process")
    if ($key -and -not ($key -like "*your_*")) {
        Write-Host "ELEVENLABS_API_KEY loaded successfully." -ForegroundColor Green
    } else {
        Write-Host "WARNING: ELEVENLABS_API_KEY is placeholder or missing. Voice features will not work." -ForegroundColor Yellow
    }
} else {
    Write-Host "No .env file found in $PSScriptRoot" -ForegroundColor Yellow
}

$port = [Environment]::GetEnvironmentVariable("PORT", "Process")
if (-not $port) { $port = 3000 }
$url = "http://localhost:$port"

# Try to find node
$nodeExe = $null
try {
    $cmd = Get-Command node -ErrorAction Stop
    $nodeExe = $cmd.Source
} catch {
    $candidates = @(
        "C:\Program Files\nodejs\node.exe",
        "$env:LOCALAPPDATA\Programs\nodejs\node.exe",
        "$env:ProgramFiles\nodejs\node.exe",
        "C:\nodejs\node.exe"
    )
    foreach ($c in $candidates) {
        if (Test-Path $c) {
            $nodeExe = $c
            break
        }
    }
}

$serverStarted = $false
if ($nodeExe) {
    Write-Host "Node.js found at: $nodeExe" -ForegroundColor Green
    Write-Host "Starting backend server in background on port $port..."
    try {
        $proc = Start-Process -FilePath $nodeExe -ArgumentList "server.js" -WorkingDirectory $PSScriptRoot -WindowStyle Hidden -PassThru -ErrorAction Stop
        Write-Host "Server process started (PID $($proc.Id)). Waiting a few seconds..."
        Start-Sleep -Seconds 4
        $serverStarted = $true
    } catch {
        Write-Host "Failed to start server: $_" -ForegroundColor Red
    }
} else {
    Write-Host "Node.js not found on this system." -ForegroundColor Yellow
    Write-Host "You can still view the static site, but the 'Test Voice' button and real audio will not work." -ForegroundColor Yellow
    Write-Host "Install Node.js from https://nodejs.org to enable full features (ElevenLabs voices)." -ForegroundColor Yellow
}

# Open browser
if ($serverStarted) {
    Write-Host "Opening browser to $url ..." -ForegroundColor Green
    Start-Process $url
} else {
    Write-Host "Opening static site (index.html) ..." -ForegroundColor Yellow
    $staticPath = Join-Path $PSScriptRoot "index.html"
    Start-Process $staticPath
}

Write-Host ""
Write-Host "Done. If using server, keep this window open or the node process will be harder to manage." -ForegroundColor Cyan
Write-Host "Close this window when done (server continues running in background)." -ForegroundColor Cyan

Read-Host "Press Enter to exit this launcher window"
