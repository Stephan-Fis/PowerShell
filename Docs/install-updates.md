*install-updates.ps1*
================

This PowerShell script installs software updates for the local machine (needs admin rights).
Use the script 'list-updates.ps1' to list available updates.

Parameters
----------
```powershell
PS> ./install-updates.ps1 [<CommonParameters>]

[<CommonParameters>]
    This script supports the common parameters: Verbose, Debug, ErrorAction, ErrorVariable, WarningAction, 
    WarningVariable, OutBuffer, PipelineVariable, and OutVariable.
```

Example
-------
```powershell
PS> ./install-updates.ps1

```

Notes
-----
Author: Markus Fleschutz | License: CC0

Related Links
-------------
https://github.com/fleschutz/PowerShell

Script Content
--------------
```powershell
<#
.SYNOPSIS
	Installs updates
.DESCRIPTION
	This PowerShell script installs software updates for the local machine (needs admin rights).
	Use the script 'list-updates.ps1' to list available updates.
.EXAMPLE
	PS> ./install-updates.ps1
.LINK
	https://github.com/fleschutz/PowerShell
.NOTES
	Author: Markus Fleschutz | License: CC0
#>

try {
	$StopWatch = [system.diagnostics.stopwatch]::startNew()

	if ($IsLinux) {
		"⏳ (1/4) Querying updates for installed Debian packages..."
		& sudo apt update

		"⏳ (2/4) Upgrading installed Debian packages..."
		& sudo apt upgrade --yes

		"⏳ (3/4) Removing obsolete Debian packages..."
		& sudo apt autoremove --yes

		"⏳ (4/4) Upgrading installed Snap packages..."
		& sudo snap refresh
	} else {
		Write-Progress "⏳ Installing updates..."
		" "
		& winget upgrade --all
		Write-Progress -completed " "
	}
	[int]$Elapsed = $StopWatch.Elapsed.TotalSeconds
	"✅ Updates installed in $Elapsed sec"
	exit 0 # success
} catch {
	"⚠️ Error in line $($_.InvocationInfo.ScriptLineNumber): $($Error[0])"
	exit 1
}
```

*(generated by convert-ps2md.ps1 using the comment-based help of install-updates.ps1 as of 09/01/2023 17:51:51)*
