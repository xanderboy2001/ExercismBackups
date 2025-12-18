Enum Triangle {
    EQUILATERAL
    ISOSCELES
    SCALENE
}
Function Get-Triangle() {
    <#
    .SYNOPSIS
    Determine if a triangle is equilateral, isosceles, or scalene.

    .DESCRIPTION
    Given 3 sides of a triangle, return the type of that triangle if it is a valid triangle.
    
    .PARAMETER Sides
    The lengths of a triangle's sides.

    .EXAMPLE
    Get-Triangle -Sides @(1,2,3)
    Return: [Triangle]::SCALENE
    #>
    
    [CmdletBinding()]
    Param (
        [double[]]$Sides
    )

    foreach ($side in $Sides) {
        if ($side -le 0) {
            Throw "All side lengths must be positive."
        }
    }
    if (-not( ($Sides[0] + $Sides[1] -ge $Sides[2]) -and ($Sides[1] + $Sides[2] -ge $Sides[0]) -and ($Sides[0] + $Sides[2] -ge $Sides[1]))) {
        Throw "Side lengths violate triangle inequality."
    }

    if (($Sides[0] -eq $Sides[1]) -and ($Sides[1] -eq $Sides[2])) {
        return [Triangle]::EQUILATERAL
    }
    
    if (($Sides[0] -eq $Sides[1]) -or ($Sides[1] -eq $Sides[2]) -or ($Sides[0] -eq $Sides[2])) {
        return [Triangle]::ISOSCELES
    }

    if (($Sides[0] -ne $Sides[1]) -and ($Sides[1] -ne $Sides[2]) -and ($Sides[0] -ne $Sides[2])) {
        return [Triangle]::SCALENE
    }
}
