@echo off
setlocal enabledelayedexpansion

for /f %%i in ('cd') do set currentdir=%%i

echo. 
echo Directory: %currentdir%

endlocal