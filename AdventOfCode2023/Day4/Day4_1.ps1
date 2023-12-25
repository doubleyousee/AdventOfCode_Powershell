$PuzzleData = Get-Content -Path "$PSScriptRoot\PuzzleInput_Day4.txt"
$Sum = 0
ForEach($Card in $PuzzleData){
    $CardData = @{
        CardNumber      = [int]$Card.Split(":")[0].Split("Card")[1]
        TargetNumbers   = @([regex]::Matches($Card.SubString($Card.IndexOf(":") + 1,($Card.IndexOf("|")-$Card.IndexOf(":")-1)),"\d{1,2}") | Select-Object -ExpandProperty Value)
        MyNumbers       = @([regex]::Matches($Card.SubString($Card.IndexOf("|") + 1,($Card.Length - $Card.IndexOf("|")-1)),"\d{1,2}") | Select-Object -ExpandProperty Value)
    }
    $CardData.Add("WinningNumbers", @(Compare-Object -ReferenceObject @($CardData.MyNumbers | ForEach-Object {[int]$_}) -DifferenceObject @($CardData.TargetNumbers | ForEach-Object {[int]$_}) -IncludeEqual -ExcludeDifferent | Select-Object -ExpandProperty InputObject))
    If($CardData.WinningNumbers.Count -gt 1){
        $CardData.Add("Score", [Math]::Pow(2,$CardData.WinningNumbers.Count - 1))
    }
    ElseIf($CardData.WinningNumbers.Count -eq 1){
        $CardData.Add("Score", 1)
    }
    Else{
        $CardData.Add("Score", 0)
    }
    $Sum = $Sum + $CardData.Score
}
$Sum
