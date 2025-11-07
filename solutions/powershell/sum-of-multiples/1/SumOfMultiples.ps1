function Get-SumOfMultiples {
    <#
    .SYNOPSIS
    Given a number, find the sum of all the unique multiples of particular numbers up to
    but not including that number.

    .DESCRIPTION
    If we list all the natural numbers below 20 that are multiples of 3 or 5,
    we get 3, 5, 6, 9, 10, 12, 15, and 18.

    .PARAMETER Multiples
    An array of the factors

    .PARAMETER Limit
    The value BELOW which we test for

    .EXAMPLE
    Get-SumOfMultiples -Multiples @(3, 5) -Limit 10

    Returns 23
    #>
    [CmdletBinding()]
    param(
        [int[]]$Multiples,
        [int]$Limit
    )

    if ($Multiples.Count -eq 0) {
        return 0
    }
    elseif ($Multiples.Count -eq 1) {
        $Multiples += 0
    }

    $Multiples_Set = @()
    for ($i = 0; $i -lt $Limit; $i++) {
        for ($j = 0; $j -lt $Multiples.Count; $j++) {
            if ($Multiples[$j] -eq 0) {
                $Multiples_Set += 0
            }
            elseif ($i % $Multiples[$j] -eq 0) {
                $Multiples_Set += $i
            }
        }
    }
    $Multiples_Set = $Multiples_Set | Select-Object -Unique

    $sum = 0
    foreach ($num in $Multiples_Set) {
        $sum += $num
    }
    return $sum
}
