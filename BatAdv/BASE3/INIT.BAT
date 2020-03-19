set north=
set south=Base2
set east=Base4
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
rem set skipdesc=true
rem if not exist %basedir%\%curroom%\roomdes2.bat goto error1
rem call %basedir%\%curroom%\roomdes2.bat
goto cont1
:error1
set abort=file
:cont1

