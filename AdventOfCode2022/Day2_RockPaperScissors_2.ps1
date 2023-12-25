$Rounds = Get-Content -Path AdventOfCode2022\Day2_RockPaperScissors.input

$Oppo_Rock = "A"
$Oppo_Paper = "B"
$Oppo_Scissors = "C"

$My_Loss = "X"
$My_Draw = "Y"
$My_Win = "Z"

$TotalScore = 0

ForEach ($Clash in $Rounds) {
    $RoundScore = 0
    $Oppo = $Clash.Split(" ")[0]
    $Me = $Clash.Split(" ")[1]
    If ($Oppo -eq $Oppo_Rock) {
        If ($Me -eq $My_Win) {
            $RoundScore += 8
        }
        If ($Me -eq $My_Draw) {
            $RoundScore += 4
        }
        If ($Me -eq $My_Loss) {
            $RoundScore += 3
        }
    }
    
    If ($Oppo -eq $Oppo_Paper) {
        If ($Me -eq $My_Win) {
            $RoundScore += 9
        }
        If ($Me -eq $My_Draw) {
            $RoundScore += 5
        }
        If ($Me -eq $My_Loss) {
            $RoundScore += 1
        }
    }
    
    If ($Oppo -eq $Oppo_Scissors) {
        If ($Me -eq $My_Win) {
            $RoundScore += 7
        }
        If ($Me -eq $My_Draw) {
            $RoundScore += 6
        }
        If ($Me -eq $My_Loss) {
            $RoundScore += 2
        }
    }
    
    $TotalScore += $RoundScore

}

$TotalScore