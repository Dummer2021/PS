$data = import-csv c:\temp\users.txt
Import-Module activedirectory

foreach ($line in $data)
{

    $name = $line.name
 
 $user = Get-ADUser -filter {Name -eq $name}

 if ($user -ne $null)
    {
      $user | Disable-ADAccount
      Write-Host "Attempting to disable user $name : Success" -ForegroundColor green
    }
 else
    {
      Write-Host "Can't find user $name in the catalog" -ForegroundColor red
    }   
}