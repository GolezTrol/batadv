echo [6n
choice /c:A /t:A,1
if errorlevel 2 goto nope
echo ansi is geladen
goto eind
:nope
echo ansi is NIET geladen
:eind
