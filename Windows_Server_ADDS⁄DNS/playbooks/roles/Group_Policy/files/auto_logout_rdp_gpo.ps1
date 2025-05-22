# Ensure the Group Policy module is available
Import-Module GroupPolicy

# GPO 2: Set Time Limit for Active but Idle RDS Session to 15 Minutes
$gpoName2 = "Idle RDS Session Timeout - 15 Minutes"

# Create GPO if it doesn't exist
if (-not (Get-GPO -Name $gpoName2 -ErrorAction SilentlyContinue)) {
    New-GPO -Name $gpoName2 | Out-Null
}

# Apply registry setting
Set-GPRegistryValue -Name $gpoName2 `
    -Key "HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" `
    -ValueName "MaxIdleTime" `
    -Type DWord `
    -Value 900000
