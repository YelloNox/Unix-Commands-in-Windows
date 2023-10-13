@echo off
setlocal enabledelayedexpansion

set looping=0
set input=%1
set ecoInput=

:loop

:: Check user input for variable

if "%input%" == "" (
    getdir
    powershell "Get-ChildItem | Format-Table -Property Mode, LastWriteTime, Length, Name -AutoSize"
    goto endloop
) else if "%input%" == "a" (
    getdir
    powershell "Get-ChildItem -Force | Format-Table -Property Mode, LastWriteTime, Length, Name -AutoSize"
    goto endloop
) else if "%input%" == "q" (
    getdir
    echo.
    dir /B
    goto endloop
) else if "%input%" == "qa" (
    getdir
    echo.
    dir /a /B
    goto endloop
) else if "%input%" == "w" (
    dir
    goto endloop
) else if "%input%" == "wa" (
    dir /a
    goto endloop
) else if "%input%" == "h" (
    uciw-help ls
)

:: is variable false? Check to see if it is uppercase or out of ecosystem, then convert
if %looping% == 0 (
    :: Convert to lower case
    for /f "delims=" %%a in ('lowercase %input%') do set input=%%a
    set looping=1
    goto loop
) else if %looping% == 1 (
    :: Convert to ecosystem
    for /f "delims=" %%a in ('convertToEcosystem %input%') do set input=%%a
    set looping=2
    goto loop
) else (
    :: Nope, it was just bad input
    echo Invalid Input: %* 
    goto endloop
)

:endloop
endlocal