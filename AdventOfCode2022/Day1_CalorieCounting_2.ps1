$data = Get-Content -Path AdventOfCode2022\Day1_CalorieCounting.input
$Elves = New-Object 'System.Collections.Generic.List[System.Object]'
$Calories = 0
ForEach($line in $data){
    If($line.length -gt 0){
        $Calories = $Calories + $Line
    }
    If($line.length -eq 0){
        $Elves.Add($Calories)
        $Calories = 0
    }
}
$ElvesByCalories = $Elves | Sort-Object -Descending
$Total = $ElvesByCalories[0] + $ElvesByCalories[1] + $ElvesByCalories[2]
$Total
