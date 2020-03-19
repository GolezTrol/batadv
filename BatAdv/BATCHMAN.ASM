; DADA dada DADA dada DADA dada ... BATCHMAN!
;-----------------------------------------------;
;  BATCHMAN * PC Magazine * Michael J. Mefford  ;
;  Batch file enhancer.                         ;
;-----------------------------------------------;

BIOS_DATA      SEGMENT AT 40H
               ORG     1AH
BUFFER_HEAD    DW      ?
BUFFER_TAIL    DW      ?
               ORG     80H
BUFFER_START   DW      ?
BUFFER_END     DW      ?
BIOS_DATA      ENDS

BOOT_SEG       SEGMENT AT 0FFFFH
RESET          LABEL   WORD
               ORG     05H
DATE_STAMP     DB      ?
BOOT_SEG       ENDS

_TEXT          SEGMENT PUBLIC 'CODE'
               ASSUME  CS:_TEXT,DS:_TEXT,ES:_TEXT,SS:_TEXT
               ORG     100H
START:         JMP     MAIN

;              DATA AREA
;              ---------
               DB      CR,SPACE,SPACE,SPACE,CR,LF

COPYRIGHT      DB      "BATCHMAN 1.1 (C) 1989 Ziff Communications Co. ",BOX
BATCHMAN_DATA  LABEL   BYTE
PROGRAMMER     DB      " PC Magazine ",BOX," Michael J. Mefford",CR,CR,CR

DB 3 DUP (TAB),"SOCK!  KRUNCH!  BANG!  BOOM!  ZOWIE! ... BATCHMAN!",CR,CR
DB 3 DUP (TAB),"Syntax: BATCHMAN [command] [arguments] [/R]",CR,CR
DB 4 DUP (TAB),"/R = Display ErrorLevel",CR,CR
DB 5 DUP (TAB),"Commands",CR
DB 5 DUP (TAB),"~~~~~~~~",CR,CR
DB 4 DUP (TAB),"EL = DOS ErrorLevel",CR,0

HELP1          LABEL   BYTE
DB " CLS [nn]  nn[H]=color H=hex",9,9,"CECHO [C] [nn,]string  nn=color;C=no CR"
DB CR
DB " SETLOOP n  n=loops (0-255)",9,9,"DEC  decrements SETLOOP  EL=SETLOOP",CR
DB " QFORMAT [d:] [N] d:=A: or B: N=No ask",9,"BREAK  EL=1 if break ON",CR
DB " PUSHPATH  EL=0 if successful",9,9,"POPPATH  EL=0 if successful",CR
DB " ANSI  EL=0 if installed",9,9,"BEEP [m,n[;m,n]...]  m=freq. n=1/18 sec",CR
DB " WAITTIL hh:mm[:ss]",9,9,9,"WAITFOR [mm:]ss",CR
DB " CURSORTYPE m,n  m=start; n=stop line",9,"DRIVEEXIST d:  EL=1 if exist",CR
DB " DIREXIST directory  EL=1 if exist",9,"ISVOL [d:]volume  EL=1 if exist",CR
DB 0

HELP2          LABEL   BYTE
DB " YEAR   EL=year from 1980 (0-199)",9,"MONTH   EL=(1-12)",CR
DB " DAY    EL=(1-31)",9,9,9,"WEEKDAY EL=(0-6) Sun=0; Sat=6",CR
DB " HOUR   EL=(0-23)",9,9,9,"MINUTE  EL=(0-59)",CR
DB " SECOND EL=(0-59)",9,9,9,"VIDEOMODE  EL=(0-19)",CR
DB " ROWS  EL=display rows",9,9,9,"COLS  EL=display columns",CR
DB " SETCURSOR m,n  m=row; n=col",9,9,"E43V50",CR
DB " PRTSC [F]  F=formfeed ",9,9,9,"COMPARE string string  EL=0 if match",CR
DB " CANCOPY filespec [d:]  EL=0 if room to copy",CR,0

HELP3          LABEL   BYTE
DB " WARMBOOT",9,9,9,9,"COLDBOOT",CR
DB " SHIFT ALT | CTRL | SHIFT EL=1 if down",9,"NUMLOCK [ON | OFF]",CR
DB " CAPSLOCK [ON | OFF]",9,9,9,"SCROLLOCK [ON | OFF]",CR
DB " RENDIR old new  EL=0 if successful",9,"ROMDATE  display BIOS date",CR
DB " GETKEY ['string' Fn n] Fn=func key n=scan code EL=pos'n; No list, EL=scan code",CR
DB " DOSVER  EL=x where x=(major*32)+minor; eg. DOS 3.30=(3*32+30)=126",CR
DB " MAINMEM n | R  main memory;  n=K bytes needed; EL=0 if enough; R=report",CR
DB " EXPMEM n | R  expanded memory",9,9,"EXTMEM n | R  extended memory",CR
DB 0

HELP4          LABEL   BYTE
DB " DISPLAY  EL=",9,9,9,9,             "CPU  EL=",CR
DB "  1=MDA         7=VGA mono",9,9,    " 1=8086/8088   3=80286",CR
DB "  2=CGA         8=VGA color",9,9,   " 2=80186       4=80386",CR
DB "  4=EGA color  11=MCGA mono",CR
DB "  5=EGA mono   12=MCGA color",CR
DB "  6=PGS",CR,0

HELP5          LABEL   BYTE
DB " WINDOW m,n,w,h[,c,b]",CR
DB "  m=row; n=col; w=width; h=height; c=color; b= -/= single/double border",CR
DB CR
DB " TYPEMATIC [m,n | N]",CR
DB "  m=typematic rate (0 - 31); larger m=faster rate",CR
DB "  n=initial delay  (0 - 3);  larger n=longer delay",CR
DB "  N=normal:  m=20; n=1",CR
DB "  default:   m=27; n=0",CR,0

DB CTRL_Z

MORE DB 3 DUP (TAB),"any key for more; ESC to quit",CR

PCMAG_LOGO     LABEL   BYTE
DB   218,17 DUP (196),191,CR
DB   195,196,6 DUP (219),220,196,220,5 DUP (219),220,196,180,CR
DB   195,4 DUP (196,3 DUP (219)),196,180,CR
DB   195,4 DUP (196,3 DUP (219)),196,180,CR
DB   195,3 DUP (196,3 DUP (219)),5 DUP (196),180,CR
DB   195,196,6 DUP (219),223,196,3 DUP (219),5 DUP (196),180,CR
DB   195,196,3 DUP (219),5 DUP (196),2 DUP (3 DUP (219),196),180,CR
DB   195,196,3 DUP (219),5 DUP (196),2 DUP (3 DUP (219),196),180,CR
DB   195,196,3 DUP (219),5 DUP (196),223,5 DUP (219),223,196,180,CR
DB   195,17 DUP (196),180,CR
DB   179," M A G A Z I N E ",179,CR
DB   192,17 DUP (196),217,CR,0

DIR_COUNT      =       6                 ;Increase this for more PATH stack.
DIR_SPACE      =       65 + 3
LOOP_COUNT     =       OFFSET BATCHMAN_DATA
CURRENT_DIR    =       LOOP_COUNT + 1
FIRST_DIR      =       CURRENT_DIR + 2
STACK_TOP      =       FIRST_DIR + (DIR_COUNT * DIR_SPACE)
LAST_DIR       =       STACK_TOP - DIR_SPACE

CR             EQU     13
LF             EQU     10
FF             EQU     12
TAB            EQU     9
CTRL_Z         EQU     26
SPACE          EQU     32
BOX            EQU     254
DOUBLE_QUOTE   EQU     34
SINGLE_QUOTE   EQU     39
COMMA          EQU     ","
ESC_SCAN       EQU     1
Y_SCAN         EQU     15H
ENTER_SCAN     EQU     1CH
WHITE_ON_BLACK EQU     07H
BLACK_ON_WHITE EQU     70H
WHITE_ON_BLUE  EQU     17H
BLUE_ON_WHITE  EQU     71H
INTENSE_ON_RED EQU     4FH
INTENSE        EQU     0FH

REPEAT_MAX     EQU     31
REPEAT_NORMAL  EQU     REPEAT_MAX - 20
REPEAT_DEFAULT EQU     27
INIT_MAX       EQU     3
INIT_NORMAL    EQU     1
INIT_DEFAULT   EQU     0

BIOS_ACTIVE_PAGE       EQU     62H
ACTIVE_PAGE    DB      ?
BIOS_CRT_MODE          EQU     49H
CRT_MODE       DB      ?
CRT_COLS       DW      ?
CRT_LEN        DW      ?
CRT_START      DW      ?
CRT_DATA_LENGTH        EQU     $ - CRT_MODE
CURSOR_POSN    LABEL   WORD
CURSOR_COL     DB      ?
CURSOR_ROW     DB      ?
BIOS_CRT_ROWS  EQU     84H
CRT_ROWS       DB      ?

DOS_VERSION    LABEL   WORD
DOS_MAJOR      DB      ?
DOS_MINOR      DB      ?
REPORT_FLAG    DB      0                       ;Equals 1 if Echo EL to CON.
TSR            DB      0                       ;Equals 1 if need to TSR data.
DATA_SEG       DW      0                       ;Non-zero if data resident.
CURSOR_FLAG    DB      0                       ;Set to 1 if CECHO skips CR.

CHAR_CNT       DW      0                       ;Count of GETKEY character keys.
FUNC_CNT       DW      0                       ;Count of GETKEY function keys.
KBD_TYPE       DB      0                       ;0=standard KBD; 10h=extended.

ALT	       DB      "ALT"
CTRL	       DB      "CTRL"
SHFT	       DB      "SHIFT"
KBD_FLAG       EQU     17H
CTRL_SHIFT     EQU     04H
ALT_SHIFT      EQU     08H
SHIFT_SHIFT    EQU     03H
SCROLL_STATE   EQU     10H
NUM_STATE      EQU     20H
CAPS_STATE     EQU     40H

DRIVE          DB      ?
SECTOR         DW      ?
FAT_BYTES      DW      ?

SPACES         DB      7 DUP (SPACE)
SINGLE_BOX     DB      218,196,191,179,192,196,217
DOUBLE_BOX     DB      201,205,187,186,200,205,188
WIN_WIDTH      DW      ?
WIN_HEIGHT     DW      ?
WIN_CURSOR     DW      ?

MATCHING       STRUC
RESERVED       DB      21 DUP (?)
ATTRIBUTE      DB              ?
FILE_TIME      DW              ?
FILE_DATE      DW              ?
SIZE_LOW       DW              ?
SIZE_HIGH      DW              ?
FILE_NAME      DB      13 DUP (?)
MATCHING       ENDS

C_NOTE         EQU     1046
CON            DB      "CON"
CON_OFFSET     EQU     10
ANSICOM        DB      CR,SPACE,SPACE,SPACE,CR,LF,"ANSI"
ANSICOM_LENGTH EQU     $ - ANSICOM
EMM            DB      "EMMXXXX0"
EMM_LENGTH     EQU     $ - EMM
BYTES_FREE     DB      "K Bytes free",CR,LF,"$"
ON             DB      "ON"
OFF            DB      "OFF"

FORMAT_PROMPT1 DB CR,LF,"WARNING: All data of drive $"
FORMAT_PROMPT2 DB " will be permanently lost.",CR,LF
               DB "Do you wish to continue?  Y/N$"
FORMAT_PROMPT3 DB CR,LF,"Place the disk you wish to Quick Format in drive $"
FORMAT_PROMPT4 DB " and press Enter.",CR,LF
               DB "Note: the disk must have been previously formatted by DOS$"

COMMANDS LABEL BYTE; Format: length,"command"
DB 3,"CLS",        5,"CECHO",      8,"PUSHPATH",   7,"POPPATH",    7,"SETLOOP"
DB 3,"DEC",        7,"QFORMAT",    7,"WEEKDAY",    3,"DAY",        5,"MONTH"
DB 4,"YEAR",       4,"HOUR",       6,"MINUTE",     6,"SECOND",     5,"BREAK"
DB 4,"ROWS",       4,"COLS",       9,"VIDEOMODE",  7,"COMPARE",    7,"CANCOPY"
DB 9,"SETCURSOR",  8,"WARMBOOT",   8,"COLDBOOT",   4,"BEEP",       4,"ANSI"
DB 3,"CPU",        7,"DISPLAY",    7,"MAINMEM",    6,"EXTMEM",     6,"EXPMEM"
DB 7,"WAITFOR",    7,"WAITTIL",    6,"GETKEY",     5,"SHIFT",      9,"SCROLLOCK"
DB 7,"NUMLOCK",    8,"CAPSLOCK",  10,"DRIVEEXIST", 5,"ISVOL",      8,"DIREXIST"
DB 9,"TYPEMATIC", 10,"CURSORTYPE", 5,"PRTSC",      6,"DOSVER",     6,"WINDOW"
DB 7,"ROMDATE",    6,"RENDIR",     6,"E43V50"
DB   0

DISPATCH_TABLE LABEL WORD
DW    CLS,            CECHO,          PUSHPATH,       POPPATH,        SETLOOP
DW    DECLOOP,        QFORMAT,        WEEKDAY,        DAY,            MONTH
DW    YEAR,           HOUR,           MINUTE,         SECOND,         BREAK
DW    ROWS,           COLS,           VIDEOMODE,      COMPARE,        CANCOPY
DW    SETCURSOR,      WARMBOOT,       COLDBOOT,       BEEP,           ANSI
DW    CPU,            DISPLAYS,       MAINMEM,        EXTMEM,         EXPMEM
DW    WAITFOR,        WAITTIL,        GETKEY,         SHIFT,          SCROLLOCK
DW    NUMLOCK,        CAPSLOCK,       DRIVEEXIST,     ISVOL,          DIREXIST
DW    TYPEMATIC,      CURSORTYPE,     PRTSC,          DOSVER,         WINDOW
DW    ROMDATE,        RENDIR,         E43V50

TWELVE_BIT_FAT         EQU     4087

BOOT_SECTOR            STRUC
JUMP                   DB      3 DUP(?)
OEM                    DB      8 DUP(?)
BYTES_PER_SECTOR       DW      ?
SECTORS_PER_CLUSTER    DB      ?
RESERVED_SECTORS       DW      ?
NUMBER_OF_FATS         DB      ?
ROOT_DIRECTORY_ENTRIES DW      ?
TOTAL_SECTORS          DW      ?
MEDIA_DESCRIPTOR_BYTE  DB      ?
SECTORS_PER_FAT        DW      ?
BOOT_SECTOR            ENDS

;              CODE AREA
;              ---------
MAIN           PROC    NEAR

               CLD                             ;String instructions forward.
               MOV     AH,30H
               INT     21H
               MOV     DOS_VERSION,AX          ;Get DOS version and save.
               MOV     BX,64 / 16 * 1024       ;Minimum of 64K required.
               MOV     AH,4AH                  ;Request via DOS.
               INT     21H
               MOV     AL,1                    ;Assume not available.
               JC      CK_TSR                  ;Exit if not.
               MOV     SP,0FFFEH               ;Else, setup stack at end of seg.
               CALL    GET_BIOS_DATA           ;Get BIOS video data and store.
               MOV     DX,OFFSET DTA           ;Set Disk Transfer Address at
               MOV     AH,1AH                  ; end of code so user parameters
               INT     21H                     ; not spoiled by DOS calls.

               MOV     SI,81H                  ;Point to parameters.
NEXT_SWITCH:   LODSB                           ;Get a byte.
               CMP     AL,CR                   ;End?
               JZ      PARSE                   ;If yes, done here.
               CMP     AL,"/"                  ;Else, switch character?
               JNZ     NEXT_SWITCH             ;If no, check next byte.
               LODSB                           ;Else, get the char.
               AND     AL,5FH                  ;Capitalize.
               CMP     AL,"R"                  ;Is it /Report errorlevel switch?
               JNZ     PARSE                   ;If no, done here.
               MOV     REPORT_FLAG,1           ;Else, flag report for exit.

PARSE:         MOV     SI,81H                  ;Point to parameters again.
               CALL    PARSE_DELIMIT           ;Parse off any delimiting chars.
               MOV     BP,SI                   ;Save start of COMMAND.
               CALL    CAPITALIZE              ;Capitalize COMMAND.

               XOR     CX,CX                   ;COMMAND length offset index.
               XOR     BX,BX                   ;COMMAND dispatch index.
               MOV     SI,OFFSET COMMANDS      ;COMMAND table pointer.
NEXT_COMMAND:  INC     BX                      ;Add two for word offset.
               INC     BX
               ADD     SI,CX                   ;Add length to COMMAND pointer.
               MOV     DI,BP                   ;Point to user requested COMMAND.
               LODSB                           ;Get COMMAND length.
               OR      AL,AL                   ;End of legal COMMANDs?
               JZ      HELP_EXIT               ;If yes, exit with help msgs.
               MOV     CL,AL                   ;Else, length in CX.
               REPZ    CMPSB                   ;Compare COMMAND table with entry
               JNZ     NEXT_COMMAND            ;If no match, try next command.
               MOV     SI,DI                   ;Else, match; SI gets pointer.
FIND_DELIMIT:  LODSB                           ;Parse off any COMMAND trailing
               CMP     AL,SPACE                ; chars.
               JA      FIND_DELIMIT
               DEC     SI                      ;Adjust pointer.
               CALL    PARSE_DELIMIT           ;Parse off any delimiting chars.
               CALL    DISPATCH_TABLE[BX - 2]  ;Call the command function.
               JMP     SHORT CK_REPORT         ;Check ErrorLevel report flag.

HELP_EXIT:     CALL    DISPLAY_HELP            ;Display list of valid COMMANDS.
               XOR     AL,AL                   ;ErrorLevel = 0

CK_REPORT:     PUSH    CS                      ;Restore data segment.
               POP     DS
               CMP     REPORT_FLAG,1           ;ErrorLevel flag set?
               JNZ     CK_TSR                  ;If no, done here.
               XOR     AH,AH                   ;Else, zero in high half.
               CALL    DEC_OUTPUT              ;Display the ErrorLevel.

CK_TSR:        PUSH    AX                      ;Preserve ErrorLevel.
               CMP     TSR,1                   ;Are we to remain resident?
               JNZ     CK_RELEASE              ;If no, done here.
               MOV     AX,DS:[2CH]             ;Else, get environment segment.
               MOV     ES,AX
               MOV     AH,49H                  ;Free up environment.
               INT     21H

               MOV     DX,OFFSET STACK_TOP     ;Resident PATH stack top.
               ADD     DX,15                   ;Round up to paragraph.
               MOV     CL,4
               SHR     DX,CL                   ;Convert to paragraphs.
               POP     AX                      ;Retrieve ErrorLevel.
               MOV     AH,31H
               INT     21H                     ;Terminate but stay resident.

CK_RELEASE:    CMP     DATA_SEG,0              ;Did we find our resident data?
               JZ      EXIT                        ;If no, done here.
               CMP     ES:WORD PTR CURRENT_DIR,0   ;Else, PATH stack empty?
               JNZ     EXIT                        ;If no, exit.
               CMP     ES:BYTE PTR LOOP_COUNT,0    ;Else, LOOP counter zero?
               JNZ     EXIT                        ;If no, exit.

RELEASE:       MOV     AH,49H                  ;Else, release resident data
               INT     21H                     ; back to memory pool.

EXIT:          POP     AX                      ;Retrieve ErrorLevel.
               MOV     AH,4CH                  ;Terminate.
               INT     21H

MAIN           ENDP

; C * O * M * M * A * N * D * S

CLS:           CALL    GET_COLOR
               CALL    FIND_HEX                ;Get argument.
               JNZ     DO_CLS
               MOV     AL,BL                   ;Use cursor color.
DO_CLS:        MOV     BH,AL                   ;Attribute.
               XOR     AL,AL                   ;Scroll entire window.
               XOR     CX,CX                   ;Top left corner.
               MOV     DH,CRT_ROWS             ;Bottom right row and
               MOV     DL,BYTE PTR CRT_COLS    ; column.
               DEC     DL                      ;Adjust logic.
               MOV     AH,6                    ;Scroll active page.
               INT     10H
               XOR     DX,DX                   ;Home the cursor.
               MOV     CURSOR_POSN,DX          ;Save it.
               CALL    SET_CURSOR
               XOR     AL,AL                   ;EL = 0.
               RET

GET_COLOR:     XOR     BH,BH
               MOV     AH,8
               INT     10H
               MOV     BL,AH
               RET

;----------------------------------------------;
CECHO:         MOV     AL,BYTE PTR [SI]
               AND     AL,5FH
               CMP     AL,"C"
               JNZ     CECHO_COLOR
               CMP     BYTE PTR [SI + 1],SPACE
               JA      CECHO_COLOR
               INC     SI
               INC     SI
               MOV     CURSOR_FLAG,1           ;Else, flag skip CR,LF.
CECHO_COLOR:   CALL    GET_COLOR
               CALL    FIND_HEX
               JZ      DO_CECHO
               MOV     BL,AL                   ;Store in BL as color.
               INC     SI
DO_CECHO:      MOV     DX,CURSOR_POSN          ;Retrieve cursor position.
NEXT_STRING:   LODSB                           ;Get a string byte.
               CMP     AL,CR                   ;End of string?
               JZ      COLOR_DONE              ;If yes, done here.
               MOV     CX,1                    ;Else, one char to write.
               CMP     AL,TAB                  ;Is character a TAB?
               JNZ     DO_CHAR                 ;If no, process normally.
               MOV     CX,DX                   ;Else, expand TAB to
               AND     CX,7                    ; appropriate space characters.
               NEG     CX
               ADD     CX,8
NEXT_CHAR:     MOV     AL,SPACE                ;And tab over with spaces.
DO_CHAR:       CALL    ATTRIB_CHAR
               LOOP    DO_CHAR
               JMP     NEXT_STRING

ATTRIB_CHAR:   PUSH    CX
               MOV     BH,ACTIVE_PAGE          ;Active video page.
               MOV     CX,1                    ;Write Attribute/Character
               MOV     AH,9                    ; at current cursor position
               INT     10H                     ; via BIOS.
               CALL    CK_ROW                  ;See if line wrap.
               POP     CX
               RET


COLOR_DONE:    CMP     CURSOR_FLAG,1           ;Should we move cursor to new
               JZ      COLOR_END               ; line?  If no, done here.
               MOV     DL,254                  ;Else, fake large column length.
CK_ROW:        INC     DL                      ;Next column.
               CMP     DL,BYTE PTR CRT_COLS    ;Last video displayable columns?
               JB      MOVE_CURSOR             ;If no, move cursor right.
               INC     DH                      ;Else, next row.
               XOR     DL,DL                   ;First column.
               CMP     DH,CRT_ROWS             ;Bottom of displayable rows?
               JBE     MOVE_CURSOR             ;If no, move cursor down.
               CMP     CURSOR_FLAG,1
               JZ      COLOR_END
               DEC     DH                      ;Else, stay on last row.
               PUSH    DX                      ;Save it.
               XOR     CX,CX                   ;Top left.
               MOV     DL,BYTE PTR CRT_COLS    ;Bottom right.
               MOV     BH,WHITE_ON_BLACK
               MOV     AX,601H
               INT     10H
               POP     DX
MOVE_CURSOR:   CALL    SET_CURSOR              ;Else set cursor to new position.
COLOR_END:     XOR     AL,AL                   ;EL = 0.
               RET

;----------------------------------------------;
PUSHPATH:      CALL    CK_BAT_DATA             ;Search for our resident data.
               PUSH    ES                      ;DS = ES.
               POP     DS
               MOV     SI,[CURRENT_DIR]        ;Get pointer to last PUSH.
               OR      SI,SI                   ;Is this the first?
               JNZ     FIND_IT                 ;If no, find end of last.
               MOV     SI,OFFSET FIRST_DIR     ;Else, use storage start.
               JMP     SHORT GOT_SPACE
FIND_IT:       INC     SI                      ;Adjust.
FIND_PUSH:     LODSB                           ;Look for end.
               OR      AL,AL                   ;Zero marks end.
               JNZ     FIND_PUSH               ;If not end, keep looking.
               CMP     SI,OFFSET LAST_DIR      ;Enough room?
               MOV     AL,1                    ;EL = 1 if fails.
               JAE     PUSHPATH_END            ;If not enough, exit with error.
GOT_SPACE:     MOV     DS:[CURRENT_DIR],SI     ;Else, store new PATH start.
               MOV     DI,SI
               MOV     AH,19H                  ;Get current drive.
               INT     21H
               ADD     AL,"A"                  ;Convert to ASCII.
               STOSB                           ;Store it.
               MOV     AL,"\"                  ;Store root delimiter.
               STOSB
               MOV     SI,DI                   ;Tack on current directory.
               XOR     DL,DL
               MOV     AH,47H
               INT     21H
               PUSH    CS                      ;Restore data segment.
               POP     DS
               CMP     DATA_SEG,0              ;Did we store in resident data?
               JNZ     PUSHPATH_DONE           ;If yes, done here.
               MOV     TSR,1                   ;Else, flag to TSR the data.
PUSHPATH_DONE: XOR     AL,AL                   ;ErrorLevel = 0.
PUSHPATH_END:  RET

;----------------------------------------------;
POPPATH:       CALL    CK_BAT_DATA             ;Search for our resident data.
               PUSH    ES                      ;DS = ES.
               POP     DS
               MOV     SI,[CURRENT_DIR]        ;Get pointer to last PUSH.
               OR      SI,SI                   ;Is there one on the stack?
               MOV     AL,1                    ;Assume no; ErrorLevel = 1.
               JZ      POPPATH_END             ;If none assume right, exit.
               MOV     DL,BYTE PTR [SI]        ;Else, retrieve drive.
               SUB     DL,"A"                  ;Convert to DOS format.
               MOV     AH,0EH                  ;Select disk.
               INT     21H
               MOV     DX,SI
               INC     DX
               MOV     AH,3BH                  ;Change current directory.
               INT     21H
               CMP     SI,OFFSET FIRST_DIR     ;This the last on stack?
               JNZ     GET_POP                 ;If no, pop stack.
               XOR     SI,SI                   ;Else, use zero to flag empty.
               JMP     SHORT SAVE_POP
GET_POP:       DEC     SI                      ;Move point past ending zero
               DEC     SI                      ; of next POP.
               STD                             ;Search backwards of start.
FIND_POP:      LODSB
               OR      AL,AL                   ;Zero marks end.
               JZ      FOUND_POP               ;If found, done.
               CMP     SI,OFFSET FIRST_DIR     ;Else if only POP, done.
               JAE     FIND_POP                ;Else, search until found.
               DEC     SI                      ;Adjust.

FOUND_POP:     INC     SI                      ;Point to start.
               INC     SI
SAVE_POP:      MOV     DS:[CURRENT_DIR],SI     ;Save next POP.
               CLD                             ;Direction flag back forward.
               XOR     AL,AL                   ;ErrorLevel = 0.
POPPATH_END:   RET

;----------------------------------------------;
SETLOOP:       CALL    DECIMAL_INPUT           ;Get argument.
               PUSH    AX                      ;Save it.
               CALL    CK_BAT_DATA             ;Search for our resident data.
               POP     AX                      ;Retrieve argument.
               MOV     ES:[LOOP_COUNT],AL      ;Store loop count request.
               OR      AL,AL                   ;If set to zero, don't TSR.
               JZ      SETLOOP_END
               CMP     DATA_SEG,0              ;Did we find resident data?
               JNZ     SETLOOP_END             ;If yes, done here.
               MOV     TSR,1                   ;Else, flag to TSR.
SETLOOP_END:   XOR     AL,AL                   ;ErrorLevel = 0
               RET

;----------------------------------------------;
DECLOOP:       CALL    CK_BAT_DATA             ;Search for our resident data.
               MOV     AL,ES:BYTE PTR [LOOP_COUNT]  ;Retrieve loop counter.
               OR      AL,AL                        ;Is it zero?
               JZ      DEC_END                      ;If yes, done here.
               DEC     AL                           ;Else, decrement it.
               MOV     ES:BYTE PTR [LOOP_COUNT],AL  ;Store it.
DEC_END:       RET

;----------------------------------------------;
QFORMAT:       XOR     BP,BP                   ;Flag for prompt.
               MOV     AH,19H                  ;Get default drive.
               INT     21H
               ADD     AL,"A"                  ;Convert to ASCII.
               MOV     BL,AL                   ;Save in BL.
NEXT_QFORMAT:  CALL    PARSE_DELIMIT
               CALL    CAPITALIZE
               LODSB
               CMP     AL,SPACE                ;Anything there?
               JBE     CK_DRIVE
               CMP     AL,"N"                  ;No ask switch?
               JNZ     SAVE_DRIVE              ;If no, check drive letter.
               INC     BP                      ;Else, flag no prompt.
               JMP     SHORT NEXT_QFORMAT
SAVE_DRIVE:    MOV     BL,AL                   ;Save drive letter.
               LODSB
               CMP     AL,":"                  ;Drive specifier there?
               JZ      NEXT_QFORMAT            ;If yes, continue
               JMP     FAIL_FORMAT             ;Else, abort.

CK_DRIVE:      CMP     BL,"A"                  ;As safety precaution, abort
               JZ      GOOD_DRIVE              ; if not drive A or B.
               CMP     BL,"B"
               JZ      GOOD_DRIVE
               JMP     FAIL_FORMAT
GOOD_DRIVE:    OR      BP,BP                    ;Should we skip prompt?
               MOV     BP,BX                    ;Save ASCII drive letter.
               JNZ     READ_BOOT                ;If no, skip prompt?
               MOV     DX,OFFSET FORMAT_PROMPT1 ;Display warning.
               CALL    PRINT_STRING
               MOV     DX,BP                    ;And drive letter.
               CALL    PRINT_CHAR
               MOV     DX,OFFSET FORMAT_PROMPT2 ;Rest of warning.
               CALL    PRINT_STRING
               CALL    KEYPRESS                 ;Get a response.
               CMP     AH,Y_SCAN                ;If "Y" yes, continue.
               JZ      ENTER_PROMPT
               JMP     FAIL_FORMAT              ;Else, abort.
ENTER_PROMPT:  MOV     DX,OFFSET FORMAT_PROMPT3 ;Prompt user to place disk in
               CALL    PRINT_STRING             ; drive and press Enter.
               MOV     DX,BP
               CALL    PRINT_CHAR
               MOV     DX,OFFSET FORMAT_PROMPT4
               CALL    PRINT_STRING
               CALL    KEYPRESS                ;Get response.
               CMP     AH,ENTER_SCAN           ;Enter pressed?
               JZ      READ_BOOT               ;If yes, continue.
               JMP     FAIL_FORMAT             ;Else, abort.

READ_BOOT:     SUB     BP,"A"                  ;Convert drive letter to logical.
               MOV     AX,BP
               MOV     DRIVE,AL                ;Save.
               MOV     CX,1                    ;Direct sector read boot sector.
               XOR     DX,DX
               MOV     BX,OFFSET READ_BUFFER
               INT     25H                     ; preserve logical drive.
               POP     AX                      ;Call leaves word on stack; fix.
               JNC     CK_BOOT                 ;If successful read, continue.
LILLY_FAIL:    JMP     FAIL_FORMAT             ;Else, exit with error.

CK_BOOT:       CMP     BYTE PTR READ_BUFFER,0EBH      ;Is first byte short jump?
               JZ      CK_SIGN                        ;If yes, continue.
               CMP     BYTE PTR READ_BUFFER,0E9H      ;Else, is it long jump?
               JNZ     LILLY_FAIL                     ;If no, not valid.
CK_SIGN:       MOV     BX,READ_BUFFER.BYTES_PER_SECTOR
               CMP     WORD PTR READ_BUFFER[BX-2],0AA55H ;Boot sector signature.
               JNZ     LILLY_FAIL
READ_FAT:      MOV     AL,DRIVE                         ;Logical drive.
               MOV     CX,READ_BUFFER.SECTORS_PER_FAT   ;Sectors per FAT.
               CMP     CX,80                            ;If too many sectors
               JBE     FAT_OK                           ; BIOS block no good.
               JMP     FAIL_FORMAT
FAT_OK:        MOV     DX,READ_BUFFER.RESERVED_SECTORS  ;Starting FAT sector.
               MOV     SECTOR,DX                        ;Save starting sector.
               MOV     BX,OFFSET WRITE_BUFFER           ;Storage for FAT.
               INT     25H
               POP     AX
               JNC     ZERO_FAT
               JMP     FAIL_FORMAT

ZERO_FAT:      MOV     AX,READ_BUFFER.SECTORS_PER_FAT
               MUL     READ_BUFFER.BYTES_PER_SECTOR
               MOV     FAT_BYTES,AX                     ;Bytes per sector.

               MOV     CX,FAT_BYTES
               SUB     CX,3                             ;Adjust for descriptors.
               MOV     SI,OFFSET WRITE_BUFFER + 3       ;Skip media descriptor.
               MOV     DI,SI
NEXT_CLUSTER:  LODSW                           ;Get a FAT word.
               MOV     BX,AX                   ;Save it.
               AND     AX,0FFFH                ;Lower 12 bits.
               CMP     AX,0FF7H                ;Is it marked bad?
               JZ      EVEN_CLUSTER            ;If yes, leave it that way.
               AND     BX,0F000H               ;Else, zero lower 12 bits.
               MOV     [DI],BX
EVEN_CLUSTER:  DEC     SI
               INC     DI
               LODSW                           ;Next FAT word.
               MOV     BX,AX
               AND     AX,0FFF0H               ;Do the same except the
               CMP     AX,0FF70H               ; even FAT numbers use
               JZ      LOOP_CLUSTER            ; upper 12 bits.
               AND     BX,0000FH
               MOV     [DI],BX
LOOP_CLUSTER:  INC     DI
               INC     DI
               SUB     CX,3                    ;Do all of FAT.
               JNC     NEXT_CLUSTER

NEXT_FAT:      MOV     AL,DRIVE                         ;Write FAT to disk.
               MOV     CX,READ_BUFFER.SECTORS_PER_FAT
               MOV     DX,SECTOR
               ADD     SECTOR,CX                        ;Next sector to write.
               MOV     BX,OFFSET WRITE_BUFFER
               INT     26H
               POP     AX
               DEC     READ_BUFFER.NUMBER_OF_FATS       ;Do all copies of FAT.
               JNZ     NEXT_FAT

               MOV     AX,READ_BUFFER.ROOT_DIRECTORY_ENTRIES  ;Get root entries.
               CMP     AX,2048
               JAE     FAIL_FORMAT
GET_ENTRIES:   MOV     CL,5                          ;32 bytes/entry.
               SHL     AX,CL                         ;Total bytes for directory.
               MOV     CX,AX                         ;Save.
               XOR     DX,DX                         ;Zero in high half.
               DIV     READ_BUFFER.BYTES_PER_SECTOR  ;Sectors for dirs.
               MOV     BX,AX                         ;Save this.
               XOR     AX,AX                         ;Zeros in directory.
               SHR     CX,1                          ;Divide by two for words.
               MOV     DI,OFFSET WRITE_BUFFER
               REP     STOSW                         ;Zeros in directory.
               MOV     AL,DRIVE
               MOV     CX,BX
               MOV     DX,SECTOR
               MOV     BX,OFFSET WRITE_BUFFER        ;Write directory sectors.
               INT     26H
               POP     AX
               JC      FAIL_FORMAT
               XOR     AL,AL                   ;ErrorLevel = 0.
               JMP     SHORT FORMAT_END

FAIL_FORMAT:   MOV     AL,1                    ;ErrorLevel = 1.
FORMAT_END:    RET

;----------------------------------------------;
WEEKDAY:       CALL    GET_DATE                ;ErrorLevel = (0 - 6).
               RET

DAY:           CALL    GET_DATE                ;ErrorLevel = (1 - 31).
               MOV     AL,DL
               RET

MONTH:         CALL    GET_DATE                ;ErrorLevel = (1- 12).
               MOV     AL,DH
               RET

YEAR:          CALL    GET_DATE
               SUB     CX,1980                 ;Normalize.
               MOV     AL,CL                   ;ErrorLevel = (0 - 199).
               RET

HOUR:          CALL    GET_TIME                ;ErrorLevel = (0 - 23).
               MOV     AL,CH
               RET

MINUTE:        CALL    GET_TIME                ;ErrorLevel = (0- 59).
               MOV     AL,CL
               RET

SECOND:        CALL    GET_TIME                ;ErrorLevel = (0 - 59).
               MOV     AL,DH
               RET

;----------------------------------------------;
BREAK:         MOV     AX,3300H                ;ErrorLevel = 1 if Break ON.
               INT     21H
               MOV     AL,DL
               RET

;----------------------------------------------;
ROWS:          MOV     AL,CRT_ROWS             ;ErrorLevel = displayable rows.
               INC     AL
               RET

COLS:          MOV     AL,BYTE PTR CRT_COLS    ;ErrorLevel = displayable cols.
               RET

VIDEOMODE:     MOV     AL,CRT_MODE             ;ErrorLevel = current video mode.
               RET

SETCURSOR:     CALL    DECIMAL_INPUT           ;Get cursor row position request.
               JZ      SETCURSOR_END           ;If none, exit.
               DEC     AL                      ;Else, logical base zero.
               JS      SETCURSOR_END           ;If zero, exit.
               PUSH    AX                      ;Else, save request.
               CALL    PARSE_DELIMIT           ;Parse delimiters.
               CALL    DECIMAL_INPUT           ;Get columns.
               JZ      SETCURSOR_END           ;If none, exit.
               DEC     AL                      ;Else, logical base zero.
               JS      SETCURSOR_END           ;if zero, exit.
               POP     DX                      ;Retrieve, row.
               MOV     DH,DL
               MOV     DL,AL
               CALL    SET_CURSOR              ;Set cursor position.
               XOR     AL,AL                   ;ErrorLevel = 0.
SETCURSOR_END: RET

;----------------------------------------------;
COLDBOOT:      MOV     AX,40H                  ;Point to BIOS data.
               MOV     DS,AX
               MOV     WORD PTR DS:[72H],0     ;Reset flag = 0.
               JMP     FAR PTR RESET           ;BIOS reset.

;----------------------------------------------;
WARMBOOT:      MOV     AX,40H                  ;Point to BIOS data.
               MOV     DS,AX
               MOV     WORD PTR DS:[72H],1234H ;Reset flag = 1234h.
               JMP     FAR PTR RESET           ;BIOS reset.

;----------------------------------------------;
BEEP:          CALL    PARSE_DELIMIT
               MOV     BX,C_NOTE               ;Default tone frequency divisor.
               CMP     BYTE PTR [SI - 1],COMMA ;Any tone request?
               JZ      BEEP_LENGTH             ;If no, done here.
               CALL    DECIMAL_INPUT           ;Else, get it.
               JZ      BEEP_LENGTH             ;If none, get length.
               MOV     BX,AX                   ;Else, store tone.
BEEP_LENGTH:   CALL    PARSE_DELIMIT           ;Parse delimiters.
               CALL    DECIMAL_INPUT           ;Get length.
               JNZ     DO_BEEP                 ;If go it, beep.
               MOV     AX,1                    ;Else, default of one second.

DO_BEEP:       MOV     BP,AX                   ;Save beep time.
               OR      BP,BP                   ;Zero time?
               JZ      NEXT_BEEP               ;If yes, skip.
               XOR     AX,AX
               MOV     DX,12H                  ;120000h dividend constant.
               CMP     BX,12H
               JBE     NO_BEEP                 ;Avoid division by zero error.
               DIV     BX                      ; Divide to get
               MOV     BX,AX                   ; 8253 countdown.

               MOV     CX,1                    ;One timer tick.
               CALL    DELAY                   ;Wait till clock rolls over.

               MOV     AL,0B6H                 ;Channel 2 speaker functions.
               OUT     43H,AL                  ;8253 Mode Control.
               JMP     $+2                     ;IO delay.
               MOV     AX,BX                   ;Retrieve countdown.
               OUT     42H,AL                  ;Channel 2 LSB.
               JMP     $+2
               MOV     AL,AH                   ;Channel 2 MSB.
               OUT     42H,AL
               IN      AL,61H                  ;Port B.
               OR      AL,3                    ;Turn on speaker.
               JMP     $+2
               OUT     61H,AL

NO_BEEP:       MOV     CX,BP                   ;Number of seconds.
               CALL    DELAY                   ;Delay seconds.
               IN      AL,61H                  ;Get Port B again.
               AND     AL,NOT 3                ;Turn speaker off.
               JMP     $+2
               OUT     61H,AL
NEXT_BEEP:     CMP     BYTE PTR [SI],";"       ;Semicolon delimiter?
               JZ      BEEP                    ;If yes, next tone.
               XOR     AL,AL                   ;ErrorLevel = 0
               RET

;----------------------------------------------;
ANSI:          MOV     AX,3529H                ;Get undocumented INT 29 vector.
               INT     21H
               MOV     SI,OFFSET CON           ;Does it point to ANSI.SYS?
               MOV     DI,CON_OFFSET           ;Check by looking for "CON"
               MOV     CX,3                    ; as device name.
               REPZ    CMPSB
               JZ      FOUND_ANSI              ;If yes, found it.

               MOV     BX,OFFSET ANSICOM       ;Else, look for ANSI.COM.
               XOR     DX,DX                   ;Start at segment zero.
               MOV     AX,CS                   ;Store our segment in AX.
NEXT_SEARCH:   INC     DX                      ;Next paragraph.
               MOV     ES,DX
               CMP     DX,AX                   ;Is it our segment?
               JZ      NOT_FOUND               ;If yes, search is done.
               XOR     DI,DI
               MOV     AL,NOT 0E9H             ;NOT the Long JMP instruction.
               SCASB
               JNZ     NEXT_SEARCH             ;Match?
               MOV     SI,BX                   ;Else, point to ANSI.COM sign.
               INC     DI
               INC     DI
               MOV     CX,ANSICOM_LENGTH       ;Check 10 bytes for match.
               REPZ    CMPSB
               JNZ     NEXT_SEARCH             ;If no match, keep looking.

FOUND_ANSI:    XOR     AL,AL                   ;ErrorLevel = 0.
ANSI_END:      RET

NOT_FOUND:     MOV     AL,1                    ;ErrorLevel = 1.
               RET

;----------------------------------------------;
CPU:           MOV     AL,1                    ;8086/8088
               PUSH    SP
               POP     BX
               CMP     BX,SP                   ;88/86/186 will push SP-2
               JZ      CK_286                  ;286/386 will push SP
               MOV     CL,32                   ;186 uses CL MOD 32.
               SHL     BX,CL
               JZ      CPU_END
               INC     AL                      ;80186
               JMP     SHORT CPU_END

CK_286:        MOV     AL,4                    ;80386
               PUSHF
               MOV     BX,SP
               POPF
               INC     BX
               INC     BX
               CMP     BX,SP                   ;32 or 16 bit push?
               JNZ     CPU_END

               SUB     SP,6
               MOV     BP,SP
DB             0FH,01H,46H,00H                 ;SGDT    QWORD PTR [BP]
               ADD     SP,4                    ;Get Global Descriptor Table.      
               POP     BX
               INC     BH                      ;Third word of GDT = -1
               JNZ     CPU_END                 ; for 286.
               DEC     AL                      ;80286
CPU_END:       RET

;----------------------------------------------;
DISPLAYS:      MOV     AX,1A00H                ;Read Display Combination.
               INT     10H
               CMP     AL,1AH                  ;Supported?
               JNZ     CK_EGA                  ;If no, done here.
               MOV     AL,BL                   ;Else, return display type.
               JMP     SHORT DISPLAY_END

CK_EGA:        MOV     BL,10H                  ;Return EGA information.
               MOV     AH,12H
               INT     10H
               CMP     BL,10H                  ;Supported?
               JZ      CK_CGA                  ;If no, done here.
               MOV     CX,40H
               MOV     ES,CX
               MOV     AL,1                    ;Assume MDA
               TEST    ES:BYTE PTR [87H],8     ;Else, EGA_info; Is it active?
               JNZ     DISPLAY_END             ;If no, assumed right.
               MOV     AL,4                    ;Else, assume EGAcolor.
               OR      BH,BH                   ;Assume right?
               JZ      DISPLAY_END             ;If yes, exit.
               INC     AL                      ;Else, it's gotta be EGAmono.
               JMP     SHORT DISPLAY_END

CK_CGA:        PUSH    DS
               MOV     AX,40H
               MOV     DS,AX                   ;BIOS data area
               MOV     AL,2                    ;Assume CGA.
               CMP     WORD PTR DS:[63H],3D4H  ;ADDR_6845.
               JZ      GOT_ADAPTOR             ;If CGA, guessed right.
               DEC     AL                      ;Else, MDA
GOT_ADAPTOR:   POP     DS
DISPLAY_END:   RET

;----------------------------------------------;
MAINMEM:       XOR     BX,BX                   ;Shrink allocated memory to
               MOV     AH,4AH                  ; zero for current program
               INT     21H                     ; via DOS.
               MOV     AH,48H                  ;Request FFFFh paragraphs of
               MOV     BX,0FFFFH               ; memory. This will fail with
               INT     21H                     ; available paragraphs in BX.
               MOV     CL,6                    ;Divide by 64 to get memory.
               SHR     BX,CL
               CALL    CAPITALIZE
               CMP     BYTE PTR [SI],"R"       ;Was there an argument of "R"?
               JZ      MEMORY_REPORT           ;If yes, display available mem.
               CALL    DECIMAL_INPUT           ;Else, get requested memory.
               JZ      NOT_ENOUGH              ;If zero, fail.
               CMP     BX,AX                   ;Else, compare available with
               JAE     ENOUGH                  ; requested.
               JMP     SHORT NOT_ENOUGH

EXTMEM:        MOV     AX,0FFFFH
               MOV     ES,AX
               MOV     AL,ES:[0EH]             ;Get System ID.
               XOR     BX,BX                   ;Assume none available.
               CMP     AL,0FCH
               JA      EXTMEM_REPORT           ;If PC, XT or PCjr, not supported
               JZ      GET_EXT                 ;If AT, get extended.
               CMP     AL,0F9H                 ;If PC Convert., Mod 30, ignore.
               JAE     EXTMEM_REPORT
GET_EXT:       MOV     AH,88H                  ;Retrieve extended.
               INT     15H
               MOV     BX,AX                   ;Store in BX.
EXTMEM_REPORT: CALL    CAPITALIZE
               CMP     BYTE PTR [SI],"R"       ;If R argument, display available
               JZ      MEMORY_REPORT
               CALL    DECIMAL_INPUT           ;Else, get requested.
               JZ      NOT_ENOUGH              ;If zero, not enough.
               CMP     BX,AX                   ;Else, compare requested with
               JAE     ENOUGH                  ; available.
               JMP     SHORT NOT_ENOUGH

EXPMEM:        MOV     AX,3567H                ;Retrieve EMM interrupt vector.
               INT     21H
               XOR     BX,BX                   ;Assume no memory.
               MOV     DI,0AH                  ;See if offset 10 of vector
               PUSH    SI
               MOV     SI,OFFSET EMM           ; points to EMMXXXX0.
               MOV     CX,EMM_LENGTH
               REPZ    CMPSB
               POP     SI
               JNZ     EXPMEM_REPORT           ;If no, then no memory manager.
               MOV     AH,42H                  ;Else, retrieve free expanded.
               INT     67H
EXPMEM_REPORT: MOV     CL,4                    ;Convert to K.
               SHL     BX,CL
               CALL    CAPITALIZE
               CMP     BYTE PTR [SI],"R"       ;If report switch, display avail.
               JZ      MEMORY_REPORT
               CALL    DECIMAL_INPUT           ;Else, get requested and compare
               JZ      NOT_ENOUGH              ; with available.
               CMP     BX,AX
               JB      NOT_ENOUGH

ENOUGH:        XOR     AL,AL                   ;ErrorLevel = 0.
               RET

NOT_ENOUGH:    MOV     AL,1                    ;ErrorLevel = 1.
               RET

MEMORY_REPORT: MOV     AX,BX
               CALL    DEC_OUTPUT              ;Display available memory.
               PUSH    CS
               POP     DS                      ;Restore data segment.
               MOV     DX,OFFSET BYTES_FREE    ;Display "K Bytes free".
               CALL    PRINT_STRING
               XOR     AL,AL                   ;ErrorLevel = 0.
               RET

;----------------------------------------------;
WAITFOR:       XOR     DI,DI                   ;Assume no minutes.
               CALL    DECIMAL_INPUT           ;Get argument.
               MOV     BX,AX                   ;Else, BX = seconds.
               CMP     BYTE PTR [SI],":"       ;Delimiter colon?
               JNZ     GO_DELAY                ;If no, delay seconds.
               MOV     DI,AX                   ;Else, save parameter in DI.
               CALL    DECIMAL_INPUT           ;Get second parameter.
               MOV     BX,AX                   ;Save in BX.

GO_DELAY:      MOV     AX,60                   ;Multiply minutes by 60.
               MUL     DI
               ADD     BX,AX                   ;Add to second parameter.

NEXT_WAIT:     MOV     AH,1                    ;Key pressed?
               INT     16H
               JNZ     WAITFOR_BREAK           ;If yes, abort.
               XOR     AL,AL                   ;EL=0.
               OR      BX,BX                   ;Zero seconds?
               JZ      WAITFOR_END             ;If yes, done.
               MOV     CX,18                   ;If no, delay one second.
               CALL    DELAY
               DEC     BX                      ;Decrement second count
               JMP     NEXT_WAIT

WAITFOR_BREAK: CALL    KEYPRESS                ;Rid KBD buffer of keypress.
NO_WAITFOR:    MOV     AL,1                    ;ErrorLevel =  1.
WAITFOR_END:   RET

;----------------------------------------------;
WAITTIL:       CALL    DECIMAL_INPUT           ;Get argument.
               JZ      NO_WAITTIL              ;If none, exit.
               MOV     BH,AL                   ;Else, save in BH.
               INC     SI                      ;Pointer past colon.
               CALL    DECIMAL_INPUT           ;Assume minutes.
               JZ      NO_WAITTIL              ;If none, exit.
               MOV     BL,AL                   ;Else, save in BL.
               MOV     DI,BX                   ;Save in DI.
               INC     SI                      ;Pointer past colon.
               CALL    DECIMAL_INPUT           ;Get argument.
               MOV     BL,AL                   ;Seconds in BL.

NEXT_WAITTIL:  MOV     AH,1                    ;Check for keypress.
               INT     16H
               JNZ     WAITTIL_BREAK           ;If yes, abort.
               MOV     AH,2CH                  ;Else, get time.
               INT     21H
               CMP     DI,CX                   ;Requested hours:minutes?
               JNZ     NEXT_WAITTIL            ;If no, wait.
               CMP     BL,DH                   ;Else, requested = seconds?
               JNZ     NEXT_WAITTIL            ;If no, wait.
               XOR     AL,AL                   ;Else, ErrorLevel = 0.
               JMP     SHORT WAITTIL_END       ;Exit.

WAITTIL_BREAK: CALL    KEYPRESS                ;Eat keypress.
NO_WAITTIL:    MOV     AL,1                    ;ErrorLevel = 1.
WAITTIL_END:   RET

;----------------------------------------------;
GETKEY:        MOV     DI,OFFSET CHARS         ;Storage for alphanumeric keys.
               MOV     BX,OFFSET FUNCS         ;Storage for function keys.
               MOV     CL,1                    ;Position.
NEXT_GET:      LODSB                           ;Get a byte.
               CMP     AL,CR                   ;End of arguments?
               JZ      DO_KEY                  ;If yes, wait for keypress.
               CMP     AL,SPACE                ;Else, if delimiter, next byte.
               JBE     NEXT_GET
               CMP     AL,SINGLE_QUOTE         ;If single or double quotes
               JZ      GET_CHARS               ; then start of literals.
               CMP     AL,DOUBLE_QUOTE
	       JZ      GET_CHARS
	       CMP     AL,"F"		       ;Check for Function key
	       JZ      CK_FUNC
	       CMP     AL,"f"
	       JZ      CK_FUNC
               DEC     SI                      ;Else, adjust pointer and
               CALL    DECIMAL_INPUT           ; get the function key number.
	       JNZ     CK_CODES 	       ;If a number found, continue.
               INC     SI                      ;Else, adjust pointer.
	       JMP     NEXT_GET 	       ;Get next byte.
CK_CODES:      CMP     AL,80H		       ;Direct scancode - see if extended
	       JBE     STORE_FUNC	       ;Nope - no change
	       JMP     EXTEND_FUNC	       ;Yes - use extended read
CK_FUNC:       CALL    DECIMAL_INPUT	       ;Test for valid Fkey
	       JZ      NEXT_GET 	       ;Not a number - invalid for Func.
	       XOR     AL,AL		       ;Test for 0
	       JNZ     F_KEY		       ;No - see if legit
	       MOV     AL,1CH		       ;Yes - F0 = enter key
	       JMP     STORE_FUNC	       ;Save it
F_KEY:	       CMP     AL,12		       ;If num betw 1 & 12 it's legal.
               JA      NEXT_GET
               MOV     CH,AL                   ;Save number in CH.
               ADD     AL,3AH                  ;Convert number to scan code.
               CMP     CH,10
               JBE     STORE_FUNC
EXTEND_FUNC:   ADD     AL,40H		       ;Adjust if function keys 10 or 11
               MOV     KBD_TYPE,10H            ; and use extended KBD read.
STORE_FUNC:    MOV     BYTE PTR [BX],AL        ;Store the scan code.
               INC     BX                      ;Next storage.
               MOV     BYTE PTR [BX],CL        ;Store the position.
               INC     BX                      ;Next storage.
               INC     FUNC_CNT                ;Increment function key count.
               INC     CL                      ;Next position.
               JMP     NEXT_GET                ;Next byte.

GET_CHARS:     MOV     DL,AL                   ;Save quote type.
NEXT_CHARS:    LODSB                           ;Get a byte.
               CMP     AL,CR                   ;End of input?
               JZ      DO_KEY                  ;If yes, done here.
               CMP     AL,DL                   ;Else, ending quote?
               JZ      NEXT_GET                ;If yes, done here.
               CMP     AL,"a"                  ;Else, capitalize.
               JB      STORE_CHAR
               CMP     AL,"z"
               JA      STORE_CHAR
               AND     AL,5FH
STORE_CHAR:    STOSB                           ;Store the character.
               MOV     AL,CL
               STOSB                           ;Store the position.
               INC     CHAR_CNT                ;Increment character count.
               INC     CL                      ;Next position.
               JMP     NEXT_CHARS              ;Next literal.

DO_KEY:        CMP     CHAR_CNT,0              ;If no arguments found,
               JNZ     KEY                     ; then return scan code of
               CMP     FUNC_CNT,0              ; first keypress.
               JZ      SCAN_KEY

KEY:           MOV     AH,KBD_TYPE             ;Else, get a key.
               INT     16H
               CMP     AL,"a"                  ;Capitalize.
               JB      CHAR_KEYS
               CMP     AL,"z"
               JA      CHAR_KEYS
               AND     AL,5FH
CHAR_KEYS:     MOV     CX,CHAR_CNT             ;Does it match one of the
               JCXZ    FUNC_KEYS               ; literals?
               MOV     DI,OFFSET CHARS
CHAR_SCAN:     SCASB
               JZ      KEY_END                 ;If yes, return EL = position.
               INC     DI
               LOOP    CHAR_SCAN

FUNC_KEYS:     XCHG    AL,AH                   ;Else, scan code in AL.
               MOV     CX,FUNC_CNT
               JCXZ    CK_BREAK
               MOV     DI,OFFSET FUNCS         ;Match any function key requests?
FUNC_SCAN:     SCASB
               JZ      KEY_END                 ;If yes, done here.
               INC     DI
               LOOP    FUNC_SCAN
CK_BREAK:      OR      AX,AX                   ;Else, was it Ctrl break?
               MOV     AL,-1                   ;If yes, ErrorLevel = -1.
               JZ      KEY_DONE
               CMP     AH,3                    ;Same for Ctrl C.
               JZ      KEY_DONE
               JMP     KEY                     ;Else, get another keypress.

KEY_END:       MOV     AL,BYTE PTR [DI]        ;ErrorLevel = position.
KEY_DONE:      RET

SCAN_KEY:      CALL    KEYPRESS                ;If no arguments
               MOV     AL,AH                   ; ErrorLevel = scan code.
               RET

;----------------------------------------------;
SHIFT:         CALL    CAPITALIZE              ;Capitalize argument.
               XOR     AL,AL                   ;Assume not depressed.  EL = 0.
               MOV     BP,SI                   ;Save argument start.
               MOV     DI,OFFSET ALT           ;Is it ALT?
               MOV     CX,3
               REPZ    CMPSB
               MOV     BL,ALT_SHIFT            ;If yes, test for ALT.
               JZ      TEST_SHIFT

               MOV     SI,BP                   ;Else, argument start again.
               MOV     DI,OFFSET CTRL          ;Is it CTRL.
               MOV     CX,4
               REPZ    CMPSB
               MOV     BL,CTRL_SHIFT           ;If yes, test for Ctrl.
               JZ      TEST_SHIFT

               MOV     SI,BP                   ;Else, argument start again.
	       MOV     DI,OFFSET SHFT	       ;Is it SHIFT?
	       MOV     CX,5
               REPZ    CMPSB
	       MOV     BL,SHIFT_SHIFT	       ;If yes, test for Shift.
               JNZ     SHIFT_END

TEST_SHIFT:    MOV     CX,40H
               MOV     DS,CX
               TEST    DS:KBD_FLAG,BL          ;Is request shift key depressed?
               JZ      SHIFT_END               ;If no, ErrorLevel = 0.
               INC     AL                      ;Else, ErrorLevel = 1.
SHIFT_END:     RET

;----------------------------------------------;
SCROLLOCK:     MOV     BL,SCROLL_STATE         ;ScrollLock.
               JMP     SHORT TOGGLE_STATE

NUMLOCK:       MOV     BL,NUM_STATE            ;NumLock.
               JMP     SHORT TOGGLE_STATE

CAPSLOCK:      MOV     BL,CAPS_STATE           ;CapsLock.

TOGGLE_STATE:  CALL    CAPITALIZE
               MOV     BP,SI                   ;Save parameter start.
               XOR     DL,DL                   ;Toggle/set flag.
               MOV     DI,OFFSET ON            ;Point to on.
               MOV     CX,2
               REP     CMPSB
               JZ      DO_TOGGLE
               INC     DL
               MOV     SI,BP
               MOV     DI,OFFSET OFF
               MOV     CX,3
               REP     CMPSB
               JNZ     DO_TOGGLE
               INC     DL

DO_TOGGLE:     MOV     AX,40H
               MOV     DS,AX
               DEC     DL
               JS      SET_STATE
               DEC     DL
               JNS     OFF_STATE
               XOR     DS:KBD_FLAG,BL          ;Toggle the requested shift
               JMP     SHORT STATE_END
OFF_STATE:     NOT     BL
               AND     DS:KBD_FLAG,BL
               JMP     SHORT STATE_END
SET_STATE:     OR      DS:KBD_FLAG,BL
STATE_END:     XOR     AL,AL                   ; key BIOS KBD flag.
               RET

;----------------------------------------------;
DRIVEEXIST:    CALL    ASCIIZ
               MOV     DI,OFFSET FCB
               MOV     AX,2900H                ;Parse filename.
               INT     21H
               INC     AL                      ;EL=1 if exist.
               RET

;----------------------------------------------;
ISVOL:         MOV     DX,SI                   ;Save parameter.
NEXT_ISVOL:    LODSB
               CMP     AL,"/"                  ;Convert to ASCII zero.
               JZ      ISVOLZ
               CMP     AL,CR
               JNZ     NEXT_ISVOL
ISVOLZ:        MOV     BYTE PTR [SI - 1],0
               MOV     CX,08H                  ;Volume attribute.
               CALL    FIND_FIRST              ;Find first matching.
               MOV     AL,0                    ;Assume it doesn't exist; EL = 0.
               JC      ISVOL_END               ;If no find match, guessed right.
               TEST    DS:DTA.ATTRIBUTE,CL     ;Else, attribute match?
               JZ      ISVOL_END               ;If no, ErrorLevel = 0.
               INC     AL                      ;Else, ErrorLevel = 1.
ISVOL_END:     RET

;----------------------------------------------;
DIREXIST:      CALL    ASCIIZ                  ;Convert to ASCIIZ.
               MOV     BP,SI                   ;Save argument in BP.
               MOV     AH,19H                  ;Get drive default
               INT     21H
               MOV     CX,AX                   ; and save in CX.
               CMP     BYTE PTR [SI + 1],":"   ;Is there a drive request?
               JNZ     SAVE_DIR                ;If no, skip this.
               MOV     DI,OFFSET READ_BUFFER   ;Else, see if drive exists
               MOV     AX,2900H                ; via parse filename.
               INT     21H
               INC     AL                      ;Drive exist?
               JZ      DIREXIST_END            ;If no, exit with EL=0.
               MOV     AL,1                    ;Else, EL = 1.
               CMP     BYTE PTR [BP + 2],SPACE ;Drive only request?
               JBE     DIREXIST_END            ;If yes, exists; exit.
               MOV     DL,BYTE PTR [BP]        ;Else, change to that drive
               AND     DL,5FH                  ; so can restore default on
               SUB     DL,"A"                  ; exit.
               MOV     AH,0EH
               INT     21H

SAVE_DIR:      MOV     DI,OFFSET READ_BUFFER   ;Save default directory.
               MOV     AL,"\"                  ;DOS doesn't preface with
               STOSB                           ;slash delimiter so we must.
               MOV     SI,DI
               XOR     DL,DL
               MOV     AH,47H
               INT     21H

               MOV     DX,BP                   ;Point to argument again and
               MOV     AH,3BH                  ; attempt to change dir.
               INT     21H
               MOV     AL,0                    ;Assume failed.
               JC      DIREXIST_END            ;If failed, exit EL = 0.
               INC     AL                      ;Else, EL = 1.

DIREXIST_END:  PUSH    AX                      ;Save EL.
               MOV     DX,OFFSET READ_BUFFER   ;Restore default dir.
               MOV     AH,3BH
               INT     21H
               MOV     DX,CX                   ;Restore default drive.
               MOV     AH,0EH
               INT     21H
               POP     AX                      ;Retrieve EL and return.
               RET

;----------------------------------------------;
TYPEMATIC:     MOV     BL,REPEAT_NORMAL        ;Assume normal parameters.
               MOV     BH,INIT_NORMAL
               MOV     AL,BYTE PTR [SI]
               AND     AL,5FH
               CMP     AL,"N"                  ;Is it (N)ormal request?
               JZ      SET_TYPE                ;If yes, assumed right.
               CALL    DECIMAL_INPUT           ;Get requested typematic rate.
               MOV     BL,REPEAT_DEFAULT       ;Assume no parameter.
               JZ      STORE_REPEAT            ;If none, use default.
               MOV     BL,AL                   ;Else, rate in BL.
               MOV     AL,1                    ;ErrorLevel = 1.
               CMP     BL,REPEAT_MAX           ;Is it greater than max rate?
               JA      TYPEMATIC_END           ;If yes, exit with error.
STORE_REPEAT:  NEG     BL                      ;Inverse rate by subtracting
               ADD     BL,REPEAT_MAX           ; from maximum rate.
               CALL    PARSE_DELIMIT
               CALL    DECIMAL_INPUT           ;Get requested initial delay.
               MOV     BH,INIT_DEFAULT         ;Assume no parameter.
               JZ      SET_TYPE                ;If none, use default.
               MOV     BH,AL                   ;Else, delay in BL.
               MOV     AL,1                    ;ErrorLevel = 1.
               CMP     BH,INIT_MAX             ;Is it greater than max delay?
               JA      TYPEMATIC_END           ;If yes, exit with error.
SET_TYPE:      MOV     AX,305H                 ;Set typematic rate and delay
               INT     16H                     ; via BIOS.
               XOR     AL,AL                   ;ErrorLevel = 0.
TYPEMATIC_END: RET

;----------------------------------------------;
CURSORTYPE:    CALL    DISPLAYS                ;Get display type.
               MOV     BX,0607H                ;Assume CGA default cursor.
               CMP     AL,2
               JZ      GET_CURSOR
               MOV     BX,0B0CH                ;Assume mono/EGA cursor.
               CMP     AL,5
               JBE     GET_CURSOR
               MOV     BX,0D0EH                ;Else, VGA cursor.
GET_CURSOR:    CALL    FIND_HEX                ;Get row argument.
               JZ      DO_CURSOR               ;If none, use default.
               MOV     BH,AL                   ;Else, save.
               CALL    PARSE_DELIMIT
               CALL    FIND_HEX                ;Get column argument.
               MOV     BL,AL
DO_CURSOR:     MOV     CX,BX
               MOV     AX,40H
               MOV     DS,AX
               PUSH    DS:[87H]                ;Preserve EGA info.
               OR      BYTE PTR DS:[87H],1     ;Emulation off.
               MOV     AH,1                    ;Set cursor type via BIOS.
               INT     10H
               POP     DS:[87H]                ;Restore EGA info.
               XOR     AL,AL                   ;ErrorLevel = 0.
CURSOR_END:    RET

;----------------------------------------------;
PRTSC:         INT     5                       ;Print screen via BIOS.
               LODSB
               AND     AL,5FH
               CMP     AL,"F"                  ;If "F" found, add formfeed.
               JNZ     PRTSC_END
               MOV     DL,FF
               MOV     AH,5
               INT     21H
PRTSC_END:     XOR     AL,AL                   ;ErrorLevel = 0.
               RET

;----------------------------------------------;
DOSVER:        MOV     AX,DOS_VERSION          ;ErrorLevel = DOS major * 32
               MOV     CL,5                    ; + DOS minor.
               SHL     AL,CL
               OR      AL,AH
               RET

;----------------------------------------------;
ROMDATE:       MOV     AX,SEG BOOT_SEG         ;Point to ROM system date.
               MOV     DS,AX
               MOV     SI,OFFSET DATE_STAMP
               MOV     CX,8                    ;8 bytes to date.
NEXT_DATE:     LODSB
               CMP     AL,"/"
               JB      ROMDATE_END
               CMP     AL,"9"
               JA      ROMDATE_END
               MOV     DL,AL
               CALL    PRINT_CHAR              ;Display date.
               LOOP    NEXT_DATE
ROMDATE_END:   MOV     DL,CR
               CALL    PRINT_CHAR
               MOV     DL,LF
               CALL    PRINT_CHAR
               XOR     AL,AL                   ;ErrorLevel = 0.
               RET

;----------------------------------------------;
RENDIR:        CMP     DOS_MAJOR,3             ;Must be DOS 3.x or better
               JB      RENDIR_ERR              ; to rename a directory.
               CALL    ASCIIZ                  ;ASCII zero target name.
               MOV     DX,SI
               MOV     CX,10H                  ;Directory attribute.
               CALL    FIND_FIRST              ;Does it exist?
               JC      RENDIR_ERR                 ;If no, exit.
               TEST    BYTE PTR DTA.ATTRIBUTE,10H ;Else, is it a directory?
               JZ      RENDIR_END                 ;If no, exit.
               CALL    FIND_END                ;Else, point to new name.
               CALL    PARSE_DELIMIT
               CALL    ASCIIZ                  ;ASCII zero it also.
               MOV     DI,SI
               MOV     AH,56H                  ;Rename the directory.
               INT     21H
               MOV     AL,0                    ;ErrorLevel = 0 if successful.
               JNC     RENDIR_END
RENDIR_ERR:    MOV     AL,1                    ;ErrorLevel = 1 if unsuccessful.
RENDIR_END:    RET

;----------------------------------------------;
E43V50:        CALL    DISPLAYS                ;Get display type.
               CMP     AL,4                    ;Is it EGA or VGA?
               JB      EGAVGA_ERR              ;If no, exit.
               MOV     DL,AL                   ;Save display type in DL.
               XOR     BL,BL                   ;Load block zero of ROM
               MOV     AX,1112H                ; 8x8 double dot font.
               INT     10H
               CMP     DL,5                    ;Is it an EGA.
               JA      EGAVGA_DONE             ;If no, done here.
               MOV     AX,40
               MOV     DS,AX
               PUSH    DS:[87H]                ;Else, turn EGA cursor emulation
               OR      BYTE PTR DS:[87H],1     ; off and set cursor type to
               MOV     DX,600H                 ; underline.
               CALL    SETCURSOR
               POP     DS:[87H]
               MOV     DX,3B4H                 ;Set cursor type port.
               MOV     AX,714H
               OUT     DX,AX
EGAVGA_DONE:   XOR     AL,AL                   ;ErrorLevel = 0.
               JMP     SHORT EGAVGA_END
EGAVGA_ERR:    MOV     AL,1                    ;ErrorLevel = 1.
EGAVGA_END:    RET

;----------------------------------------------;
COMPARE:       CMP     BYTE PTR [SI],CR        ;If no argument, error.
               JZ      COMPARE_ERR
               CALL    CAPITALIZE              ;Else, capitalize argument.
               MOV     DI,SI                   ;Save in DI.
STRING_END:    LODSB                           ;Find end of first argument.
               CMP     AL,SPACE
               JA      STRING_END
               CALL    PARSE_DELIMIT           ;Parse delimiters.
               CALL    CAPITALIZE              ;Capitalize second argument.
               CALL    ASCIIZ                  ;Eliminate any "/" character.
NEXT_COMPARE:  LODSB                           ;Get a byte.
               CMP     AL,SPACE                ;End of string?
               JBE     CK_MATCH                ;If yes, see if end of other.
               SCASB                           ;Else, see if matching bytes.
               JZ      NEXT_COMPARE            ;If yes, continue.
               JMP     SHORT COMPARE_ERR       ;Else, no match.
CK_MATCH:      XOR     AL,AL                   ;EL = 0 if strings match.
               CMP     BYTE PTR [DI],SPACE
               JBE     COMPARE_END
COMPARE_ERR:   MOV     AL,1                    ;EL = 1 if non-matching.
COMPARE_END:   RET

;----------------------------------------------;
CANCOPY:       CALL    ASCIIZ                  ;ASCII zero filespec.
               MOV     DX,SI                   ;Point to filespec.
               MOV     CX,1                    ;Normal and read-only files.
               CALL    FIND_FIRST
               JC      CANCOPY_FAIL            ;If no matching, fail.
               XOR     DI,DI                   ;Else, start with zero.
               XOR     BP,BP                   ;BP:DI
NEXT_CANCOPY:  ADD     DI,DTA.SIZE_LOW         ;Get file size.
               ADC     BP,DTA.SIZE_HIGH
               MOV     AH,4FH                  ;Find next matching.
               INT     21H
               JNC     NEXT_CANCOPY

               CALL    FIND_END                ;Find end of filespec.
               CALL    PARSE_DELIMIT
               XOR     DL,DL                   ;Assume no destination drive.
               CMP     BYTE PTR [SI - 1],"/"
               JZ      GET_DEST
               LODSB                           ;Get drive request.
               CMP     AL,SPACE                ;Is there one?
               JBE     GET_DEST                ;If no, use default.
               AND     AL,5FH                  ;Else, capitalize.
               SUB     AL,"A" - 1
               MOV     DL,AL
GET_DEST:      MOV     AH,36H                  ;Get target free space.
               INT     21H
               CMP     AX,0FFFFH               ;If invalid drive, fail
               JZ      CANCOPY_FAIL
               MUL     BX                      ;Sectors per clust * avail clust.
               PUSH    DX                      ;Save high half.
               MUL     CX                      ;Times bytes per sector.
               MOV     BX,AX                   ;     DX:AX
               POP     AX                      ;    *   CX
               PUSH    DX                      ;    ------
               MUL     CX                      ;     DX:AX
               POP     DX                      ;  DX:AX
               ADD     DX,AX                   ;  ========
                                               ;     DX:BX
               XOR     AL,AL                   ;EL = 0
               SUB     BX,DI                   ;     DX:BX
               SBB     DX,BP                   ;   - BP:DI
               JNC     CANCOPY_END
CANCOPY_FAIL:  MOV     AL,1                    ;EL = 1.
CANCOPY_END:   RET

;----------------------------------------------;
WINDOW:        PUSH    CURSOR_POSN             ;Preserve cursor position.
               MOV     DI,OFFSET SPACES        ;Assume no border chars.
               CALL    DECIMAL_INPUT           ;Get starting row.
               JZ      WIN_ERR                 ;If none, exit.
               MOV     BH,AL                   ;Else, save in BH.
               DEC     BH                      ;Adjust.
               CALL    PARSE_DELIMIT
               CALL    DECIMAL_INPUT           ;Get starting column.
               JZ      WIN_ERR                 ;If none, exit.
               MOV     BL,AL                   ;Else, save in BL.
               DEC     BL                      ;Adjust.
               MOV     DX,BX
               MOV     WIN_CURSOR,DX           ;Store upper left corner.
               CALL    DO_WIN_CURSOR           ;Set cursor.
               CALL    PARSE_DELIMIT
               CALL    DECIMAL_INPUT           ;Get width.
               SUB     AX,2                    ;At least 2 wide.
               JB      WIN_ERR
               MOV     WIN_WIDTH,AX
               CALL    PARSE_DELIMIT
               CALL    DECIMAL_INPUT           ;Get height.
               SUB     AX,2                    ;At least 2 wide.
               JAE     SAVE_HEIGHT
WIN_ERR:       JMP     SHORT WINDOW_ERROR
SAVE_HEIGHT:   MOV     WIN_HEIGHT,AX

               CALL    PARSE_DELIMIT
               CALL    GET_COLOR               ;Get screen color.
               CALL    FIND_HEX                ;Get requested color.
               JZ      DO_WINDOW               ;If none, use screen color.
               MOV     BL,AL                   ;Else, requested.
               CALL    PARSE_DELIMIT
               LODSB
               CMP     AL,"-"                  ;Use single box chars?
               JNZ     CK_DOUBLE
               MOV     DI,OFFSET SINGLE_BOX
               JMP     SHORT DO_WINDOW
CK_DOUBLE:     CMP     AL,"="                  ;Use double box char?
               JNZ     DO_WINDOW
               MOV     DI,OFFSET DOUBLE_BOX

DO_WINDOW:     MOV     CURSOR_FLAG,1           ;No line wraps.
               MOV     SI,DI
               MOV     DX,CURSOR_POSN
               CALL    LINE                    ;Top line of box.

               LODSB
               MOV     BP,AX                   ;Border character.
               CMP     WIN_HEIGHT,0
               JZ      BOTTOM
SIDES:         MOV     AX,BP
               CALL    ATTRIB_CHAR
               MOV     CX,WIN_WIDTH
               JCXZ    RIGHT_SIDE
CENTER:        MOV     AL,SPACE                ;Spaces for center.
               CALL    ATTRIB_CHAR
               LOOP    CENTER
RIGHT_SIDE:    MOV     AX,BP                   ;Right side of box.
               CALL    ATTRIB_CHAR
               CALL    DO_WIN_CURSOR
               DEC     WIN_HEIGHT
               JNZ     SIDES

BOTTOM:        CALL    LINE                    ;Bottom line.
               XOR     AL,AL                   ;EL = 0.
               JMP     SHORT WINDOW_END
WINDOW_ERROR:  MOV     AL,1                    ;EL = 1.
WINDOW_END:    POP     DX                      ;Restore cursor position.
               PUSH    AX
               CALL    SET_CURSOR
               POP     AX
               RET

LINE:          LODSB                           ;Left char. of line.
               CALL    ATTRIB_CHAR
               LODSB                           ;Center repeat char of line.
               MOV     CX,WIN_WIDTH
               JCXZ    CORNER
               MOV     BP,AX
NEXT_LINE:     MOV     AX,BP
               CALL    ATTRIB_CHAR
               LOOP    NEXT_LINE
CORNER:        LODSB                           ;Right char. of line.
               CALL    ATTRIB_CHAR
               CALL    DO_WIN_CURSOR
               RET

DO_WIN_CURSOR: MOV     DX,WIN_CURSOR
               CALL    SET_CURSOR
               ADD     WIN_CURSOR,100H         ;Cursor to next line.
               RET

;*************************;
;*  SUPPORT SUBROUTINES  *;
;*************************;

DISPLAY_HELP:  MOV     AL,WHITE_ON_BLUE        ;Clear the screen with W/B.
               CMP     CRT_MODE,7              ;Else, is it MONO mode?
               JNZ     DO_HELP                 ;If no, use requested color.
               MOV     AL,WHITE_ON_BLACK       ;Else, use white on black.
DO_HELP:       CALL    DO_CLS                  ; blue background.
               MOV     BL,BLUE_ON_WHITE        ;Use inverse video blue on
               CMP     CRT_MODE,7              ; white for the header.
               JNZ     DISPLAY_COPY
               MOV     BL,BLACK_ON_WHITE       ;Or inverse video black on
DISPLAY_COPY:  MOV     SI,OFFSET COPYRIGHT     ; white if mono display.
               CALL    DO_CECHO
               MOV     DI,WHITE_ON_BLUE        ;For the rest of the help menu
               CMP     CRT_MODE,7              ; use white on blue for color
               JNZ     NEXT_COPY               ; display and white on black
               MOV     DI,WHITE_ON_BLACK       ; for mono display.

NEXT_COPY:     MOV     BX,DI                   ;Retrieve the color.
               CALL    DISP_STRING             ;Display top part of help.
               MOV     BP,201H                 ;Display PC Magazine logo
               MOV     SI,OFFSET PCMAG_LOGO    ; starting at row 2, column 1
               MOV     BL,INTENSE_ON_RED       ; for the top left corner.
               CMP     CRT_MODE,7              ;Use high intensity white on
               JNZ     NEXT_LOGO               ; red if color, else on black
               MOV     BL,INTENSE              ; if mono.
NEXT_LOGO:     MOV     DX,BP
               CALL    SET_CURSOR              ;Set the cursor.
               CALL    DO_CECHO                ;Print a line of logo.
               ADD     BP,100H                 ;Next line.
               CMP     BYTE PTR [SI],0         ;Until null marking end of logo.
               JNZ     NEXT_LOGO

               MOV     BX,DI                   ;Retrieve text color.
               MOV     SI,OFFSET HELP1         ;Display all pages of help
               CALL    DISP_PAGE               ; pause for a keystroke
               JZ      HELP_END                ; between pages and as long
               MOV     SI,OFFSET HELP2         ; as ESC not pressed.
               CALL    DISP_PAGE
               JZ      HELP_END
               MOV     SI,OFFSET HELP3
               CALL    DISP_PAGE
               JZ      HELP_END
               MOV     SI,OFFSET HELP4
               CALL    DISP_PAGE
               JZ      HELP_END
               MOV     SI,OFFSET HELP5
               CALL    DISP_PAGE

HELP_END:      MOV     DX,1600H                ;Set cursor on line 22 on exit
               CALL    SET_CURSOR              ; so DOS won't scroll screen.
               RET

;----------------------------------------------;
DISP_STRING:   CALL    DO_CECHO                ;Display lines of text
               CMP     BYTE PTR [SI],0         ; until terminating null found.
               JNZ     DISP_STRING
               RET

DISP_PAGE:     MOV     CX,0F00H                ;Clear last help page (row 15
               MOV     DX,164FH                ; through row 22) via BIOS
               MOV     BH,BL                   ; scroll active page.
               MOV     AX,600H
               INT     10H
               MOV     DX,0F00H                ;Set cursor to first line of
               CALL    SET_CURSOR              ; help.
               CALL    DISP_STRING
               MOV     DX,1800H                ;Cursor on line 24 for "press
               CALL    SET_CURSOR              ; any key" message.
               MOV     SI,OFFSET MORE
               MOV     CURSOR_FLAG,1           ;Suppress CR.
               CALL    DO_CECHO
               MOV     CURSOR_FLAG,0           ;CR back on.
               CALL    KEYPRESS                ;Pause for a keystroke.
               CMP     AH,ESC_SCAN             ;Is it ESC?
               JZ      PAGE_END
               CMP     AL,3                    ;Ctrl-C?
               JZ      PAGE_END
               OR      AX,AX                   ;Check for Ctrl Break.
PAGE_END:      RET                             ;Return for next page.

;-----------------------------------------------------------------;
; INPUT: SI -> string;  OUTPUT SI -> first non-white space or CR. ;
;-----------------------------------------------------------------;
PARSE_DELIMIT: LODSB                           ;Get a byte.
               CMP     AL,CR
               JZ      LEADING_END
               CMP     AL,SPACE                ;Is it a space char or below?
               JBE     PARSE_DELIMIT
               CMP     AL,COMMA                ;Or comma?
               JZ      PARSE_DELIMIT
               CMP     AL,"/"                  ;Or forward slash?
               JZ      PARSE_DELIMIT
               CMP     AL,";"                  ;Or semicolon?
               JZ      PARSE_DELIMIT           ;If yes, parse.
LEADING_END:   DEC     SI                      ;Else, adjust pointer to
               RET                             ; string start.

;----------------------------------------------;
; INPUT:  SI -> string;  SI preserved.         ;
;----------------------------------------------;
CAPITALIZE:    PUSH    SI
NEXT_CAP:      LODSB
               CMP     AL,SPACE                ;Capitalize until first
               JBE     CAP_END                 ; white space encountered.
               CMP     AL,"a"
               JB      NEXT_CAP
               CMP     AL,"z"
               JA      NEXT_CAP
               AND     BYTE PTR [SI - 1],5FH
               JMP     NEXT_CAP
CAP_END:       POP     SI
               RET

;----------------------------------------------;
FIND_END:      LODSB
               OR      AL,AL                   ;Search string until terminating
               JNZ     FIND_END                ; ASCIIZ found.
               RET

;-----------------------------------------------------;
FIND_HEX:      PUSH    SI
NEXT_H:        LODSB
               CMP     AL,SPACE
               JBE     CK_HEX
               CMP     AL,COMMA
               JNZ     NEXT_H
CK_HEX:        MOV     AL,[SI - 2]
               POP     SI
               AND     AL,5FH
               CMP     AL,"H"
               JNZ     DECIMAL
               CALL    HEX_INPUT
               RET
DECIMAL:       CALL    DECIMAL_INPUT
               RET

;----------------------------------------------------------------------;
; INPUT:  SI -> string;                                                ;
; OUTPUT: SI -> end of string; AX = number; ZF = 1 if no number found. ;
;----------------------------------------------------------------------;
DECIMAL_INPUT: PUSH    BX
               PUSH    CX
               XOR     BX,BX                   ;Start with zero as number.
               XOR     BP,BP                   ;Number found flag.
NEXT_DECIMAL:  LODSB                           ;Get a character.
               SUB     AL,"0"                  ;ASCII to binary.
               JC      DECIMAL_END             ;If not between 0 and 9, skip.
               CMP     AL,9
               JA      DECIMAL_END
               CBW                             ;Convert byte to word.
               XCHG    AX,BX                   ;Swap old and new number.
               MOV     CX,10                   ;Shift to left by multiplying
               MUL     CX                      ; last entry by ten.
               ADD     BX,AX                   ;Add new number and store in BX.
               INC     BP
               JMP     NEXT_DECIMAL
DECIMAL_END:   DEC     SI                      ;SI -> string end.
               MOV     AX,BX
               OR      BP,BP                   ;Number found flag.
               POP     CX
               POP     BX
               RET

;----------------------------------------------;
HEX_INPUT:     PUSH    BX
               PUSH    CX
               XOR     BX,BX
               XOR     BP,BP
NEXT_HEX:      LODSB                           ;Get a byte.
               CMP     AL,"a"
               JB      GET_HEX
               AND     AL,5FH
GET_HEX:       SUB     AL,"0"                  ;ASCII to binary.
               JC      HEX_END                 ;If not 0 to 9, skip.
               CMP     AL,9                    ;Is it A - F ?
               JLE     NOT_ALPHA               ;If no, OK.
               SUB     AL,7                    ;Else, adjust for alpha.
               CMP     AL,10                   ;Is it punctuation?
               JB      HEX_END                 ;If yes, skip.
               CMP     AL,15                   ;Is it valid?
               JA      HEX_END                 ;If no, skip.
NOT_ALPHA:     MOV     CL,4                    ;Shift old number four bits left.
               SHL     BX,CL
               OR      BL,AL                   ;Add to number.
               INC     BP
               JMP     NEXT_HEX
HEX_END:       MOV     AX,BX
               OR      BP,BP
               POP     CX
               POP     BX
               RET

;----------------------------------------------;
ASCIIZ:        PUSH    SI
NEXT_ASCII:    LODSB                           ;Place a terminating null
               CMP     AL,"/"                  ; at the end of string.
               JZ      ASCII
               CMP     AL,SPACE
               JA      NEXT_ASCII
ASCII:         MOV     BYTE PTR [SI - 1],0
               POP     SI
               RET

;-------------------------------------;
;  INPUT: AX = number.  AX preserved  ;
;-------------------------------------;
DEC_OUTPUT:    PUSH    AX
               MOV     BX,10                   ;Convert to decimal.
               XOR     CX,CX                   ;Zero in counter.
NEXT_COUNT:    XOR     DX,DX
               DIV     BX
               ADD     DL,'0'                  ;Convert to ASCII.
               PUSH    DX                      ;Save results.
               INC     CX                      ;Also increment count.
               CMP     AX,0                    ;Are we done?
               JNZ     NEXT_COUNT

NEXT_NUMBER:   POP     DX                      ;Retrieve numbers.
               CALL    PRINT_CHAR              ;And write them.
               LOOP    NEXT_NUMBER
               POP     AX
               RET

;----------------------------------------------;
GET_BIOS_DATA: PUSH    DS
               PUSH    ES
               MOV     AX,40H                  ;BIOS data area.
               MOV     DS,AX
               MOV     SI,BIOS_ACTIVE_PAGE     ;Start with active page.
               MOV     DI,OFFSET ACTIVE_PAGE
               MOVSB                           ;Retrieve active page
               MOV     SI,BIOS_CRT_MODE        ;Retrieve CRT mode, CRT columns,
               MOV     CX,CRT_DATA_LENGTH      ; CRT length, CRT start.
               REP     MOVSB
               MOV     BL,ES:ACTIVE_PAGE       ;Use active page as index
               XOR     BH,BH                   ; of active cursor position.
               SHL     BX,1
               ADD     SI,BX
               MOVSW
               XOR     BH,BH
               MOV     AX,1130H                ;Font information.
               MOV     DL,24                   ;Assume 25 lines.
               INT     10H
               POP     ES
               MOV     AL,DL
               STOSB
               POP     DS
               RET

;----------------------------------------------;
; OUTPUT: ES = segment of BATCHMAN data.       ;
;----------------------------------------------;
CK_BAT_DATA:   MOV     BYTE PTR LOOP_COUNT,0   ;Initialize variables to zero.
               MOV     WORD PTR CURRENT_DIR,0
               MOV     BX,OFFSET START         ;Point to start of code.
               NOT     BYTE PTR [BX]           ;Change a byte so no false match.
               XOR     DX,DX                   ;Start at segment zero.
               MOV     AX,CS                   ;Store our segment in AX.
NEXT_PARAG:    INC     DX                      ;Next paragraph.
               MOV     ES,DX
               CMP     DX,AX                   ;Is it our segment?
               JZ      BAT_DATA_END            ;If yes, search is done.
               MOV     SI,BX                   ;Else, point to our signature.
               MOV     DI,BX                   ; and offset of possible match.
               MOV     CX,16                   ;Check 16 bytes for match.
               REPZ    CMPSB
               JNZ     NEXT_PARAG              ;If no match, keep looking.
               MOV     DATA_SEG,ES             ;Save segment of resident data.
BAT_DATA_END:  RET

;----------------------------------------------;
; INPUT: CX = 1/18 seconds.                    ;
;----------------------------------------------;
DELAY:         PUSH    DS                      ;Preserve data segment.
               MOV     AX,40H                  ;Point to BIOS data segment.
               MOV     DS,AX
NEXT_TICK:     MOV     AX,DS:[6CH]             ;Retrieve timer low.
NEXT_DELAY:    MOV     DX,DS:[6CH]             ;Retrieve timer low.
               CMP     DX,AX                   ;Have we timed out?
               JZ      NEXT_DELAY              ;If not, wait until timer tick.
               LOOP    NEXT_TICK
               POP     DS                      ;Restore data segment.
               RET

;----------------------------------------------;
; INPUT: DX = cursor position.                 ;
;----------------------------------------------;
SET_CURSOR:    MOV     CURSOR_POSN,DX          ;Save locally cursor position.
               MOV     BH,ACTIVE_PAGE
               MOV     AH,2                    ;Set cursor on active video page.
               INT     10H
               RET

;----------------------------------------------;
FIND_FIRST:    MOV     AH,4EH
               INT     21H
               RET

;----------------------------------------------;
KEYPRESS:      XOR     AH,AH
               INT     16H
               RET

;----------------------------------------------;
GET_DATE:      MOV     AH,2AH
               INT     21H
               RET

GET_TIME:      MOV     AH,2CH
               INT     21H
               RET

;----------------------------------------------;
PRINT_STRING:  MOV     AH,9
               INT     21H
               RET

;----------------------------------------------;
PRINT_CHAR:    MOV     AH,2
               INT     21H
               RET

DTA            LABEL   BYTE
READ_BUFFER    =       DTA + SIZE MATCHING
CHARS          =       READ_BUFFER
FUNCS	       =       READ_BUFFER + 96 * 2 * 2
FCB            =       READ_BUFFER
WRITE_BUFFER   =       READ_BUFFER + SIZE BOOT_SECTOR

_TEXT          ENDS
               END     START
