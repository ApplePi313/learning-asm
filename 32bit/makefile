hello_world:
	nasm -f elf hello_world.asm;
	ld -m elf_i386 -s -o hello_world hello_world.o;

fibonacci:
	nasm -f elf fibonacci.asm;
	ld -m elf_i386 -s -o fibonacci fibonacci.o;

functions:
	nasm -f elf functions.asm;
	ld -m elf_i386 -s -o functions functions.o

making_functions:
	nasm -f elf64 making_functions.asm;
	ld -o making_functions making_functions.o
