$PuzzleData = Get-Content -Path "$PSScriptRoot\PuzzleInput_Day7.txt"
$PuzzleData = $PuzzleData.Replace("44430","3176")

$InstructionSet = [System.Collections.Generic.List[object]]::new()
ForEach($Instruction in $PuzzleData){
    If((($Instruction.Split(" -> "))[0]).Split(" ").Count -eq 1){
        $entry = [PSCustomObject]@{
            Term1 = $null
            Operator = $null
            Term2 = (($Instruction.Split(" -> "))[0]).Split(" ")[0]
            Target = (($Instruction.Split(" -> "))[1]).Trim()
            Answer = $null
            Calculated = $False
        }    
    }
    ElseIf((($Instruction.Split(" -> "))[0]).Split(" ").Count -eq 2){
        $entry = [PSCustomObject]@{
            Term1 = $null
            Operator = (($Instruction.Split(" -> "))[0]).Split(" ")[0]
            Term2 = ((($Instruction.Split(" -> "))[0]).Split(" ")[1]).Trim()
            Target = (($Instruction.Split(" -> "))[1]).Trim()
            Answer = $null
            Calculated = $False
        }
    }
    ElseIf((($Instruction.Split(" -> "))[0]).Split(" ").Count -eq 3){
        $entry = [PSCustomObject]@{
            Term1 = ((($Instruction.Split(" -> "))[0]).Split(" ")[0]).Trim()
            Operator = (($Instruction.Split(" -> "))[0]).Split(" ")[1]
            Term2 = ((($Instruction.Split(" -> "))[0]).Split(" ")[2]).Trim()
            Target = (($Instruction.Split(" -> "))[1]).Trim()
            Answer = $null
            Calculated = $False
        }
    }
    $InstructionSet.Add($entry)
}

While(($InstructionSet | Where-Object Calculated -eq $False).Count -gt 0){
    $CalculatedCount = ($InstructionSet | Where-Object Calculated -eq $True).Count
    Write-Host "$CalculatedCount Entries have been Calculated."
    ForEach($InstructionEntry in ($InstructionSet | Where-Object Calculated -eq $False)){
        If($InstructionEntry.Term1 -match '^\d*$|-\d+$'){
            If($InstructionEntry.Term2 -match '^\d*$|^-\d+$'){
                If($null -ne $InstructionEntry.Operator){
                    $ao = ((((($InstructionEntry.Operator).Replace("AND","-band")).Replace("OR","-bor")).Replace("RSHIFT","-shr")).Replace("LSHIFT","-shl")).Replace("NOT","-bnot")
                    $InstructionSet[$InstructionSet.Target.IndexOf($InstructionEntry.Target)].Answer = Invoke-Expression ("$($InstructionEntry.Term1) $($ao) $($InstructionEntry.Term2)").Trim()
                    $InstructionSet[$InstructionSet.Target.IndexOf($InstructionEntry.Target)].Calculated = $True
                }
                Else{
                    $InstructionSet[$InstructionSet.Target.IndexOf($InstructionEntry.Target)].Answer = $InstructionEntry.Term2
                    $InstructionSet[$InstructionSet.Target.IndexOf($InstructionEntry.Target)].Calculated = $True
                }
            }
            Else{
                If($null -ne $InstructionSet[$InstructionSet.Target.IndexOf($InstructionEntry.Term2)].Answer){
                    $InstructionSet[$InstructionSet.Target.IndexOf($InstructionEntry.Target)].Term2 = $InstructionSet[$InstructionSet.Target.IndexOf($InstructionEntry.Term2)].Answer
                }
            }
        }
        Else{
            If($null -ne $InstructionSet[$InstructionSet.Target.IndexOf($InstructionEntry.Term1)].Answer){
                $InstructionSet[$InstructionSet.Target.IndexOf($InstructionEntry.Target)].Term1 = $InstructionSet[$InstructionSet.Target.IndexOf($InstructionEntry.Term1)].Answer
            }
        }
    }
}
$InstructionSet | Out-GridView