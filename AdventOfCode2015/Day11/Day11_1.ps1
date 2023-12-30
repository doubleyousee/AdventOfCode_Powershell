$PuzzleData = Get-Content -Path "$PSScriptRoot\PuzzleInput_Day11.txt"
$alphabet = @("a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z")
$letterSetsRegex = 'abc|bcd|cde|def|efg|fgh|ghi|hij|ijk|jkl|klm|lmn|mno|nop|opq|pqr|qrs|rst|stu|tuv|uvw|vwx|wxy|xyz'
$AlphaHash = [ordered]@{}
$i = 0
$Valid = $False
ForEach($letter in $alphabet){
    $AlphaHash.Add($i,$letter)
    $i++
}
$iteration = $PuzzleData
While($Valid -eq $False){
    If($iteration -match $letterSetsRegex -and $iteration -match '[^iol]{8}' -and $iteration -match '([a-z])\1.*([a-z])\2'){
        $Valid = $True
    }
    Else{
        $NumberList = [System.Collections.Generic.List[int]]::new()
        ForEach($Character in $iteration.ToCharArray()){
            [int]$Number = $AlphaHash.GetEnumerator() | Where-Object Value -eq $Character | Select-Object -ExpandProperty Name
            $NumberList.Add($Number)
        }
        $NumberList[7]++
        ForEach($x in 7..0){
            If($NumberList[$x] -gt 25){
                $NumberList[$x] = 0
                If($x -ne 0){
                    $NumberList[$x-1]++
                }
                Else{
                    $NumberList = @(0,0,0,0,0,0,0,0)
                }
            }
        }
        $iteration = ""
        ForEach($Num in $NumberList){
            $iteration += "$($AlphaHash[$Num])"
        }
    }
}
$iteration
Set-Clipboard $iteration