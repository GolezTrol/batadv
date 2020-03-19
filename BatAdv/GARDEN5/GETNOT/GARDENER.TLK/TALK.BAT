cls
if exist %basedir%\invent\cow echo %FG%Gardener: Is that a cow in your pocket or are you just happy to see me?
:begin
echo.
echo %FW%What would you like to say to the gardener?
if exist %basedir%\%curroom%\getnot\%input%.tlk\opt1 goto o12
set text1=Hi I'm Lost, who are you?
set opt1=meet
goto o2
:o12
set text1=What was your name again?
set opt1=name
goto o2
:o2
if exist %basedir%\%curroom%\getnot\%input%.tlk\opt23 goto o23
if exist %basedir%\%curroom%\getnot\%input%.tlk\opt22 goto o22
if exist %basedir%\%curroom%\getnot\%input%.tlk\opt21 goto o21

set text2=Do you live here?
set opt2=owner
goto o3
:o21
set text2=Were you one of lady Louisa's staff?
set opt2=staff
goto o3
:o22
set text2=So, you've been doing this since 1784? You must be getting tired of this!

set opt2=tired
goto o3
:o23
set text2=How can I free Lady Louisa?
set opt2=free
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
echo %FY%You: Hi, I'm Lost, who are you?
echo %FG%Gardener: I'm Harm, the gardener.
echo        I've noticed you snubbing around, can I help you?
echo ja>%basedir%\%curroom%\getnot\%input%.tlk\opt1
echo ja>%basedir%\%curroom%\getnot\%input%.tlk\opt3
REM set flag to remember you have talked to the gardener
echo ja>%basedir%\flags\gardener.001
goto begin
:name 
echo %FY%You: What was your name again?
echo %FG%Gardener: I'm Harm, is that so hard to remember?
echo ja>%basedir%\%curroom%\getnot\%input%.tlk\opt3
goto begin
:owner
echo %FY%You: Do you live here?
echo %FG%Gardener: No, actually not. I used to live here, but I stopped doing that 
echo        in 1784. Actually, no one lived here since then.
echo ja>%basedir%\%curroom%\getnot\%input%.tlk\opt21
echo ja>%basedir%\%curroom%\getnot\%input%.tlk\opt3
REM set flag to remember you have talked to the gardener
echo ja>%basedir%\flags\gardener.001
goto begin
:staff
echo %FY%You: Were you one of lady Louisa's staff?
echo %FG%Gardener: You know the story of Lady Louisa? That's good.
echo        I indeed was a member of her staff. I used to tend this garden.
echo        But when I died, I couldn't find peace. 
echo        And although it seems no one lives in this house, it is kept
echo        clean and tidy by Lady Louisa's former staff.
echo ja>%basedir%\%curroom%\getnot\%input%.tlk\opt22
echo ja>%basedir%\%curroom%\getnot\%input%.tlk\opt3
goto begin
:tired
echo %FY%You: So, you've been doing this since 1784?
echo        You must be getting tired of this!
echo %FG%Gardener: Yes, I am. I'm hoping for the day that someone frees
echo        Lady Louisa. Her spirit is kept prison by %BOLD%Hans KazAn!%RS%%FG%.
echo        Only when her house is complete we will all find peace.
echo ja>%basedir%\%curroom%\getnot\%input%.tlk\opt23
echo ja>%basedir%\%curroom%\getnot\%input%.tlk\opt3
goto begin
:free
echo %FY%You: How can I free Lady Louisa?
echo %FG%Gardener: I don't know, but you'll have to go outside the garden gate.
echo None of us can do this, so it has to be someone from outside. 
echo You are our only chance.
echo Go, and break the curse of%BOLD%Hans KazAn!%RS%%FG%!
echo Only then we will be free.
echo ja>%basedir%\%curroom%\getnot\%input%.tlk\opt3
goto begin
:nevermnd
echo %FY%You: Nevermind, bye.
echo %FG%Gardener: Ok, bye.
goto end
:bye
echo %FY%You: I'll see what I can do, bye.
echo %FG%Gardener: I hope you'll succeed.
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
