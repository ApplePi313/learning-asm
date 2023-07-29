; learning asm

%include 'functions.asm'

section .text
    global _start;

    _start:
        mov eax, message; set eax to the message

        call strprint; print the string


        call input;


        push eax;

        mov eax, strinput
        call strprint; print the string

        pop eax;


        call quit;

section .bss
    len: resw 1

    strinput: resb 5; reserve 255 bytes for the input

section .text
    message db "Hello World", 0Ah, 0; the message being printed, 10 is \n and 0 is \0
