Function Invoke-BinarySearch() {
    <#
    .SYNOPSIS
    Perform a binary search on a sorted array.

    .DESCRIPTION
    Take an array of integers and a search value and return the index of the value in the array.

    .PARAMETER Array
    The array to search.

    .PARAMETER Value
    The value to search for.

    .EXAMPLE
    Invoke-BinarySearch -Array @(1, 2, 3, 4, 5) -Value 3
    #>
    [CmdletBinding()]
    Param(
        [Int64[]]$Array,
        [Int64]$Value
    )

    $len = $Array.Count - 1

    $left = 0
    $right = $len

    while ($left -le $right) {
        $index = [int](($left + $right)/2)
        $middle = $Array[$index]
        if ($middle -eq $Value) {
            return $index
        } elseif ($middle -gt $Value) {
            $right = $index - 1
        } elseif ($middle -lt $Value) {
            $left = $index + 1
            # Write-Host "Middle is lt value"
        }
    }
    Throw "error: value not in array"
}
