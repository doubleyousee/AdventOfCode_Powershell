$Instructions = Get-Content -Path .\AdventOfCode2021\Day2_Dive!.input
$x = 0
$y = 0
$aim = 0
ForEach($Instruction in $Instructions){
    $Direction = $Instruction.Split(" ")[0]
    $Value = [int]$Instruction.Split(" ")[1]
    If ($Direction -eq "forward"){
        $x = $x + $Value
        $y = $y + ($Value*$Aim)
    }
    If ($Direction -eq "up"){
        $aim = $aim - $Value
    }
    If ($Direction -eq "down"){
        $aim = $aim + $Value
    }
    $x
    $y
}
$Answer = $x * $y
$Answer