@echo off
title FRIDAY - Perl Distro Chatbot
color 0A
cls
echo.
echo ----------------------------------
echo   Welcome to FRIDAY an AI Chatbot
echo   Type 'exit' to end the chat
echo ----------------------------------
echo.

:friday_loop
set /p input=[Perl]$ 

if /i "%input%"=="exit" goto :eof

if /i "%input%"=="hello" (
    echo FRIDAY: Hello Perl User. Ready to assist you.
    goto friday_loop
)

if /i "%input%"=="who are you" (
    echo FRIDAY: I'm FRIDAY — your AI companion inside the Perl Distro.
    goto friday_loop
)

if /i "%input%"=="a joke" (
    echo FRIDAY: There are 10 types of people — those who understand binary and those who don't.
    goto friday_loop
)

if /i "%input%"=="help" (
    echo FRIDAY: Try commands like: hello, who are you, joke, exit
    goto friday_loop
)

echo FRIDAY: I'm not sure what you meant. Try again.
goto friday_loop