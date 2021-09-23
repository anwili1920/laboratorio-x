nasm -g -f elf64 programa.asm -o programa.o
ld -g programa.o -o ejecutable 
./ejecutable