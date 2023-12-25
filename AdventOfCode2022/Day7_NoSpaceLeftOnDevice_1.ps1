[System.Collections.ArrayList]$Folders = @()
$CurrentFolder = ""

foreach ($Line in  Get-Content -Path $PSScriptRoot\Day7_NoSpaceLeftOnDevice.input) {
    if ($Line.StartsWith("$ cd")) {
        $CommandArray = $Line.Split(" ")

        switch ($CommandArray[2]) {
            "/" { $CurrentFolder = $CommandArray[2] }
            ".." { $CurrentFolder = $CurrentFolder.Substring(0, $CurrentFolder.TrimEnd("/").LastIndexOf("/")) + "/" }
            default { $CurrentFolder += $CommandArray[2] + "/" }
        }       
    }
    elseif (-not $Line.StartsWith("$")) {
        $FileOrDir = $Line.Trim().Split(" ")

        if ($FileOrDir[0] -match "^\d+$") {
            $FileSize = [int]$FileOrDir[0]

            $TempFolder = ""
            $PathSplit = $CurrentFolder.Split("/")
            foreach ($Sub in $PathSplit[0..($PathSplit.Count - 2)]) {
                $TempFolder += $Sub + "/"
                $x = $Folders | Where-Object { $_.Folder -eq $TempFolder }

                $TempSize = $FileSize

                # Remove existing entry / update
                if ($null -ne $x) {
                    $TempSize += $x.Size
                    [void]$Folders.Remove($x)                    
                }

                [void]$Folders.Add([pscustomobject]@{
                        Folder = $TempFolder
                        Size   = $TempSize
                    })
            }           
        }
    }
}

($Folders | Where-Object { $_.Size -le 100000 } | Measure-Object -Sum Size).Sum