$PuzzleData = Get-Content -Path "$PSScriptRoot\PuzzleInput_Day12.txt" | ConvertFrom-JSON -NoEnumerate
ForEach($Line in $PuzzleData){
    $Line <#| Get-Member | Where-Object MemberType -match "NoteProperty" | Select-Object -ExpandProperty Name | ForEach-Object {
        $Line.$_ | Get-Member | Where-Object MemberType -match "NoteProperty" | Select-Object -ExpandProperty Name
    }#>
}