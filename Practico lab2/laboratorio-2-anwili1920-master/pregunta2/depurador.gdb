set logging file reporte.txt
set print pretty on
set logging on
set pagination off
set args 10
file ejecutable
define hook-echo
echo <------
end
define hookpost-echo
echo ------>\n
end
set disassembly-flavor intel
 
b main
b iteracion
b continuar 
b buscar
b encontro
run
c
echo REGISTROS 1.0
info r rax rcx 
c
echo REGISTROS 2.0
info r rax rcx  r8  r9 r10 r12 r13 r14 
c 
echo REGISTROS 2.0
info r rax rcx  r8  r9 r10 r12 r13 r14 
c 
echo REGISTROS 2.0
info r rax rcx  r8  r9 r10 r12 r13 r14 
c 
echo REGISTROS 2.0
info r rax rcx  r8  r9 r10 r12 r13 r14 
c 
echo REGISTROS 2.0
info r rax rcx  r8  r9 r10 r12 r13 r14 
c 
