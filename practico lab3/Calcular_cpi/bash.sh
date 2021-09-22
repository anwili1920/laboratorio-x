nasm -g -f elf64 cip_prom.asm -o cip_prom.o
ld -g cip_prom.o -o ejecutable 
./ejecutable
#gdb -x depurador.gdb
