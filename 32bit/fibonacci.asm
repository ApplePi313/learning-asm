section .text
global _start

start:
    mov dword [prev_2], 1; sets prev_2 equal to 1
    mov dword [prev_1], 1; sets prev_1 equal to 1;
    mov dword [curr], 0; sets curr equal to 0

    mov dword [iter], 40; 40 iterations

iterate:
    ; if iter is equal to 0, jump to end
    cmp dword [iter], 0
    je end;

    mov dword [curr], prev_2; sets curr equal to prev_2
    add dword [curr], prev_1; adds prev_1 to curr

    mov dword [prev_2], prev_1; sets prev_2 equal to prev_1
    mov dword [prev_1], curr; set prev_1 equal to curr

    dec dword [iter]; decrements iter

    jmp iterate; jumps back to iterate to repeat the cycle
end:
    mov dword [msg], curr; set msg equal to curr
    add dword [msg], 30; add 30 to msg to covert it to the ascii number range

    mov eax, 4; says we're going to print
    mov ebx, 1; says print to console
    mov ecx, msg; says we're going to print curr
    mov edx, 4; says the length of curr is 4(dword is 4 bytes)

    int 80h; print

    mov eax, 1; says system exit
    mov ebx, 0; exit code 0

    int 80h; exit

section .bss
    prev_2 resb 4;
    prev_1 resb 4;
    curr resb 4;

    msg resb 4;

    iter resb 4;

