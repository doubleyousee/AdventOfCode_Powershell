$PuzzleData = Get-Content -Path "$PSScriptRoot\PuzzleInput_Day6.txt"
$LightingArray = [ordered]@{}
ForEach($x in 0..999){
    ForEach($y in 0..999){
        $LightingArray.Add("$X,$Y",$False)
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
            $LightingArray["$($Change.Name)"] = $False
        }
        ElseIf($Change.Value -eq 'turn on'){
            $LightingArray["$($Change.Name)"] = $True
        }
        ElseIf($Change.Value -eq 'toggle'){
            $LightingArray["$($Change.Name)"] = -not $LightingArray["$($Change.Name)"]
        }
    }
}
$OnCount = ($LightingArray.GetEnumerator() | Where-Object Value -eq $True).Count
$OffCount = ($LightingArray.GetEnumerator() | Where-Object Value -eq $False).Count
Write-Host -ForegroundColor Blue "There are $OnCount Lights On and $OffCount Lights Off"