#apt 19 modified attack

#self elevate script
if (-Not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] 'Administrator')) {
 if ([int](Get-CimInstance -Class Win32_OperatingSystem | Select-Object -ExpandProperty BuildNumber) -ge 6000) {
  $CommandLine = "-File `"" + $MyInvocation.MyCommand.Path + "`" " + $MyInvocation.UnboundArguments
  Start-Process -FilePath PowerShell.exe -Verb Runas -ArgumentList $CommandLine
  Exit
 }
}

#T1071.001 N/A


#T1140
cmd.exe /c del %temp%\T1140_calc.txt >nul 2>&1
cmd.exe /c del %temp%\T1140_calc_decoded.exe >nul 2>&1

#T1132.001 N/A


#T1204.002
Remove-Item C:\Users\Public\art.jse -ErrorAction Ignore

#T1027 N/A


#T1033 N/A


#T1113
Remove-Item $env:TEMP\T1113.png -ErrorAction Ignore

#T1016 N/A


#T1033 N/A


#T1082 N/A


#T1117 N/A


