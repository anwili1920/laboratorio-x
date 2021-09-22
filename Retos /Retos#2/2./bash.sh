nasm -g -f elf64 calculo_limite.asm -o calculo_limite.o
ld -g calculo_limite.o -o ejecutable 
./ejecutable
gdb -x depurador.gdb