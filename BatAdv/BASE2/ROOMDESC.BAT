if exist %basedir%\invent\torch goto light
if exist %basedir%\%curroom%\torch goto light
echo The basement continues. It's dark so you have to find your way by
echo searching the walls which are moisty.
if exist %basedir%\flags\tap.001 goto tapopen1
echo You hear a dripping noise.
goto end
:tapopen1
echo You can hear water streaming.
goto end
:light
echo The basement continues. It's quite dark, but you can see some things
echo in the faint light of the torch.
if exist %basedir%\flags\tap.001 goto tapopen2
echo You can see a dripping tap.
goto end
:tapopen2
echo You can see water streaming from the tap.
goto end
:end

