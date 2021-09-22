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
 
b calcular_media
b sumatoria
b exit 
run
echo REGISTROS 1.0
p $xmm3.v2_double[0]
info r rcx 
c
set $cont = $ecx 
#set $aux = 6
echo calculo de la media
while ($cont>0)
    p $xmm1.v2_double[0] 
    p $xmm2.v2_double[0]
    p $cont
    c
    #set $aux= $aux -1
    set $cont= $ecx 
end
set $cont = $ecx 
#set $aux = 6
echo calculo de la sumatoria
while ($cont>0)
    p $xmm1.v2_double[0] 
    p $xmm4.v2_double[0]
    p $cont
    c
    #set $aux= $aux -1
    set $cont= $ecx 
end
    p $xmm4.v2_double[0]
quit