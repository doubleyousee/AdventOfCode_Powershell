$PuzzleData = Get-Content -Path C:\Users\willc\OneDrive\Repos\Powershell\AdventOfCode2023\Day3\PuzzleInput_Day3.txt
$Rows = $PuzzleData.Split("/n")
$RowCount = 0
$Sum = 0
ForEach($Row in $Rows){
    $Check = [regex]::Matches($Row,"\d{1,3}")
    ForEach($Number in $Check){
        $Symbol = $False
        $First = $Number.Index - 1
        $Length = $Number.Length + 2
        $Check1 = ""
        $Check2 = ""
        $Check3 = ""
        If($First -lt 0){
            $First = 0
            $Length = $Number.Length + 1
        }
        If($First + $Length -gt $Row.Length - 1){$Length = ($Row.Length) - $First}
        If($RowCount -ne 0){
            $Check1 = $Rows[$RowCount-1].SubString($First,$Length)
            If($Check1 -match '[^\d\.]'){
                $Symbol = $True
            }
        }
        $Check2 = $Rows[$RowCount].SubString($First,$Length)
        If($Check2 -match '[^\d\.]'){
            $Symbol = $True
        }
        If($RowCount -lt $Rows.Count - 1){
            $Check3 = $Rows[$RowCount + 1].SubString($First,$Length)
            If($Check3 -match '[^\d\.]'){
                $Symbol = $True
            }
        }
        If($Symbol -eq $True){
            $Sum = $Sum + $Number.Value
        }
        ElseIf($Symbol -eq $False){
            <#$Check1
            $Check2
            $Check3
            Write-Host "----"#>
        }
    }
    $RowCount++
}
$Sum