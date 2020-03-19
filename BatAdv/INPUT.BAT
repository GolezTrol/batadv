REM ************** I N P U T **************************************
REM This routine allowes the user to type as word behind the prompt
REM defined by %inputprompt%. The word typed is stored in %input%
REM ***************************************************************
set input=
set oldprompt=%inputprompt%
:begin
cls
rem echo.%input%
choice /c:abcdefghijklmnopqrstuvwxyz. /n %inputprompt%
rem choice /c:abcdefghijklmnopqrstuvwxyz. /n %inputprompt%
if errorlevel 255 goto begin
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
goto begin
:Apressed
set input=%input%A
set inputprompt=%inputprompt%A
goto begin
:Bpressed
set input=%input%B
set inputprompt=%inputprompt%B
goto begin
:Cpressed
set input=%input%C
set inputprompt=%inputprompt%C
goto begin
:Dpressed
set input=%input%D
set inputprompt=%inputprompt%D
goto begin
:Epressed
set input=%input%E
set inputprompt=%inputprompt%E
goto begin
:Fpressed
set input=%input%F
set inputprompt=%inputprompt%F
goto begin
:Gpressed
set input=%input%G
set inputprompt=%inputprompt%G
goto begin
:Hpressed
set input=%input%H
set inputprompt=%inputprompt%H
goto begin
:Ipressed
set input=%input%I
set inputprompt=%inputprompt%I
goto begin
:Jpressed
set input=%input%J
set inputprompt=%inputprompt%J
goto begin
:Kpressed
set input=%input%K
set inputprompt=%inputprompt%K
goto begin
:Lpressed
set input=%input%L
set inputprompt=%inputprompt%L
goto begin
:Mpressed
set input=%input%M
set inputprompt=%inputprompt%M
goto begin
:Npressed
set input=%input%N
set inputprompt=%inputprompt%N
goto begin
:Opressed
set input=%input%O
set inputprompt=%inputprompt%O
goto begin
:Ppressed
set input=%input%P
set inputprompt=%inputprompt%P
goto begin
:Qpressed
set input=%input%Q
set inputprompt=%inputprompt%Q
goto begin
:Rpressed
set input=%input%R
set inputprompt=%inputprompt%R
goto begin
:Spressed
set input=%input%S
set inputprompt=%inputprompt%S
goto begin
:Tpressed
set input=%input%T
set inputprompt=%inputprompt%T
goto begin
:Upressed
set input=%input%U
set inputprompt=%inputprompt%U
goto begin
:Vpressed
set input=%input%V
set inputprompt=%inputprompt%V
goto begin
:Wpressed
set input=%input%W
set inputprompt=%inputprompt%W
goto begin
:Xpressed
set input=%input%X
set inputprompt=%inputprompt%X
goto begin
:Ypressed
set input=%input%Y
set inputprompt=%inputprompt%Y
goto begin
:Zpressed
set input=%input%Z
set inputprompt=%inputprompt%Z
goto begin
:Dotpressed
:Escpressed
rem echo. Bevestiging dmv. Escape
goto endofinput

:Backpressed
set input=
set inputprompt=%oldprompt%
goto begin

:endofinput
rem echo.%input%
