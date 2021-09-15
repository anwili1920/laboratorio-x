nasm -g -f elf64 palindromo.asm -o palindromo.o
gcc -g palindromo.o -o ejecutable
./ejecutable