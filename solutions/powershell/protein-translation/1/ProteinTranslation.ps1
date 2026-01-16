Function Invoke-ProteinTranslation() {
    <#
    .SYNOPSIS
    Translate RNA sequences into proteins.

    .DESCRIPTION
    Take an RNA sequence and convert it into condons and then into the name of the proteins in the form of a list.

    .PARAMETER Strand
    The RNA sequence to translate.

    .EXAMPLE
    Invoke-ProteinTranslation -Strand "AUG"
    #>
    [CmdletBinding()]
    Param(
        [string]$Strand
    )

    $codon2AA = @{
        "AUG"	=	"Methionine"
        "UUU"	=	"Phenylalanine"
        "UUC"	=	"Phenylalanine"
        "UUA"	=	"Leucine"
        "UUG"	=	"Leucine"
        "UCU"	=	"Serine"
        "UCC"	=	"Serine"
        "UCA"	=	"Serine"
        "UCG"	=	"Serine"
        "UAU"	=	"Tyrosine"
        "UAC"	=	"Tyrosine"
        "UGU"	=	"Cysteine"
        "UGC"	=	"Cysteine"
        "UGG"	=	"Tryptophan"
        "UAA"	=	"STOP"
        "UAG"	=	"STOP"
        "UGA"	=	"STOP"
    }

    $codons = $Strand -split "(.{3})" | Where-Object { $_ }

    $result = @()
    foreach ($codon in $codons) {
        $msg = $codon2AA[$codon]
        if (-not $msg) {
            throw "error: Invalid codon: $codon"
        }
        if ($msg -eq "STOP") {
            break
        }
        $result += $msg
    }

    return $result
}
