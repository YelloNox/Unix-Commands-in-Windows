@echo off

:: Finds if file allready exists
setlocal enabledelayedexpansion

set foundFile=

if "%1"=="" (
    echo Usage: %0 [file]
    exit /b
)

for /r %%i in (*) do (
    if "%%~nxi"=="%*" (
        set foundFile=%%i
    )
)

if defined foundFile (
    echo 1
) else (
    echo 0
)

endlocal
exit /b