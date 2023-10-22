@echo off
setlocal

if "%1"=="" (
    echo Usage: %0 [command]
    exit /b
)

set output=
for /f "delims=" %%i in ('isCommand %1') do (set "output=%%i")

if %output%==0 (
    echo.
    echo The command "%*" was not found 
    echo OR is NOT a part of UCIW.
    exit /b
)

set "command=%1"
set "manfile=%~dp0%command%.bat.man"

if not exist "%manfile%" (
    echo No .man file for "%command%"
    exit /b
)


type "%manfile%"
echo.

endlocal
exit /b