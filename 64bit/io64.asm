BITS 64

;------------------------------------------------------------------------
;           Printing macros
%macro console_write 2
    PUSH rax                    ; Save current register values
    PUSH rdi                    ;
    PUSH rsi                    ;
    PUSH rdx                    ;

    MOV rax, 1                  ; write
    MOV rdi, 1                  ; to console
    MOV rsi, %1                 ; arg1 will contain the message
    MOV rdx, %2                 ; arg2 will contain the length

    syscall                     ;

    POP rdx                     ; Reset registers to how they were before
    POP rsi                     ;
    POP rdi                     ;
    POP rax                     ;
%endmacro

%macro console_write_LF 2
    PUSH r8                     ; save r8
    console_write %1, %2;

    MOV r8, 0Ah                 ; set r8 to \n
    PUSH r8                     ; push it to the stack
    MOV r8, rsp                 ; set r8 to a pointer to the stack

    console_write r8, 1         ; write the newline character

    POP r8                      ; pop out the \n

    syscall                     ;

    POP r8                      ; restore r8
%endmacro
;
;-------------------------------------------------------------------------


%macro input 1
    PUSH rax                    ; Save current register values
    PUSH rdi                    ;
    PUSH rsi                    ;
    PUSH rdx                    ;

    MOV rax, 0                  ; read
    MOV rdi, 1                  ; from console
    MOV rsi, %1                 ; output to arg1
    MOV rdx, 255                ; read 255 bytes

    syscall                     ;

    POP rdx                     ; Reset registers to how they were before
    POP rsi                     ;
    POP rdi                     ;
    POP rax                     ;
%endmacro


strlen: ; input message in r9, outputs length to r8 (for direct use with strprint)
    PUSH r9;
    PUSH rdi;

    MOV rdi, r9;

    nextchar:
        CMP byte [r9], 0;
        je strlendone;

        INC r9;

        jmp nextchar;
    strlendone:
        SUB r9, rdi;

        MOV r8, r9;

        POP rdi;
        POP r9;

        ret;

quit:
    MOV rax, 60;
    MOV rdi, 0;
    syscall;

    ret;
