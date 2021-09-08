set logging file reporte.txt
set print pretty on
set logging on
set pagination off
set args 10
file ejecutable1
define hook-echo
echo <------
end
define hookpost-echo
echo ------>\n
end
set disassembly-flavor intel
 
b main
b asmMedia32
r
c
ni
b 32
b exit

