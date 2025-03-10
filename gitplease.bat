@echo off

chcp 65001 > nul

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
cls
echo Current branches:
echo.
git branch -v
echo.
echo    1.  Exit
echo    2.  New branch
echo    3.  Delete branch
echo    4.  Checkout branch
echo    5.  Rename current branch
echo.
set /p inp=Select an option: 
if "%inp%" EQU "1" goto inp
if "%inp%" EQU "2" goto brnew
if "%inp%" EQU "3" goto brdel
if "%inp%" EQU "4" goto brcheck
if "%inp%" EQU "5" goto brrename
echo Invalid input
pause
goto fnbranch

:brcheck
set /p inp=Enter branch name or ID: 
git checkout %inp%
rem print the branch but it is not needed
rem echo Changed branch to %inp%
pause
goto fnbranch

:brnew
set /p inp=Enter branch name: 
git branch %inp%
pause
goto fnbranch

:brdel
set /p inp=Enter branch name or ID: 
git branch -d %inp%
pause
goto fnbranch

:brrename
set /p inp=Enter new branch name: 
git branch -M %inp%
pause
goto fnbranch

:fnremote
cls
echo Current remotes:
git remote -v
echo.
echo    1.  Exit
echo    2.  Add origin
echo    3.  Remove origin
echo    4.  Push all commits to origin
echo    5.  Pull origin
echo.
set /p inp=Select an option: 
if "%inp%" EQU "1" goto inp
if "%inp%" EQU "2" goto rmadd
if "%inp%" EQU "3" goto rmremove
if "%inp%" EQU "4" goto rmpush
if "%inp%" EQU "5" goto rmpull
echo Invalid input
pause
goto fnremote

:rmadd
set /p name=Enter origin name: 
set /p adr=Enter origin adress: 
git remote add %name% %adr%
pause
goto fnremote

:rmremove
set /p name=Enter origin name: 
git remote remove %name%
pause
goto fnremote

:rmpush
set /p name=Enter origin name: 
git branch
set /p inp=Enter branch to push: 
git push -u %name% %inp%
pause
goto fnremote

:rmpull
set /p name=Enter origin name: 
git branch
set /p inp=Enter branch to pull: 
git pull %name% %inp%
pause
goto fnremote

:exit
cls
exit
