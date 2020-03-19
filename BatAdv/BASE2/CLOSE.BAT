if exist %basedir%\flags\tap.001 goto closetap
goto end
:closetap
if not %look%PLUK==PLUK goto ok2close
echo You can't find it.
set dummy=skip
goto end
:ok2close
set dummy=skip
del %basedir%\flags\tap.001
if exist %basedir%\flags\tap.001 goto error1
echo You close the tap.
goto end
:error1
echo You can't close the tap due to an error.
echo %basedir%\flags\tap.001 is probably read-only.
goto end
:end
