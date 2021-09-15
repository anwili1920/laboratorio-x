set logging file reporte.txt
set print pretty on
set logging on
set pagination off
set args 10
file ejecutableizquierdo
define hook-echo
echo <------
end
define hookpost-echo
echo ------>\n
end
set disassembly-flavor intel
 
#b main
b sumatoria
b potencia
b continuar
r 
info r rcx rax r9 r12
c
info r rcx rax r9 r12
set $cont = $ecx 
set $iterador=$r10
#set $aux = 6
echo calculo de la potencia
while ($iterador>0) 
    info r r12 r10
    while ($cont>0) 
        info r rax r12
        p $cont
        c
        #set $aux= $aux -1
        set $cont= $ecx 
    end
    c
    set $iterador= $iterador-1
end
c 
c 
info r r12

