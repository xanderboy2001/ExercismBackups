Function Invoke-Encode() {
    <#
    .SYNOPSIS
    Encode a string using the Atbash cipher.

    .DESCRIPTION
    The Atbash cipher is a simple substitution cipher that relies on transposing all the letters in the 
    alphabet such that the resulting alphabet is backwards. 
    The first letter is replaced with the last letter, the second with the second-last, and so on.

    .PARAMETER Phrase
    The string to encode.

    .EXAMPLE
    Invoke-Encode -Phrase "yes"
    #>
    [CmdletBinding()]
    Param(
        [string]$Phrase
    )
    
    $base = 97
    ($Phrase -replace ' ', '').ToLower().ToCharArray() | ForEach-Object {
        if ([char]::IsLetter($_)) {
            $encoded_int = [int][char]'z' - [int]$_
            $encoded_char = [char]($encoded_int + $base)
            $result += $encoded_char
        } elseif ($_ -match "^[\d\.]+$") {
            $result += $_
        }
    }
    return ($result -replace '\.', '' -replace '.{5}', '$& ').Trim()
}

Function Invoke-Decode(){
    <#
    .SYNOPSIS
    Decode a string using the Atbash cipher.

    .DESCRIPTION
    The Atbash cipher is a simple substitution cipher that relies on transposing all the letters in the 
    alphabet such that the resulting alphabet is backwards. 
    The first letter is replaced with the last letter, the second with the second-last, and so on.

    .PARAMETER Phrase
    The string to decode.

    .EXAMPLE
    Invoke-Decode -Phrase "yes"
    #>
    [CmdletBinding()]
    Param(
        [string]$Phrase
    )

    $base = 97
    $result = ''
    ($Phrase -replace ' ', '').ToLower().ToCharArray() | ForEach-Object {
        if ([char]::IsLetter($_)) {
            $decoded_int = [int][char]'z' - [int]$_
            $decoded_char = [char]($decoded_int + $base)
            $result += $decoded_char
        } elseif ($_ -match "^[\d\.]+$") {
            $result += $_
        }
    }
    return $result
}
