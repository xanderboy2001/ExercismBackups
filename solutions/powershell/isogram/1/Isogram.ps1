function Invoke-Isogram() {
    <#
    .SYNOPSIS
    Determine if a word or phrase is an isogram.
    
    .DESCRIPTION
    An isogram (also known as a "nonpattern word") is a word or phrase without a repeating letter,
    however spaces and hyphens are allowed to appear multiple times.
    
    .PARAMETER Phrase
    The phrase to check if it is an isogram.
    
    .EXAMPLE
    Invoke-Isogram -Phrase "isogram"
    
    Returns: $true
    #>
    [CmdletBinding()]
    param(
        [string]$Phrase
    )

    $chars = ($Phrase.ToLower() -replace '[\s-]', '').ToCharArray()
    $repeated_chars = $chars | Group-Object -NoElement | Where-Object -Property Count -GT 1

    return -not $repeated_chars
}
