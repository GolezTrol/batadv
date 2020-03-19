if %look%PLUK==PLUK goto 2dark
if %input%PLUK==TAPPLUK goto tap
goto end
:2dark
echo You can't find it. It's too dark.
set dummy=skip
goto end
:tap
set dummy=skip
if exist %basedir%\flags\tap.001 goto tapopen
echo ja>%basedir%\flags\tap.001
echo You open the tap.
goto end
:tapopen
echo The tap is already opened
goto end
:end
