chcp 65001
title Terminal
@echo off
setlocal enabledelayedexpansion

:: Colors source
:: https://gist.github.com/wh0th3h3llam1/e65bc1eab967a22952e1ced5129bfcac


:: Define menu items
set "menuItems[0]=Bash"
set "menuItems[1]=CMD"
set "menuItems[2]=Exit"

:: Initialize variables
set "selectedOption=0"
set "key="

:displayMenu
cls
echo.
echo [97m👉 CHOOSE TERMINAL[0m
echo.
echo ------------------
for /l %%i in (0,1,2) do ( 
  if %%i equ !selectedOption! (
    echo ➡️  [94m!menuItems[%%i]![0m
  ) else (
    echo    !menuItems[%%i]!
  )
)
echo ------------------
echo.
echo.
echo.
echo.
echo.
echo.


:: Capture user input
call C:\Users\fabri\terminalOptions\GetKey.exe
set "key=!errorlevel!"

:: Handle user input
if "%key%"=="-72" (
  set /a "selectedOption-=1"
  if !selectedOption! lss 0 set "selectedOption=2"
  goto displayMenu
) else if "%key%"=="-80" (
  set /a "selectedOption+=1"
  if !selectedOption! gtr 2 set "selectedOption=0"
  goto displayMenu
) else if "%key%"=="13" (
  goto runSelectedCommand
) else (
  goto displayMenu
)

:runSelectedCommand
cls
if %selectedOption% equ 0 (
  @echo off
  echo Loading...
  bash
) else if %selectedOption% equ 1 (
  @echo off
  title Command Prompt
  cmd
)

echo.
exit
