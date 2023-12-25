$PuzzleData = Get-Content -Path C:\Users\willc\OneDrive\Repos\Powershell\AdventOfCode2023\Day4\PuzzleInput_Day4.txt
$CardReport = [System.Collections.Generic.List[Object]]::new()
ForEach($Card in $PuzzleData){
    $CardData = [PSCustomObject]@{
        CardNumber      = [int]$Card.Split(":")[0].Split("Card")[1]
        TargetNumbers   = @([regex]::Matches($Card.SubString($Card.IndexOf(":") + 1,($Card.IndexOf("|")-$Card.IndexOf(":")-1)),"\d{1,2}") | Select-Object -ExpandProperty Value)
        MyNumbers       = @([regex]::Matches($Card.SubString($Card.IndexOf("|") + 1,($Card.Length - $Card.IndexOf("|")-1)),"\d{1,2}") | Select-Object -ExpandProperty Value)
        WinningNumbers  = @()
        Score           = 0
    }
    $CardData.WinningNumbers = @(Compare-Object -ReferenceObject @($CardData.MyNumbers | ForEach-Object {[int]$_}) -DifferenceObject @($CardData.TargetNumbers | ForEach-Object {[int]$_}) -IncludeEqual -ExcludeDifferent | Select-Object -ExpandProperty InputObject)
    If($CardData.WinningNumbers.Count -gt 1){
        $CardData.Score = [Math]::Pow(2,$CardData.WinningNumbers.Count - 1)
    }
    ElseIf($CardData.WinningNumbers.Count -eq 1){
        $CardData.Score = 1
    }
    Else{
        $CardData.Score = 0
    }
    $CardReport.Add($CardData)
}
