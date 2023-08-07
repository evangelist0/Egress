# TEST EGRESS FUNCTION to Update EgressClient - AE
function Update-EgressClient {

#  Import-Module Update-EgressClient.ps1
#  Update-EgressClient -LargeFileMinKB 3000 -ExpansionTimeoutSecs 5

 [CmdletBinding()]
    Param (
        [Parameter(Mandatory = $False)]
        [switch]$ReadOnly,
        [Parameter(Mandatory = $False)]
        [switch]$LoggingLevel,
        [Parameter(Mandatory = $False)]
        [switch]$forcegatewaymode,
        [Parameter(Mandatory = $False)]
        [int]$MinimumSizeKB,
        [Parameter(Mandatory = $False)]
        [string]$LargeFileMinKB,
        [Parameter(Mandatory = $False)]
        [int]$ExpansionTimeoutSecs
        )

    $regPaths = @("HKLM:\Software\Egress\Switch\","HKLM:\SOFTWARE\WOW6432Node\Egress\Switch\")

        if ($ReadOnly) {
   # Get-ChildItem 'HKLM:\SOFTWARE\Egress'
   # Get-ChildItem 'HKLM:\SOFTWARE\WOW6432Node\Egress'
   }

        if ($LoggingLevel) { 
    Write-Host "Updating LoggingLevel to : $LoggingLevel" -ForegroundColor Yellow
    foreach ($regPath in $regPaths) {
    New-ItemProperty -Path $regPath -Name 'LoggingLevel' -Value $LoggingLevel -PropertyType DWord -Force | Out-Null }
    }

        if ($forcegatewaymode) { 
    Write-Host "Updating forcegatewaymode to : $forcegatewaymode" -ForegroundColor Yellow
    foreach ($regPath in $regPaths) {
    New-ItemProperty -Path $regPath -Name 'forcegatewaymode' -Value $forcegatewaymode -PropertyType DWord -Force | Out-Null }
    }

        if ($MinimumSizeKB) { 
    Write-Host "Updating MinimumSizeKB to : $MinimumSizeKB" -ForegroundColor Yellow
    foreach ($regPath in $regPaths) {
    New-ItemProperty -Path $regPath -Name 'MinimumSizeKB' -Value $MinimumSizeKB -PropertyType DWord -Force | Out-Null }
    }

        if ($LargeFileMinKB) { 
    Write-Host "Updating LargeFileMinKB to : $LargeFileMinKB KB" -ForegroundColor Yellow
    foreach ($regPath in $regPaths) {
    New-ItemProperty -Path $regPath -Name 'LargeFileMinKB' -Value $LargeFileMinKB -PropertyType DWord -Force | Out-Null }
    }

        if ($ExpansionTimeoutSecs) { 
    Write-Host "Updating ExpansionTimeoutSecs to : $ExpansionTimeoutSecs" -ForegroundColor Yellow
    foreach ($regPath in $regPaths) {
    New-ItemProperty -Path $regPath -Name 'ExpansionTimeoutSecs' -Value $ExpansionTimeoutSecs -PropertyType DWord -Force | Out-Null }
    }
    Get-ChildItem 'HKLM:\SOFTWARE\Egress'
    Get-ChildItem 'HKLM:\SOFTWARE\WOW6432Node\Egress'
}
