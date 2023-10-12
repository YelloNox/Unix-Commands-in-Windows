@echo off
setlocal

set "foundFile="

for /r %%i in (*) do (
    set "foundFile=%%i"
    goto :found
)

:found
if defined foundFile (
    @del %*
    echo Deleted: %*
) else (
    echo Could Not Find: %cd%\%*
)


endlocal