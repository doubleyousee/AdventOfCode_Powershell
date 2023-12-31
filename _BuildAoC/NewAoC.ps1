$AoCYear = Read-Host -Prompt "Please enter the Year"
$RootPath = "$($PSScriptRoot | Split-Path -Parent)\AdventOfCode$AocYear"
If(!(Test-Path -Path $RootPath)){
    New-Item -Path $RootPath -ItemType Directory
}
1..25 | ForEach-Object {
    If(!(Test-Path -Path "$RootPath\Day$_")){
        New-Item -Path "$RootPath\Day$_" -ItemType Directory
        $PuzzleInputFilePath = "$RootPath\Day$_\PuzzleInput_Day$($_).txt"
        $PuzzleInputFilePathString = ("`"`$PSScriptRoot\PuzzleInput_Day$($_).txt`" ").Trim()
        $Line1 = '$PuzzleData = Get-Content -Path ' + $PuzzleInputFilePathString
        New-Item -Path $PuzzleInputFilePath -ItemType File
        New-Item -Path "$RootPath\Day$_\Day$($_)_1.ps1" -ItemType File
        Add-Content -Path "$RootPath\Day$_\Day$($_)_1.ps1" -Value $Line1
        New-Item -Path "$RootPath\Day$_\Day$($_)_2.ps1" -ItemType File
        Add-Content -Path "$RootPath\Day$_\Day$($_)_2.ps1" -Value $Line1
    }
}