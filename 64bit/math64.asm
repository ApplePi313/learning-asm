BITS 64

%macro multiply 2 ; takes two inputs, outputs to r8
    PUSH rax;

    MOV rax, %1;
    MUL %2;

    MOV r8, rax;

    POP rax;
%endmacro

inttostring:

parseint: ; input the string to r9, output to r8
    PUSH rax;
    PUSH rdi;
    PUSH rsi;
    PUSH rdx;
    PUSH r9;

    call strlen; the length will be put in r9

    nextchartoint:

    cmp byte [r9], 0;
    je endparseint;

    MOV rax, qword [r8]; mov the current char into rax
    SUB rax, 48; get into the 0-9 integer range


    INC r8;

    jmp nextchartoint;

    endparseint:

        POP r9;
        POP rdx;
        POP rsi;
        POP rdi;
        POP rax;

        ret;

power: ; r8 as output, r9 as input 1, r10 as input 2

    ret;
