@echo off
if %1PLUK==PLUK goto error1
if exist %1\nul goto error2
md %1
if not exist %1\nul goto error3
copy standard\. %1
goto end
:error1
echo syntax: m Location 
echo Location is the name if the location. This must be a normal 8 letter DOS name.
goto end
:error2
echo Location %1 already exists.
goto end
:error3
echo Directory %1 cannot be made
echo Check if the name is ok.
echo Check amount of disk space.
echo Check number of locations .
:end
