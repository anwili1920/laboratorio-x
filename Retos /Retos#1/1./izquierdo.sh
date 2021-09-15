nasm -g -f elf64 izquierdo.asm -o izquierdo.o
gcc -g izquierdo.o -o ejecutableizquierdo
./ejecutableizquierdo