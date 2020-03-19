echo This is the mansion's front door. It's locked. You'll need a key to open it.
if exist %basedir%\flags\ghost.001
goto ghost001
echo You're wondering if someone lives here, since you can't hear any noises.
goto end
:ghost001
echo It's very quiet here. You can only hear a few birds singing outside.
:end
