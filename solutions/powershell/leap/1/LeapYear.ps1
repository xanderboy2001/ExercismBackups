function Test-LeapYear {
    <#
    .SYNOPSIS
    Given a year, report if it is a leap year.
    
    .DESCRIPTION
    Calculate whether the supplied year is a leap year. A leap year is determined from the following
    calculation:

    on every year that is evenly divisible by 4
    except every year that is evenly divisible by 100
    unless the year is also evenly divisible by 400
    
    .PARAMETER year
    The year to test
    
    .EXAMPLE
    Test-LeapYear -year 2018

    Returns false

    .EXAMPLE
    Test-LeapYear -year 2020

    Returns True
    #>
    param( [int]$year )

    $by4 = ($year % 4) -eq 0
    $by100 = ($year % 100) -eq 0
    $by400 = ($year % 400) -eq 0

    if (($by4 -and $by100 -and $by400) -or ($by4 -and -not $by100)) {
        return $true
    } else {
        return $false
    }
}
