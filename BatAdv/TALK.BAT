if %input%PLUK==YOURSELFPLUK goto yourself
if %input%PLUK==MYSELFPLUK goto yourself
if %input%PLUK==MEPLUK goto yourself
if %input%PLUK==COWPLUK goto cow
if %input%PLUK==AUTHORPLUK goto author
if %input%PLUK==MAKERPLUK goto author
if %input%PLUK==JOSPLUK goto author
if %input%PLUK==PRESENTPLUK goto present
if %input%PLUK==PLUK goto no1
:no1
goto end
REM ***** YOURSELF
:yourself
if exist %basedir%\invent\cow echo %FG%You: Is that a cow in your pocket or are you just happy to see yourself?
echo %FY%You: Hi, I'm Lonely.
echo %FG%You: I see...
goto talked
REM ***** COW
:cow
if exist %basedir%\invent\cow goto Talk2Cow
if exist %basedir%\%curroom%\cow goto Talk2Cow
if exist %basedir%\%curroom%\getnot\cow goto Talk2Cow
goto end
:Talk2Cow
echo %FY%You: Hi there
echo %FG%Cow: Mweu!
echo %FY%You: Is that so?!
echo %FG%Cow: MOOOOOOoooooo........
echo %FY%You: Okay... 
goto talked
REM ***** AUTHOR
:author
if exist %basedir%\invent\cow goto author2
echo %FY%You: This game is really magnificant!
echo %FG%Author: Pardon? Waddidyousay?
echo %FY%You: You .. %RCUR%
choice /c:./n/t:.,2
echo %SCUR%have .. %RCUR%
choice /c:./n/t:.,2
echo %SCUR%made .. %RCUR%
choice /c:./n/t:.,2
echo %SCUR%a .. %RCUR%
choice /c:./n/t:.,2
echo %SCUR%COOOOOL .. %RCUR% 
choice /c:./n/t:.,4
echo %SCUR%game!
echo %FG%Author: Thanks! You are too.
if exist %basedir%\invent\present goto presgivn
:givepres
echo         I'd like to give you this present for being so nice to me:
echo %BLINK%%BOLD%%BM%%FY%This is a nice present, given to you by the maker of this game.>%basedir%\invent\present
echo You wonder what is is, and wish it stopped blinking.%RS%%FY% >> %basedir%\invent\present
goto talked
:presgivn
echo I see I've already given you this lovely present!
goto talked
:author2
echo %FG%Author: Is that a cow in your pocket or are you just happy to see me?
echo %FY%You: (%FR%%BLINK%MAD%RS%%FY%) Is that your joke!?
echo %FG%Author: (%FB%Scared%FG%)Errr... Nope 
if exist %basedir%\invent\present goto presgivn
goto givepres
REM ***** PRESENT
:present
if exist %basedir%\invent\present goto t2presnt
if exist %basedir%\%curroom%\present goto t2presnt
goto end
:t2presnt
echo %FY%You: Hi, can you talk?
echo %BLINK%%BOLD%%BM%%FY%Present: Nope... %BEEP%%RS%FY%
goto talked
REM ***** You have communicated:
:talked
set dummy=skiporwhatever

:end
