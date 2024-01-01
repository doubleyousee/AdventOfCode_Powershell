$PuzzleData = Get-Content -Path "$PSScriptRoot\PuzzleInput_Day12.txt"
$Total = 0
$Integers = Select-String '-\d+|\d+' -input $PuzzleData -AllMatches
ForEach($Num in $Integers.Matches){
    $Total = $Total + $Num.Value
}
Set-Clipboard $Total
$total