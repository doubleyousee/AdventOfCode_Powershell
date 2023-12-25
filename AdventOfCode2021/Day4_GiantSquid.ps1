$Source = Get-Content -Path .\AdventOfCode2021\Day4_GiantSquid.input
$CallList = $Source[0].Split(",")

$Boards = $Source[2..($Source.Length-1)]
$Boards = $Boards -Join "`n"
$Boards = $Boards -Split "\r?\n\r?\n"
$BoardCount = 0
$FullRowReport = @()
ForEach($Board in $Boards){
    $BoardCount++
    $NumberList = (($Board).Split(" ")).Split("`n") | Where-Object {$_ -ne ""}
    #Assign Positions to each Number
    $i = 0
    $BoardReport = @()
    ForEach($Letter in ("a","b","c","d","e")){
        ForEach($Num in (1..5)){
            $data = @([pscustomobject]@{Board="$BoardCount";Coord="$Letter$Num";Number=$NumberList[$i]})
            $BoardReport += $data
            $i ++
        }
    }
    $RowA = $BoardReport | Where-Object Coord -match "a" | Select-Object -ExpandProperty Number
    $RowB = $BoardReport | Where-Object Coord -match "b" | Select-Object -ExpandProperty Number
    $RowC = $BoardReport | Where-Object Coord -match "c" | Select-Object -ExpandProperty Number
    $RowD = $BoardReport | Where-Object Coord -match "d" | Select-Object -ExpandProperty Number
    $RowE = $BoardReport | Where-Object Coord -match "e" | Select-Object -ExpandProperty Number
    $Row1 = $BoardReport | Where-Object Coord -match "1" | Select-Object -ExpandProperty Number
    $Row2 = $BoardReport | Where-Object Coord -match "2" | Select-Object -ExpandProperty Number
    $Row3 = $BoardReport | Where-Object Coord -match "3" | Select-Object -ExpandProperty Number
    $Row4 = $BoardReport | Where-Object Coord -match "4" | Select-Object -ExpandProperty Number
    $Row5 = $BoardReport | Where-Object Coord -match "5" | Select-Object -ExpandProperty Number
    $BoardRowData = @([pscustomobject]@{Board=$BoardCount;Row0=$Row1;Row1=$Row2;Row2=$Row3;Row3=$Row4;Row4=$Row5;Row5=$RowA;Row6=$RowB;Row7=$RowC;Row8=$RowD;Row9=$RowE})
    $FullRowReport += $BoardRowData
}
$BoardWinReport = @()
$DataCheck = 0
ForEach($BoardNum in (1..100)){
    $Winner = 100
    $data = @()
    $CallNum = 0
    ForEach($Call in $CallList){
        $CallNum ++
        ForEach($i in (0..9)){
            $RowNum = "Row$i"
            If($Call -in ($FullRowReport | Where-Object Board -eq $BoardNum).$RowNum){
                $Regex = "^$Call$"
                ($FullRowReport | Where-Object Board -eq $BoardNum).$RowNum = ($FullRowReport | Where-Object Board -eq $BoardNum).$RowNum | Where-Object {$_ -notmatch $Regex}
                If ((($FullRowReport | Where-Object Board -eq $BoardNum).$RowNum | Measure-Object).Count -eq 0){
                    $Test = $CallNum
                    IF($Test -lt $Winner){
                        $Winner = $Test
                        Write-Host $BoardNum had a winning number on $RowNum : $CallNum ($Call)
                        $data = [PSCustomObject]@{
                            Board = $BoardNum;
                            WinningRow = $RowNum;
                            WinningCall = $Call;
                            WinningCallNum = $CallNum;
                            CalledNumbers = $CallList[0..($CallNum-1)]
                        }
                        
                    }
                }
            }
        }
    }
    If ($data.WinningCallNum -gt $DataCheck){
        $DataCheck = $data.WinningCallNum
        $BoardWinReport = $data
    }
}
$BoardWinReport
$Board = $Boards[($BoardWinReport.Board - 1)]
$NumberList = (($Board).Split(" ")).Split("`n") | Where-Object {$_ -ne ""}
$NumberList = $NumberList | Where-Object {$_ -notin $BoardWinReport.CalledNumbers}
$WinningSum = ($NumberList | Measure-Object -Sum).Sum
$Answer = $WinningSum * $BoardWinReport.WinningCall
$Answer