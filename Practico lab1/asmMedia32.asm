;extern int asmMedia32(int *a, int N);
;     eax es el return 
global asmMedia32

section	.text

asmMedia32:
    ; Prólogo para calling conventions en 32 bits
    push ebp
    mov ebp, esp
    push esi
    push edi
    push ebx

    ; Limpiar los registros a utilizar
    xor eax,eax
    xor ebx,ebx
    xor ecx,ecx
    xor edx,edx
    xor r9d ,r9d 
    ; Punteros iniciales (esto se inicializa en el archivo pregunta1.c)
    mov edi,[ebp + 8]   ; edi <- *arr
    mov ecx,[ebp + 12]  ; ecx <- N


; 12 10 11 9 
    mov eax,[edi]   ; eax <- arr[0] cargamos en eax la primera posición del arreglo
    mov ebx,ecx     ; ebx ← N
    dec ecx         ; ecx tiene el valor del tamaño del arreglo por lo que lo usamos de contador decreciente 
    jz exit         ; saltamos hacia exit en caso el tamaño del arreglo de datos sea cero
    mov [r9d], 4  ; OJOO!!! OJOZAZOOOO 
elMenor: ;Buscare el menor de los elementos en el loop
    mov [edx],[edi + r9d] ;  direccionamiento
    add [r9d], 4
    cmp eax,edx
    jl  nuevomenor
continuar1:
    loop elMenor
    jmp limpiar 

nuevomenor: 
    mov eax,edx 
    jmp continuar1 ; 
limpiar :
    xor ecx,ecx
    xor edx,edx
    mov ecx,ebx ; recupero el valor N en el registro ecx 

operacion:
    cmp eax,[edi]
    jne suma
continuar2:
    add edi,4       ; incrementamos la posición del puntero. Recordar que un entero tiene 4 bytesadd edi,4
    loop operacion
    jmp exit

suma: 
    add edx,[edi]   ; leemos el siguiente valor y almacenamos la suma acumulada en eax
    jmp continuar2   ; loop para leer todos los valores del arreglo. La instrucción loop trabaja con el registro ecx para saber cuando saltar. Revisar ISA

exit:
    xor eax,eax 
    mov eax,edx 
    cdq              ; extender el signo de eax hacia edx 
    idiv ebx         ; cociente: eax <- (edx:eax)/ebx ---- residuo: edx


    ; Epílogo de calling conventions de 32 bits
    pop ebx
    pop edi
    pop esi 
    mov esp,ebp
    pop ebp
    ret
