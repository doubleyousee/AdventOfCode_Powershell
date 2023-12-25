$PuzzleData = Get-Content -Path "$PSScriptRoot\PuzzleInput_Day2.txt"
$Order = 0
ForEach($Box in $PuzzleData){
    $Measurements = $Box.Split("x")
    [int]$Length = $Measurements[0]
    [int]$Width = $Measurements[1]
    [int]$Height = $Measurements[2]
    $SideLW = $Length * $Width
    
    $SideWH = $Width * $Height
    
    $SideHL = $Height * $Length
    
    If($SideLW -le $SideWH -and $SideLW -le $SideHL){$Smallest = $SideLW}
    ElseIf($SideWH -le $SideLW -and $SideWH -le $SideHL){$Smallest = $SideWH}
    ElseIf($SideHL -le $SideLW -and $SideHL -le $SideWH){$Smallest = $SideHL}
    
    $Result = [int]$Smallest + ([int]$SideLW * 2) + ([int]$SideWH * 2) + ([int]$SideHL * 2)
    Write-Host "For Box $Box the elves need $Result Sq Ft of wrapping paper" -ForegroundColor Red
    $Order = $Order + $Result
}
Write-Host "The Elves should order $Order sq ft" -ForegroundColor Green