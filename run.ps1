# Run script for RCW site with ElevenLabs
Write-Host "Loading .env..."
Get-Content .env | ForEach-Object {
  if ($_ -match "^\s*([^#=]+?)\s*=\s*(.+?)\s*$") {
    $name = $matches[1]
    $value = $matches[2]
    [Environment]::SetEnvironmentVariable($name, $value, "Process")
    Write-Host "Set $name"
  }
}
if (-not $env:ELEVENLABS_API_KEY -or $env:ELEVENLABS_API_KEY -eq "your_elevenlabs_api_key_here") {
  Write-Host "WARNING: ELEVENLABS_API_KEY not set to a real value in .env. The test endpoint will fail."
}
Write-Host "Starting server on http://localhost:3000 ..."
node server.js
