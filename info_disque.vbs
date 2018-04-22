Dim shell,command
command = "powershell.exe -nologo -File c:\users\snouf\desktop\info_disques.ps1"
Set shell = CreateObject("WScript.Shell")
shell.Run command,0