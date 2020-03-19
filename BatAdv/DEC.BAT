@echo off
set input=%1
if exist %input%.0 goto ok
if exist %input%.1 goto ok
if exist %input%.2 goto ok
if exist %input%.3 goto ok
echo Je hebt geen %input%
goto end
:ok
if not exist %input%.0 goto dec0
del %input%.0
goto end
:dec0
if not exist %input%.1 goto dec1
echo bit set>%input%.0
del %input%.1
goto end
:dec1
if not exist %input%.2 goto dec2
del %input%.2
echo bit set>%input%.0
echo bit set>%input%.1
goto end
:dec2
if not exist %input%.3 goto decerror
del %input%.3
echo bit set>%input%.0
echo bit set>%input%.1
echo bit set>%input%.2
goto end
:incerror
echo Fatale Error!! Underflow!
:end
set input=


















