@echo off
setlocal enabledelayedexpansion

set "manfile=%~dp0%0-p1.bat.man"
type "%manfile%"

echo.
echo.

for /f "delims=" %%i in ('where %0') do set "commandPath=%%~dpi"
echo COMMANDS
for /f "delims=" %%a in ('grep .bat "%commandPath%"') do (
    set "line=%%a"
    if "!line:~-3!"=="bat" (
        setlocal enabledelayedexpansion
        echo        !line:~0,-4!
        endlocal
    )

)
echo.

set "manfile=%~dp0%0-p2.bat.man"
type "%manfile%"
echo.

endlocal
