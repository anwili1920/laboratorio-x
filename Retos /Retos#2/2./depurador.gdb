set logging file reporte.txt
set print pretty on
set logging on
set pagination off
file limite
define hook-echo
echo <------
end
define hookpost-echo
echo ------>\n
end
set args 5
b main
b ASMLimite
b potencia 
b exit 
r
c
ni
c
set $cont=$ecx
echo calculo de la potencia
while ($cont>0)
    p $xmm1.v2_double[0] 
    p $xmm2.v2_double[0]
    p $cont
    c
    #set $aux= $aux -1
    set $cont= $ecx 
end
    p $xmm4.v2_double[0]
quit
