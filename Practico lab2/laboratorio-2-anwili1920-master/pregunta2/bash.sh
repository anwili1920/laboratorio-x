nasm -g -f elf64 juego.asm -o juego.o
gcc -g juego.o -o ejecutable
./ejecutable
#gdb -x depurador.gdb