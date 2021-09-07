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
b _star
b potencia

run
echo REGISTROS 1.0
info r rax r8 r9 r10 rax rbx rcx
c
echo REGISTROS 1.0
info r rax r8 r9 r10 rax rbx rcx


