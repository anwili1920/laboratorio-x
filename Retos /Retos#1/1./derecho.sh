nasm -g -f elf64 derecho.asm -o derecho.o
gcc -g derecho.o -o ejecutablederecho
./ejecutablederecho
gdb -x derecho.gdb