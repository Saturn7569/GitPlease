@echo off

chcp 65001 > nul

title GitPlease!

:inp
cls

echo.
echo.
echo		 ██████╗ ██╗████████╗    ██████╗ ██╗     ███████╗ █████╗ ███████╗███████╗██╗
echo		██╔════╝ ██║╚══██╔══╝    ██╔══██╗██║     ██╔════╝██╔══██╗██╔════╝██╔════╝██║
echo		██║  ███╗██║   ██║       ██████╔╝██║     █████╗  ███████║███████╗█████╗  ██║
echo		██║   ██║██║   ██║       ██╔═══╝ ██║     ██╔══╝  ██╔══██║╚════██║██╔══╝  ╚═╝
echo		╚██████╔╝██║   ██║       ██║     ███████╗███████╗██║  ██║███████║███████╗██╗
echo		 ╚═════╝ ╚═╝   ╚═╝       ╚═╝     ╚══════╝╚══════╝╚═╝  ╚═╝╚══════╝╚══════╝╚═╝
echo.
echo.

echo    1.  Exit
echo    2.  Print Status
echo    3.  Initialize repository
echo    4.  Stage all files
echo    5.  Commit
echo    6.  Branch
echo    7.  Remote
echo.

rem call :logo
set /p inp=Please select an option: 
if "%inp%" EQU "1" goto exit
if "%inp%" EQU "2" goto fnstatus
if "%inp%" EQU "3" goto fninit
if "%inp%" EQU "4" goto fnaddall
if "%inp%" EQU "5" goto fncommit
if "%inp%" EQU "6" goto fnbranch
if "%inp%" EQU "7" goto fnremote
echo invalid input
pause
goto inp

:fnstatus
cls
git status
pause
goto inp

:fninit
git init
pause
goto inp

:fnaddall
git add .
echo Staged all files
pause
goto inp

:fncommit
set /p inp=Enter commit message: 
git commit -m "%inp%"
pause
goto inp

:fnbranch
start %~dp0branch.bat
goto inp

:fnremote
start %~dp0remote.bat
goto inp

:exit
cls
exit
