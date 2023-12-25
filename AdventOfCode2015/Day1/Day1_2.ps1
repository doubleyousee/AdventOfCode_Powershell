$PuzzleData = Get-Content -Path "$PSScriptRoot\PuzzleInput_Day1.txt"
$Floor = 0
$Position = 0
$Found = $False
ForEach($Char in $PuzzleData.ToCharArray()){
    $Position++
    If($Char -eq "("){
        $Floor++
        Write-Host "Sending Santa up a floor" -ForegroundColor Green
    }
    ElseIf($Char -eq ")"){
        $Floor--
        Write-Host "Sending Santa down a floor" -ForegroundColor Red
    }
    If($Floor -eq -1 -and $Found -eq $false){
        $BasementPosition = $Position
        $Found = $True
    }
}
Write-Host "Santa has arrived on floor $Floor"
Write-Host "Santa First Entered the Basement at position $BasementPosition"