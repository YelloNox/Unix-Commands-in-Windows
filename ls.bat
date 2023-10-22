@echo off
setlocal

set "opt_a=0"
set "opt_q=0"
set "targetDir=."

:: Check each argument for options and possible target directory
for %%i in (%*) do (
    if "%%i"=="-h" (
        uciw-help ls
    )
    if "%%i"=="-a" set "opt_a=1"
    if "%%i"=="-q" set "opt_q=1"
    if not "%%i"=="-a" if not "%%i"=="-q" if not "%%i"=="-h" set "targetDir=%%i"
)

:: Execute commands based on options and target directory
if "%opt_q%"=="1" (
    if "%opt_a%"=="1" (
        dir /a "%targetDir%"
    ) else (
        dir "%targetDir%"
    )
) else if "%opt_a%"=="1" (
    powershell "Get-ChildItem -Force '%targetDir%' | Format-Table -Property Mode, LastWriteTime, Length, Name -AutoSize"
) else (
    powershell "Get-ChildItem '%targetDir%' | Format-Table -Property Mode, LastWriteTime, Length, Name -AutoSize"
)

endlocal