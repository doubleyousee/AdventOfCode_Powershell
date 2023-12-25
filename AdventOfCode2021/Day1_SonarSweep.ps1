$Measurements = Get-Content -Path .\AdventOfCode2021\Day1_SonarSweep.input

$Depths = @()
$Count = 0
ForEach($Measeurement in $Measurements){
    If($Count -lt ($Measurements.Count -2)){
        $data = [int]$Measurements[$Count] + [int]$Measurements[$count+1] + [int]$Measurements[$count+2]
        $Depths += $data
        $count++
    }
}

$Previous = 0
$Increased = -1
ForEach($Measurement in $Depths){
    If($Measurement -gt $Previous){
        $Increased++
    }
    $Previous = $Measurement
}
$Increased