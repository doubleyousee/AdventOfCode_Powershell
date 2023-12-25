$Diagnostic = Get-Content -Path .\AdventOfCode2021\Day3_BinaryDiagnostic.input
$A0 = 0;$A1 = 0;$B0 = 0;$B1 = 0;$C0 = 0;$C1 = 0;$D0 = 0;$D1 = 0;$E0 = 0;$E1 = 0;$F0 = 0;$F1 = 0;$G0 = 0;$G1 = 0;$H0 = 0;$H1 = 0;$I0 = 0;$I1 = 0;$J0 = 0;$J1 = 0;$K0 = 0;$K1 = 0;$L0 = 0;$L1 = 0
ForEach($Entry in $Diagnostic){
    If ($Entry[0] -eq "0"){$A0 ++}
    Else{$A1 ++}
    If ($Entry[1] -eq "0"){$B0 ++}
    Else{$B1 ++}
    If ($Entry[2] -eq "0"){$C0 ++}
    Else{$C1 ++}
    If ($Entry[3] -eq "0"){$D0 ++}
    Else{$D1 ++}
    If($Entry[4] -eq "0"){$E0 ++}
    Else{$E1 ++}
    If($Entry[5] -eq "0"){$F0 ++}
    Else{$F1 ++}
    If($Entry[6] -eq "0"){$G0 ++}
    Else{$G1 ++}
    If($Entry[7] -eq "0"){$H0 ++}
    Else{$H1 ++}
    If($Entry[8] -eq "0"){$I0 ++}
    Else{$I1 ++}
    If($Entry[9] -eq "0"){$J0 ++}
    Else{$J1 ++}
    If($Entry[10] -eq "0"){$K0 ++}
    Else{$K1 ++}
    If($Entry[11] -eq "0"){$L0 ++}
    Else{$L1 ++}
}
    Write-Host $A0 $A1
    Write-Host $B0 $B1
    Write-Host $C0 $C1
    Write-Host $D0 $D1
    Write-Host $E0 $E1
    Write-Host $F0 $F1
    Write-Host $G0 $G1
    Write-Host $H0 $H1
    Write-Host $I0 $I1
    Write-Host $J0 $J1
    Write-Host $K0 $K1
    Write-Host $L0 $L1
    
    If($A0 -gt $A1){
        $GammaA = "0"
        $EpsilonA = "1"
    }
    Else{
        $GammaA = "1"
        $EpsilonA = "0"
    }
    If($B0 -gt $B1){
        $GammaB = "0"
        $EpsilonB = "1"
    }
    Else{
        $GammaB = "1"
        $EpsilonB = "0"
    }
    If($C0 -gt $C1){
        $GammaC = "0"
        $EpsilonC = "1"
    }
    Else{
        $GammaC = "1"
        $EpsilonC = "0"
    }
    If($D0 -gt $D1){
        $GammaD = "0"
        $EpsilonD = "1"
    }
    Else{
        $GammaD = "1"
        $EpsilonD = "0"
    }
    If($E0 -gt $E1){
        $GammaE = "0"
        $EpsilonE = "1"
    }
    Else{
        $GammaE = "1"
        $EpsilonE = "0"
    }
    If($F0 -gt $F1){
        $GammaF = "0"
        $EpsilonF = "1"
    }
    Else{
        $GammaF = "1"
        $EpsilonF = "0"
    }
    If($G0 -gt $G1){
        $GammaG = "0"
        $EpsilonG = "1"
    }
    Else{
        $GammaG = "1"
        $EpsilonG = "0"
    }
    If($H0 -gt $H1){
        $GammaH = "0"
        $EpsilonH = "1"
    }
    Else{
        $GammaH = "1"
        $EpsilonH = "0"
    }
    If($I0 -gt $I1){
        $GammaI = "0"
        $EpsilonI = "1"
    }
    Else{
        $GammaI = "1"
        $EpsilonI = "0"
    }
    If($J0 -gt $J1){
        $GammaJ = "0"
        $EpsilonJ = "1"
    }
    Else{
        $GammaJ = "1"
        $EpsilonJ = "0"
    }
    If($K0 -gt $K1){
        $GammaK = "0"
        $EpsilonK = "1"
    }
    Else{
        $GammaK = "1"
        $EpsilonK = "0"
    }
    If($L0 -gt $L1){
        $GammaL = "0"
        $EpsilonL = "1"
    }
    Else{
        $GammaL = "1"
        $EpsilonL = "0"
    }
$GammaBinary = $GammaA + $GammaB + $GammaC + $GammaD + $GammaE + $GammaF + $GammaG + $GammaH + $GammaI + $GammaJ + $GammaK + $GammaL
$EpsilonBinary = $EpsilonA + $EpsilonB + $EpsilonC + $EpsilonD + $EpsilonE + $EpsilonF + $EpsilonG + $EpsilonH + $EpsilonI + $EpsilonJ + $EpsilonK + $EpsilonL

Write-Host "Gamma in binary is $GammaBinary"
Write-Host "Epsilon in binary is $EpsilonBinary"
$Gamma = ([int]$GammaL * 1) + ([int]$GammaK * 2) + ([int]$GammaJ * 4) + ([int]$GammaI * 8) + ([int]$GammaH * 16) + ([int]$GammaG * 32) + ([int]$GammaF * 64) + ([int]$GammaE * 128) + ([int]$GammaD * 256) + ([int]$GammaC * 512) + ([int]$GammaB * 1024) + ([int]$GammaA * 2048)
$Epsilon = ([int]$EpsilonL * 1) + ([int]$EpsilonK * 2) + ([int]$EpsilonJ * 4) + ([int]$EpsilonI * 8) + ([int]$EpsilonH * 16) + ([int]$EpsilonG * 32) + ([int]$EpsilonF * 64) + ([int]$EpsilonE * 128) + ([int]$EpsilonD * 256) + ([int]$EpsilonC * 512) + ([int]$EpsilonB * 1024) + ([int]$EpsilonA * 2048)

$Answer = $Gamma * $Epsilon

$Answer