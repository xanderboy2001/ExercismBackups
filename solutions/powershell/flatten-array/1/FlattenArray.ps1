function Invoke-FlattenArray() {
    <#
    .SYNOPSIS
    Take a nested array and return a single flattened array with all values except null.

    .DESCRIPTION
    Given an array, flatten it and keep all values except null.

    .PARAMETER Array
    The nested array to be flattened.

    .EXAMPLE
    Invoke-FlattenArray -Array @(1, @(2, 3, $null, 4), @($null), 5)
    Return: @(1, 2, 3, 4, 5)
    #>
    [CmdletBinding()]
    param(
        [System.Object[]]$Array
    )
    $unpacked_array = @()
    foreach ($item in $Array) {
        if ($null -eq $item) {
            continue
        }
        elseif ($item.GetType().BaseType.Name -eq 'Array') {
            $unpacked_array += Invoke-FlattenArray -Array $item
        }
        else {
            $unpacked_array += $item
        }
    }
    return $unpacked_array
}