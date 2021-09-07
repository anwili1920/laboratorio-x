set logging file reporte.txt
set print pretty on
set logging on
set pagination off
set args 10
file varianza
define hook-echo
echo <------
end
define hookpost-echo
echo ------>\n
end
b calcularmedia
b breakpoint21
b bucle
b breakpoint42

run
echo REGISTROS 1.0
info r rax r9

set $cont = $r9 
#set $aux = 10

while ($cont>0)
    
    p $xmm1.v2_double
    p $xmm2.v2_double
    p $cont
    c
    #set $aux= $aux -1
    set $cont= $r9
    
end

c
echo REGISTRO 2.0 
p $xmm4.v2_double

set $cont = $r9 
while ($cont>0)
    c
    p $xmm2.v2_double
    p $xmm3.v2_double
    set $cont=$r9
end
quit