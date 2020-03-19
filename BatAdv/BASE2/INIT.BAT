set north=Base3
set south=Base1
set east=
set west=
set up=
set down=
set in=
set close=
set look=
if exist %basedir%\invent\torch goto ok2look
if exist %basedir%\%curroom%\torch goto ok2look
goto cont1
:ok2look
set look=ok
goto cont1

rem if not exist %basedir%\invent\torch goto cont1
rem set skipdesc=true
rem if not exist %basedir%\%curroom%\roomdes2.bat goto error1
rem call %basedir%\%curroom%\roomdes2.bat
rem goto cont1
rem :error1
rem set abort=file
:cont1
