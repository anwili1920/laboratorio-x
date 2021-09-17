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
b sumatoria
b breakpoint1
b guardarmem_
run
c
echo REGISTROS 1.0
info r rax rcx 

set $cont = $rcx 
#set $aux = 6

while ($cont>0) 
   echo calculo de cuadrados
    info r rax 
    echo sumatoria
    info r r12
    p $cont
    c
    #set $aux= $aux -1
    set $cont= $rcx 
end
echo REGISTROS 1.0
info r rax rcx r12
ni
q