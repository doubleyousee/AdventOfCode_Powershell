$Rucksacks = Get-Content -Path AdventOfCode2022\Day3_RucksackReorganization.input

$Priorities = New-Object system.collections.hashtable
$Priorities.a = 1
$Priorities.b = 2
$Priorities.c = 3
$Priorities.d = 4
$Priorities.e = 5
$Priorities.f = 6
$Priorities.g = 7
$Priorities.h = 8
$Priorities.i = 9
$Priorities.j = 10
$Priorities.k = 11
$Priorities.l = 12
$Priorities.m = 13
$Priorities.n = 14
$Priorities.o = 15
$Priorities.p = 16
$Priorities.q = 17
$Priorities.r = 18
$Priorities.s = 19
$Priorities.t = 20
$Priorities.u = 21
$Priorities.v = 22
$Priorities.w = 23
$Priorities.x = 24
$Priorities.y = 25
$Priorities.z = 26
$Priorities.A = 27
$Priorities.B = 28
$Priorities.C = 29
$Priorities.D = 30
$Priorities.E = 31
$Priorities.F = 32
$Priorities.G = 33
$Priorities.H = 34
$Priorities.I = 35
$Priorities.J = 36
$Priorities.K = 37
$Priorities.L = 38
$Priorities.M = 39
$Priorities.N = 40
$Priorities.O = 41
$Priorities.P = 42
$Priorities.Q = 43
$Priorities.R = 44
$Priorities.S = 45
$Priorities.T = 46
$Priorities.U = 47
$Priorities.V = 48
$Priorities.W = 49
$Priorities.X = 50
$Priorities.Y = 51
$Priorities.Z = 52

$Score = 0
$i = 0
ForEach($Pack in $Rucksacks){
    $Found = $False
    $i++
    $Splitpoint = $Pack.Length / 2
    $FirstHalf = $Pack.Substring(0,$Splitpoint)
    $SecondHalf = $Pack.Substring($Splitpoint, $Splitpoint)
    ForEach($Letter in $FirstHalf.TocharArray()){
        If($SecondHalf.contains($Letter) -and $Found -eq $False){
            Write-Host -ForegroundColor Green "Found a $Letter in Pach Number $i"
            $Found = $True
            $Score += $Priorities[$Letter.ToString()]
        }
    }
}
$Score