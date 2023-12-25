$CleanupPairs = Get-Content -Path AdventOfCode2022\Day4_CampCleanup.input
$Count = 0
ForEach($Pair in $CleanupPairs){

    $Match = $False
    $Set1 = $Pair.Split(",")[0]
    $Set2 = $Pair.Split(",")[1]

    If([int]$Set1.Split("-")[0] -le [int]$Set2.Split("-")[0] -and [int]$Set1.Split("-")[1] -ge [int]$Set2.Split("-")[1]){
        $WiderSet = $Set1
        $InsideSet = $Set2
        $Count ++
        $Match = $True
        Write-Host "Set1"
    }
    If([int]$Set2.Split("-")[0] -le [int]$Set1.Split("-")[0] -and [int]$Set2.Split("-")[1] -ge [int]$Set1.Split("-")[1] -and $Match -eq $False){
        $WiderSet = $Set2
        $InsideSet = $Set1
        $Count ++
        Write-Host "Set2"
    }
    $WiderSet
    $InsideSet
    $Count
    Write-Host "---"
    IF($WiderSet){Remove-Variable -Name WiderSet}
    If($InsideSet){Remove-Variable -Name InsideSet}
}
$Count