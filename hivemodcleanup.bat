
::HIVE RANSOMEWARE MODIFIED Cleanup
cls

::T1562.001 replacement 

::T1489
cmd.exe /c sc start LanmanWorkstation
cmd.exe /c sc start SamSs
cmd.exe /c sc start SDRSVC
cmd.exe /c sc start SstpSVc
cmd.exe /c sc start UI0Detect
cmd.exe /c sc start Vmicvss
cmd.exe /c sc start Vmss
cmd.exe /c sc start VSS
cmd.exe /c sc start Wbengine
cmd.exe /c sc start Unistoresvc

::T1047 substitute

::T1490 subsitute

::T1070.001

::T1490 (needs cmdadmin)
bcdedit.exe /set {default} bootstatuspolicy DisplayAllFailures >nul 2>&1
bcdedit.exe /set {default} recoveryenabled yes >nul 2>&1

::Ransomeware substitute 
