@echo off
setlocal enabledelayedexpansion
set filename=%*

:: Create temporary file
set tempfile=%temp%\tempmanfile.txt

:: Output the command to temp file
:: This is to stop windows error messages
where "%filename%" > "%tempfile%" 2>&1

if %errorlevel%==0 (
    for /f "delims=" %%i in ('type "%tempfile%"') do (
        echo.
        cat "%%i.help"
        echo.
    )
)

:: Delete temp file
del %tempfile% 2>NUL

if not defined found (
    echo The command "%*" was not found.
)

endlocal