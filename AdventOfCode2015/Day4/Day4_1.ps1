$PuzzleData = Get-Content -Path C:\Users\willc\OneDrive\Repos\Powershell\AdventOfCode2015\Day4\PuzzleInput_Day4.txt
$Number = 0
$Answer = 0
While($Answer -eq 0){
    $stringAsStream = [System.IO.MemoryStream]::new()
    $writer = [System.IO.StreamWriter]::new($stringAsStream)
    $writer.write("$puzzleData" + "$Number")
    $writer.Flush()
    $stringAsStream.Position = 0
    $Hash = Get-FileHash -InputStream $stringAsStream -Algorithm MD5 | Select-Object -ExpandProperty Hash
    If($Hash.Substring(0,5) -eq '00000'){
        $Answer = $Number
    }
    $Number++
}
$Answer