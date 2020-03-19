'SHELL "dir roomdesc.dat /s/b>loc.dat"
OPEN "loc.dat" FOR INPUT AS #1

DO
   INPUT #1, loc$
   loc2$ = LEFT$(loc$, LEN(loc$) - 3) + "BAT"
   PRINT "Converteren van: "; loc$; " naar "; loc2$
  
   OPEN loc$ FOR INPUT AS #2
   OPEN loc2$ FOR OUTPUT AS #3
   
   DO
      INPUT #2, l$
      IF LTRIM$(RTRIM$(l$)) <> "" THEN
         l$ = "echo " + l$
         PRINT #3, l$
      END IF
   LOOP UNTIL EOF(2)
  
   CLOSE #3
   CLOSE #2
LOOP UNTIL EOF(1)

CLOSE #1
END

skip:
RESUME NEXT

