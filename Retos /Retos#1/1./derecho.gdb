set logging file reporte.txt
set print pretty on
set logging on
set pagination off
set args 10
file ejecutablederecho
define hook-echo
echo <------
end
define hookpost-echo
echo ------>\n
end
set disassembly-flavor intel
 
b main
b potencia
run
c 
echo REGISTROS 1.0
info r rax rcx 

set $cont = $ecx 
#set $aux = 6
echo calculo de la potencia
while ($cont>0) 
    info r rax 
    p $cont
    c
    #set $aux= $aux -1
    set $cont= $ecx 
end
quit