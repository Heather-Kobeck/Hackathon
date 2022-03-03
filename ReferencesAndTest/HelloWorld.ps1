#All Powershell commands are written in verb - object form
# do something to object then you can fill in properties 
# parameters

Write-Output "test output"




#In PowerShell, the vertical bar ( | ) is the pipe symbol. 
#This tells PowerShell that you want to take the output of 
#one command and pass it as the input (or pipe it) 
#to the next command.

#Get-Process -Name Chrome | Select-Member 

#Powershell handles things in objects for the
#example above the process chrome is an object and 
#Select Member allows you to see methods and properties
#associated with this object type


#Get-Process -Name Chrome | Select-Object *

#Select Object gives you the properties and 
#values of the object. This physically
#gives you the values 
#Note * just means all 

#sometimes people use alias to short the code
# an example fo this is cls get alias will show
#you the full name of the abbreviation

 Get-Alias cls


#PowerShell variables 
#these always start with a dollar sign 

#$Example = Get-Process chrome
#$Example #this will return the variable so you can check it

#Now you can also access different properties of that 

#$Example.Name

# You can also use the methods on the variables 
# $Example.Kill() 
#this closes the chrome page


# https://www.youtube.com/watch?v=f9xPJXslVWE 
# view this for arithmetic and $_ (cur object) 
#information

Get-PSDrive | Where-Object {$_.free -gt 1} |Select-Object Root, Used, Free

#This makes an array variable
$array = @('Zero','One','Two','Three')
# $array 

#To loop through the array you can use the For Each command
#or if you would like a specific index use $array[0] or 
#what ever index you would like. 


ForEach($item in $array){Write-Output $item"hi"}
Write-Output $array

#Powershell makes string concatenation easy 
#Just do what most languages have you do



#Set Location allows you to move around through the file system
Set-Location -Path C:\Users\hrkob\Desktop\TestFolder

#Get-ChildItem gets all of the indivdual items within the provided directory
Get-ChildItem

#Get-Item only gets the item specified in the file 
Get-Item .\Test1.txt

# you can also save them into variables
$saveFile = Get-Item .\Test1.txt
$saveFile

#you can also make folders or files in the needed directory 
# new-Item -ItemType Directory -Name "New Directory"

#Emergency help video lists
# https://www.youtube.com/playlist?list=PLCGGtLsUjhm2k22nFHHdupAK0hSNZVfXi

