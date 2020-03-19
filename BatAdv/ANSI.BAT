REM Set ANSI display codes if ansi=on

if %ansi%PLUK==ONPLUK goto setit
if %ansi%PLUK==onPLUK goto setit
if %ansi%PLUK==OnPLUK goto setit
if %ansi%PLUK==oNPLUK goto setit

set ansi=
set fbl=
set fr=
set fg=
set fy=
set fb=
set fm=
set fc=
set fw=

set bbl=
set br=
set bg=
set by=
set bb=
set bm=
set bc=
set bw=

set rs=
set bold=
set blink=
set reverse=

set rcur=
set scur=
set mode3=

REM Reset video
echo [3h[0m
cls
goto end


:setit
set ansi=on
REM Set ANSI display codes if ansi=on
set fbl=[30m
set fr=[31m
set fg=[32m
set fy=[33m
set fb=[34m
set fm=[35m
set fc=[36m
set fw=[37m

set bbl=[40m
set br=[41m
set bg=[42m
set by=[43m
set bb=[44m
set bm=[45m
set bc=[46m
set bw=[47m

set rs=[0m
set bold=[1m
set blink=[5m
set reverse=[7m

set rcur=[s
set scur=[u
set mode3=[3h

:end

