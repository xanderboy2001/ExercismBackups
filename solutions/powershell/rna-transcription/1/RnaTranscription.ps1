Function Invoke-RnaTranscription() {
    <#
    .SYNOPSIS
    Transcribe a DNA strand into RNA.

    .DESCRIPTION
    Given a DNA strand, return its RNA complement (per RNA transcription).

    .PARAMETER Strand
    The DNA strand to transcribe.

    .EXAMPLE
    Invoke-RnaTranscription -Strand "A"
    #>
    [CmdletBinding()]
    Param(
        [string]$Strand
    )
    
    $dna_rna_map = @{
    'G' = 'C'
    'C' = 'G'
    'T' = 'A'
    'A' = 'U'
    }

    $result = ''
    
    foreach ($letter in $Strand -split '') {
        $result += $dna_rna_map[$letter]
    }

    return $result
}
