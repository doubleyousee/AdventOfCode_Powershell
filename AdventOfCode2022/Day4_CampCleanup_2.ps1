$CleanupPairs = Get-Content -Path AdventOfCode2022\Day4_CampCleanup.input
$Count = 0
ForEach($Pair in $CleanupPairs){

    $Match = $False
    $Set1 = $Pair.Split(",")[0].Split("-")[0]..$Pair.Split(",")[0].Split("-")[1]
    $Set2 = $Pair.Split(",")[1].Split("-")[0]..$Pair.Split(",")[1].Split("-")[1]
    
    ForEach($Number in $Set1){
        If($Number -in $Set2 -and $Match -eq $False){
            $Pair
            $Count ++
            $Count
            Write-Host "---"
            $Match = $True
        }
    }
}
$Count