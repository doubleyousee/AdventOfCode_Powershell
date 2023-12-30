##Warning, this code will take HOURS, Powershell ftw!

$PuzzleData = "3113322113" #Get-Content -Path "$PSScriptRoot\PuzzleInput_Day10.txt"
$i = 1
$Iteration = $PuzzleData
While($i -le 50){
    $MatchGroups = [regex]::matches($Iteration,'((\d)\2*)')
    $NewString = ""
    ForEach($Group in $MatchGroups){
        $NewString = $NewString + "$([string]$Group.Length)"
        $NewString = $NewString + "$([string]($Group.Value.ToCharArray())[0])"
    }
    Write-Host "Pass $($i): Current String has a Length of $($Iteration.Length), the updated string Length is now $($NewString.Length)"
    $Iteration = $NewString
    $i++
}
Set-Clipboard $Iteration.Length
$Iteration.Length