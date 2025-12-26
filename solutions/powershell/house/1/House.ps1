Function Get-Rhyme {
    [CmdletBinding()]
    Param(
        [int]$Start,
        [int]$End
    )

    $Subjects = @(
        "the house",
        "the malt",
        "the rat",
        "the cat",
        "the dog",
        "the cow with the crumpled horn",
        "the maiden all forlorn",
        "the man all tattered and torn",
        "the priest all shaven and shorn",
        "the rooster that crowed in the morn",
        "the farmer sowing his corn",
        "the horse and the hound and the horn"
    )

    $Phrases = @{
        "the malt" = "that lay in"
        "the rat" = "that ate"
        "the cat" = "that killed"
        "the dog" = "that worried"
        "the cow with the crumpled horn" = "that tossed"
        "the maiden all forlorn" = "that milked"
        "the man all tattered and torn" = "that kissed"
        "the priest all shaven and shorn" = "that married"
        "the rooster that crowed in the morn" = "that woke"
        "the farmer sowing his corn" = "that kept"
        "the horse and the hound and the horn" = "that belonged to"
    }

    $allVerses = @()

    for ($v = $Start; $v -le $End; $v++) {
        $verseText = "This is $($Subjects[$v - 1])"

        $chain = @()
        for ($i = $v - 1; $i -gt 0; $i--) {
            $chain += "$($Phrases[$Subjects[$i]]) $($Subjects[$i - 1])"
        }

        if ($chain.Count -gt 0) {
            $verseText += " " + ($chain -join " ")
        }

        $verseText += " that Jack built."

        $allVerses += $verseText
    }

    return $allVerses -join "`n"
}

