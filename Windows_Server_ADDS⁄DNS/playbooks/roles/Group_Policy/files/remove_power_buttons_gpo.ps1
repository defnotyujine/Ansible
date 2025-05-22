# Ensure the Group Policy module is available
Import-Module GroupPolicy

# GPO 1: Remove and Prevent Access to the Shut Down, Restart, Sleep, and Hibernate Buttons
$gpoName1 = "Remove Shutdown and Power Buttons"

# Create GPO if it doesn't exist
if (-not (Get-GPO -Name $gpoName1 -ErrorAction SilentlyContinue)) {
    New-GPO -Name $gpoName1 | Out-Null
}

# Apply registry setting
Set-GPRegistryValue -Name $gpoName1 `
    -Key "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" `
    -ValueName "NoClose" `
    -Type DWord `
    -Value 1