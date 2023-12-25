$PuzzleData = Get-Content -Path "$PSScriptRoot\PuzzleInput_Day3.txt"
$x=0
$y=0
$HouseList = [System.Collections.Generic.List[string]]::new()
$House = "$X,$y"
$HouseList.Add($House)
ForEach($Instruction in $PuzzleData.ToCharArray()){
    If($Instruction -eq "^"){$y++}
    ElseIf($Instruction -eq "V"){$y--}
    ElseIf($Instruction -eq "<"){$x--}
    ElseIf($Instruction -eq ">"){$x++}
    $House = "$X,$y"
    If($house -notin $HouseList){
        $HouseList.Add($House)
    }
}
$HouseList.Count