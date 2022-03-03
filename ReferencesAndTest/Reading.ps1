
#References for reading in text files
#https://techgenix.com/read-text-file-powershell/#:~:text=When%20you%20want%20to%20read,%2Din%20Get%2DContent%20function.&text=When%20you%20execute%20this%20command,on%20where%20you%20execute%20it

$Name = @()
$Title = @()



Import-Csv C:\Hackathon\info.csv

    ForEach-Object {
        $Name += $_.Name
        $Title += $_."Title"
    }
