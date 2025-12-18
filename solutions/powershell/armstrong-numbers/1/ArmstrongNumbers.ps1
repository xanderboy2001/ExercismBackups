Function Invoke-ArmstrongNumbers() {
    <#
    .SYNOPSIS
    Determine if a number is an Armstrong number.

    .DESCRIPTION
    An Armstrong number is a number that is the sum of its own digits each raised to the power of the number of digits.

    .PARAMETER Number
    The number to check.

    .EXAMPLE
    Invoke-ArmstrongNumbers -Number 12
    #>
    [CmdletBinding()]
    Param(
        [Int64]$Number
    )

    $num_digits = $Number.toString().Length
    
    $sum = 0
    foreach ($char in $Number.toString().toCharArray()) {
        $digit = [int]$char.ToString()
        $sum += [int][Math]::Pow($digit, $num_digits)
    }

    if ($sum -eq $Number){
        return $true
    }
    else {
        return $false
    }
}
