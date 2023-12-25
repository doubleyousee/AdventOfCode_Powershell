$PuzzleData = Get-Content -Path "$PSScriptRoot\PuzzleInput_Day1.txt"
$Sum = 0
$LineNum = 1
$WordTable = @{
    one = 1
    two = 2
    three = 3
    four = 4
    five = 5
    six = 6
    seven = 7
    eight = 8
    nine = 9
}
ForEach($Line in $PuzzleData){
    $Checks = [regex]::Matches($Line, '(?=(one|two|three|four|five|six|seven|eight|nine|\d))')
    $Check = $Checks.Groups | Where-Object Name -eq 1
    If($Check[0].Value.Length -eq 1){$First = [int]$Check[0].Value}
    Else{$First = [int]$WordTable[$Check[0].Value]}
    If($Check[$Check.Count-1].Value.Length -eq 1){$Last = [int]$Check[$Check.Count-1].Value}
    Else{$Last = [int]$WordTable[$Check[$Check.Count-1].Value]}
    $Combine = [int]([string]"$($First)$($Last)")
    Write-Host "$LineNum : Sum is $Sum, adding $Combine from $Line"
    $Sum = $Sum + $Combine
    $LineNum++
}
$Sum