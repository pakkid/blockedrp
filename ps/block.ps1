# Run this script as Administrator

$hostsPath = "$env:SystemRoot\System32\drivers\etc\hosts"
$redirects = @(
    "readingplus.com",
    "www.readingplus.com",
    "secure.readingplus.com",
    "student.readingplus.com",
    "login.readingplus.com",
    "cdn.readingplus.com",
    "portal.readingplus.com"
)

# Read the current hosts file
$hostsContent = Get-Content $hostsPath -ErrorAction SilentlyContinue

foreach ($domain in $redirects) {
    $entry = "23.171.240.158`t$domain"
    if ($hostsContent -notcontains $entry) {
        Add-Content -Path $hostsPath -Value $entry
        Write-Host "Added: $entry"
    } else {
        Write-Host "Already exists: $domain"
    }
}

Write-Host "`n✅ Hosts file updated. Make sure your block page is served on http://127.0.0.1 (port 80)."
