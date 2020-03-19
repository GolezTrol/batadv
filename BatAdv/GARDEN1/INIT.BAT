if %south%PLUK==Garden1PLUK goto exitmans
:continit
if %south%PLUK==Garden1PLUK echo You open the door with your key and carefully lock it behind you.
set north=Entrance
set south=
set east=Garden2
set west=Gate3b
set up=
set down=
set in=Entrance
goto endinit
:exitmans
if exist %basedir%\invent\key goto continit
echo You cannot open the door without a key
set curroom=Entrance
set reinit=true
:endinit
