$ol = New-Object -comObject Outlook.Application

$mail = $ol.CreateItem(0)
$mail.Subject = "<subject>"
$mail.Body = "<body>"
$mail.save()

$inspector = $mail.GetInspector
$inspector.Display()