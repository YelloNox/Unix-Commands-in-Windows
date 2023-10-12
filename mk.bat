@echo off
setlocal enabledelayedexpansion

set isFile=%*
set file=%*
set created=Created

for /f "delims=" %%a in ('isFile %isFile%') do (
    set isFile=%%a
)
:loop
if %isFile% == 1 (
    set /p userInput=File "%*" Allready Exists. Overwrite? y/n: 
    if /i "!userInput!"=="y" (
        set created=Overwritten
        goto userYes
    ) else (
        echo File not created.
        goto endloop
    )
) else (
    :userYes
    echo. > "%*"
    echo %created%: "%*"
    set created=Created
)

:endloop
endlocal