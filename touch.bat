@echo off
setlocal enabledelayedexpansion

set fileCount=0
set currentFile=
set isFile=

:: Could watch The Room faster than it took to fix the "( was unexpected at this time." ERRRRRRORR
:: DONT USE "goto" EITHER; BREAKS SHIT
for %%i in (%*) do (
    for /f "delims=" %%a in ('isFile %%i') do (
        set isFile=%%a
    )
    if !isFile! == 1 (
        set /p userInput=File "%%i" already exists. Overwrite? y/n: 
        if /i !userInput! == y (
            set /a fileCount+=1
            @echo. > "%%i"
            echo Overwritten: %%i
        ) else (
            echo File not created.
        )
    ) else (
        set /a fileCount+=1
        @echo. > "%%i"
        echo Created: %%i
    )
)

echo.
echo Number of files: %fileCount%

endlocal
