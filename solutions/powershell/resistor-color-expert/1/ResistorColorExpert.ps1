function Get-Colors() {
    return @('black', 'brown', 'red', 'orange', 'yellow', 'green', 'blue', 'violet', 'grey', 'white')
}

function Get-ColorCode() {
    param([string]$Color)
    return [array]::IndexOf((Get-Colors), $Color)
}

# Tolerance mapping for 4- and 5-band resistors
$ToleranceMap = @{
    'brown'  = 1
    'red'    = 2
    'green'  = 0.5
    'blue'   = 0.25
    'violet' = 0.1
    'grey'   = 0.05
    'gold'   = 5
    'silver' = 10
}

function Get-ResistorLabelTriple {
    param([string[]]$Colors)

    $color_list = Get-Colors

    # First two colors are digits
    $digit1 = [array]::IndexOf($color_list, $Colors[0])
    $digit2 = [array]::IndexOf($color_list, $Colors[1])
    $digits = "$digit1$digit2"

    # Third color is multiplier
    $multiplier = [array]::IndexOf($color_list, $Colors[2])
    $num = [int]($digits + ('0' * $multiplier))

    # Determine unit
    if ($num -ge 1000000000) { $num /= 1000000000; $unit = 'gigaohms' }
    elseif ($num -ge 1000000) { $num /= 1000000; $unit = 'megaohms' }
    elseif ($num -ge 1000) { $num /= 1000; $unit = 'kiloohms' }
    else { $unit = 'ohms' }

    # Format decimal if needed
    if ($num -is [double] -and $num % 1 -ne 0) {
        $num = $num.ToString()
    }
    else {
        $num = [int]$num
    }

    return "$num $unit"
}

function Get-ResistorLabel {
    param([string[]]$Colors)

    if ($Colors.Count -eq 1) {
        return '0 ohms'
    }
    elseif ($Colors.Count -eq 4) {
        $resistance = Get-ResistorLabelTriple -Colors $Colors[0..2]
        $tolerance = $ToleranceMap[$Colors[3]]
        return "$resistance ±$tolerance%"
    }
    elseif ($Colors.Count -eq 5) {
        # First three colors are digits
        $digit1 = [array]::IndexOf((Get-Colors), $Colors[0])
        $digit2 = [array]::IndexOf((Get-Colors), $Colors[1])
        $digit3 = [array]::IndexOf((Get-Colors), $Colors[2])
        $digits = "$digit1$digit2$digit3"

        # Fourth color is multiplier
        $multiplier = [array]::IndexOf((Get-Colors), $Colors[3])
        $num = [int]($digits + ('0' * $multiplier))

        # Determine unit
        if ($num -ge 1000000000) { $num /= 1000000000; $unit = 'gigaohms' }
        elseif ($num -ge 1000000) { $num /= 1000000; $unit = 'megaohms' }
        elseif ($num -ge 1000) { $num /= 1000; $unit = 'kiloohms' }
        else { $unit = 'ohms' }

        $resistance = "$num $unit"
        $tolerance = $ToleranceMap[$Colors[4]]
        return "$resistance ±$tolerance%"
    }
}
