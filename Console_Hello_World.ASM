format PE GUI 4.0
include 'win32ax.inc'

;###########################################################################################
;---------------------------------------- Get input ----------------------------------------
proc getLine str0,lenght1                          ;                                      ;-
invoke ReadFile,[rhndl],[str0],[lenght1],lenght,0  ; Get input from console               ;-
xor ebx,ebx                                    ;  Delete symbvols of new line (0Ah,0Dh)   ;-
mov bx,[lenght]                                ; |                                        ;-
add ebx,buffer                                 ; |                                        ;-
mov byte [ebx-1],0                             ; |                                        ;-
mov byte [ebx-2],0                             ;<|                                        ;-
xor eax,eax                                                                               ;-
dec eax                                                                                   ;-
dec eax                                                                                   ;-
mov ax,[lenght]                                                                           ;-
ret                                                                                       ;-
endp                                                                                      ;-
;-------------------------------------------------------------------------------------------

;###########################################################################################
;---------------------------------------- Strcmp function ----------------------------------
proc strcmp str0,str1                                                                     ;-
mov ebx,[str0]                                                                            ;-
mov ecx,[str1]                                                                            ;-
.pStart:                                                                                  ;-
mov byte al,[ebx]                                                                         ;-
cmp byte al,[ecx]                                                                         ;-
jnz .pF                                                                                   ;-
cmp al,0                                                                                  ;-
jz .pT                                                                                    ;-
inc ebx                                                                                   ;-
inc ecx                                                                                   ;-
jmp .pStart                                                                               ;-
.pF:                                                                                      ;-
mov eax,0                                                                                 ;-
ret                                                                                       ;-
.pT:                                                                                      ;-
mov eax,1                                                                                 ;-
ret                                                                                       ;-
endp                                                                                      ;-
;-------------------------------------------------------------------------------------------

;###########################################################################################
;---------------------------------------- Strlen function ----------------------------------
proc strlen str0                                                                          ;-
mov ebx,[str0]                                                                            ;-
xor eax,eax                                                                               ;-
dec ebx                                                                                   ;-
.pStart:                                                                                  ;-
inc eax                                                                                   ;-
inc ebx                                                                                   ;-
cmp byte [ebx],0                                                                          ;-
jnz .pStart                                                                               ;-
ret                                                                                       ;-
endp                                                                                      ;-
;-------------------------------------------------------------------------------------------

;###########################################################################################
;---------------------------------------- Output strings -----------------------------------
proc put_line str0                                                                        ;-
local size:DWORD                                                                          ;-
stdcall strlen,[str0]                                                                     ;-
dec eax                                                                                   ;-
mov [size],eax                                                                            ;-
invoke WriteFile,[whndl],[str0],[size],0,0                                                ;-
ret                                                                                       ;-
endp                                                                                      ;-
;-------------------------------------------------------------------------------------------

;###########################################################################################
;---------------------------------------- Output Help --------------------------------------
chelp:                                                                                    ;-
stdcall put_line,mhelp                                                                    ;-
jmp start.p0                                                                              ;-
;-------------------------------------------------------------------------------------------

;###########################################################################################
;------------------------------------------- Exit ------------------------------------------
cquit:                                                                                    ;-
invoke FreeConsole                                                                        ;-
invoke ExitProcess,0                                                                      ;-
jmp start.p0 ;; :D                                                                        ;-
;-----------------------------------------------------------------------------------------;-

;###########################################################################################
;--------------------------------------- Clear screen --------------------------------------
cclear:                                                                                   ;-
mov [coord.x],0                                                                           ;-
mov [coord.y],0                                                                           ;-
invoke FillConsoleOutputCharacter,[whndl],dword 0,dword 2000,dword [coord],lenght         ;-
invoke SetConsoleCursorPosition,[whndl],dword [coord]                                     ;-
jmp start.p0                                                                              ;-
;-------------------------------------------------------------------------------------------

;###########################################################################################
;--------------------------------------- Change title --------------------------------------
ctitle:                                                                                   ;-
stdcall put_line,.msg0                                                                    ;-
stdcall getLine,buffer,256                                                                ;-
invoke SetConsoleTitle,buffer                                                             ;-
jmp start.p0                                                                              ;-
.msg0 db 'New title name:',0                                                              ;-
;-------------------------------------------------------------------------------------------

;###########################################################################################
;--------------------------------------- Cpliss :D -----------------------------------------
cpliss:                                                                                   ;-
stdcall put_line,.msg0                                                                    ;-
jmp start.p0                                                                              ;-
.msg0 db 'Subscribe pliss :DDD, :)',0Ah,0Dh,0                                             ;-
;-------------------------------------------------------------------------------------------


;############################################################################################
start:                                        ;             ENTRY POINT                     |
invoke AllocConsole                           ; Create Console                              |
invoke CreateFile,'CON',GENERIC_WRITE         ; Create and save console write handle        |
mov [whndl],eax                               ;                                             |
invoke CreateFile,'CON',GENERIC_READ          ; Create and save console read handle         |
mov [rhndl],eax                               ;                                             |
;---------------------------------------------;---------------------------------------------|
.p0:                                          ;            GENERAL CYCLE                    |
invoke WriteFile,[whndl],get,1,0,0            ; Output '>'                                  |
stdcall getLine,buffer,256                    ; Get input from console                      |
stdcall strcmp,buffer,help                    ; Compare Buffer and command Help             |
cmp eax,01                                    ; Strcmp return 1 in eax if strings equal     |
jz chelp                                      ;                                             |
stdcall strcmp,buffer,quit                    ; Compare Buffer and command Quit             |
cmp eax,01                                    ; Strcmp return 1 in eax if strings equal     |
jz cquit                                      ;                                             |
stdcall strcmp,buffer,clear                   ; Compare Buffer and command Clear            |
cmp eax,01                                    ; Strcmp return 1 in eax if strings equal     |
jz cclear                                     ;                                             |
stdcall strcmp,buffer,title                   ; Compare Buffer and command Title            |
cmp eax,01                                    ; Strcmp return 1 in eax if strings equal     |
jz ctitle                                     ;                                             |
stdcall strcmp,buffer,pliss                   ; Compare Buffer and command Title            |
cmp eax,01                                    ; Strcmp return 1 in eax if strings equal     |
jz cpliss                                     ;                                             |
stdcall put_line,wrong0                       ;                                             |
stdcall put_line,buffer                       ;                                             |
stdcall put_line,wrong1                       ;                                             |
jmp .p0                                       ; cycle                                       |
.end start                                    ;                                             |
wrong0 db 'Wrond command: ',0                 ;---------|                                   |
wrong1 db ' .Type help, to see active command',0Ah,0Dh,0;                                   |
;--------------------------------------------------------------------------------------------

;------------------
whndl dd 0       ;-
rhndl dd 0       ;-
coord:           ;-
.x dw 0  ;; x    ;-
.y dw 0  ;; y    ;-
lenght dw 0      ;-
;------------------

db 0
db 0
get    db '>'
db 0
db 0
buffer db 255 dup(00)
help   db 'help',0
quit   db 'quit',0
clear  db 'clear',0
title  db 'title',0
pliss   db 'subscribe',0
mhelp   db 'Example commands:',0Ah,0Dh,'quit  - Close programm',0Ah,0Dh,'clear - Clear shell',0Ah,0Dh,'help  - Show this help :)',0Ah,0Dh,'title - Change window title',0Ah,0Dh,0
