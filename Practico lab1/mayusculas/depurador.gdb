set logging file reporte.txt
set print pretty on
set logging on
set pagination off
set args 10
file p1
define hook-echo
echo <------
end
define hookpost-echo
echo ------>\n
end
set disassembly-flavor intel
 
b main
b 13
b upgratter
r
c
ni
b 13
b iteracion
b Fin
c
c
echo REGISTROS 1.0
info r eax ecx 

set $cont = $ecx +1
#set $aux = 6

while ($cont>0) 
    info r eax
    p $cont
    c
    #set $aux= $aux -1
    set $cont= $ecx +1   
end
c