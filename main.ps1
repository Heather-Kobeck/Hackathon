
## Imports for the GUI ##

Add-type -AssemblyName System.Windows.Forms
Add-type -AssemblyName System.Drawing

##################
##### GUI ########
##################

#This sets the GUI up to show on the window
$Writerform = New-Object System.Windows.Forms.Form
$Writerform.Text = 'Name Entry Form'
$Writerform.Size = New-Object System.Drawing.Size(300,200)
$Writerform.StartPosition = 'CenterScreen'

$okButton = New-Object System.Windows.Forms.Button
$okButton.Location = New-Object System.Drawing.Point(75,120)
$okButton.Size = New-Object System.Drawing.Size(75,23)
$okButton.Text = 'OK'
$okButton.DialogResult = [System.Windows.Forms.DialogResult]::OK
$Writerform.AcceptButton = $okButton
$Writerform.Controls.Add($okButton)

$cancelButton = New-Object System.Windows.Forms.Button
$cancelButton.Location = New-Object System.Drawing.Point(150,120)
$cancelButton.Size = New-Object System.Drawing.Size(75,23)
$cancelButton.Text = 'Cancel'
$cancelButton.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
$Writerform.CancelButton = $cancelButton
$Writerform.Controls.Add($cancelButton)


$Writerlabel = New-Object System.Windows.Forms.Label
$Writerlabel.Location = New-Object System.Drawing.Point(10,20)
$Writerlabel.Size = New-Object System.Drawing.Size(280,20)
$Writerlabel.Text = 'Please enter your full name:'
$Writerform.Controls.Add($Writerlabel)

$WritertextBox = New-Object System.Windows.Forms.TextBox
$WritertextBox.Location = New-Object System.Drawing.Point(10,40)
$WritertextBox.Size = New-Object System.Drawing.Size(260,20)
$Writerform.Controls.Add($WritertextBox)

$Writerform.Topmost = $true

$Writerform.Add_Shown({$WritertextBox.Select()})
$result = $Writerform.ShowDialog()


if ($result -eq [System.Windows.Forms.DialogResult]::OK)
{
    $WriterName = $WritertextBox.Text
    $WriterName
}

$Pathform = New-Object System.Windows.Forms.Form
$Pathform.Text = 'Path Entry Form'
$Pathform.Size = New-Object System.Drawing.Size(300,200)
$Pathform.StartPosition = 'CenterScreen'

$okButton = New-Object System.Windows.Forms.Button
$okButton.Location = New-Object System.Drawing.Point(75,120)
$okButton.Size = New-Object System.Drawing.Size(75,23)
$okButton.Text = 'OK'
$okButton.DialogResult = [System.Windows.Forms.DialogResult]::OK
$Pathform.AcceptButton = $okButton
$Pathform.Controls.Add($okButton)

$cancelButton = New-Object System.Windows.Forms.Button
$cancelButton.Location = New-Object System.Drawing.Point(150,120)
$cancelButton.Size = New-Object System.Drawing.Size(75,23)
$cancelButton.Text = 'Cancel'
$cancelButton.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
$Pathform.CancelButton = $cancelButton
$Pathform.Controls.Add($cancelButton)


$Pathlabel = New-Object System.Windows.Forms.Label
$Pathlabel.Location = New-Object System.Drawing.Point(10,20)
$Pathlabel.Size = New-Object System.Drawing.Size(280,20)
$Pathlabel.Text = 'Please enter the source csv path:'
$Pathform.Controls.Add($Pathlabel)

$PathtextBox = New-Object System.Windows.Forms.TextBox
$PathtextBox.Location = New-Object System.Drawing.Point(10,40)
$PathtextBox.Size = New-Object System.Drawing.Size(260,20)
$Pathform.Controls.Add($PathtextBox)

$Pathform.Topmost = $true

$Pathform.Add_Shown({$PathtextBox.Select()})
$result = $Pathform.ShowDialog()


if ($result -eq [System.Windows.Forms.DialogResult]::OK)
{
    $PathName = $PathtextBox.Text
    $PathName
}


$DestForm = New-Object System.Windows.Forms.Form
$DestForm.Text = 'Path Entry Form'
$DestForm.Size = New-Object System.Drawing.Size(300,200)
$DestForm.StartPosition = 'CenterScreen'

$okButton = New-Object System.Windows.Forms.Button
$okButton.Location = New-Object System.Drawing.Point(75,120)
$okButton.Size = New-Object System.Drawing.Size(75,23)
$okButton.Text = 'OK'
$okButton.DialogResult = [System.Windows.Forms.DialogResult]::OK
$DestForm.AcceptButton = $okButton
$DestForm.Controls.Add($okButton)

$cancelButton = New-Object System.Windows.Forms.Button
$cancelButton.Location = New-Object System.Drawing.Point(150,120)
$cancelButton.Size = New-Object System.Drawing.Size(75,23)
$cancelButton.Text = 'Cancel'
$cancelButton.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
$DestForm.CancelButton = $cancelButton
$DestForm.Controls.Add($cancelButton)


$DestLable = New-Object System.Windows.Forms.Label
$DestLable.Location = New-Object System.Drawing.Point(10,20)
$DestLable.Size = New-Object System.Drawing.Size(280,20)
$DestLable.Text = 'Please enter the destination path:'
$DestForm.Controls.Add($DestLable)

$Desttextbox = New-Object System.Windows.Forms.TextBox
$Desttextbox.Location = New-Object System.Drawing.Point(10,40)
$Desttextbox.Size = New-Object System.Drawing.Size(260,20)
$DestForm.Controls.Add($Desttextbox)

$DestForm.Topmost = $true

$DestForm.Add_Shown({$Desttextbox.Select()})
$result = $DestForm.ShowDialog()


if ($result -eq [System.Windows.Forms.DialogResult]::OK)
{
    $DestName = $Desttextbox.Text
    $DestName
}






## Reading in the Data csv ##


## CSV Variables ##
$Name = @()
$Title =@()
$CTNumber=@()
$Building=@()


$CSV = Import-Csv $PathName

    foreach($LINE in $CSV) {
        $Title +=$LINE.Title
        # Write-Output $LINE.Title
        $file_data = (Get-Content -path C:\Hackathon\template.txt ) -replace '<Title>', $LINE.Title

        $Name = $LINE.Name
        # Write-Output $LINE.Name
        $file_data = $file_data -replace '<Name>', $LINE.Name 

        $CTNumber += $LINE.CTNumber
        # Write-Output $LINE.CTNumber
        $file_data = $file_data -replace '<CTNumber>', $LINE.CTNumber

        $Building += $LINE.Building
        # Write-Output $LINE.Building
        $file_data = $file_data -replace '<Building>', $LINE.Building

        $file_data = $file_data -replace '<Writer>', $WriterName

        $ol = New-Object -comObject Outlook.Application
        

        $mail = $ol.CreateItem(0)
        $mailSub = $LINE.CTNumber
        $mail.Subject = "Computer Replacement $mailSub"
        $mail.Body = "$file_data"
        $mail.save()

        $inspector = $mail.GetInspector
        $inspector.Display()

       
        if (Test-Path $DestName\Emails){
            New-Item -Path $DestName\Emails\$Name.txt -ItemType File
            $file_data| out-file -append $DestName\Emails\$Name.txt
        }
        else{
            New-Item -Path $DestName\Emails -ItemType Directory
            New-Item -Path $DestName\Emails\$Name.txt -ItemType File
            $file_data| out-file -append $DestName\Emails\$Name.txt
        }
        
       
       
    }


