

<#
.SYNOPSIS
Adds a new user entry to users.ps1 and appends a matching SSH host profile.

.DESCRIPTION
This script:
1. Validates required user inputs (First, Last, Email, GitHub Username).
2. Builds a normalized user key from first + last name.
3. Verifies that users.ps1 and ~/.ssh/config exist.
4. Prevents duplicates by checking for an existing user key and SSH host.
5. Inserts a new [ordered] user block into the $Users hashtable in users.ps1.
6. Appends an SSH config block for GitHub access using a user-specific key file.

.PARAMETER First
User's first name.

.PARAMETER Last
User's last name.

.PARAMETER Email
User's email address.

.PARAMETER Username
User's GitHub username.

.PARAMETER RepoName
Repository name associated with the user. Defaults to 'HVMAPS'.

.NOTES
Requires:
- users.ps1 in the same directory as this script.
- SSH config at $HOME\.ssh\config.
#>

param(
	[Parameter(Mandatory = $true)]
	[string]$First,

	[Parameter(Mandatory = $true)]
	[string]$Last,

	[Parameter(Mandatory = $true)]
	[string]$Email,

	[Parameter(Mandatory = $true)]
	[string]$Username,

	[string]$RepoName = 'HVMAPS'
)

$ErrorActionPreference = 'Stop'

function ConvertTo-EscapedSingleQuote {
	param(
		[string]$Value
	)

	return $Value -replace "'", "''"
}

function Get-UserKey {
	param(
		[string]$FirstName,
		[string]$LastName
	)

	return ((($FirstName + $LastName) -replace '[^A-Za-z0-9]', '').ToLowerInvariant())
}

$UsersPath = Join-Path $PSScriptRoot 'users.ps1'
$SshConfigPath = Join-Path $HOME '.ssh\config'

if (-not (Test-Path -LiteralPath $UsersPath)) {
	$Starter = @'
$Users = @{
}
'@
	Set-Content -LiteralPath $UsersPath -Value $Starter -Encoding utf8
	Write-Host "Created starter users.ps1: $UsersPath"
}

if (-not (Test-Path -LiteralPath $SshConfigPath)) {
	$SshDir = Split-Path -Parent $SshConfigPath
	if (-not (Test-Path -LiteralPath $SshDir)) {
		New-Item -ItemType Directory -Path $SshDir -Force | Out-Null
		Write-Host "Created SSH directory: $SshDir"
	}
	# create an empty ssh config file
	Set-Content -LiteralPath $SshConfigPath -Value "" -Encoding utf8
	Write-Host "Created SSH config: $SshConfigPath"
}

$EscapedFirst = ConvertTo-EscapedSingleQuote $First
$EscapedLast = ConvertTo-EscapedSingleQuote $Last
$EscapedEmail = ConvertTo-EscapedSingleQuote $Email
$EscapedUsername = ConvertTo-EscapedSingleQuote $Username
$EscapedRepoName = ConvertTo-EscapedSingleQuote $RepoName
$UserKey = Get-UserKey -FirstName $First -LastName $Last
$HostName = "github-$UserKey"

$UsersContent = Get-Content -LiteralPath $UsersPath -Raw
$UserPattern = "(?m)^\s*$([regex]::Escape($UserKey))\s*=\s*\[ordered\]@\{"

if ($UsersContent -match $UserPattern) {
	throw "User already exists in users.ps1: $UserKey"
}

$UsersLines = [System.Collections.Generic.List[string]]::new()
$UsersLines.AddRange([string[]]($UsersContent -split '\r?\n'))

$UsersStartIndex = -1
for ($Index = 0; $Index -lt $UsersLines.Count; $Index++) {
	if ($UsersLines[$Index] -match '\$Users\s*=\s*@\{') {
		$UsersStartIndex = $Index
		break
	}
}

if ($UsersStartIndex -lt 0) {
	throw 'Could not find $Users = @{ in users.ps1'
}

$ClosingBraceIndex = -1
for ($Index = $UsersStartIndex + 1; $Index -lt $UsersLines.Count; $Index++) {
	if ($UsersLines[$Index] -match '^\}\s*$') {
		$ClosingBraceIndex = $Index
		break
	}
}

if ($ClosingBraceIndex -lt 0) {
	throw 'Could not find the $Users closing brace in users.ps1'
}

$UserBlock = @(
	"    $UserKey = [ordered]@{"
	"`t`tName     = '$EscapedFirst $EscapedLast'"
	"`t`tEmail    = '$EscapedEmail'"
	"`t`tGitHub   = '$EscapedUsername'"
	"`t`tRepoName = '$EscapedRepoName'"
	"`t`tHost     = '$HostName'"
	"`t`t}"
	''
)

$UsersLines.InsertRange($ClosingBraceIndex, [string[]]$UserBlock)
Set-Content -LiteralPath $UsersPath -Value $UsersLines -Encoding utf8

$SshConfigContent = Get-Content -LiteralPath $SshConfigPath -Raw
$HostPattern = "(?m)^Host\s+$([regex]::Escape($HostName))\s*$"

if ($SshConfigContent -match $HostPattern) {
	throw "SSH host already exists in config: $HostName"
}

$SshBlock = @"
Host $HostName
  HostName github.com
  User git
  IdentityFile ~/.ssh/id_ed25519_$UserKey
  IdentitiesOnly yes
"@

Add-Content -LiteralPath $SshConfigPath -Value "`n$SshBlock" -Encoding utf8

$RemoteUrl = "git@$($HostName):$Username/$RepoName.git"
git remote add origin "$RemoteUrl"

Write-Host "Added user: $UserKey"
Write-Host "Name:       $First $Last"
Write-Host "Email:      $Email"
Write-Host "GitHub:     $Username"
Write-Host "RepoName:   $RepoName"
Write-Host "Git Remote: $RemoteUrl"
