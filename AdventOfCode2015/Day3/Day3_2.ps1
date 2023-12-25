$PuzzleData = Get-Content -Path C:\Users\willc\OneDrive\Repos\Powershell\AdventOfCode2015\Day3\PuzzleInput_Day3.txt
$santaX = 0
$santaY = 0
$roboX = 0
$roboY = 0
$HouseList = [System.Collections.Generic.List[string]]::new()
$HouseList.Add("0,0")
$Count = 0
ForEach($Instruction in $PuzzleData.ToCharArray()){
    If($Count -eq 0 -or $Count % 2 -eq 0){
        If($Instruction -eq "^"){$santaY++}
        ElseIf($Instruction -eq "V"){$santaY--}
        ElseIf($Instruction -eq "<"){$santaX--}
        ElseIf($Instruction -eq ">"){$santaX++}
        $House = "$santaX,$santaY"
        If($house -notin $HouseList){
            $HouseList.Add($House)
            Write-Host "Santa has found a new house!" -ForegroundColor Red
        }
    }
    Else{
        If($Instruction -eq "^"){$roboY++}
        ElseIf($Instruction -eq "V"){$roboY--}
        ElseIf($Instruction -eq "<"){$roboX--}
        ElseIf($Instruction -eq ">"){$roboX++}
        $House = "$roboX,$roboY"
        If($house -notin $HouseList){
            $HouseList.Add($House)
            Write-Host "Robo Santa has found a new house!" -ForegroundColor DarkGreen
        }
    }
    $Count++
}
$HouseList.Count

