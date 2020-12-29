#!/snap/bin/powershell
<#
.SYNTAX         ./locate-city.ps1 [<city>]
.DESCRIPTION	prints the geographic location of the given city
.LINK		https://github.com/fleschutz/PowerShell
.NOTES		Author:	Markus Fleschutz / License: CC0
#>

param([string]$City)
if ($City -eq "" ) {
	$City = read-host "Enter the city"
}
 
try {
	write-progress "Reading worldcities.csv..."
	$PathToRepo=(get-item $MyInvocation.MyCommand.Path).directory.parent
	$Table = import-csv "$PathToRepo/Data/worldcities.csv"

	$FoundOne = 0
	foreach($Row in $Table) {
		if ($Row.city -eq $City) {
			$FoundOne = 1
			$Country = $Row.country
			$Region = $Row.admin_name
			$Lat = $Row.lat
			$Long = $Row.lng
			$Population = $Row.population
			write-host "* $City ($Country, $Region, population $Population) is at $Lat°N, $Long°W"
		}
	}

	if ($FoundOne) {
		exit 0
	}
	write-error "City $City not found"
	exit 1
} catch {
	write-error "ERROR in line $($_.InvocationInfo.ScriptLineNumber): $($Error[0])"
	exit 1
}
