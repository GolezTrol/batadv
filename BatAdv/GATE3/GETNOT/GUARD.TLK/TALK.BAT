:start
if exist %basedir%\%curroom%\getnot\%input%.tlk\opt11 goto opt11
set text1=Hi, I'm Lost. Who are you?
set label1=meet
goto opt2
:opt11
if exist %basedir%\%curroom%\getnot\%input%.tlk\opt12 goto opt12
set text1=Can I get a drink somewhere?
set label1=inn1
goto opt2
:opt12
if exist %basedir%\%curroom%\getnot\%input%.tlk\opt13 goto opt13
set text1=Could you show me the way to the inn again?
set label1=inn2
goto opt2
:opt13
set text1=Can you show me the way to the bar?
set label1=bar
goto opt2
:opt2
if exist %basedir%\%curroom%\getnot\%input%.tlk\opt21 goto opt21
set text2=Can you tell me about the city history?
set label2=history
goto opt3
:opt21
if exist %basedir%\%curroom%\getnot\%input%.tlk\opt22 goto opt22
set text2=Where did all the pirates go?
set label2=pirates
goto opt3
:opt22
set text2=How can I find the old pirate?
set label2=old
goto opt3
:opt3
if exist %basedir%\%curroom%\getnot\%input%.tlk\opt31 goto opt31
set text3=Nevermind, bye.
set label3=nevermind
goto continue
:opt31
set text3=Thank you, bye.
set label3=thanks

:continue
echo.%FW%
echo a) %text1%
echo b) %text2%
echo z) %text3%
choice /c:abz/n 
cls
if errorlevel 3 goto %label3%
if errorlevel 2 goto %label2%
if errorlevel 1 goto %label1%
goto continue

:meet
echo %FY%You: Hi, I'm Lost. Who are you?
echo %FG%Cityguard: I'm Guard of the Eastern Citygate of Lutjebroek
echo            Can I help you?
echo ja>%basedir%\%curroom%\getnot\%input%.tlk\opt11
echo ja>%basedir%\%curroom%\getnot\%input%.tlk\opt31
goto start

:inn1
echo %FY%You: Can I get a drink somewhere?
echo ja>%basedir%\%curroom%\getnot\%input%.tlk\opt12
goto inn
:inn2
echo %FY%You: Could you show me the way to the inn again?
:inn
echo %FG%Cityguard: Ofcourse! You can follow Main Street until you reach the Mainsquare. 
echo            You can find all the beer you want in the Black Hand Inn.
echo ja>%basedir%\%curroom%\getnot\%input%.tlk\opt31
goto start

:bar
echo %FY%You: Can you show me the way to the bar?
echo %FG%Cityguard: I can, but I'd like you not to go there. The bar is full of
echo            criminals who'd be glad to rob and/or kill you.
echo ja>%basedir%\%curroom%\getnot\%input%.tlk\opt31
goto start

:history
echo %FY%You: Can you tell me about the city history?
echo %FG%Cityguard: Yes I can.
echo %FY%You: Will you?
echo %FG%Cityguard: Oh.. Okay. This town's history is hundreds of years old.
echo            It was once a city of fishermen and pirates. 
echo            The pirates went pirating foreign ships, but also protected the
echo            fishermen from foreign attacks. This situation made this town
echo            one of the richest of the country. Actually, it became a country
echo            itself! Unfortunately not much of these glory is left now.
echo ja>%basedir%\%curroom%\getnot\%input%.tlk\opt21
echo ja>%basedir%\%curroom%\getnot\%input%.tlk\opt31
goto start

:pirates
echo %FY%You: Where did all the pirates go?
echo %FG%Cityguard: In the early days they often went pirating, but they became wealthy,
echo            rich and lazy. The innkeeper is doing fine business with all these 
echo            pirates spending all their money on lipstick and beer. %FB%(inside joke)
echo            %FG%The only pirate in town who became old instead of lazy is 
echo            The Old Pirate!(tm) %FB%(Tadada boom)
echo ja>%basedir%\%curroom%\getnot\%input%.tlk\opt22
echo ja>%basedir%\%curroom%\getnot\%input%.tlk\opt31
goto start

:old
echo %FY%You: How can I find the old pirate?
echo %FG%Cityguard: Follow Main Street from here and take first street on the right.
echo            You will bump into his house automatically. It's an old house with a
echo            huge anchor in front of it.
echo ja>%basedir%\flags\oldpir.001
echo ja>%basedir%\%curroom%\getnot\%input%.tlk\opt31
goto start

:nevermind
echo %FY%You: Nevermind, bye.
echo %FG%Cityguard: OK, bye.
goto end

:thanks
echo %FY%You: Thank you, bye.
echo %FG%Cityguard: OK, bye.
del %basedir%\%curroom%\getnot\%input%.tlk\opt31
goto end

:end
set text1=
set text2=
set text3=
set label1=
set label2=
set label3=

