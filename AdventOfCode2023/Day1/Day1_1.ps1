$PuzzleData = Get-Content -Path "C:\Users\willc\OneDrive\Repos\Powershell\AdventOfCode2023\Day1\PuzzleInput_Day1.txt"
$Sum = 0
ForEach($Line in $PuzzleData){
    $Check = [regex]::Matches($Line, '\d')
    $First = [int]$Check[0].Value 
    $Last = [int]$Check[$Check.Count-1].Value
    $Combine = [int]([string]"$($First)$($Last)")
    $Sum = $Sum + $Combine
}
$Sum