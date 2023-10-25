@echo off
setlocal enabledelayedexpansion

:: Input
set "s-term=%~1"
set "s-item=%~2"

:: isVars
set "isFolder="

:: Options
set "opt_c=0"

if "%s-term%"=="-h" (
    uciw-help grep
    goto end
)
:: Check each argument for possible options
for %%i in (%*) do (
    if "%%i"=="-h" (
        uciw-help grep
        goto end
    )
    if "%%i"=="-c" set "opt_c=1"
)
set /a "totalOptions=0+opt_c" 

:: If no input, print help item
if "%s-item%"=="" (
    echo Usage: %0 [pattern] [file or folder]
    exit /b
)

:: If option(s) found, update vars 
if "%opt_c%"=="1" (
    set "s-term=%2"
    set "s-item=%3" 
)
set "target=%s-item%"

if exist "%target%\*" (
    set "isFolder=1"
) 

:: Use option "-c"
set counter=0
if !opt_c!==1 (
    echo.
    if !isFolder!==1 (
        for %%F in ("%target%\*%s-term%*") do (
            set /a counter=counter+1
        )
    ) else (
        for /f "delims=" %%a in ('type "%target%"') do (
            set "line=%%a"
            echo.!line! | findstr /C:"%s-term%" >nul
            if not errorlevel 1 (
                set /a counter=counter+1
            )
        )
    ) 
) 
if !totalOptions! GTR 0 (
    echo Grep found: %counter%
    goto end
)

if !isFolder!==1 (
    :: Check if the second argument is a folder
    for %%F in ("%target%\*%s-term%*") do (
        set "file=%%~nxF"
        echo !file!
    )
) else (
    :: If the second argument is not a folder, try displaying reading it as a file
    for /f "delims=" %%a in ('type "%target%"') do (
        set "line=%%a"
        echo.!line! | findstr /C:"%s-term%" >nul
        if not errorlevel 1 (
            echo.!line!
        )
    )
    goto end
)

:end
endlocal
