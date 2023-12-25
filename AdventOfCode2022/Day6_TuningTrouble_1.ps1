$packetSize = 4
$Raw = Get-Content ./Day6_TuningTrouble.input
For($i=0; $i -le $Raw.Length-$packetSize;$i++){
    $Answer = $i + $packetSize
    $Set = $Raw.Substring($i,$packetSize)
    $Compare = [System.Collections.Generic.List[object]]::new()
    For ($m=0; $m -le $packetSize-1; $m++){
        $Compare.Add($Set[$m])
    }
    If(($Compare | Sort-Object -Unique).Count -eq $packetSize){
        $Answer
        break
    }
}