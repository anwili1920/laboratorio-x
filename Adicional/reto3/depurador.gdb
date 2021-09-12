set logging file reporte.txt
set print pretty on
set logging on
set pagination off
set args 10
file assembler
define hook-echo
echo <------
end
define hookpost-echo
echo ------>\n
end
b _start

b end


run
echo REGISTROS 1.0
info r rax r8 r9 rbx rdx
c

echo REGISTROS 3.0
info r r8 r10 r11  rax  rbx rcx rdx
c

