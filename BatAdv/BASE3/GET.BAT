if %look%PLUK==PLUK goto noget
if %input%PLUK==NOSEPLUK goto opendoor
goto end
:opendoor
echo As you pull the nose of the statue you notice a massive stone door 
echo opening with the sound of a massive stone door that opens.
set curroom=secret1
goto endget
:noget
echo. It's too dark to find it.
:endget
set dummy=skip
goto end
set reinit=true
:end
