

<#
.SYNOPSIS
    Configures Git user identity and remote URL for a specified user.

.DESCRIPTION
    This script sets up Git configuration (user name and email) and configures the origin remote URL
    for a given user. It validates that the user exists in the predefined users table and that the
    corresponding SSH key is present before applying the configuration.

.PARAMETER User
    The user key (firstlast) to look up in the users table. Must match an entry in the $Users hashtable.

.EXAMPLE
    .\whoami.ps1 pierceaffleck
    Configures Git for the pierceaffleck user.
#>

param(
	[Parameter(Mandatory = $true)]
	[string]$User
)

$ErrorActionPreference = 'Stop'

# Reject the example/placeholder user key if supplied
if ($User -and ($User -ieq 'firstlast')) {
    throw 'input your user profile name'
}

# Load users from the companion users.ps1 file located next to this script
$ScriptDir = if ($PSScriptRoot) { $PSScriptRoot } else { Split-Path -Parent $MyInvocation.MyCommand.Definition }
$UsersFile = Join-Path $ScriptDir 'users.ps1'
if (-not (Test-Path -LiteralPath $UsersFile)) {
	throw "users.ps1 not found: $($UsersFile)"
}
. $UsersFile

if (-not $Users) {
	throw "No `$Users variable defined in $UsersFile"
}

$U = $Users[$User]
if (-not $U) {
	throw "Unknown user: $User"
}

$Key = Join-Path $HOME ".ssh\id_ed25519_$User"

if (-not (Test-Path -LiteralPath $Key)) {
	throw "SSH key not found: $($Key)"
}

git config user.name  $U.Name
git config user.email $U.Email

$OriginUrl = "git@$($U.Host):$($U.GitHub)/$($U.RepoName).git"
git remote set-url origin $OriginUrl


Write-Host "Switched to: $User"
Write-Host "Author:      $($U.Name) <$($U.Email)>"
Write-Host "SSH key:     $($Key)"
Write-Host "Origin:      $OriginUrl"


