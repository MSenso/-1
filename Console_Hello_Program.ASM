format PE console
entry N99481205
include "win32a.inc"
stack 400h

section ".code" code readable executable
N99481205:
cinvoke printf, NamePrompt
cinvoke scanf_s, InpFormat, Name, 32
cinvoke printf, FamilyPrompt
cinvoke flushall
cinvoke scanf_s, InpFormat, Family, 32
cinvoke printf, Accost
cinvoke printf, Name
cinvoke putch, 32
cinvoke printf, Family
cinvoke putch, '!'
cinvoke flushall
cinvoke getch
cinvoke exit, NULL

section ".data" data readable
NamePrompt db "Input your name: ", 0
FamilyPrompt db "Input your surname: ", 0
Accost db "Hello, ", 0
InpFormat db "%s", 0

section ".bss" data readable writeable
Name rd 32
Family rd 64

section ".idata" import data readable
library msvcrt, "msvcrt.dll"
import msvcrt, printf, "printf", getch, "_getch",\
scanf_s, "scanf_s", flushall, "_flushall",\
putch, "_putch", exit, "_exit"