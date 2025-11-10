function Invoke-SecretHandshake() {
    <#
    .SYNOPSIS
    Convert a number between 1 and 31 to a sequence of actions in the secret handshake.

    .DESCRIPTION
    The sequence of actions is chosen by looking at the rightmost five digits of the number once it's been converted to binary.
    Start at the right-most digit and move left.

    The actions for each number place are:
    00001 = wink
    00010 = double blink
    00100 = close your eyes
    01000 = jump
    10000 = Reverse the order of the operations in the secret handshake.

    .PARAMETER Number
    The value to be converted into a sequence of actions.

    .EXAMPLE
    Invoke-SecretHandshake -Number 2
    Returns: @("double blink")
     #>
    [CmdletBinding()]
    param(
        [int]$Number
    )

    function DecToBinary {
        param(
            [int]$Number
        )

        $dividend = $Number


        $binary = ""
    
        $binary = ""
        do {
            $remainder = $Number % 2
            $binary = $remainder.ToString() + $binary
            $Number = [math]::Floor($Number / 2)
        } while ($Number -gt 0)

        return $binary

    }

    $action_map = @{
        00001 = 'wink'
        00010 = 'double blink'
        00100 = 'close your eyes'
        01000 = 'jump'
        10000 = 'Reverse the order of operations in the secret handshake'
    }

    $Binary = DecToBinary -Number $Number

    return $action_map[$Binary]

}