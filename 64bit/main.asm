BITS 64
; also learning 64 bit asm

%include 'io64.asm'
%include 'math64.asm'

section .text
    global _start;

    _start:
        MOV r9, message                             ; set r9 to the message pointer

        call strlen                                 ; sets r8 to the string length

        console_write_LF test, len                  ; print the message, with a line feed

        console_write_LF r9, r8                     ; print the message, with a line feed

        input consoleinput                          ; sets consoleinput to the input
        MOV r9, consoleinput                                  ; put the input in r9

        call strlen                                 ; set r8 to length
        console_write r9, r8                        ; print the input


;--
        MOV r9, 5;
        MOV r10, 12;

        multiply r9, r10;

        MOV r9, r8;

        PUSH r8;
        MOV r9, rsp;

        MOV r8, 1;

        console_write_LF r9, r8

        POP r8;
;--

        call quit;

section .bss
    consoleinput: resb 255

section .text
    message: db "Hello World", 0Ah, 0; 0 is a null character

    test: db "test", 0;

    len: equ $-test;
