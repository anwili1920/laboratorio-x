nasm -g -f elf64 Calculo_varianza.asm -o Calculo_varianza.o
ld -g Calculo_varianza.o -o ejecutable 
./ejecutable
gdb -x depurador.gdb