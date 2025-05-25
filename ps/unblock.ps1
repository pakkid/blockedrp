# Run this script as Administrator

$hostsPath = "$env:SystemRoot\System32\drivers\etc\hosts"

# Load the hosts file content
$originalContent = Get-Content $hostsPath -ErrorAction SilentlyContinue

# Filter out lines related to readingplus.com
$filteredContent = $originalContent | Where-Object { $_ -notmatch "readingplus\.com" }

# Overwrite the hosts file
Set-Content -Path $hostsPath -Value $filteredContent

Write-Host "`n❌ Removed readingplus.com redirects from the hosts file."
