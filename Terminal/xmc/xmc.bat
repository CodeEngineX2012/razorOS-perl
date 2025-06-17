@echo off
color 0A
title Perl XMC1

setlocal enabledelayedexpansion

set "env_logged_in="

:startup
cls
echo Blue Dragon RazorOS Distro - Perl XMC1
echo (c) Blue Dragon Cooperation. All rights reserved

:loop
set /p user_input=[perl@xmc ~]$ 

if "%user_input%"=="help" (
    echo Available commands:
    echo   help            : Show this help menu
    echo   xmc-build       : Show OS version info
    echo   ip xmc          : Show local IP address
    echo   ls              : List current directory
    echo   clear           : Clear the screen
    echo   exit            : Exit XMC1
    echo   xmc.boot        : Run apps in XMC1
    echo   xmc.boot -h     : Show apps that can be run in XMC1
    echo   nw_xmc_env      : Create a new XMC environment
    echo   log xmc_env     : Login to an XMC environment
    echo   logout -env     : Logout from the current environment
    echo   xmc -env        : Show the logged-in environment
)

if "%user_input%"=="xmc-build" (
    echo XMC1 V1.1 - Build 22.05.2025
    echo Site: blue-dragon.42web.io
    echo XMC1 Code : X-5-X-5-X-3-X-1-X
)

if "%user_input%"=="ip xmc" (
    echo Fetching local IP address...
    for /f "tokens=2 delims=:" %%A in ('ipconfig ^| findstr /i "IPv4"') do echo IP Address:%%A
)

if "%user_input%"=="clear" (
    cls
)

if "%user_input%"=="ls" (
    dir /b
)

if "%user_input%"=="exit" (
    exit
)

if "%user_input%"=="xmc.boot chatbot_xmc" (
    call chatbots/chatbot_xmc.bat
)

if "%user_input%"=="xmc.boot -h" (
    echo xmc.boot chatbot_xmc
    echo xmc.boot env_xmc2[Pre-Release Status : Unstable Build]
    echo xmc.boot env_def
    echo xmc.boot xmc_gg
)

if "%user_input%"=="nw_xmc_env" (
    set /p env_name=Enter Env Name: 
    call :getHiddenInput env_pass "Enter Password: "
    if not exist nw_xmc_env (
        mkdir nw_xmc_env
    )
    echo EnvName=%env_name%> nw_xmc_env\%env_name%s_env.txt
    echo Password=%env_pass%>> nw_xmc_env\%env_name%s_env.txt
    echo Environment %env_name% created successfully.
)

if "%user_input%"=="log xmc_env" (
    set /p login_env=Enter Env Name to Login: 
    call :getHiddenInput login_pass "Enter Password: "
    if exist nw_xmc_env\%login_env%s_env.txt (
        for /f "tokens=2 delims==" %%A in ('findstr /i "EnvName=" nw_xmc_env\%login_env%s_env.txt') do set file_env=%%A
        for /f "tokens=2 delims==" %%A in ('findstr /i "Password=" nw_xmc_env\%login_env%s_env.txt') do set file_pass=%%A
        if /i "!file_env!"=="%login_env%" if "!file_pass!"=="%login_pass%" (
            set "env_logged_in=%login_env%"
            echo Logged in successfully to %env_logged_in%.
        ) else (
            echo Wrong credentials.
        )
    ) else (
        echo Environment does not exist. Please create an XMC env.
    )
)

if "%user_input%"=="logout -env" (
    if defined env_logged_in (
        echo Logged out of environment: %env_logged_in%
        set "env_logged_in="
    ) else (
        echo No environment is currently logged in.
    )
)

if "%user_input%"=="xmc -env" (
    if defined env_logged_in (
        echo Currently logged in environment: %env_logged_in%
    ) else (
        echo No environment is currently logged in.
    )
)

goto loop

:: ---- Hidden password input subroutine ----
:getHiddenInput
setlocal
set "line="
<nul set /p="%~2"
:loop
set "key="
for /f "delims=" %%A in ('"prompt $H & for %%B in (1) do rem"') do (
    set "key=%%A"
)
set /p "char=" <nul
for /f "delims=" %%C in ('xcopy /w /L "%~f0" "%~f0" 2^>nul') do if not defined key set "key=%%C"
set "key=!key:~0,1!"
if "!key!"=="" goto :done
set "line=!line!!key!"
<nul set /p=*
goto loop
:done
endlocal & set "%~1=%line%"
goto :eof