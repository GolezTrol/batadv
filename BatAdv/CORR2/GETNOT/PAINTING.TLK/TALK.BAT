if exist %basedir%\%curroom%\%input%.tlk\phase1 del %basedir%\%curroom%\%input%.tlk\phase1 
if exist %basedir%\%curroom%\%input%.tlk\phase2 del %basedir%\%curroom%\%input%.tlk\phase2 
if exist %basedir%\%curroom%\%input%.tlk\phase3 del %basedir%\%curroom%\%input%.tlk\phase3 
if exist %basedir%\%curroom%\%input%.tlk\phase1 set abort=file goto end
if exist %basedir%\%curroom%\%input%.tlk\phase1 goto end
:begin
if not exist %basedir%\flags\ghost.002 goto end
set dummy=skip
if exist %basedir%\%curroom%\%input%.tlk\opt2 goto opt3
if exist %basedir%\%curroom%\%input%.tlk\opt1 goto opt2
set text1=Alakazam!
set opt1=opt11
set text2=Move!
set opt2=opt12
if exist %basedir%\flags\ghost.003 goto ok1
set text3=Abraca!
set opt3=opt14
:ok1
set text3=Open!
set opt3=opt13
:cont1
set text4=Nevermind..
set opt4=quit
set count=first
goto start

:opt2
set text1=Painting!
set opt1=opt21
if exist %basedir%\flags\ghost.003 goto ok2
set text2=Dabra!
set opt2=opt24
:ok2
set text2=Sesame!
set opt2=opt22
:cont2
set text3=Simsalabim!
set opt3=opt23
set text4=Nevermind..
set opt4=quit
set count=second
goto start

:opt3
set text1=Hocus Pocus!
set opt1=opt31
set text2=Now!
set opt2=opt32
if exist %basedir%\flags\ghost.003 goto ok3
set text3=Dip!
set opt3=opt34
:ok3
set text3=Please!
set opt3=opt33
:cont3
set text4=Nevermind..
set opt4=quit
set count=last
goto start

:start
echo Whisper the %count% part of the spell.
echo.
echo %text1%
echo %text2%
echo %text3%
choice /c:abc/n 
cls
if errorlevel 3 goto opt3
if errorlevel 2 goto opt2
if errorlevel 1 goto opt1
goto start

:opt11
echo %FY%You: Alakazam!
echo %FG%Painting: Krrr...
goto begin
:opt12
echo %FY%You: Move!
echo %FG%Painting: Rang!
goto begin
:opt13
echo %FY%You: Open!
echo %FG%Painting: Clic.
echo ja>%basedir%\%curroom%\%input%.tlk\phase1
goto begin
:opt14
echo %FY%You: Abraca!
echo %FG%Painting: Klonk.
goto begin
:opt21
echo %FY%You: Painting!
echo %FG%Painting: Ieeeeeeee  ...    p
goto begin
:opt22
echo %FY%You: Sesame!
echo %FG%Painting: Clac.
echo ja>%basedir%\%curroom%\%input%.tlk\phase2
goto begin
:opt23
echo %FY%You: Simsalabim!
echo %FG%Painting: Pruk..
goto begin
:opt24
echo %FY%You: Dabra!
echo %FG%Painting: Wheeee!!!!!! [ Alert, code 2 ] -Kggg- [ Roger ].
goto begin
:opt31
echo %FY%You: Hocus Pocus!
echo %FG%Painting: Wooosh. Deng. Ratatatatataattt   ..     ploc
echo           [Alfa Bravo - Alfa Bravo. Come In please]
echo %FY%You: Hmm... 
goto done
:opt32
echo %FY%You: Now!
echo %FG%Painting: Krrrr eng Bzzzzz Ronk                     pok
echo %FY%You: *sigh*
goto done
:opt33
echo %FY%You: Please!
echo %FG%Painting: Clok.
echo %FY%You: ...
echo ja>%basedir%\%curroom%\%input%.tlk\phase3
goto done
:opt34
echo %FY%You: Dip!
echo %FG%Painting: Dip?
echo %FY%You: Yes, Dip!
echo %FG%Painting: Ok.. 
goto done
:quit
echo %FY%You: Hmm.. I think I forgot the spell.
echo %FG%Painting: Ok, bye.
goto end
:done
if not exist %basedir%\%curroom%\%input%.tlk\phase1 goto fail
if not exist %basedir%\%curroom%\%input%.tlk\phase2 goto fail
if not exist %basedir%\%curroom%\%input%.tlk\phase3 goto fail
set curroom=%curroom%\%input%.opn
goto end
:fail
echo. You wait, but nothing happens.
:end
set count=
set text1=
set text2=
set text3=
set text4=
set opt1=
set opt2=
set opt3=
set opt4=
:final
