if not %look%PLUK==PLUK goto UCanLook
set dummy=skip
echo It's much too dark to see something in this room.
goto end
:UCanLook
if %input%PLUK==NOSEPLUK goto looknose
goto end
:looknose
echo %RS%%FY%It's an incredible nose! It looks like a handle (%BLINK%%FR%hint hint%RS%%FY%)
set dummy=skip
goto end
:end
