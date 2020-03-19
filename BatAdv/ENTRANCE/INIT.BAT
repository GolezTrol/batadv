if %north%PLUK==EntrancePLUK goto enter
:continit
if %north%PLUK==EntrancePLUK echo You open the door with the key and carefully lock it behind you.
set north=Corr1
set south=Garden1
set east=
set west=
set up=
set down=
set in=
goto end
:enter
if exist %basedir%\invent\key goto continit
echo You need a key to open the door.
set curroom=Garden1
set reinit=true
:end
