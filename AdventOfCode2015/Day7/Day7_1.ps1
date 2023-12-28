$PuzzleData = Get-Content -Path "$PSScriptRoot\PuzzleInput_Day7.txt"
$ResultsHash = @{}
ForEach($Instruction in $PuzzleData){
    $ResultsHash.Add(($Instruction.Split(" -> "))[1],$null)
}
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

<#
ForEach($Instruction in $PuzzleData){
    $Instruction = (((((($Instruction.Split(" -> "))[0]).Replace("AND","-band")).Replace("OR","-bor")).Replace("RSHIFT","-shr")).Replace("LSHIFT","-shl")).Replace("NOT","-bnot")
    [regex]$regex = '-b[a-z]+|-sh[l|r]'
    $InputA = ($Instruction.Split($($regex.Matches($Instruction) | Select-Object -ExpandProperty Value))[0]).Trim()
    $InputB = ($Instruction.Split($($regex.Matches($Instruction) | Select-Object -ExpandProperty Value))[1]).Trim()
    $ex = $Instruction -match $regex
    If($InputA -notmatch '\d{1,10}' -and $InputA -ne ""){
        $InputA = [int]$ResultsHash[$InputA]
    }
    If($InputB -notmatch '\d{1,10}'){
        $InputB = [int]$ResultsHash[$InputB]
    }
    $Expression = "$InputA $($Matches.Values) $InputB"
    $Expression
}
    $ResultsHash[(($Instruction.Split(" -> "))[1]).Trim()] = 
    
    $Compute = ($Instruction.Split(" -> "))[0]
    $BitwiseCheck = $Compute -cmatch '[A-Z]{1,6}'
    If($BitwiseCheck -eq $True){
        $Operator = $Matches | Select-Object -ExpandProperty Values
        $Inputs = $Compute.Split("$Operator")
        ForEach($Value in $Inputs){
            If($value.Trim() -match '^\d+$'){
                Write-Host "$($Value.Trim()) is a Number"
            }
            ElseIf($Value.Trim() -cmatch '^[a-z]{1,2}$'){
                Write-Host "$($Value.Trim()) is a Variable with value of $($ResultsHash[$Value.Trim()])"
            }
        }
        If($Inputs -gt 1){
            If ($Operator -eq "RSHIFT"){
                $ResultsHash[($Instruction.Split(" -> "))[1]] = $ResultsHash[$Inputs.Trim()[0]] -shr $Inputs[1]
        }
    }
}
#>