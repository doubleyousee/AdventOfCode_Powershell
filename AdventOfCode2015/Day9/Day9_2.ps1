$PuzzleData = Get-Content -Path "$PSScriptRoot\PuzzleInput_Day9.txt"

function remove ($element, $list){
    $newlist = @()
    $list | ForEach-Object { if ($_ -ne $element) { $newlist += $_} }
    return $newlist
}

function append ($head, $tail){
    if ($tail.count -eq 0){ return ,$head }
    $result =  @()
    $tail | ForEach-Object{
        $newlist = ,$head
        $_ | ForEach-Object{ $newlist += $_ }
        $result += ,$newlist
    }
    return $result
}

function permute ($list){
    if ($list.count -eq 0){ return @() }
    $list | ForEach-Object{
        $permutations = permute (remove $_ $list)
        return append $_ $permutations
    }
}

$Legs = @{}

ForEach($Entry in $PuzzleData){
    $Endpoints = @((($Entry.Split("="))[0].Split("to"))[0].Trim(),(($Entry.Split("="))[0].Split("to"))[1].Trim()) | Sort-Object
    $Legs.Add("$($Endpoints[0]),$($Endpoints[1])",[int]($Entry.Split("="))[1].Trim())
}

$Cities = $Legs.Keys -Split "," | Sort-Object -Unique 

$permutations = permute $Cities

$Routes = [System.Collections.Generic.List[object]]::new()
ForEach($Combination in $permutations){
    $i = 0
    $RouteDistance = 0
    While($i -le 6){
        $Set = @($($Combination[$i]),$($Combination[$i+1])) | Sort-Object
        $LegDistance = $Legs["$($Set[0]),$($Set[1])"]
        $RouteDistance = $RouteDistance + $LegDistance
        $i++
    }
    $Route = [PSCustomObject]@{
        Cities = $Combination
        Distance = $RouteDistance
    }
    $Routes.Add($Route)
}
Set-Clipboard $($Routes.Distance | Sort-Object)[-1]
$($Routes.Distance | Sort-Object)[-1]
