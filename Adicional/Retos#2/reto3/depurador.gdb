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

b potenciadorBinario
b continuar
b fin

run
echo REGISTROS 1.0
info r rax r9

set $cont = $rax 


while ($cont!=0)
    
    p $xmm1.v2_double
    p $rdx 
    c
    set $cont= $rax
    
end
c
nexti 
p $xmm0.v2_double
 
quit