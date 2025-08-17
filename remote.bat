@echo off

title GitPlease! Remote manager

:inp
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
if "%inp%" EQU "1" goto exit
if "%inp%" EQU "2" goto rmadd
if "%inp%" EQU "3" goto rmremove
if "%inp%" EQU "4" goto rmpush
if "%inp%" EQU "5" goto rmpull
echo Invalid input
pause
goto inp

:rmadd
set /p name=Enter origin name: 
set /p adr=Enter origin adress: 
git remote add %name% %adr%
pause
goto inp

:rmremove
set /p name=Enter origin name: 
git remote remove %name%
pause
goto inp

:rmpush
set /p name=Enter origin name: 
git branch
set /p inp=Enter branch to push: 
git push -u %name% %inp%
pause
goto inp

:rmpull
set /p name=Enter origin name: 
git branch
set /p inp=Enter branch to pull: 
git pull %name% %inp%
pause
goto inp

:exit
cls
exit