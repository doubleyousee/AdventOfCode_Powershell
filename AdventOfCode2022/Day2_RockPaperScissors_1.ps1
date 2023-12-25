$Rounds = Get-Content -Path AdventOfCode2022\Day2_RockPaperScissors.input

$Oppo_Rock = "A"
$Oppo_Paper = "B"
$Oppo_Scissors = "C"

$My_Rock = "X"
$My_Paper = "Y"
$My_Scissors = "Z"

$TotalScore = 0

ForEach ($Clash in $Rounds) {
    $RoundScore = 0
    $Oppo = $Clash.Split(" ")[0]
    $Me = $Clash.Split(" ")[1]
    If ($Me -eq $My_Rock) {
        $RoundScore += 1
        If ($Oppo -eq $Oppo_Rock) {
            $RoundScore += 3
        }
        If ($Oppo -eq $Oppo_Paper) {
            $RoundScore += 0
        }
        If ($Oppo -eq $Oppo_Scissors) {
            $RoundScore += 6
        }
    }
    
    If ($Me -eq $My_Paper) { 
        $RoundScore += 2
        If ($Oppo -eq $Oppo_Rock) {
            $RoundScore += 6
        }
        If ($Oppo -eq $Oppo_Paper) {
            $RoundScore += 3
        }
        If ($Oppo -eq $Oppo_Scissors) {
            $RoundScore += 0
        }
    }
    
    If ($Me -eq $My_Scissors) { 
        $RoundScore += 3
        If ($Oppo -eq $Oppo_Rock) {
            $RoundScore += 0
        }
        If ($Oppo -eq $Oppo_Paper) {
            $RoundScore += 6
        }
        If ($Oppo -eq $Oppo_Scissors) {
            $RoundScore += 3
        }
    }
    
    $TotalScore += $RoundScore

}

$TotalScore