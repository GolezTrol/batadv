@echo off
set input=%1
if not exist %input%.0 goto ok
if not exist %input%.1 goto ok
if not exist %input%.2 goto ok
if not exist %input%.3 goto ok
echo Je hebt al genoeg %input%
goto end
:ok
if exist %input%.0 goto dec0
echo setbit>%input%.0
goto end
:dec0
del %input%.0
if exist %input%.1 goto dec1
echo bit set>%input%.1
goto end
:dec1
del %input%.1
if exist %input%.2 goto dec2
echo bit set>%input%.2
goto end
:dec2
del %input%.2
if exist %input%.3 goto decerror
echo bit set>%input%.3
goto end
:incerror
echo Fatale Error!! Overflow!
:end
set input=


















