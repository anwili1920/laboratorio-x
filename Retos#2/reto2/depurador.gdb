set logging file reporte.txt
set print pretty on
set logging on
set pagination off
set args 10
file limite
define hook-echo
echo <------
end
define hookpost-echo
echo ------>\n
end

b potenciador
b breakpoint22


run
echo REGISTROS 1.0
info r rax r9

set $cont = $r9 


while ($cont>=2)
    
    p $xmm1.v2_double
    p $xmm2.v2_double
    p $cont
    c
    #set $aux= $aux -1
    set $cont= $r9
    
end
 
quit