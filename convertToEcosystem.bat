@echo off

:: Welcome to the Ecosystem. Here, we take all "oddities" that linux usually uses, and remove them.
:: For example, "-a" or "/a" becomes "a"
setlocal enabledelayedexpansion

set "input=%*"
set "output="

for /f "delims=" %%a in ('echo !input!') do (
    set "line=%%a"
    set "line=!line:/=!"
    set "line=!line:-=!"
    set "output=!output!!line!"
)

set "output=!output:^=%%!"

echo %output%

endlocal
