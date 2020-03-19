echo You're walking on a garden path in front of the mansion.
if exist %basedir%\flags\gardener.001 goto gard001
echo You can hear the birds singing in the trees. Since it seems that no one
echo lives here, you are wondering who keeps this garden so nice.
goto cont001
:gard001
echo You can hear the birds singing in the trees.
echo The gardener is doing a nice job taking care of this garden.
:cont001

