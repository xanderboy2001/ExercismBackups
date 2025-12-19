Function Invoke-Etl() {
    <#
    .SYNOPSIS
    Transforms a set of legacy Lexiconia data stored as letters per score to a set of data stored score per letter.

    .DESCRIPTION
    Take a hash table and take the values as keys and the keys as values.

    .PARAMETER Legacy
    The legacy data to transform.

    .EXAMPLE
    Invoke-Etl -Legacy @{1 = @("A")}
    #>
    [CmdletBinding()]
    Param(
        [object]$Legacy
    )

    $new_data = @{}

    $Legacy.GetEnumerator() | Foreach-Object {
        foreach ($letter in $_.Value) {
            $new_data.Add($letter.toLower(), $_.Key)
        }
    }
    return $new_data
}
