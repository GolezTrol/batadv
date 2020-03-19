@echo off
REM /// Configure game ///
set abort=
REM *** Special Characters : Escape(27), Beep (7), Backspace(8)
set alarm=
set esc=
set backs=
if not exist config.bat set abort=config
if not exist ansi.bat set abort=ansi
if not %abort%PLUK==PLUK goto abort
call config.bat
call ansi.bat
if not %sound%PLUK==onPLUK goto nosound
set beep=%alarm%
set sound=
goto pastsoundcheck
:nosound
set beep=
set alarm=
:pastsoundcheck
REM Check if Ansi variables are properly defined.
REM (If the last (Esc) is, the rest is too.)
if %mode3%%ansi%PLUK==onPLUK goto ESError
cls
REM *** Check if %basedir% is configured right
echo Loading Batch Adventure
echo Checking settings...
echo Initial directory: %basedir%
if exist %basedir%\main.bat goto BDRight
echo Main program not found in Base Directory. Please check yout Config.bat
echo Terminating %alarm%%alarm%%alarm%
goto end
:BDRight
REM *** Check if Ansi.sys is loaded ***
REM ESC[6n returns ESC[CursorY,CursorX to keyboard.
REM If first char in key buffer is ESC, the code has worked -} Ansi was loaded
if %ansi%PLUK==onPLUK goto AnsiOn
echo Use Ansi enhancements: off
echo Sorry for the mess: %ESC%[6n 
choice /c:%ESC%A /n/t:A,1
if errorlevel 2 goto NoAnsi1
echo You have turned off Ansi Enhancements, but Ansi.sys is loaded.
echo You're advised to 'set ansi=on' in %basedir%\config.bat  
echo to make full use of the Ansi Color and Key enhancements in Batch Adventure.
echo Press any key to start the game.%alarm%
pause>nul
goto AnsiChkd
:NoAnsi1
echo Ansi.sys is not loaded and you have turned off Ansi Enhancements. 
echo You can play the game now, but you will not be able to use the Ansi
echo Color and Key enhancements. 
echo You are advised to load Ansi.sys by placing the line DEVICE=[Path]ANSI.SYS
echo in your Config.sys file.
echo Then 'set ansi=on' in %basedir%\config.bat. 
echo You will enjoy Batch Adventure a LOT more when you do this.
echo Press any key to start the game. %alarm%
pause>nul
goto AnsiChkd
:AnsiOn
echo Use Ansi enhancements: on
echo Sorry for the mess: %ESC%[6n 
choice /c:%ESC%A /n /t:A,1
if errorlevel 2 goto NoAnsi2
echo You're gonna enjoy 
echo %BLINK%%BOLD%%FB%A%FG%N%FY%S%FW%I %RS% %RCUR%
echo %SCUR%%BLINK%%FW%E%FC%N%BOLD%%FB%H%RS%%BLINK%%FB%A%FG%N%FY%C%FM%E%FR%M%FY%E%FG%N%FB%T%BOLD%%FB%S%FC%!
echo %RS%Press any key to start the game. %alarm%
pause>nul
goto AnsiChkd
:NoAnsi2
echo You have set Ansi Enhancements to on, but Ansi.sys is not loaded.
echo This will REALLY mess up your screen. It's best to load Ansi.sys
echo by placing the line DEVICE=[Path]ANSI.SYS in your Config.sys file.
echo If you, for some reason, can't load Ansi.sys, you'll have to
echo 'set ansi=off' in %basedir%\config.bat %alarm%%alarm%%alarm%
echo Press 1 to quit
echo Press 2 to start the game
echo Press 3 to turn off Ansi Enhancements before starting the game.
choice /c:123
if errorlevel 3 goto SetNoAnsi
if errorlevel 2 goto AnsiChkd
if errorlevel 1 goto End
:SetNoAnsi
set ansi=
call %basedir%\ansi.bat
:AnsiChkd
REM Load last location. Use starting location if none
set curroom=Corr1
if exist location.bat call location.bat
REM Define Enter key to return '.'
if not %ansi%PLUK==onPLUK goto nokeys
if %ansi%PLUK==onPLUK echo %ESC%[13;"."p
REM Define arrow keys to return NorthSouthEastWest
echo %ESC%[224;72;"n"p%ESC%[0;72;"n"p
echo %ESC%[224;75;"w"p%ESC%[0;75;"w"p
echo %ESC%[224;77;"e"p%ESC%[0;77;"e"p
echo %ESC%[224;80;"s"p%ESC%[0;80;"s"p
REM Define PgUp/PgDn to return up, down
echo %ESC%[224;73;"u"p%ESC%[0;73;"u"p
echo %ESC%[224;81;"d"p%ESC%[0;81;"d"p
:nokeys
REM /// Main Screen / Opening Screen ///
echo %RS%
cls
echo %BOLD%%FW%                                .@'
echo %BOLD%%FY%  I~\ I   I  I I /` %FW%          .@@@:
echo %BOLD%%FY%  I_/ I   I  I I{   %FW%        .;@@@::::.%RS%%FY%..%BOLD%%FW%  .
echo %BOLD%%FY%  I   I__  \_I I \. %FW%       .;@@::::::::::::
echo                            :@@@{::::::::::: 
echo                            :@@:``  %RS%%FY% ::%BOLD%%FW%`':: 
echo                             :@     %RS%%FY%::%BOLD%%FW%   '
echo                                    %RS%%FY%::
echo %BOLD%%FY%       I~\ I~\  /\  I~\  I  I  /~\%RS%%FY%::%BOLD%/~I~\ I  /\  I  I /~~
echo %BOLD%%FY%       I_/ I_/ I  I I  I I  I I   %RS%%FY%::%BOLD%  I   I I  I I\ I ~-.
echo %BOLD%%FY%       I   I \  \/  I_/   \_I  \_/%RS%%FY%::%BOLD%  I   I  \/  I `I __/
echo %RS%%FY%                                  ::.
echo                                   :::
choice /c:. /n /t:.,2
echo                                 %FC%PRESENTS:
choice /c:. /n /t:.,2
cls
echo.%RS%%FB%             `@@@@@@.     `@`   .@@@@@@@@@.   @@@@@. `@`   `@`
echo.%FG%              @     @    .@ @.  '    @    `  @     `  @     @
echo.%BOLD%%FY%              @@@@@{    .@@@@@.      @       @        @@@@@@@
echo.%RS%%FY%              @     @  .@     @.     @       @     ,  @     @
echo.%FR%             .@@@@@@' .@.     .@.   .@.       @@@@@' .@.   .@.
echo.
echo.%FM%    `@`    `@@@@@.`@`     `@``@@@@@@`@@    @ .@@@@@@@. @    @`@@@@@ `@@@@@@`
echo.%BOLD%   .@ @.    @   `@..@.   .@   @      @ @   @ '   @   ` @    @ @    @ @
echo.%FB%  .@@@@@.   @    )@ .@   @.   @@@[   @  @  @     @     @    @ @@@@@  @@@[
echo.%FG% .@     @.  @   .@'  .@ @.    @      @   @ @     @     @    @ @   @  @
echo.%FY%.@.     .@..@@@@@'    .@.    .@@@@@@.@    @@    .@.     @@@@@.@.   @.@@@@@@.
echo.
choice /c:. /n /t:.,3
echo %BOLD%%FB%+-----------------------------------------------------------------------------+
echo %BOLD%%FB%[                             %BLINK%%FR% Batch Adventure%RS%%BOLD%%FB%                                ]
echo %BOLD%%FB%[                       %FG%By Jos Visser, Pluk Productions 1998%FB%                  ]
echo %BOLD%%FB%+-----------------------------------------------------------------------------+
echo %BOLD%%FB%[ %RS%%FG%Programming:  %BOLD%%FY%Jos Visser                                                   %FB% ]
echo %BOLD%%FB%[ %RS%%FG%Game design:  %BOLD%%FY%Jos Visser                                                   %FB% ]
echo %BOLD%%FB%[ %RS%%FG%ASCII ART  :  %BOLD%%FY%Joan G. Stark (when signed with '%RS%%FY%jgs%BOLD%')                    %RCUR%
echo %SCUR%%FB%    ]
echo %BOLD%%FB%[ %FG%              %FY%Jos Visser (other graphics)                                  %FB% ]
echo %BOLD%%FB%[ %RS%%FG%Graphics by Joan Stark downloaded from%BOLD%%FY% 'Joan Stark's ASCII ART Gallery'    %FB% ]
echo %BOLD%%FB%[ %BOLD%%FY%              http://www.geocities.com/SoHo/7373/                           %FB%]
echo %BOLD%%FB%+-----------------------------------------------------------------------------+
echo %BOLD%%FB%[ %FR%Thanks to Nienke and Bas for support and ideas, Joan for the graphics and   %FB%]
echo %BOLD%%FB%[ %FR%all other people who should be thanked for the good things they did.        %FB%]
echo %BOLD%%FB%+-----------------------------------------------------------------------------+
echo %BOLD%%FB%[ %RS%%FR%See documentation (BatAdv.txt) for further information.                     %BOLD%%FB%]
echo %BOLD%%FB%+-----------------------------------------------------------------------------+
echo %FY%Press any key to start the game...
pause >nul
cls
REM /// Start of main loop ///
:begin
if not %abort%PLUK==PLUK goto abort
echo %RS%%FG%------------------------------------------------------------------------------%RS%%FY%
REM ********* I N I T  A N D  D E S C R I B E  R O O M ***************
if not exist %basedir%\%curroom%\init.bat goto error1
if not exist %basedir%\%curroom%\roomdesc.bat goto error1
set reinit=|set skipdesc=|set abort=
echo %FG%Current location: %FC%%curroom% %FB% Debug option %FY%
call %basedir%\%curroom%\init.bat
if not %reinit%PLUK==PLUK goto begin
if not %skipdesc%PLUK==PLUK goto skipdesc
if not %abort%PLUK==PLUK goto abort
call %basedir%\%curroom%\roomdesc.bat
:skipdesc
REM ************ E X I T S *****************
set dir=
if exist %basedir%\%curroom%\exits.bat call %basedir%\%curroom%\exits.bat
if not %dummy%PLUK==PLUK goto contexit
if %ansi%PLUK==onPLUK goto setexitc
if not %north%PLUK==PLUK set dir=%dir% north,
if not %south%PLUK==PLUK set dir=%dir% south,
if not %east%PLUK==PLUK set dir=%dir% east,
if not %west%PLUK==PLUK set dir=%dir% west,
if not %up%PLUK==PLUK set dir=%dir% up,
if not %down%PLUK==PLUK set dir=%dir% down,
if not %in%PLUK==PLUK set dir=%dir% in,
:contexit
if %dir%PLUK==PLUK goto skipexit
echo %BOLD%%FY%Exits are:    %RS%%FR%%dir%
goto skipexit
:setexitc
set nclr=%FY%|set sclr=%RS%%FY%|set eclr=%RS%%FY%|set wclr=%RS%%FY%
set uclr=%RS%%FY%|set dclr=%RS%%FY%|set iclr=%RS%%FY%
if not %north%PLUK==PLUK set nclr=%BOLD%%FB%
if not %south%PLUK==PLUK set sclr=%BOLD%%FB%
if not %east%PLUK==PLUK set eclr=%BOLD%%FB%
if not %west%PLUK==PLUK set wclr=%BOLD%%FB%
if not %up%PLUK==PLUK set uclr=%BOLD%%FB%
if not %down%PLUK==PLUK set dclr=%BOLD%%FB%
if not %in%PLUK==PLUK set iclr=%BOLD%%FB%
:skipexit
REM ********** I T E M S  I N  R O O M *****
set totvwp=|set dummy=
if exist %basedir%\%curroom%\items.bat call %basedir%\%curroom%\items
if not %dummy%PLUK==PLUK goto itemsdone
cd %basedir%\%curroom%
REM *** For some reason the addit procedure wont work inline. 
REM *** If you can tell me why, please contact me.
REM *** for %%v IN (*.) DO set totvwp=%totvwp%, %%v    won't work ???
for %%v IN (*.) DO call %basedir%\addit %%v
cd %basedir%
if not exist %basedir%\%curroom%\getnot\nul goto continv
cd %basedir%\%curroom%\getnot
for %%v IN (*.) DO call %basedir%\addit %%v
cd %basedir%
:continv
if %totvwp%PLUK==PLUK goto noitems
echo %FG%You can see:   %FC%%totvwp%%FY%
goto itemsdone
:noitems
echo %FG%You can see:   %FY%You can see nothing here.
:itemsdone
REM ********** I N V E N T O R Y ***********
set totvwp=
cd %basedir%\invent
for %%v IN (*.) DO call %basedir%\addit %%v
cd %basedir%
if %totvwp%PLUK==PLUK goto noinvent
echo %FG%Inventory:     %FC%%totvwp%
goto inventdone
:noinvent
echo %FG%Inventory:     %FY%Your pockets are empty
:inventdone
REM ************* C O M M A N D S*************
REM Get input from keyboard and execute the right subroutine.
echo %FG%Commands:      %FY%Get, Put, Look, Talk, Open, Close, Menu
echo %FG%Directions:    %nclr%North, %sclr%South, %eclr%East, %wclr%West, %uclr%Up, %dclr%Down, %iclr%In
REM echo %FG%1 = echo on, 2 = echo off  %FB%Debug option%RS%
choice /c:gpltocmnsewudi12 /n %RS%%FY%Your command:
if errorlevel 17 goto begin
if errorlevel 16 goto echooff
if errorlevel 15 goto echoon
if errorlevel 14 goto in
if errorlevel 13 goto down
if errorlevel 12 goto up
if errorlevel 11 goto west
if errorlevel 10 goto east
if errorlevel 9 goto south
if errorlevel 8 goto north
if errorlevel 7 goto menu
if errorlevel 6 goto close
if errorlevel 5 goto open
if errorlevel 4 goto talk
if errorlevel 3 goto look
if errorlevel 2 goto put
if errorlevel 1 goto get
if errorlevel 0 goto wannaquit

REM /// End of main loop ///
goto begin

REM *********** C T R L - B R E A K *******
REM Should get here if user presses Ctrl Break. ( - NOT :) - )
:wannaquit
cls
echo %FM%Once you will be able to exit this way...%FY%
goto begin
REM **************** G E T *****************************
:get
REM I WILL SAY THIS ONLY ONCE:
REM Set the prompt for the inputroutine
set inputprompt=What would you like to get? :
REM Set label to return to when input is done.
set continue=contget
REM Call Input routine
goto getinput
REM Label to return to
:contget
cls
set dummy=
REM Check if an alternate get.bat can be found.
if exist %basedir%\%curroom%\get.bat call %basedir%\%curroom%\get.bat
if not %dummy%PLUK==PLUK goto endofget
REM Check if item can be found and if so, if it can be picked up.
if exist %basedir%\%curroom%\%input% goto getit
if exist %basedir%\%curroom%\getnot\%input% goto getnot
if not %input%PLUK==PLUK echo. You cannot see a %input% here.
goto begin
:getnot
echo You cannot pick up the %input%.
goto begin
:getit
if exist %basedir%\invent\%input% goto gotitalready
copy %basedir%\%curroom%\%input% %basedir%\invent\%input% >nul
if not exist %basedir%\invent\%input% goto cannotgetit
del %basedir%\%curroom%\%input% 
if exist %basedir%\%curroom%\%input% goto cannotgetit
echo You picked up the %input%
goto endofget
:gotitalready
echo. You already got this item.
goto endofget

:cannotgetit
echo. You cannot get this item due to an error
echo. It cannot be moved to your inventory or it can not be removed from
echo. the current room.
echo. Game is terminated
goto end

:endofget
set inputprompt=
set input=
goto begin
REM ****************** P U T *********************************
:put
set inputprompt=What would you like to put down? :
set continue=contput
goto getinput
:contput
cls
if not exist %basedir%\invent\%input% goto havenot
if exist %basedir%\%curroom%\%input% goto istherealready
copy %basedir%\invent\%input% %basedir%\%curroom%\%input% >nul
if not exist %basedir%\%curroom%\%input% goto cannotputit
del %basedir%\invent\%input% 
if exist %basedir%\invent\%input% goto cannotputit
echo You dropped the %input%
goto endofput

:havenot
if not %input%PLUK==PLUK echo. %input% : You do not have this item
goto endofput
:istherealready
echo. One %input% in a room is enough.
goto endofput

:cannotputit
echo. You cannot put this item down due to an error
echo. It cannot be moved to the current room or it can not be removed from
echo. your inventory.
echo. This is probably caused by the file's read-only attribute.
echo. Game is terminated
goto end
:endofput
set inputprompt=
set input=
goto begin

REM *********** L O O K *****
:look
set inputprompt=What would you like to look at? :
set continue=contlook
goto getinput
:contlook
cls
set dummy=
if exist %basedir%\%curroom%\look.bat call %basedir%\%curroom%\look
if not %dummy%PLUK==PLUK goto begin
if exist %basedir%\%curroom%\%input% goto lookrm1
if exist %basedir%\%curroom%\getnot\%input% goto lookrm2
:lookinvent
if exist %basedir%\invent\%input% goto lookinv
if not %input%PLUK==PLUK echo You cannot see the %input% here.
goto begin
:lookinv
type %basedir%\invent\%input%
choice /c:. /n /t:.,2
if %ansi%PLUK==onPLUK echo %ESC%[2A
goto begin
:lookrm1
type %basedir%\%curroom%\%input%
choice /c:. /n /t:.,2
if %ansi%PLUK==onPLUK echo %ESC%[2A
goto begin
:lookrm2
type %basedir%\%curroom%\getnot\%input%
choice /c:. /n /t:.,2
if %ansi%PLUK==onPLUK echo %ESC%[2A
goto begin

REM *********** T A L K ******
:talk
set continue=conttalk
set inputprompt=Who would you like to talk to? :
goto getinput
:conttalk
cls
REM Check if .tlk dir is found (If not, no1 is there to talk to you)
REM if not exist %basedir%\%curroom%\getnot\%input%.tlk\nul goto no12talk2
REM Check if talk.bat is found (If not, ERROR!)
if not exist %basedir%\%curroom%\getnot\%input%.tlk\talk.bat goto no12talk2
rem ... error1
call %basedir%\%curroom%\getnot\%input%.tlk\talk.bat
goto begin
:no12talk2
set dummy=
if exist %basedir%\talk.bat call %basedir%\talk.bat
if not %dummy%PLUK==PLUK goto begin
if exist %basedir%\%curroom%\%input% goto psexist
if exist %basedir%\%curroom%\getnot\%input% goto psexist
if not %input%PLUK==PLUK echo You cannot see that person.
goto begin
:psexist
echo %FY%You: Hello %input%. 
echo %FG%%input%: ...
echo %FY%You: Hmm ...
goto begin
REM ********** O P E N *******
:open
set inputprompt=What would you like to open? :
set continue=contopen
goto getinput
:contopen
cls
set dummy=
if exist %basedir%\%curroom%\open.bat call %basedir%\%curroom%\open.bat
if not %dummy%PLUK==PLUK goto quitopen
if exist %basedir%\%curroom%\%input%.opn\nul goto openit
echo You cannot open that.
goto quitopen
:openit
set curroom=%curroom%\%input%.opn
:quitopen
set inputprompt=
set input=
goto begin
REM ******* C L O S E *********
:close
cls
set dummy=
if exist %basedir%\%curroom%\close.bat call %basedir%\%curroom%\close.bat
if not %dummy%PLUK==PLUK goto begin
if not %close%PLUK==PLUK goto closeit
echo Nothing is opened.
goto begin
:closeit
set curroom=%close%
goto begin
REM ********************** M E N U ********************************
:menu
cls
:startmenu
echo.
echo %FY%%BOLD%-----------------------------BatAdv Main menu------------------------------
echo. 
echo %FB%What would you like to do?
REM ***************************************************************
REM *** SAVE and LOAD are removed from the game.                ***
REM *** It's almost impossible to remember all the flags that   ***
REM *** are set or reset and keep track of all objects that are ***
REM *** Picked up or dropped.                                   ***
REM *** The program automatically saves the location you are in ***
REM *** when you quit.                                          ***
REM *** Use PKZIP -rp savegame.zip to save a game, and use      ***
REM *** PKUNZIP -d savegame.zip when loading a game (remember   ***
REM *** to clear the BatAdv directory first)                    ***
REM *** These options will later be put back in this main menu. ***
REM ***************************************************************
REM echo %FY%[S]%FG%ave ------------ Saves the current game 
REM echo %FY%[L]%FG%oad ------------ Loads the saved game
echo %FY%[D]%FG%escription ----- Edit room description     %RS%%FB%Debug option%BOLD%
echo %FY%[I]%FG%nitialisation -- Edit room initialisation  %RS%%FB%Debug option%BOLD%
echo %FY%[E]%FG%ditor ---------- Starts the MS-DOS editor  %RS%%FB%Debug option%BOLD%
echo %FY%[S]%FG%hell ----------- Enters MS-DOS Shell       %RS%%FB%Debug option%BOLD%
echo %FY%[H]%FG%elp ------------ Gives info about the game and the author
echo %FY%[Q]%FG%uit ------------ Quits the game
echo.
echo %FY%[C]%FG%ontinue game --- Continues the current game%RS%%FY%
REM choice /c:slqch /n
choice /c:qchdies /n
if errorlevel 8 goto startmenu
if errorlevel 7 goto dosshell
if errorlevel 6 goto edit
if errorlevel 5 goto editinit
if errorlevel 4 goto editdesc
if errorlevel 3 goto info1
if errorlevel 2 goto menucontinue
if errorlevel 1 goto menuquit
REM if errorlevel 2 goto menuload
REM if errorlevel 1 goto menusave
goto startmenu

REM ************* DOS SHELL
:dosshell
echo Use 'Exit' command to return to Batch Adventure.
COMMAND
goto begin
REM ************* EDIT DESCRIPTION/INITIALISATION *************
:editdesc
set dummy=%basedir%\%curroom%\roomdesc.bat
goto editor
:editinit
set dummy=%basedir%\%curroom%\init.bat
goto editor
:edit
set dummy=
goto editor
REM ************* MS-DOS Editor *****************
:editor
cls
if exist c:\windows\command\edit.com goto winedit
if exist c:\windows\command\edit.exe goto winedit
if exist c:\dos\edit.com goto dosedit
if exist c:\dos\edit.exe goto dosedit
notepad %dummy%
echo %BLINK%%BOLD%%FR%CANNOT FIND EDITOR%RS%%FY%
:winedit
c:\windows\command\edit %dummy%
REM -- 2 times 'Goto Begin'. Edit acts weird sometimes.
goto begin
goto begin
:dosedit
c:\dos\edit %dummy%
REM -- 2 times 'Goto Begin'. Edit acts weird sometimes.
goto begin
goto begin
REM ************************ ABOUT *****************************
:info1
cls
echo %BOLD%%FY%--------- About Batch Adventure ----------------%RS%%FG%
echo BatAdv is an adventure game, completely written in batch.
echo The author is a mad maniac, who is not understood by the world. 
echo His schoolmates were making fun of him because he spent a few weeks 
echo programming a text adventure in batch (%BLINK%%BOLD%%FR%MWUAHAHA%RS%%FG%).
echo He quit school, got broke and landed in the gutter. 
echo A few friends told him to hold his chin up, and so he continued this 
echo programme. 
echo This story is about a guy who finds himself in a big mansion on an island.
echo The rest of the story is not written yet (because I figured I could never
echo  turn this into a working programme).
echo It's probably not half way finished right now, but you can ofcourse 
echo use the base program you are holding to create your own world.
echo.
echo %FY%Press (almost) any key to get info about the keys to use in the programme.
pause >nul
cls
echo %BOLD%%FY%----------- Batch Adventure Key Controls ----------%RS%%FG%
echo You can choose one of these commands from the command menu
echo %BOLD%%FB%[g]et, [p]ut, [l]ook, [t]alk, [o]pen, [c]lose, [m]enu
echo Direction keys: [w]est, [e]ast... [i]n%RS%%FG%
echo Use Get and Put to pick up and drop objects. Giving an object to someone
echo also happens with Put.
echo Use Look to look at objects, rooms or persons.
echo Use Talk to talk to a person.
echo Use Open and Close to open and close objects or doors.
echo Use Menu to go to the main menu
echo Use the direction keys to go to an adjacent location.
echo If you're in Ansi mode, the arrow keys, PgUp and PgDn can be used to move.
echo. 
echo After the get/put/look/talk/open commands you are asked to type the
echo name of the object. After you've typed the name, you can press '.' or
echo -if you are in ansi mode- Enter. If you make a typing error you can use
echo backspace to remove the word you have typed and start over again.
echo With Esc you can cancel the input.
echo.
echo In the main menu you can choose to save or load a game, quit or
echo continue the game, or enter this help screen.
echo.
echo %FY%Press a key to get info about setting up the game.
pause >nul
cls
echo %BOLD%%FY%------------- Setting Up Batch Adventure ------------%RS%%FG%
echo The game setup in BatAdv is done by setting environment variables in the 
echo CONFIG.BAT file. example:
echo %FY%set basedir=C:\BATADV
echo set ansi=on%FG%
echo basedir holds the directory in which BatAdv is installed. (In this case
echo  C:\BATADV)
echo ansi can be ON or OFF. Setting ansi to ON makes the game use colors and
echo special keys like Enter. Make sure you have your ANSI.SYS loaded by placing 
echo the line DEVICE=C:\DOS\ANSI.SYS in your CONFIG.SYS file.
echo The game uses ANSI to make use of colors and special keys.
echo %FR%NOTICE%FG% that most objects have Ansi codes in their description. These codes
echo are also displayed when ANSI.SYS is not loaded. The text will be messy if you
echo try to display the description of these objects when ANSI.SYS is not loaded. 
echo The 'set ansi=off' option is only useful if you want to test the game and
echo for some reason you cannot load ANSI.SYS.
echo %FY%set curroom=Corr1%FG% can be found in main.bat. 
echo The curroom variable holds the room in whitch the game is started.
echo %FR%%BLINK%THIS SHOULD NORMALLY NOT BE CHANGED BY THE USER. %RS%%FG%
echo If you are making your own game with this engine, you should enter your
echo own starting room in the curroom variable.
echo.
echo %FY%Press a key to get info about the future of BatAdv.
pause >nul
cls
echo %BOLD%%FY%---------------- Batch Adventure Future Ideas ----------%RS%%FG%
echo - Talk is implemented now, but the game needs persons to talk to.
REM echo For the moment only one game can be saved and loaded. It would be a lot
REM echo nicer if multiple games could be saved.
REM echo Saving doesn't work THAT properly though.
echo - The game is automatically saved. Only one game can be saved. 
echo The idea is to create an interface that uses a program like PKZIP to save
echo and load multiple games.
echo - The story for now is NOT interesting. I need ideas for a story, and these
echo ideas need to be implemented. This takes time. (LOTS of it :) ) 
echo - Another idea is to put all Init.bat and Roomdesc.bat files in one batch
echo file. This saves a LOT of space because even a 100 byte file uses a whole
echo cluster which is often at least 4kb or on large hard disks without FAT32
echo even up to 32kb. (2files * 31kbWastePerFile * 300 locations = 19Mb savings!)
echo.
echo %FY%Press a key to view trouble shooting information.
pause >nul
cls
echo %BOLD%%FY%------------------- Trouble Shooting --------------------%RS%%FG%
echo Things that can go wrong:
echo %FB%1)%FG% - When you start the game you see a message like
echo  "Insufficient space in environment" 
echo  This means that there's not enough space to assign environment
echo  variables. Start the game with START.BAT instead of MAIN.BAT.
echo  START.BAT starts a new instance of COMMAND.COM with more environment space
echo %FB%2)%FG% - "An error occurred! Errormessage"
echo  This means an error occurred during initialisation. 
echo  probably due to a missing file. Check if basedir is set correctly 
echo  in CONFIG.DAT.
echo %FB%3)%FG% - "File not found."
echo  This means that a game file is missing. Probably an Init.bat or a 
echo  Roomdesc.Bat in the room you want to enter.
echo %FB%4)%FG% - You start the game and see funny looking arrows followed by a '[' and
echo  a few letter codes.
echo  This means Ansi is set to ON in CONFIG.BAT, but ANSI.SYS is not loaded, or
echo  your PC does not support Ansi. Load the ANSI.SYS file, or set Ansi to Off in
echo  the CONFIG.BAT file.
echo.
echo %FY%Press a key to return to the main menu.
pause >nul
goto menu

REM *************  SAVE  ****************************
:menusave
cls
if exist %basedir%\save.bat del %basedir%\save.bat
if exist %basedir%\save.bat goto nosave1
echo set curroom=%curroom%>%basedir%\save.bat
if not exist %basedir%\save.bat goto nosave2
echo Game is saved. 
goto begin
:nosave1
echo The game cannot be saved.
echo The current savegame (%basedir%\save.bat) cannot be overwritten.
goto begin
:nosave2
echo The game cannot be saved.
echo The file %basedir%\save.bat cannot be made.
goto begin

REM *************  LOAD  ****************************
:menuload
cls
if not exist %basedir%\save.bat got cantload
set dummy=%curroom%
call %basedir%\save.bat
if %curroom%PLUK==PLUK goto illisave
if not exist %basedir%\%curroom%\nul goto illisave
echo Game is loaded.
goto begin
:illisave
echo Illegal savegame.
echo Game is continued
set curroom=%dummy%
goto begin
:cantload
echo No savegame is found.
echo Game is continued.
goto begin
:menuquit
goto end

REM *************  CONTINUE  ****************************
:menucontinue
cls
echo. Continuing game...%FW%
goto begin

REM ********** N O R T H *********
:north
cls
if %north%PLUK==PLUK goto notnorth
rem cd %basedir%\%north%
set curroom=%north%
goto begin
:notnorth
echo. You can't go north here %beep%
goto begin
REM ************ S O U T H *******
:south
cls
if %south%PLUK==PLUK goto notsouth
rem cd %basedir%\%south%
set curroom=%south%
goto begin
:notsouth
echo. You can't go south here %beep%
goto begin
REM ************* E A S T ********
:east
cls
if %east%PLUK==PLUK goto noteast
rem cd %basedir%\%east%
set curroom=%east%
goto begin
:noteast
echo. You can't go east here %beep%
goto begin
REM *********** W E S T **********
:west
cls
if %west%PLUK==PLUK goto notwest
rem cd %basedir%\%west%
set curroom=%west%
goto begin
:notwest
echo. You can't go west here %beep%
goto begin
REM ************ U P *************
:up
cls
if %up%PLUK==PLUK goto notup
rem cd %basedir%\%up%
set curroom=%up%
goto begin
:notup
echo. You can't go up here %beep%
goto begin
REM ************ D O W N *********
:down
cls
if %down%PLUK==PLUK goto notdown
rem cd %basedir%\%down%
set curroom=%down%
goto begin
:notdown
echo. You can't go down here %beep%
goto begin
REM *********** I N **************
:in
cls
if %in%PLUK==PLUK goto notin
set curroom=%in%
goto begin
:notin
echo. You can't go in here %beep%
goto begin

REM *********************** ERROR 1 *************************************
REM ******* Error1: File or directory not found: Game Incomplete ********
:error1
echo.
echo File not found. Game incomplete. Terminating...%alarm%%alarm%
echo.
echo Press a key to quit...
pause>nul
goto end
REM **************** Environment Space Error ****************************
REM ***** Occurs when there's not enough space to declare variables *****
:ESError
echo. 
echo Not enough space to declare variables.
echo Please start the game with Start.bat instead of Main.bat or change the
echo amount of space in Start.bat
echo.%alarm%%alarm%
echo Press a key to quit...
pause>nul
goto end
REM ***************** I N P U T ******************************************
REM *** This routine allowes the user to type a word behind the prompt  **
REM *** defined by %inputprompt%. The word typed is stored in %input%   **
REM **********************************************************************
:getinput
REM if not %ansi%PLUK==onPLUK cls
echo.
set input=
set oldprompt=%inputprompt%
:startofinput
if not %ansi%PLUK==onPLUK cls
if %ansi%PLUK==onPLUK echo %ESC%[2A
choice /c:abcdefghijklmnopqrstuvwxyz%BACKS%.%ESC% /n %inputprompt%
if errorlevel 255 goto startofinput
if errorlevel 29 goto Escpressed
if errorlevel 28 goto Dotpressed
if errorlevel 27 goto Backpressed
if errorlevel 26 goto Zpressed
if errorlevel 25 goto Ypressed
if errorlevel 24 goto Xpressed
if errorlevel 23 goto Wpressed
if errorlevel 22 goto Vpressed
if errorlevel 21 goto Upressed
if errorlevel 20 goto Tpressed
if errorlevel 19 goto Spressed
if errorlevel 18 goto Rpressed
if errorlevel 17 goto Qpressed
if errorlevel 16 goto Ppressed
if errorlevel 15 goto Opressed
if errorlevel 14 goto Npressed
if errorlevel 13 goto Mpressed
if errorlevel 12 goto Lpressed
if errorlevel 11 goto Kpressed
if errorlevel 10 goto Jpressed
if errorlevel 9 goto Ipressed
if errorlevel 8 goto Hpressed
if errorlevel 7 goto Gpressed
if errorlevel 6 goto Fpressed
if errorlevel 5 goto Epressed
if errorlevel 4 goto Dpressed
if errorlevel 3 goto Cpressed
if errorlevel 2 goto Bpressed
if errorlevel 1 goto Apressed
if errorlevel 0 goto endofinput
goto startofinput
:Apressed
set input=%input%A
set inputprompt=%inputprompt%A
goto startofinput
:Bpressed
set input=%input%B
set inputprompt=%inputprompt%B
goto startofinput
:Cpressed
set input=%input%C
set inputprompt=%inputprompt%C
goto startofinput
:Dpressed
set input=%input%D
set inputprompt=%inputprompt%D
goto startofinput
:Epressed
set input=%input%E
set inputprompt=%inputprompt%E
goto startofinput
:Fpressed
set input=%input%F
set inputprompt=%inputprompt%F
goto startofinput
:Gpressed
set input=%input%G
set inputprompt=%inputprompt%G
goto startofinput
:Hpressed
set input=%input%H
set inputprompt=%inputprompt%H
goto startofinput
:Ipressed
set input=%input%I
set inputprompt=%inputprompt%I
goto startofinput
:Jpressed
set input=%input%J
set inputprompt=%inputprompt%J
goto startofinput
:Kpressed
set input=%input%K
set inputprompt=%inputprompt%K
goto startofinput
:Lpressed
set input=%input%L
set inputprompt=%inputprompt%L
goto startofinput
:Mpressed
set input=%input%M
set inputprompt=%inputprompt%M
goto startofinput
:Npressed
set input=%input%N
set inputprompt=%inputprompt%N
goto startofinput
:Opressed
set input=%input%O
set inputprompt=%inputprompt%O
goto startofinput
:Ppressed
set input=%input%P
set inputprompt=%inputprompt%P
goto startofinput
:Qpressed
set input=%input%Q
set inputprompt=%inputprompt%Q
goto startofinput
:Rpressed
set input=%input%R
set inputprompt=%inputprompt%R
goto startofinput
:Spressed
set input=%input%S
set inputprompt=%inputprompt%S
goto startofinput
:Tpressed
set input=%input%T
set inputprompt=%inputprompt%T
goto startofinput
:Upressed
set input=%input%U
set inputprompt=%inputprompt%U
goto startofinput
:Vpressed
set input=%input%V
set inputprompt=%inputprompt%V
goto startofinput
:Wpressed
set input=%input%W
set inputprompt=%inputprompt%W
goto startofinput
:Xpressed
set input=%input%X
set inputprompt=%inputprompt%X
goto startofinput
:Ypressed
set input=%input%Y
set inputprompt=%inputprompt%Y
goto startofinput
:Zpressed
set input=%input%Z
set inputprompt=%inputprompt%Z
goto startofinput
:Escpressed
set input=
:Dotpressed
goto endofinput

:Backpressed
set input=
set inputprompt=%oldprompt%
if %ansi%PLUK==onPLUK echo %ESC%[1A                                                                                .%ESC%[1A
goto startofinput

:endofinput
goto %continue%

REM ************ECHO ON/OFF DEBUG OPTION **************
:echooff
echo off
cls
goto begin
:echoon
echo on
cls
goto begin

REM ************** A B O R T on error ********************
:abort
echo An error occurred.
if %abort%==file echo A file cannot be found, deleted or moved.
if %abort%==config echo Configuration file CONFIG.BAT not found.
if %abort%==ansi echo Configuration file ANSI.BAT not found.
echo.
echo Press a key to quit...%alarm%%alarm%
pause>nul
goto end
REM ************* End of game ****************************
:end
REM /// SAVE LOCATION
if not %curroom%PLUK==PLUK echo set curroom=%curroom%>location.bat
if not %ansi%PLUK==onPLUK goto skipreset
REM Reset Enter key
echo %ESC%[13;13p
REM Reset Arrowkeys
echo %ESC%[224;72;224;72p%ESC%[0;72;0;72p
echo %ESC%[224;75;224;75p%ESC%[0;75;0;75p
echo %ESC%[224;77;224;77p%ESC%[0;77;0;77p
echo %ESC%[224;80;224;80p%ESC%[0;80;0;80p
REM Reset PgUp/PgDn
echo %ESC%[224;73;224;73p%ESC%[0;73;0;73p
echo %ESC%[224;81;224;81p%ESC%[0;81;0;81p
:skipreset
REM This resets the varables that were defined in the game.
set nclr=
set sclr=
set eclr=
set wclr=
set uclr=
set dclr=
set iclr=
set oldprompt=
set inputprompt=
set input=
set north=
set south=
set east=
set west=
set up=
set down=
set in=
set close=
set reinit=
set skipdesc=
set curroom=
set basedir=
set ansi=
set continue=
set abort=
set dummy=
set dir=
set esc=
set alarm=
set backs=
REM Reset display
set ansi=
call ansi
echo Game is terminated normally.
