nasm -g -f elf64 iterativoASM.asm -o iterativoASM.o
gcc -g iterativoASM.o -o ejecutable
./ejecutable
gdb -x depurador.gdb