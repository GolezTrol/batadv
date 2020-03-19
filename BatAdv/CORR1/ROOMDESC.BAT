if exist %basedir%\flags\1sttime.001 goto beenhere
echo Skip intro story in main hall>%basedir%\flags\1sttime.001
echo You awaken and look around. You're in the main hall of a big mansion.
echo You wonder how you got here and what time it is.
echo Actually you don't know what year it is and what your name is either.
echo.
echo From here exits are in all directions.
echo You see daylight coming from the south. Stairs are going up.
goto end
:beenhere
echo You're in the main hall.
echo From here exits are in all directions.
echo You see daylight coming from the south. Stairs are going up.
:end
