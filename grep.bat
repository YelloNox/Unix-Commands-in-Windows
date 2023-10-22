@echo off
setlocal enabledelayedexpansion

set input=%~2

if "%1"=="-h" (
    uciw-help grep
    goto end
)

if "%input%"=="" (
    echo Usage: %0 [pattern] [file or folder]
    exit /b
)

set "pattern=%1"
set "target=%input%"

if exist "%target%\*" (
    :: Check if the second argument is a folder
    for %%F in ("%target%\*%pattern%*") do (
        set "file=%%~nxF"
        echo !file!
    )
) else (
    :: If the second argument is not a folder, display an error
    echo The specified target is not a directory.
    exit /b
)

:end
endlocal
