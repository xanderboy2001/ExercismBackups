function Get-ResistorLabel() {
    <#
    .SYNOPSIS
    Implement a function to get the label of a resistor with three color-coded bands.

    .DESCRIPTION
    Given an array of colors from a resistor, decode their resistance values and return a string represent the resistor's label.

    .PARAMETER Colors
    The array represents the 3 colors from left to right.

    .EXAMPLE
    Get-ResistorLabel -Colors @("red", "white", "blue")
    Return: "29 megaohms"
    #>
    [CmdletBinding()]
    param(
        [string[]]$Colors
    )

    $color_list = @('black', 'brown', 'red', 'orange', 'yellow', 'green', 'blue', 'violet', 'grey', 'white')


    # Take first two colors as digits
    $digits = "$($color_list.IndexOf($Colors[0]))$($color_list.IndexOf($Colors[1]))"
    $num = "${digits}" + "$('0'*$color_list.IndexOf($Colors[2]))"
    $num = $num -replace '^0+', ''

    if ($num -eq '') {
        $num = 0
        $unit = 'ohms'
    }
    elseif ($num % 100000000000 -eq 0) {
        $num = $num / 1000000000
        $unit = 'gigaohms'
    }
    elseif ($num % 10000000000 -eq 0) {
        $num = $num / 1000000000
        $unit = 'gigaohms'
    }
    elseif ($num % 1000000000 -eq 0) {
        $num = $num / 1000000000
        $unit = 'gigaohms'
    }
    elseif ($num % 100000000 -eq 0) {
        $num = $num / 1000000
        $unit = 'megaohms'
    }
    elseif ($num % 10000000 -eq 0) {
        $num = $num / 1000000
        $unit = 'megaohms'
    }
    elseif ($num % 1000000 -eq 0) {
        $num = $num / 1000000
        $unit = 'megaohms'
    }
    elseif ($num % 100000 -eq 0) {
        $num = $num / 1000
        $unit = 'kiloohms'
    }
    elseif ($num % 10000 -eq 0) {
        $num = $num / 1000
        $unit = 'kiloohms'
    }
    elseif ($num % 1000 -eq 0 ) {
        $num = $num / 1000
        $unit = 'kiloohms'
    }
    else {
        $unit = 'ohms'
    }

    # Combine and return
    return "${num} ${unit}"
}