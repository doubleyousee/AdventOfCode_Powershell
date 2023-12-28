$PuzzleData = Get-Content -Path "$PSScriptRoot\PuzzleInput_Day8.txt"
$AllStringLiterals = 0
$AllInMemory = 0
ForEach($StringLiteral in $PuzzleData){
    $SLL = $StringLiteral.Length
    $InMemory = $StringLiteral -Replace '^"(.*)"$','$1'
    $InMemory = $InMemory -Replace '\\\\','\'
    $InMemory = $InMemory -Replace '\\"','"' 
    $InMemory = $InMemory -Replace '\\x[a-fA-F0-9][a-fA-F0-9]','!'
    $IML = $InMemory.Length
    Write-Host "$StringLiteral adds $SLL minus $InMemory with a length $IML"
    $AllStringLiterals = $AllStringLiterals + $SLL
    $AllInMemory = $AllInMemory + $IML
}
$AllStringLiterals
$AllInMemory
$Total = $AllStringLiterals - $AllInMemory
Set-Clipboard $Total
$Total