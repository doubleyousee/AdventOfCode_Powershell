$Raw = Get-Content -Path .\Day5_Supplystacks.input
$NumberRow = Select-String -Path .\Day5_Supplystacks.input -Pattern ' 1   2' | Select-Object -ExpandProperty LineNumber
$ColumnLabels = $Raw[$NumberRow-1].Trim().Split('   ')

##Identify the index for the row that will have the entry for that column
$CrateColumnIndex = @{}
$i = 1
1..$ColumnLabels[$ColumnLabels.Length-1] | ForEach-Object {
    $CrateColumnIndex.Add($_,$i)
    $i = $i + 4
}

##Loop Through Data and Transpose Columns to a hashtable of lists
$Columns = @{}
ForEach($ColumnNum in $ColumnLabels){
    $TempList = [System.Collections.Generic.List[object]]::new()
    ##Loop Through Data to get Crates
    ([int]$NumberRow-2)..0 | ForEach-Object {
        $CrateTemp = $Raw[$_].Substring($CrateColumnIndex.[int]$ColumnNum,1)
        If(![string]::IsNullOrWhitespace($CrateTemp)){
            $TempList.Add($CrateTemp)
        }
    }
    $Columns.Add($ColumnNum,$TempList)
}

$MovesStartRow = $NumberRow + 1
$MovesEndRow = $Raw.Length - 1
$Moves = $Raw[$MovesStartRow..$MovesEndRow]

ForEach($Move in $Moves){
    $CrateCount = [int]$Move.Split(" from")[0].Split("move ")[1]
    $ColumnDestNum = [int]$Move.Split(" to ")[1]
    $ColumnSourceNum = [int]$Move.Split(" from ")[1].Split(" to ")[0]
    
    $Crane = [System.Collections.Generic.List[object]]::new()
    For ($m=$CrateCount; $m -ge 1; $m--){
        #Add Crate to Crane
        $Crane.Add($Columns."$ColumnSourceNum"[-$m])
        #Remove Crate from Stack
        $Columns."$ColumnSourceNum".RemoveAt(($Columns."$ColumnSourceNum".Count)-$m)
    }
    ForEach($Crate in $Crane){
        $Columns."$ColumnDestNum".Add($Crate)
    }
}

$Answer = [System.Collections.Generic.List[object]]::new()
ForEach($ColumnNum in $ColumnLabels){
    $Answer.Add($Columns.$ColumnNum[-1])
}
-Join $Answer