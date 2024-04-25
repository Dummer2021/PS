$group = Get-ADGroup ComputerSmartCardLogon
$res = Get-ADUser -Filter {(MemberOf -recursivematch $group.DistinguishedName) -and (Enabled -eq "True")} -Properties * | FT Name, Company, Enabled
$res