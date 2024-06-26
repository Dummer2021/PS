cls
import-module -name ActiveDirectory
$dt = Get-date -Format "dd MMMM yyyy в HH:MM"
$id = New-timeSpan -days 89
$lltm = (get-date)-$id 
get-aduser -filter {(lastlogontimestamp -lt $lltm) -and (Enabled -eq "True")} -searchbase "OU=**,dc=**,DC=***,dc=***" | Move-ADObject -TargetPath "OU=blocked_users,dc=**,DC=***,dc=***"
get-aduser -filter * -searchbase "OU=blocked_users,dc=**,DC=***,dc=***" | Disable-ADAccount 