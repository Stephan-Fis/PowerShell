*clear-dns-cache.ps1*
================

This PowerShell script clears the DNS client cache of the local computer.

Parameters
----------
```powershell
PS> ./clear-dns-cache.ps1 [<CommonParameters>]

[<CommonParameters>]
    This script supports the common parameters: Verbose, Debug, ErrorAction, ErrorVariable, WarningAction, 
    WarningVariable, OutBuffer, PipelineVariable, and OutVariable.
```

Example
-------
```powershell
PS> ./clear-dns-cache.ps1
✔️ cleared DNS cache in 0 ms

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
	Clears the DNS cache
.DESCRIPTION
	This PowerShell script clears the DNS client cache of the local computer.
.EXAMPLE
	PS> ./clear-dns-cache.ps1
	✔️ cleared DNS cache in 0 ms
.LINK
	https://github.com/fleschutz/PowerShell
.NOTES
	Author: Markus Fleschutz | License: CC0
#>

try {
	$StopWatch = [system.diagnostics.stopwatch]::startNew()

	Clear-DnsClientCache

	[int]$Elapsed = $StopWatch.Elapsed.TotalSeconds
	"✔️ cleared DNS cache in $Elapsed sec"
	exit 0 # success
} catch {
	"⚠️ Error in line $($_.InvocationInfo.ScriptLineNumber): $($Error[0])"
	exit 1
}
```

*(generated by convert-ps2md.ps1 using the comment-based help of clear-dns-cache.ps1 as of 09/01/2023 17:51:49)*
