nasm -g -f elf32 -o asmMedia32.o asmMedia32.asm 
gcc -g -m32  codigo.c asmMedia32.o -o ejecutable1
./ejecutable1 12 10 11 9

