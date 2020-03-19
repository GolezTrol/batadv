:start
if exist %basedir%\%curroom%\getnot\%input%.tlk\opt11 goto opt11
goto meet
:opt11
goto notime
:meet
echo %FY%You: Hi, I'm Lost. Who are you?
echo %FG%Priest: I'm a priest.
echo          I do not have time to speak with you now. I'm busy.
echo ja>%basedir%\%curroom%\getnot\%input%.tlk\opt11
goto end
:notime
echo %FY%You: Er.. nevermind
echo %FG%Priest: Okay.
goto end
:end
