nasm -f elf32 -o cambiarAsm.o cambiarAsm.asm
gcc -m32 -march=i686 cambiarCadena.c cambiarAsm.o -o p1
./p1
