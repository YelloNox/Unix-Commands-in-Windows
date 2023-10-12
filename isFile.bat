@echo off

:: Finds if file allready exists
setlocal enabledelayedexpansion

set foundFile=

for /r %%i in (*) do (
        if "%%~nxi"=="%*" (
        set foundFile=%%i
        goto :found
    )
)

:found
if defined foundFile (
    echo 1
) else (
    echo 0
)

endlocal