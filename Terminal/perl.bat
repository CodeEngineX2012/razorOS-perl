@echo off
color 0A
title Blue Dragon RazorOS Perl

:startup
cls
echo Blue Dragon RazorOS Distro - Perl
echo (c) Blue Dragon Cooperation. All rights reserved

:loop
set /p user_input=[razorOS@perl ~]$ 

if "%user_input%"=="help" (
    echo Available commands:
    echo   help     : Show this help menu
    echo   os-build : Show OS version info
    echo   ip add   : Show local IP address
    echo   ls       : List current directory
    echo   clear    : Clear the screen
    echo   whoami   : Show current user
    echo   uname    : Show system name
    echo   exit     : Exit RazorOS
    echo   perl.run : Run apps by RazorOS from Perl
)

if "%user_input%"=="os-build" (
    echo RazorOS Perl v2 - Build 22.05.2025
    echo Site: blue-dragon.42web.io
    echo Shell Code : X-6-X-6-X-0-X
)

if "%user_input%"=="ip add" (
    echo Fetching local IP address...
    for /f "tokens=2 delims=:" %%A in ('ipconfig ^| findstr /i "IPv4"') do echo IP Address:%%A
)

if "%user_input%"=="whoami" (
    echo %USERNAME%
)

if "%user_input%"=="clear" (
    cls
)

if "%user_input%"=="uname" (
    echo RazorOS Perl. By Blue Dragon
)

if "%user_input%"=="ls" (
    dir /b
)

if "%user_input%"=="exit" (
    exit
)

if "%user_input%"=="perl.run chatbot_fr" (
    call chatbots/chatbot_fr.bat
)

if "%user_input%"=="perl.run os" (
    call os_gui/main.py
)

if "%user_input%"=="perl.run xmc" (
    call xmc/xmc.bat
)

goto loop
