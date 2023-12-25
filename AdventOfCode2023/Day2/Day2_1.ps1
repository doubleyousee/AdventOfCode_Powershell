#12 Red, 13 Green, 14 blue
$PuzzleData = Get-Content -Path "C:\Users\willc\OneDrive\Repos\Powershell\AdventOfCode2023\Day2\PuzzleInput_Day2.txt"
$Sum = 0
ForEach($Game in $PuzzleData){
    $GameData = [PSCustomObject]@{
        GameNumber = [int]$Game.Split(":")[0].Split(" ")[1]
        Results = @($Game.Split(":")[1].Split(";"))
        Possible = $True
    }
    ForEach($Result in $GameData.Results){
        $Cubes = $Result.Split(",")
        ForEach($Count in $Cubes){
            If([int]$Count.Trim().Split(" ")[0] -gt 12 -and [string]$Count.Trim().Split(" ")[1] -eq 'red'){
                $GameData.Possible = $False
            }
            ElseIf([int]$Count.Trim().Split(" ")[0] -gt 13 -and [string]$Count.Trim().Split(" ")[1] -eq 'green'){
                $GameData.Possible = $False
            }
            ElseIf([int]$Count.Trim().Split(" ")[0] -gt 14 -and [string]$Count.Trim().Split(" ")[1] -eq 'blue'){
                $GameData.Possible = $False
            }
        }
    }
    If($GameData.Possible -eq $True){
        $GameData.GameNumber
        $Sum = $Sum + $GameData.GameNumber
    }
}
$Sum