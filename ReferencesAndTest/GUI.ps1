
####HOW TO DO A SIMPLE GUI####
Add-type -AssemblyName System.Windows.Forms
Add-type -AssemblyName System.Drawing

#This keeps you from having to type so much everytime you 
#create a new form or label
$FormObject = [System.Windows.Forms.Form]
$LabelObject = [System.Windows.Forms.Label]


#This creates the actual form
$HelloWorldForm = New-Object $FormObject

#This set the size of your window 
$HelloWorldForm.ClientSize = '500,300'

#This is how you place text on the form window (like the title)
$HelloWorldForm.Text = 'Hello World Window'

#Set the background color
$HelloWorldForm.BackColor = "Blue"

#Makes the Labels on the Form 
$labelTitle = New-Object $LabelObject
$labelTitle.Text = "This is a Label"
$labelTitle.AutoSize = $true

#This Styles the font
$labelTitle.Font ='Verdana, 24, style=Bold'

#Gives the text a location on the window
$labelTitle.Location = New-Object System.Drawing.Point(20,20)

#Actually places the label on the window you made
$HelloWorldForm.Controls.AddRange(@($labelTitle))

#This actually displays the form
$HelloWorldForm.ShowDialog()

#This cleans up the form 
$HelloWorldForm.Dispose()

#More References Here
#https://docs.microsoft.com/en-us/powershell/scripting/samples/creating-a-custom-input-box?view=powershell-7.2



############    WINDOW 2    ############
############    THIS DOES A INPUT TEXT  ########


$form = New-Object System.Windows.Forms.Form
$form.Text = 'Data Entry Form'
$form.Size = New-Object System.Drawing.Size(300,200)
$form.StartPosition = 'CenterScreen'

$okButton = New-Object System.Windows.Forms.Button
$okButton.Location = New-Object System.Drawing.Point(75,120)
$okButton.Size = New-Object System.Drawing.Size(75,23)
$okButton.Text = 'OK'
$okButton.DialogResult = [System.Windows.Forms.DialogResult]::OK
$form.AcceptButton = $okButton
$form.Controls.Add($okButton)

$cancelButton = New-Object System.Windows.Forms.Button
$cancelButton.Location = New-Object System.Drawing.Point(150,120)
$cancelButton.Size = New-Object System.Drawing.Size(75,23)
$cancelButton.Text = 'Cancel'
$cancelButton.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
$form.CancelButton = $cancelButton
$form.Controls.Add($cancelButton)

$label = New-Object System.Windows.Forms.Label
$label.Location = New-Object System.Drawing.Point(10,20)
$label.Size = New-Object System.Drawing.Size(280,20)
$label.Text = 'Please enter the information in the space below:'
$form.Controls.Add($label)

$textBox = New-Object System.Windows.Forms.TextBox
$textBox.Location = New-Object System.Drawing.Point(10,40)
$textBox.Size = New-Object System.Drawing.Size(260,20)
$form.Controls.Add($textBox)

$form.Topmost = $true

$form.Add_Shown({$textBox.Select()})
$result = $form.ShowDialog()

if ($result -eq [System.Windows.Forms.DialogResult]::OK)
{
    $x = $textBox.Text
    $x
}