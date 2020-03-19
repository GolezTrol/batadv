if exist %basedir%\invent\torch goto UCanC
if exist %basedir%\%curroom%\getnot\torch goto UCanC
if exist %basedir%\%curroom%\torch goto UCanC
echo You're in the basement. It's too dark to see a thing.
if exist %basedir%\%curroom%\mouse echo You feel a small mouse running between your feet.
goto end
:UCanC
echo You can look around now your torch enlightens the room.
if exist %basedir%\%curroom%\mouse echo You can see a few mouse-holes and a mouse which is running around.
if not exist %basedir%\%curroom%\mouse echo Maybe you shouldn't have taken the mouse away from its home.
if not exist %basedir%\%curroom%\tie goto NoTie
echo A statue with a long nose and a tie is standing in the corner.
goto end
:NoTie
echo A statue with a long nose is standing in the corner.
:end
