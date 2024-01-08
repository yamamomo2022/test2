cd Desktop

function PI { [Math]::PI } # Returns the value of PI
function E { [Math]::E } # Returns the value of Euler's number, e
function Abs([double]$x) { [Math]::Abs($x) } # Returns the absolute value of a number
function Acos([double]$x) { [Math]::Acos($x) } # Returns the arccosine of a number in radians
function Asin([double]$x) { [Math]::Asin($x) } # Returns the arcsine of a number in radians
function Atan([double]$x) { [Math]::Atan($x) } # Returns the arctangent of a number in radians
function Cos([double]$x) { [Math]::Cos($x) } # Returns the cosine of a number (angle in radians)
function Sin([double]$x) { [Math]::Sin($x) } # Returns the sine of a number (angle in radians)
function Tan([double]$x) { [Math]::Tan($x) } # Returns the tangent of a number (angle in radians)
function Sqrt([double]$x) { [Math]::Sqrt($x) } # Returns the square root of a number
function Log([double]$x) { [Math]::Log($x) } # Returns the natural logarithm of a number
function Exp([double]$x) { [Math]::Exp($x) } # Returns e raised to the power of a number
function log([double]$x) { [Math]::log($x) }
function log10([double]$x) { [Math]::log10($x) }

#function Round($x, $y) { [Math]::Round($x, $y, [MidpointRounding]::AwayFromZero) }


Set-PSReadLineOption -Colors @{
    Command            = "Magenta"
    Number             = "DarkGray"
    Member             = "DarkGray"
    Operator           = "DarkGray"
    Type               = "DarkGray"
    Variable           = "DarkGreen"
    Parameter          = "DarkGreen"
    ContinuationPrompt = "DarkGray"
    Default            = "DarkGray"
}

function el() {explorer .}
