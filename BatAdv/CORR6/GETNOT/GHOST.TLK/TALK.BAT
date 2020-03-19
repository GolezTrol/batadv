cls
if exist %basedir%\invent\cow echo %FG%Ghost: Is that a cow in your pocket or are you just happy to see me?
:begin
echo.
echo %FW%What would you like to say to the ghost?
if exist %basedir%\%curroom%\getnot\%input%.tlk\opt12 goto o13
if exist %basedir%\%curroom%\getnot\%input%.tlk\opt1 goto o12
set text1=Hi I'm Lost, who are you?
set opt1=meet
goto o2
:o12
if exist %basedir%\invent\key goto gotakey
set text1=How can I leave this house?
set opt1=leave
goto o2
:o13
if exist %basedir%\invent\key goto gotakey
set text1=What spell must I use to open the secret behind the painting?
set opt1=spell
goto o2
:gotakey
set text1=What was your name again?
set opt1=name
goto o2
:o2
if exist %basedir%\%curroom%\getnot\%input%.tlk\opt23 goto o23
if exist %basedir%\%curroom%\getnot\%input%.tlk\opt22 goto o22
if exist %basedir%\%curroom%\getnot\%input%.tlk\opt21 goto o21
set text2=Can you tell me who owns this place?
set opt2=owner
goto o3
:o21
set text2=How did you all die?
set opt2=circumst
goto o3
:o22
set text2=Who was this man?
set opt2=man
goto o3
:o23
set text2=And that's the whole story?
set opt2=story
goto o3
:o3
if exist %basedir%\%curroom%\getnot\%input%.tlk\opt3 goto o31
set text3=Nevermind, bye.
set opt3=nevermnd
goto start
:o31
set text3=Nice talking to you, bye.
set opt3=bye
:goto start
:start
echo a) %text1%
echo b) %text2%
echo.
echo z) %text3%
choice /c:abz /n
cls
if errorlevel 3 goto %opt3%
if errorlevel 2 goto %opt2%
if errorlevel 1 goto %opt1%
goto end
:meet
echo %FY%You  : Hi, I'm Lost, who are you?
echo %FG%Ghost: I am Dead, nice meeting you.
echo        I've noticed you snubbing around, can I help you?
echo ja>%basedir%\%curroom%\getnot\%input%.tlk\opt1
echo ja>%basedir%\%curroom%\getnot\%input%.tlk\opt3
goto begin
:leave
echo %FY%You  : How can I leave this house?
echo %FG%Ghost: Go north from the main hall. 
echo        You will find the portrait of Lady Louisa von Bahnenstein to Loon Op Zand.
echo        If you whisper the right spell, you'll find a secret place behind it.
echo ja>%basedir%\%curroom%\getnot\%input%.tlk\opt3
echo ja>%basedir%\flags\ghost.002
goto begin
:spell
echo %FY%You  :What spell must I use to open the secret behind the painting?
echo %FG%Ghost:Whisper the words %BOLD%Open Sesame Please%RS%%FG% to the painting.
echo        It will open then.
echo ja>%basedir%\%curroom%\getnot\%input%.tlk\opt3
echo ja>%basedir%\flags\ghost.003
goto begin
:name 
echo %FY%You  : What was your name again?
echo %FG%Ghost: I'm not sure about my name, but I sure am Dead.
echo ja>%basedir%\%curroom%\getnot\%input%.tlk\opt3
goto begin
:owner
echo %FY%You  : Can you tell me who owns this place?
echo %FG%Ghost: This mansions was owned by Lady Louisa II von Bahnenstein to Loon
echo        Op Zand. She died in 1784 under suspicious circumstances.
echo        I was her waiter at that time. I died too, the dog died....
echo        Actually, everyone died then.
echo ja>%basedir%\%curroom%\getnot\%input%.tlk\opt21
echo ja>%basedir%\%curroom%\getnot\%input%.tlk\opt3
REM set flag to remember you have talked to the ghost
echo ja>%basedir%\flags\ghost.001
goto begin
:circumst
echo %FY%You  : How did you all die?
echo %FG%Ghost: It was a rainy day, when a man knocked at the door. He was dressed in
echo        a long dark coat. Lady louisa had always been friendly to guests,
echo        but then...  She started yelling at the man and wouldn't let him in.
echo        The man got furious and cursed her and her house. 
echo        That evening, at dinner, we all died. First Lady Louisa, then her 
echo        family and finally her staff. I was one of the last to die.
echo ja>%basedir%\%curroom%\getnot\%input%.tlk\opt22
echo ja>%basedir%\%curroom%\getnot\%input%.tlk\opt3
goto begin
:man
echo %FY%You  : Who was this man?
echo %FG%Ghost: It was %BOLD%Hans KazAn!%RS%%FG%, a wizard who lived in a cottage in the forest. 
echo        He had always been nice to the people on the island, but in the last 
echo        months before he cursed us he became evil. 
echo        Some people thought he was posessed by an evil spirit. 
echo        Others thought he was posessed by the devil himself.
echo ja>%basedir%\%curroom%\getnot\%input%.tlk\opt23
echo ja>%basedir%\%curroom%\getnot\%input%.tlk\opt3
goto begin
:story
echo %FY%You  : And that's the whole story?
echo %FG%Ghost: I'm sorry, but the writer couldn't make up a better one.
echo ja>%basedir%\%curroom%\getnot\%input%.tlk\opt3
goto begin
:nevermnd
echo %FY%You  : Nevermind, bye.
echo %FG%Ghost: Ok, bye.
goto end
:bye
echo %FY%You  : Nice talking to you.
echo %FG%Ghost: See you in a few years.
goto end
:end
echo %FW%
if exist %basedir%\%curroom%\getnot\%input%.tlk\opt3 del %basedir%\%curroom%\getnot\%input%.tlk\opt3
set text1=
set text2=
set text3=
set opt1=
set opt2=
set opt3=
