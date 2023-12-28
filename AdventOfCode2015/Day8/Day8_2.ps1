$PuzzleData = Get-Content -Path "$PSScriptRoot\PuzzleInput_Day8.txt"
$AllStringLiterals = 0
$AllEncoded = 0
ForEach($StringLiteral in $PuzzleData){
    $SLL = $StringLiteral.Length
    $Encoded = $StringLiteral -Replace '\\','\\'
    $Encoded = $Encoded -Replace '"','\"' 
    $Encoded = $Encoded -Replace '^"(.*)"$','\"$1\"'
    #$Encoded = $Encoded -Replace '\\x[a-fA-F0-9][a-fA-F0-9]','!'
    $EL = $Encoded.Length
    Write-Host "$StringLiteral adds $SLL minus $Encoded with a length $EL"
    $AllStringLiterals = $AllStringLiterals + $SLL
    $AllEncoded = $AllEncoded + $EL + 2
}
$AllStringLiterals
$AllEncoded
$Total = $AllEncoded - $AllStringLiterals
Set-Clipboard $Total
$Total