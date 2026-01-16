Function Invoke-RotationalCipher() {
    <#
    .SYNOPSIS
    Rotate a string by a given number of places.

    .DESCRIPTION
    Create an implementation of the rotational cipher, also sometimes called the Caesar cipher.
    
    .PARAMETER Text
    The text to rotate    

    .PARAMETER Shift
    The number of places to shift the text

    .EXAMPLE
    Invoke-RotationalCipher -Text "A" -Shift 1
    #>
    [CmdletBinding()]
    Param(
        [string]$Text, 
        [int]$Shift
    )

    $result = ''
    $Text.ToCharArray() | ForEach-Object {
        if ([char]::IsLetter($_)) {
            if ([char]::IsUpper($_)) {
                $base = 65
            } else {
                $base = 97
            }
            $normalized = [int]$_ - $base
            $rotated = ($normalized + $Shift) % 26
            $result += [char]($rotated + $base)
        } else {
            $result += $_
        }
    }
    
    return $result
}
