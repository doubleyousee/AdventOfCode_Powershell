$PuzzleData = Get-Content -Path "$PSScriptRoot\PuzzleInput_Day5.txt"
$Results = [System.Collections.Generic.List[object]]::new()
$RegexA = '([a-z])\1'
$RegexB = 'ab|cd|pq|xy'
$RegexC = '[aeiou][a-z]*[aeiou][a-z]*[aeiou]'
ForEach($string in $PuzzleData){   
    If($string -match $RegexA -and $string -notmatch $RegexB -and $string -match $RegexC){
        $Results.Add([PSCustomObject]@{
            String = $string 
            Status = 'Nice'
        })
    }
    Else{
        $Results.Add([PSCustomObject]@{
            String = $string
            Status = 'Naughty'
        })
    }
}
$niceCount = ($Results | Where-Object Status -eq 'Nice').Count
$naughtyCount = ($Results | Where-Object Status -eq 'Naughty').Count
Write-Host "There are $niceCount Nice Strings and $naughtyCount Naughty Strings."