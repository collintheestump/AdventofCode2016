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
[array]$PlacesVisted = @("(0,0)")

# Trimming to remove whitespace
foreach ($direction in $($Directions.trim())){
  $counter ++
  $Turn = $direction.substring(0,1)
  # Only set starting point to include numbers with more than one digit
  $Distance = $direction.substring(1)

  $CurrentDirection = ChangeDirection -Turn $Turn -Current $CurrentDirection
  switch ($CurrentDirection){
    'N'{
      for($i = 1; $i -le $distance ; $i ++){
        $YAxis ++
        $Coor = "($XAxis,$Yaxis)"
        if($PlacesVisted -notcontains $Coor){
          $PlacesVisted += $Coor
        }
        elseif($PlacesVisted -contains $Coor){
          write-host "$Coor already visted"
          break
        }
      }# For
    }# N
    'E'{
      for($i = 1; $i -le $distance ; $i ++){
        $XAxis ++
        $Coor = "($XAxis,$Yaxis)"
        if($PlacesVisted -notcontains $Coor){
          $PlacesVisted += $Coor
        }
        elseif($PlacesVisted -contains $Coor){
          write-host "$Coor already visted"
          break
        }
      }# For
    }# E
    'S'{
      for($i = 1; $i -le $distance ; $i ++){
        $YAxis --
        $Coor = "($XAxis,$Yaxis)"
        if($PlacesVisted -notcontains $Coor){
          $PlacesVisted += $Coor
        }
        elseif($PlacesVisted -contains $Coor){
          write-host "$Coor already visted"
          break
        }
      }# For
    }# S
    'W'{
      for($i = 1; $i -le $distance ; $i ++){
        $XAxis --
        $Coor = "($XAxis,$Yaxis)"
        if($PlacesVisted -notcontains $Coor){
          $PlacesVisted += $Coor
        }
        elseif($PlacesVisted -contains $Coor){
          write-host "$Coor already visted"
          break
        }
      } # For
    }# W
  }
}
