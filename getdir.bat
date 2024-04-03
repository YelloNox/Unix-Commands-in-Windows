@echo off
setlocal enabledelayedexpansion

for /f %%i in ('cd') do set currentdir=%%i

echo Directory: %currentdir%

endlocal