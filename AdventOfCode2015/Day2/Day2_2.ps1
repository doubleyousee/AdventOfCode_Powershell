$PuzzleData = Get-Content -Path C:\Users\willc\OneDrive\Repos\Powershell\AdventOfCode2015\Day2\PuzzleInput_Day2.txt
$Order = 0
ForEach($Box in $PuzzleData){
    $Measurements = $Box.Split("x")
    [int]$Length = $Measurements[0]
    [int]$Width = $Measurements[1]
    [int]$Height = $Measurements[2]
    $SideLW = $Length + $Width
    $SideWH = $Width + $Height
    $SideHL = $Height + $Length
    If($SideLW -le $SideWH -and $SideLW -le $SideHL){$Smallest = $SideLW * 2}
    ElseIf($SideWH -le $SideLW -and $SideWH -le $SideHL){$Smallest = $SideWH * 2}
    ElseIf($SideHL -le $SideLW -and $SideHL -le $SideWH){$Smallest = $SideHL * 2}
    
    $Bow = $Length * $Width * $Height

    $Length = $Smallest + $Bow
    $Order = $Order + $Length
}
$Order