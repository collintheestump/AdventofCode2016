<#
Determine the direction you are facing
Move in that direction
#>

function ChangeDirection{
  [cmdletBinding()]
  param(
    [Parameter(Mandatory=$true)]
    [string]
    $Turn,

    [Parameter(Mandatory=$true)]
    [string]
    $Current
  )

  if ($Turn -eq 'R'){
    switch ($Current){
        'N'{$NewDirection = 'E'}
        'E'{$NewDirection = 'S'}
        'S'{$NewDirection = 'W'}
        'W'{$NewDirection = 'N'}
    }
  }

  elseif ($Turn -eq 'L'){
    switch ($Current){
      'N'{$NewDirection = 'W'}
      'E'{$NewDirection = 'N'}
      'S'{$NewDirection = 'E'}
      'W'{$NewDirection = 'S'}
    }
  }
  $NewDirection
}# Function ChangeDirection

$Directions = $(Get-Content $PSScriptRoot/Day1_Directions.txt) -split ','
$CurrentDirection = 'N'
$XAxis = 0
$YAxis = 0
# Ensure all directions are interptered
$Counter = 0

# Trimming to remove whitespace
foreach ($direction in $($Directions.trim())){
  $counter ++
  $Turn = $direction.substring(0,1)
  # Only set starting point to include numbers with more than one digit
  $Distance = $direction.substring(1)

  $CurrentDirection = ChangeDirection -Turn $Turn -Current $CurrentDirection
  switch ($CurrentDirection){
    'N'{$YAxis += $Distance}
    'E'{$XAxis += $Distance}
    'S'{$YAxis -= $Distance}
    'W'{$XAxis -= $Distance}
  }
  Write-host "$Direction`: moving $currentdirection by $distance Blocks"
  write-host "`t($XAxis,$YAxis)"
}
"`nNumber of directions given: $Counter"
"HQ Corrdinates: ($XAxis, $YAxis)"

$Total = [math]::abs($XAxis) + [math]::abs($YAxis)
"Rectalinear Distance: $Total`n"
