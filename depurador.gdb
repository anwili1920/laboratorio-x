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