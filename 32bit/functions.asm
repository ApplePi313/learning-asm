input:
    push ebx;
    push ecx;
    push edx;

    mov eax, 3; call sys_read
    mov ebx, 0; from stdin
    mov ecx, strinput; output to strinput
    mov edx, 255; length of 255 bytes

    int 80h

    pop edx;
    pop ecx;
    pop ebx;

;     add eax, 0; add a null character for when checking the length

    ret; return to main file


parseint:

ret;

;-------------------------------------------------------------------------
; This is all part of getting string length
strlen: ; for this function, eax should hold the string
    push ebx; push current eax on the stack

    mov ebx, eax; give ebx the same address as eax

checknext:
    cmp byte [eax], 0; check if the current position is a null character
    je done; jump to done if it is

    inc eax; increment eax

    jmp checknext; jump to checknext

done:
    sub eax, ebx; subtract ebx from eax

    pop ebx; replace ebx's value with the value previously pushed to the stack

    ret; return to main file
;--------------------------------------------------------------------------------------


strprint: ; eax should hold the string to print
;------------------------------------------------------
    push eax;                                       ; this gets the string length

    call strlen; call the string length function
    mov edx, eax; set edx to the string length

    pop eax;
;------------------------------------------------------

    push ebx;
    push ecx;

    mov ecx, eax; set ecx to eax

    mov eax, 4; set eax to 4
    mov ebx, 1; set ebx to 4

    int 80h; print

    pop ecx;
    pop ebx;

    ret; return

strprintLF: ; print a line feed after the string
    call strprint; print the string

    push eax;
    push ebx;
    push ecx;
    push edx;

    mov eax, 4
    mov edx, 1
    mov ecx, 0Ah; set ecx to \n, the new line character
    mov edx, 1; the length of 1 character is 1 byte

    int 80h; print

    pop edx;
    pop ecx;
    pop ebx;
    pop eax;

    ret; return

quit:
    mov eax, 1; says we'll be exiting
    mov ebx, 0; exit code of 0

    int 80h;
