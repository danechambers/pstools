# inspiration https://blogs.technet.microsoft.com/heyscriptingguy/2011/11/11/use-powershell-to-easily-convert-decimal-to-binary-and-back/

param(
  [string]$mask,
  [switch]$decimal,
  [switch]$binary
)

function Decimal2Binary {
  param([string[]]$mask)

  $addr = @()
  foreach ($octet in $mask) {
    $binary = [convert]::ToString([int32]$octet,2)
    $addr += $binary.PadLeft(8,"0") 
  }
  $addr -join '.'
}

function Binary2Decimal {
  param([string[]]$mask)

  $addr = @()
  foreach ($octet in $mask) {
    $binary = [convert]::ToInt32($octet,2)
    $addr += $binary
  }
  $addr -join '.'
}

$maskArr = $mask -split '\.'

if ($decimal) {
  Decimal2Binary $maskArr
}

if ($binary) {
  Binary2Decimal $maskArr
}