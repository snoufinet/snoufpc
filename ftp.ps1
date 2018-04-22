# Generate a random password
# Usage: random-password <length>
Function random-password ($length = 8)
{
    $punc = 46..46
    $digits = 48..57
    $letters = 65..90 + 97..122

    # Thanks to
    # https://blogs.technet.com/b/heyscriptingguy/archive/2012/01/07/use-pow
    $password = get-random -count $length `
        -input ($punc + $digits + $letters) |
            % -begin { $aa = $null } `
            -process {$aa += [char]$_} `
            -end {$aa}

    return $password
}

$a = Import-Csv -path C:\Users\snouf\Desktop\test.csv -Delimiter ";"
$b = $a | Group-Object -Property login -NoElement
$results = @()
ForEach ($pwet in $b.name) {
$pass = random-password
echo "$pwet a pour mot de passe $pass"
$details = @{
    Login = $pwet
    pass = $pass
    }
$results += New-Object PSObject -Property $details
}
#$results | export-csv -Path  C:\Users\snouf\Desktop\test2.csv -NoTypeInformation -Delimiter ";"


foreach ($line in $a) {
    $login = $line.login
    $path = $line.path
    $right = $line.right
    foreach ($result in $results) {
        $logintemp = $result.Login
        $passtemp = $result.pass
        if ($login -eq $logintemp) {
            $pass2 = $passtemp
            }
        }

    write-host $line.login = $line.path = $pass2
}