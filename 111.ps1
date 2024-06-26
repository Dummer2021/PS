cls
import-module -name ActiveDirectory
$dt = Get-date -Format "dd MMMM yyyy в HH:MM"
$id = New-timeSpan -days 89
$logLine = "Дата блокировка учетных записей: " + $dt
[int]$count = 0 
$lltm = (get-date)-$id
$users = get-aduser -filter {(lastlogontimestamp -lt $lltm) -and (Enabled -eq "True")} -searchbase "OU=strj,dc=**,DC=***,dc=***"| fl name,DistinguishedName  |out-string
$count = (get-aduser -filter {(lastlogontimestamp -lt $lltm) -and (Enabled -eq "True")} -searchbase "OU=strj,dc=**,DC=***,dc=***").count
$count
$ura = "Работает"
if ($count -ne 0) 
    {
    Out-File -FilePath c:\scripts\UserAutoDisable.txt -inputobject $logline -Append -encoding unicode #Запись в файл
    Out-File -FilePath c:\scripts\UserAutoDisable.txt -inputobject $users -Append -encoding unicode #Запись в файл
    Out-File -FilePath c:\scripts\UserAutoDisable.txt -inputobject "__________________________________________________________________" -Append -encoding unicode
    
    $server = "1*.1*.1*.1*"
    $from = "wsus_sys@**.***.***"
    $to = "ao@***.**"
    $subject = "Результат выполнения атоматической блокировки неактивных учетных записей"
    $body = "Сегодня " + $dt + " были заблокированы следующие учетные записи:
    
    "  + $users +  
    "
    
    Во вложении находится история блокировок учетных записей."
    $listFile = get-childitem "c:\scripts\111"
    $SmtpClient = New-Object system.net.mail.SmtpClient
    $Message = New-object system.net.mail.MailMessage
    $SmtpClient.Host = $server
    $Message.from = $from
    $Message.to.add($to)
    $Message.subject = $subject
    $Message.body = $body
    foreach ($file in $ListFile) {$attachment = new-object system.net.mail.attachment($file.fullname)
            $message.attachments.add($attachment)}
    $SmtpClient.send($message)
    $message.dispose()
    } else {$ura}