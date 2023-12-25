$Source = Get-Content -Path .\AdventOfCode2021\Day3_BinaryDiagnostic.input

$Diagnostic = $Source

ForEach($CharNum in (0..11)){
    $Regex0 = "^.{$CharNum}0"
    $Regex1 = "^.{$CharNum}1"
    
    $Zero = @($Diagnostic | Where-Object {$_ -match $Regex0})
    $One = @($Diagnostic | Where-Object {$_ -match $Regex1})
    Write-Host Position $CharNum
    If($Zero.Count -gt $One.Count){
        Write-Host $Zero.Count is More than $One.Count
        Write-Host Zero Wins!
        $Diagnostic = $Zero
    }
    Else{
        Write-Host $One.Count is More than or equal to $Zero.Count
        Write-Host One Wins!
        $Diagnostic = $One
    }
    Write-Host $Diagnostic.Count Numbers for next Round
    If($Diagnostic.Count -eq 1){
        $OxyGenBin = $Diagnostic
    }
}

$Diagnostic = $Source
ForEach($CharNum in (0..11)){
    $Regex0 = "^.{$CharNum}0"
    $Regex1 = "^.{$CharNum}1"
    
    $Zero = @($Diagnostic | Where-Object {$_ -match $Regex0})
    $One = @($Diagnostic | Where-Object {$_ -match $Regex1})
    Write-Host Position $CharNum
    If($Zero.Count -le $One.Count){
        Write-Host $Zero.Count is Less than or equal to $One.Count
        Write-Host Zero Wins!
        $Diagnostic = $Zero
    }
    Else{
        Write-Host $One.Count is Less than $Zero.Count
        Write-Host One Wins!
        $Diagnostic = $One
    }
    Write-Host $Diagnostic.Count Numbers for next Round
    If($Diagnostic.Count -eq 1){
        $Diagnostic
        $CO2ScrubBin = $Diagnostic
    }
}

Write-Host Oxygen Generator diagnostic binary is $OxyGenBin
Write-Host CO2 Scrubber diagnostic binary is $CO2ScrubBin
Write-Host Oxygen Generator equals $([convert]::ToInt32($OxyGenBin,2))
Write-Host CO2 Scrubber equals $([convert]::ToInt32($CO2ScrubBin,2))

$Answer = $([convert]::ToInt32($OxyGenBin,2)) * $([convert]::ToInt32($CO2ScrubBin,2))

Write-Host Answer is $Answer