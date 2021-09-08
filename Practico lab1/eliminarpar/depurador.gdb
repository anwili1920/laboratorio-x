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
b selector
r
ni
b 13
b iteracion
b Fin
c
c
echo REGISTROS 1.0
info r eax ecx 

set $cont = 10
#set $aux = 6
printf "%d \n",$cont 
echo 
echo iteracion 
while ($cont>0) 
   info r eax
   p $cont
   c
   #set $aux= $aux -1
   set $cont= $cont -1

end
c