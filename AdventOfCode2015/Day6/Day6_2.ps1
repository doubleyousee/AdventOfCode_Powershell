##Warning, this powershell code will take ~30-40 hours to complete... at best.
$PuzzleData = Get-Content -Path "$PSScriptRoot\PuzzleInput_Day6.txt"
$LightingArray = [ordered]@{}
ForEach($x in 0..999){
    ForEach($y in 0..999){
        $LightingArray.Add("$X,$Y",0)
    }
}
ForEach($Line in $PuzzleData){
    $InstructionArray = [ordered]@{}
    $Instruction = $Line -split '(?=\d)',2
    $Action = $Instruction[0].Trim()
    $StartX = (($Instruction[1] -Split '\sthrough\s')[0] -Split ',')[0]
    $StartY = (($Instruction[1] -Split '\sthrough\s')[0] -Split ',')[1]
    $EndX = (($Instruction[1] -Split '\sthrough\s')[1] -Split ',')[0]
    $EndY = (($Instruction[1] -Split '\sthrough\s')[1] -Split ',')[1]
    ForEach($x in $StartX..$EndX){
        ForEach($y in $StartY..$EndY){
            $InstructionArray.Add("$X,$Y",$Action)
        }
    }
    ForEach($Change in $InstructionArray.GetEnumerator()){
        If($Change.Value -eq 'turn off'){
            $LightingArray["$($Change.Name)"] = $LightingArray["$($Change.Name)"] - 1
            If($LightingArray["$($Change.Name)"] -lt 0){
                $LightingArray["$($Change.Name)"] = 0
            }
        }
        ElseIf($Change.Value -eq 'turn on'){
            $LightingArray["$($Change.Name)"] = $LightingArray["$($Change.Name)"] + 1
        }
        ElseIf($Change.Value -eq 'toggle'){
            $LightingArray["$($Change.Name)"] = $LightingArray["$($Change.Name)"] + 2
        }
    }
}
$TotalBrightness = 0
ForEach($Brightness in $LightingArray.GetEnumerator()){
    $TotalBrightness = $TotalBrightness + [int]$Brightness.Value
}
Write-Host "The total brightness of all lights is $TotalBrightmess"