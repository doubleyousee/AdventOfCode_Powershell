$PuzzleData = Get-Content -Path "$PSScriptRoot\PuzzleInput_Day2.txt"
$Sum = 0
ForEach($Game in $PuzzleData){
    $GameData = [PSCustomObject]@{
        GameNumber = [int]$Game.Split(":")[0].Split(" ")[1]
        Results = @($Game.Split(":")[1].Split(";"))
        MaxRed = 0
        MaxGreen = 0
        MaxBlue = 0
        Product = 0
    }
    ForEach($Result in $GameData.Results){
        $Cubes = $Result.Split(",")
        ForEach($Count in $Cubes){
            If([int]$Count.Trim().Split(" ")[0] -gt $GameData.MaxRed -and [string]$Count.Trim().Split(" ")[1] -eq 'red'){
                $GameData.MaxRed = [int]$Count.Trim().Split(" ")[0]
            }
            ElseIf([int]$Count.Trim().Split(" ")[0] -gt $GameData.MaxGreen -and [string]$Count.Trim().Split(" ")[1] -eq 'green'){
                $GameData.MaxGreen = [int]$Count.Trim().Split(" ")[0]
            }
            ElseIf([int]$Count.Trim().Split(" ")[0] -gt $GameData.MaxBlue -and [string]$Count.Trim().Split(" ")[1] -eq 'blue'){
                $GameData.MaxBlue = [int]$Count.Trim().Split(" ")[0]
            }
        }
    }
    $GameData.Product = $GameData.MaxRed * $GameData.MaxGreen * $GameData.MaxBlue
    $Sum = $Sum + $GameData.Product
}
$Sum