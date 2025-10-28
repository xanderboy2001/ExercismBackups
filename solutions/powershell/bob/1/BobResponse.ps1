Function Get-BobResponse() {
    <#
    .SYNOPSIS
    Bob is a lackadaisical teenager. In conversation, his responses are very limited.
    
    .DESCRIPTION
    Bob is a lackadaisical teenager. In conversation, his responses are very limited.

    Bob answers 'Sure.' if you ask him a question.

    He answers 'Whoa, chill out!' if you yell at him.

    He answers 'Calm down, I know what I'm doing!' if you yell a question at him.

    He says 'Fine. Be that way!' if you address him without actually saying
    anything.

    He answers 'Whatever.' to anything else.
    
    .PARAMETER HeyBob
    The sentence you say to Bob.
    
    .EXAMPLE
    Get-BobResponse -HeyBob "Hi Bob"
    #>
    [CmdletBinding()]
    Param(
        [string]$HeyBob
    )

    $HeyBobTrimmed = $HeyBob.Trim()

    $isQuestion = $HeyBobTrimmed -match '\?$'
    $isYelling = $HeyBobTrimmed -match '[A-Z]' -and $HeyBobTrimmed -ceq $($HeyBobTrimmed.ToUpper())
    $isSilent = $HeyBobTrimmed -eq ''

    if ($isSilent){
        return "Fine. Be that way!"
    } elseif ($isYelling -and $isQuestion) {
        return "Calm down, I know what I'm doing!"
    } elseif ($isQuestion) {
        return "Sure."
    } elseif ($isYelling) {
        return "Whoa, chill out!"
    } else {
        return "Whatever."
    }
}
