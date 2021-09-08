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
echo 
echo INICIO DEPURACION 
b main
b voltear
r
c
ni
b guardar
b modificar
c
echo REGISTROS 0.0
info r eax ecx 
set $cont = $ecx 
echo ENTRA AL WHILE
#set $aux = 6
while ($cont>=0) 
    info r eax
    p $cont
    c
    #set $aux= $aux -1
    set $cont= $ecx +1   
end

q