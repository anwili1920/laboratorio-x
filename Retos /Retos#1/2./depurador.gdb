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
b digitoxdigito
b factorial
b imprimir
run
c 
c
echo REGISTROS 1.0
info r rax rcx 

set $cont = $rcx 
#set $aux = 6
echo calculo del factorial
while ($cont>0) 
    info r rax 
    p $cont
    c
    #set $aux= $aux -1
    set $cont= $rcx 
end
