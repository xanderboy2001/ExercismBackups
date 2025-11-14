Function Invoke-Panagram() {
    <#
    .SYNOPSIS
    Determine if a sentence is a pangram.
    
    .DESCRIPTION
    A pangram is a sentence using every letter of the alphabet at least once.
    
    .PARAMETER Sentence
    The sentence to check
    
    .EXAMPLE
    Invoke-Panagram -Sentence "The quick brown fox jumps over the lazy dog"
    
    Returns: $true
    #>
    [CmdletBinding()]
    Param(
        [string]$Sentence
    )

    # Get list of all lowercase letters (ASCII codes 97 through 122)
    $letters = 97..122 | ForEach-Object { [char]$_ }
    
    # Normalize sentence
    $Sentence = $Sentence.ToLower()

    # Default value will be true, if we don't find a letter, it will change to false
    $isPanagram = $true

    foreach ($letter in $letters){
        if ($Sentence -notmatch $letter) {
            $isPanagram = $false
        }
    }

    return $isPanagram
}
