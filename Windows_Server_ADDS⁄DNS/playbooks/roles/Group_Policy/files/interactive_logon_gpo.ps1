# Ensure the Group Policy module is available
Import-Module GroupPolicy

# Define GPO name
$gpoName = "Interactive Logon Message"

# Create the GPO if it doesn't exist
if (-not (Get-GPO -Name $gpoName -ErrorAction SilentlyContinue)) {
    New-GPO -Name $gpoName | Out-Null
}

# Apply registry setting: Logon Message Title
Set-GPRegistryValue -Name $gpoName `
    -Key "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" `
    -ValueName "LegalNoticeCaption" `
    -Type String `
    -Value "Authorized Use Only!"

# Apply registry setting: Logon Message Text
Set-GPRegistryValue -Name $gpoName `
    -Key "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" `
    -ValueName "LegalNoticeText" `
    -Type String `
    -Value "Unauthorized access or use is strictly prohibited and may result in disciplinary action, civil, and/or criminal penalties. By logging in, you acknowledge your awareness of and compliance with all applicable policies and monitoring practices. Your activities may be logged and reviewed. If you are not an authorized user, disconnect immediately."
