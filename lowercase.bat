@echo off
setlocal enabledelayedexpansion

set inputString=%*

:: Use PowerShell to convert to lowercase
for /f %%a in ('powershell -command "[Console]::Write('%inputString%'.ToLower())"') do (
    set "outputString=%%a"
)

echo %outputString%

endlocal
