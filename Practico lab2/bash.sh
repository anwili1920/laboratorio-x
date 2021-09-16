nasm -g -f elf64 leernumero.asm -o leernumero.o
gcc -g leernumero.o -o ejecutable
./ejecutable