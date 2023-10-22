@echo off

where %* > nul 2>&1
if %errorlevel% equ 0 (
    echo 1
) else (
    echo 0
)

exit /b